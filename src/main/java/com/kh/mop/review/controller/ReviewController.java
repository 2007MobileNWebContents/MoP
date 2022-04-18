package com.kh.mop.review.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.mop.common.Pagination;
import com.kh.mop.common.Review_Pagination;
import com.kh.mop.member.domain.Member;
import com.kh.mop.review.domain.ReviewPageInfo;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.domain.RvReply;
import com.kh.mop.review.domain.ReviewSelect;
import com.kh.mop.review.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService vService;
	
	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\reviewUploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String filePath = folder + "\\" + file.getOriginalFilename();
		try {
			file.transferTo(new File(filePath));
		}catch(Exception e){
			e.printStackTrace();
		}
		return filePath;
	}

	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String deletePath = root + "\\reviewUploadFiles";
		File deleteFile = new File(deletePath + "\\" + fileName);
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	// 게시글 등록
	@RequestMapping(value="reviewInsert.do", method = RequestMethod.POST)
	public String reviewInsert(Review review, Model model, HttpServletRequest request, MultipartFile uploadFile) {
		if(!uploadFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFile, request);
			if(filePath != null) {
				review.setFilePath(uploadFile.getOriginalFilename());
			}
		}
		int result = 0;
		String path = null;
		result = vService.insertReview(review);
		if(result > 0) {
			path = "redirect:reviewList.do?vNo=" + review.getvNo();
		}else {
			model.addAttribute("msg", "리뷰게시글 등록 실패");
			path = "common/errorPage";
		}
		return path;
	}
	
	// 게시글 삭제
	@RequestMapping(value="reviewDelete.do", method = RequestMethod.GET)
	public String reviewDelete(int vId, HttpServletRequest request, Model model) {
		Review review = vService.selectReview(vId);
		if(review.getFilePath() != null) {
			deleteFile(review.getFilePath(), request);
		}
		int result = vService.deleteReview(vId);
		if(result > 0) {
			return "redirect:reviewList.do?vNo=" +review.getvNo();
		}else {
			model.addAttribute("msg", "리뷰게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	// 리뷰게시판 리스트
	@RequestMapping(value="reviewList.do", method = RequestMethod.GET)
	public ModelAndView reviewList(HttpSession session, ModelAndView mv, @RequestParam(value="page", required = false) Integer page, String vNo) {
		int currentPage = (page != null) ? page : 1;
		int listCount = vService.getListCount();
		ReviewPageInfo pi = Review_Pagination.getReviewPageInfo(currentPage, listCount);
		int reviewNo = Integer.parseInt(vNo);
		ArrayList<Review> vList = vService.selectList(pi, reviewNo);
		
Member member = (Member)session.getAttribute("loginMember");
		
		System.out.println(member.getReservation());

		// 댓글 리스트
		for (Review rvOne : vList) {
			ArrayList<RvReply> rvReplyList = vService.selectRvReplyList(rvOne.getvId());
			rvOne.setRvReplyList(rvReplyList);
		}
		
		if(!vList.isEmpty()) {
			mv.addObject("vList", vList);
			mv.addObject("pi", pi);
			mv.addObject("vNo", vNo);
			mv.setViewName("review/reviewList");
		}else {
			mv.addObject("msg", "리뷰게시판 리스트 에러다 돌아가라");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 리뷰게시판 selectBox
	@RequestMapping(value="reviewSelect.do", method = RequestMethod.GET)
	public String reviewSelect(ReviewSelect select, Model model, String vNo) {
		int reviewNo = Integer.parseInt(vNo);
		ArrayList<Review> selectList = vService.selectBoxList(select, reviewNo);
		// 댓글 리스트
		for (Review rvOne : selectList) {
			ArrayList<RvReply> rvReplyList = vService.selectRvReplyList(rvOne.getvId());
			rvOne.setRvReplyList(rvReplyList);
		}

		if(!selectList.isEmpty()) {
			model.addAttribute("vList", selectList);
			model.addAttribute("select", select);
			model.addAttribute("vNo", vNo);
			return "review/reviewList";
		}else {
			model.addAttribute("msg", "리뷰게시판 선택 실패");
			return "common/errorPage";
		}
	}
	
	// 리뷰게시판 수정화면
	@RequestMapping(value="reviewUpdateView.do", method = RequestMethod.GET)
	public String reviewUpdateView(int vId, Model model) {
		model.addAttribute("review", vService.selectReview(vId));
		return "review/reviewUpdateView";
	}
	
	// 리뷰게시판 수정
	@RequestMapping(value="reviewUpdate.do", method = RequestMethod.POST)
	public String reviewUpdate(Review review, Model model, HttpServletRequest request, MultipartFile reloadFile) {
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(review.getFilePath() != null) {
				deleteFile(review.getFilePath(), request);
			}
			String savePath = saveFile(reloadFile, request);
			if(savePath != null) {
				review.setFilePath(reloadFile.getOriginalFilename());
			}
		}
		int result = vService.updateReview(review);
		if(result > 0) {
			return "redirect:reviewList.do?vNo="+review.getvNo();
		}else {
			model.addAttribute("msg", "리뷰 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 댓글
	@ResponseBody
	@RequestMapping(value="addRvReply.do", method = RequestMethod.POST)
	public String addRvReply(RvReply rvReply, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginMember");
		String reWriter = loginUser.getMemberId();
		rvReply.setReWriter(reWriter);
		int result = vService.insertRvReply(rvReply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 댓글 삭제
	@RequestMapping(value="rvReplyDelete.do", method = RequestMethod.GET)
	public String rvReplyDelete(int vId, int reId, HttpServletRequest request, Model model) {
		Review review = vService.selectReview(vId);
		
		int result = vService.deleteRvReply(reId);
		if(result > 0) {
			return "redirect:reviewList.do?vNo=" +review.getvNo();
		}else {
			model.addAttribute("msg", "리뷰게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
}
