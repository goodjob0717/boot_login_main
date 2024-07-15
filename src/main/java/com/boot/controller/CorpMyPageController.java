package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.CorpMyPageDTO;
import com.boot.service.CorpMyPageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CorpMyPageController {
	@Autowired
	private CorpMyPageService service;
	
	
	
//	@RequestMapping("/list")
	@RequestMapping("/corpMyPage")
	public String list(Model model) {
		log.info("@# corpMyPage");
		
		ArrayList<CorpMyPageDTO> list = service.list();
		model.addAttribute("list", list);

		ArrayList<CorpMyPageDTO> list_corp = service.list_corp();
		model.addAttribute("list_corp", list_corp);
		
		return "corpMyPage";
	}
	@RequestMapping("/corpModify")
//	public String modify(@RequestParam HashMap<String, String> param) {
	public String modify(@RequestParam HashMap<String, String> param) {
		log.info("@# modify");
		log.info("@# param=>"+param);
		
		service.modify(param);
		
		return "redirect:corpMyPage";
	}
	@RequestMapping("/apply")
//	public String modify(@RequestParam HashMap<String, String> param) {
	public String apply(@RequestParam HashMap<String, String> param) {
		log.info("@# apply");
		log.info("@# param=>"+param);
		
		service.modify(param);
		
		return "apply";
	}

	
	@RequestMapping("/corpDelete")
//	public String delete(@RequestParam HashMap<String, String> param) {
	public String delete(@RequestParam HashMap<String, String> param) {
		log.info("@# delete");
		log.info("@# param=>"+param);
		log.info("@# emp_postNo=>"+param.get("emp_postNo"));
		
		service.delete(param);
		
		return "redirect:corpMyPage";
	}
	
	
}











