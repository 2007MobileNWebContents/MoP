package com.kh.mop.place.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mop.place.domain.Place;
import com.kh.mop.place.service.PlaceService;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.service.ReviewService;

@Controller
public class PlaceController {

	@Autowired 
	private PlaceService pService;
	private ReviewService rService;
	
	@ResponseBody
	@RequestMapping(value="placeList.do")
	public ModelAndView placeList (ModelAndView mv) {
		ArrayList<Place> pList = pService.selectList();
		if(!pList.isEmpty()) {
			mv.addObject("pList", pList);
			mv.setViewName("place/placeList");
		} else {
			mv.addObject("msg", "장소 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 게시판 카테고리 분류 하여 출력 하는 부분 
	@ResponseBody
	@RequestMapping(value="psort.do")
	public ModelAndView categoryList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pCode = request.getParameter("pCode");

		  Map<String, String> m = new HashMap<String, String>();
		  m.put("pCode", "%" + pCode + "%");
		
		// 카테고리 해당 부분 불러오기 
		ArrayList<Place> categoryList = pService.categoryList(m);
		ModelAndView categoryMv = new ModelAndView("place/placeList");
		categoryMv.addObject("pCode", pCode);
		categoryMv.addObject("categoryList", categoryList);
		return categoryMv;
	}
	
	@RequestMapping(value="placeDetail.do")
	public ModelAndView placeDetail(ModelAndView mv, int pId) {
		
		Place place = pService.selectOne(pId);
		if(place != null) {
			mv.addObject("place", place);
			mv.addObject("pId", pId);
			mv.setViewName("place/placeDetail");
		}
		return mv;
	}
}
