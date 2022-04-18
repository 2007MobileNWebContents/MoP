package com.kh.mop;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */


	
	  @RequestMapping(value = "/home.do", method = RequestMethod.GET) public String
	  home(Locale locale, Model model) { // HomeController는 메인페이지로 돌아가는 기능을 함
	  return "common/main"; }
	 
	 

	/*
	 * @RequestMapping(value = "home.do", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) { // HomeController는 메인페이지로돌아가는 기능을 함 
	 * return "scheduler/SchedulerView"; }
	 */
	 
}
