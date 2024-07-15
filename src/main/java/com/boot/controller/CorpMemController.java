package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.dto.CorpMemDTO;
import com.boot.service.CorpMemService;

import lombok.extern.slf4j.Slf4j;

//나상엽

@Controller
@Slf4j
public class CorpMemController {
	
	@Autowired
	private CorpMemService corpService;
	
	@RequestMapping("/corp_login_yn")
	public String login_yn(@RequestParam HashMap<String, String> param) {
		log.info("@# login_yn");
		
		ArrayList<CorpMemDTO> dtos = corpService.loginyn(param);
		
		if (dtos.isEmpty()) {
			return "redirect:login";
		} else {
			if (param.get("corp_pw").equals(dtos.get(0).getCorp_pw())) {
				return "redirect:login_ok";
			} else {
				return "redirect:login";
			}
		}
	}
	
	@RequestMapping("/corp_register_ok")
	public String write(@RequestParam HashMap<String, String> param) {
		log.info("@# corp_register_ok");
		log.info("@# param=>"+param);
		
		corpService.write(param);
		return "redirect:login";
	}
	
	@PostMapping("/check_corp_id")
    @ResponseBody
    public ResponseEntity<HashMap<String, Boolean>> checkCorpId(@RequestParam String corp_id) {
        log.info("@# check_corp_id");
        
        boolean isAvailable = corpService.checkCorpId(corp_id);
        HashMap<String, Boolean> response = new HashMap<>();
        response.put("available", isAvailable);
        
        return ResponseEntity.ok(response);
    }
}