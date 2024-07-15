
package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.dto.UserMemDTO;
import com.boot.service.UserMemService;
import com.boot.service.VerificationCodeService;

import lombok.extern.slf4j.Slf4j;

//나상엽

@Controller
@Slf4j
public class UserMemController {

	@Autowired
	private UserMemService userService;
	
	@Autowired
    private VerificationCodeService verificationCodeService;
	
	@RequestMapping("/login")
	public String login() {
		log.info("@# login");
		
		return "login";
	}
	
	@RequestMapping("/login_yn")
	public String login_yn(@RequestParam HashMap<String, String> param) {
		log.info("@# login_yn");
		
		ArrayList<UserMemDTO> dtos = userService.loginyn(param);
		
		if (dtos.isEmpty()) {
			return "redirect:login";
		} else {
			if (param.get("user_pw").equals(dtos.get(0).getUser_pw())) {
				return "redirect:login_ok";
			} else {
				return "redirect:login";
			}
		}
	}
	
	@RequestMapping("/login_ok")
	public String login_ok() {
		log.info("@# login_ok");
		
		return "login_ok";
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest request, Model model) {
		log.info("@# register");

		return "register";
	}
	
	@RequestMapping("/register_ok")
	public String write(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# register_ok");
		log.info("@# param=>"+param);
		
		String userEmail = param.get("user_email");
		if (!verificationCodeService.isEmailVerified(userEmail)) {
            model.addAttribute("error", "이메일 인증을 완료해주세요.");
            return "redirect:register";
        } else {
        	userService.write(param);
		}
		
		return "redirect:login";
	}
	
	@PostMapping("/check_user_id")
    @ResponseBody
    public ResponseEntity<HashMap<String, Boolean>> checkUserId(@RequestParam String user_id) {
        log.info("@# check_user_id");
        
        boolean isAvailable = userService.checkUserId(user_id);
        HashMap<String, Boolean> response = new HashMap<>();
        response.put("available", isAvailable);
        
        return ResponseEntity.ok(response);
    }
}
