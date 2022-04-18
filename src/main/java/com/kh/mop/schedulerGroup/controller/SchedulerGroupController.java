package com.kh.mop.schedulerGroup.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.mop.member.domain.Member;
import com.kh.mop.scheduler.domain.Scheduler;
import com.kh.mop.schedulerGroup.domain.SchedulerGroup;
import com.kh.mop.schedulerGroup.service.SchedulerGroupService;

@Controller
public class SchedulerGroupController {
      
   
   @Autowired
   private SchedulerGroupService gService;

   
   //스케줄러 메인화면
   @RequestMapping(value="schedulerGroup.do", method = RequestMethod.GET)
   public String schedulerGroup() {
      return "scheduler/SchedulerGroup";
   }
   
   // 스케줄러 출력
   @ResponseBody
   @RequestMapping(value = "schedulerGroupList.do", method = RequestMethod.GET)
   public void selectList(HttpServletResponse reponse, HttpServletRequest request, Model model) throws Exception {
      ArrayList<SchedulerGroup> gList = gService.selectList();
      HttpSession session = request.getSession();
      model.addAttribute("gList", gList);
      for (SchedulerGroup g : gList) {
         g.setDescription(URLEncoder.encode(g.getDescription(), "utf-8"));
         g.setDescription(URLDecoder.decode(g.getDescription(),"utf-8"));
         
         /*
          * if(g.getAllDay().equals("true")) { g.setAllDay("true"); }else {
          * g.setAllDay("false"); }
          */
      }
      Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd HH:mm:ss").create();
      gson.toJson(gList, reponse.getWriter());
      session.setAttribute("gList", gList);
      System.out.println(gList.toString());
      
   }
   // 스케줄러 등록
   
   @ResponseBody
   @RequestMapping(value = "SchedulerGroupinsert.do", method = RequestMethod.POST)
   public Map<Object, Object> insertSchedulerGroup(SchedulerGroup schedulergroup, HttpServletRequest request, Model model) {
      HttpSession session = request.getSession();
      Member member = (Member)session.getAttribute("loginMember");
      model.addAttribute("schedulergroup", schedulergroup);
      Map<Object, Object> map = new HashMap<Object, Object>();
   
      gService.insertSchedulerGroup(schedulergroup);
      System.out.println(schedulergroup.toString());
      
      return map;
   }
   // 스케줄러 수정
   @ResponseBody
   @RequestMapping(value="schedulerGroupUpdate.do", method = RequestMethod.GET)
   public String updateSchdedulerGroup(SchedulerGroup schedulergroup, HttpServletRequest request, Model model) {
      
      HttpSession session = request.getSession();
      System.out.println(schedulergroup.toString());
      int result = gService.updateSchdedulerGroup(schedulergroup);
      
      if(result > 0) {
         model.addAttribute("schedulergroup", schedulergroup);
         return "redirect:home.do";
         
      }else {
         model.addAttribute("msg", "정보수정 실패");
         return "common/errorPage";
      }
   }
   // 스케줄러 삭제
   
      @ResponseBody
      @RequestMapping(value="schedulerGroupDelete.do", method = RequestMethod.GET)
      public String Schedulerdelete(String gId, HttpServletRequest request, Model model) {
         
         HttpSession session = request.getSession();
         int scheduleGroupId = Integer.parseInt(gId);
         int result = gService.deleteSchedulerGroup(scheduleGroupId);
         if (result > 0) {
            return "redirect:schedulerGroup.do";
         }else {
            model.addAttribute("msg", "스케줄러 삭제 실패");
            return "common/errorPage";
         }
      }
}