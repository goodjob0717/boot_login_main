package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.MyPageDTO;
import com.boot.service.MainService;
import com.boot.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyPageController {
	@Autowired
	private MyPageService service;
//	@Autowired
//	private MainService mainService; 
	
	
	
//	@RequestMapping("/list")
	@RequestMapping("/myPage")
	public String list(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# myPage");
		
		ArrayList<MyPageDTO> list1 = service.list1();
		model.addAttribute("list1", list1);

		ArrayList<MyPageDTO> list_cv = service.list_cv();
		model.addAttribute("list_cv", list_cv);

		ArrayList<MyPageDTO> list_apply = service.list_apply();
		model.addAttribute("list_apply", list_apply);
		
		
		return "myPage";
	}
	@RequestMapping("/myPageModify")
//	public String modify(@RequestParam HashMap<String, String> param) {
	public String modify(@RequestParam HashMap<String, String> param) {
		log.info("@# modify");
		log.info("@# param=>"+param);
		
		service.modify(param);
		
		return "redirect:myPage";
	}
	@RequestMapping("/cancle")
	public String cancle(Model model) {
		log.info("@# cancle");
		
		ArrayList<MyPageDTO> list1 = service.list1();
		model.addAttribute("list", list1);
		
		return "redirect:myPage";
	}
	
	@RequestMapping("/myPageDelete")
//	public String delete(@RequestParam HashMap<String, String> param) {
	public String delete(@RequestParam HashMap<String, String> param) {
		log.info("@# delete");
		log.info("@# param=>"+param);
		log.info("@# cv_no=>"+param.get("cv_no"));
		
		service.delete(param);
		
		return "redirect:myPage";
	}
	
}











