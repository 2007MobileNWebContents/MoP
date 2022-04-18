package com.kh.mop.member.naver;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.mop.member.naver.NaverLogin;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverController {
	
	private static final Logger logger = LoggerFactory.getLogger(NaverController.class);
	private NaverLogin nl;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLogin(NaverLogin nl) {
		this.nl  = nl;
	}
}
