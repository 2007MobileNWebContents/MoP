package com.kh.mop.eventboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.kh.mop.common.PaginationEvent;
import com.kh.mop.eventboard.domain.Eventboard;
import com.kh.mop.eventboard.domain.EventboardPageInfo;
import com.kh.mop.eventboard.service.EventboardService;


@Controller
public class EventboardController {

   @Autowired
   private EventboardService eService;

   // 이벤트 게시판 등록화면
   @RequestMapping(value = "eventBoardWriteView.do", method = RequestMethod.GET)
   public String evnetBoardWriteView() {
      return "/eventboard/EventboardWriteForm";

   }

   // 이벤트 게시판 글 등록
   @RequestMapping(value = "insertEventBoard.do", method = RequestMethod.POST)
   public String inserteventBoard(Eventboard eventboard, Model model, MultipartFile uploadFile,
         HttpServletRequest request) {

      // 파일을 서버에 저장
      
      // 파일을 DB에 저장
      int result = 0;
      String path = null;
      result = eService.insertEventboard(eventboard);
   
      if (result > 0) {
         path = "redirect:eventBoardList.do";
      } else {
         model.addAttribute("msg", "이벤트게시판 글 등록 실패");
         path = "common/errorPage";
      }
      return path;
   }

   private String saveFile(MultipartFile file, HttpServletRequest request) {
      // 파일 저장 경로 설정
      String root = request.getSession().getServletContext().getRealPath("resources");
      String savePath = root + "\\euploadFiles";
      // 저장 폴더 선택
      File folder = new File(savePath);
      // 만약 폴더가 없을 경우 자동 생성
      if (!folder.exists()) {
         folder.mkdir();
      }
      // 공지사항 첨부파일은 파일명 변환없이 바로 저장했으나
      // 게시파은 회원들이 동시에올리거나 같은파일을 올릴 수도 있기 때문에
      // 파일명을 rename하는 과정이 필요함
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
      String eOriginalFileName = file.getOriginalFilename();
      String eRenameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
            + eOriginalFileName.substring(eOriginalFileName.lastIndexOf(".") + 1);

      String filePath = folder + "\\" + eRenameFileName;
      // 파일 저장
      try {
         file.transferTo(new File(filePath));
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return eRenameFileName;
   }

   // 이벤트게시판 글 전체 조회
   @RequestMapping(value = "eventBoardList.do", method = RequestMethod.GET)
   public ModelAndView eventBoardList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

      int currentPage = (page != null) ? page : 1;
      int listCount = eService.getListCount();
      EventboardPageInfo pi = PaginationEvent.getEventBoardPageInfo(currentPage, listCount);

      ArrayList<Eventboard> eList = eService.selectList(pi);
      System.out.println(eList);
      if (!eList.isEmpty()) {
         mv.addObject("eList", eList);
         mv.addObject("pi", pi);
         mv.setViewName("eventboard/EventboardListView");
      } else {
         mv.addObject("msg", "이벤트게시판 전체조회 실패");
         mv.setViewName("common/errorPage");
      }
      return mv;
   }

   // 이벤트게시판 상세 페이지
   @RequestMapping(value = "eventBoardDetail.do", method = RequestMethod.GET)
   public ModelAndView evnetBoardDetail(ModelAndView mv, int eId, Integer page) {
      int currentPage = page != null ? page : 1;
      // 조회수 증가
      eService.addReadCount(eId);
      // 게시글 상세 조회
      Eventboard eventboard = eService.selectEventboard(eId);
      if (eventboard != null) {
         // 메서드체이닝
         mv.addObject("eventboard", eventboard).addObject("currentPage", currentPage)
               .setViewName("eventboard/EventboardDetailView");
      } else {
         mv.addObject("msg", "게시글 상세 조회 실패!");
         mv.setViewName("common/errorPage");
      }
      return mv;
   }

   public void deleteFile(String fileName, HttpServletRequest request) {
      String root = request.getSession().getServletContext().getRealPath("resources");
      String savepath = root + "\\euploadFIles";
      File file = new File(savepath + "\\" + fileName);
      // 파일이 존재할경우 삭제
      if (file.exists()) {
         file.delete();
      }
   }

   // 이벤트게시판 삭제
   @RequestMapping(value = "eventBoardDelete.do", method = RequestMethod.GET)
   public String EventBoardDelete(int eId, HttpServletRequest request, Model model) {
      // 파일삭제
      Eventboard eventboard = eService.selectEventboard(eId);
      if (eventboard.geteOriginalfilename() != null) {
         deleteFile(eventboard.geteOriginalfilename(), request);
      }

      // DB에서 삭제
      int result = eService.deleteEvnetboard(eId);
      if (result > 0) {
         return "redirect:eventBoardList.do";
      } else {
         model.addAttribute("msg", "게시글 삭제 실패");
         return "common/errorPage";
      }
   }

   // 이벤트게시판 수정하기
   @RequestMapping(value = "eventBoardUpdate.do", method = RequestMethod.POST)
   public ModelAndView EventboardUpdate(@ModelAttribute Eventboard eventboard, ModelAndView mv,
         HttpServletRequest request, @RequestParam("page") Integer page,
         @RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile) {
      // 새로 업로드된 파일이 있는경우
      if (reloadFile != null && !reloadFile.isEmpty()) {
         // 기존 업로드된 파일 삭제
         if (eventboard.geteOriginalfilename() != null) {
            deleteFile(eventboard.geteOriginalfilename(), request);
         }
         // 새로 업로드된 파일을 저장
         
      }
      // DB 저장
      int result = eService.updateEvnetboard(eventboard);
      System.out.println(eventboard);
      if (result > 0) {
         mv.addObject("page", page);
         mv.setViewName("redirect:eventBoardList.do");
      } else {
         mv.addObject("msg", "게시글 수정 실패");
         mv.setViewName("common/errorPage");
      }
      return mv;
   }
   
   //이벤트게시판 수정화면
   @RequestMapping("EventBoardUpdateView.do")
   public ModelAndView eventBoardUpdate(ModelAndView mv, @RequestParam("eId") int eId,
                                 @RequestParam("page") Integer page) {
      mv.addObject("eventBoard",eService.selectEventboard(eId)).addObject("currentPage",page).setViewName("eventboard/EventboardUpdateForm");
      return mv;
   }
   
   @RequestMapping("faqBoardList.do")
   public String faq() {
	   return "eventboard/FaqBoard";
   }

}