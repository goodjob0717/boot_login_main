package com.boot.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.EmpPostDTO;
import com.boot.dto.MainDTO;
import com.boot.service.CompanyListService;
import com.boot.service.EmpPostService;
import com.boot.service.MainService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class MainController {
	
//	@Autowired
//	private CompanyListService companyListService;

	@Autowired
	private EmpPostService empPostService; 
	
	@Autowired
	private MainService mainService; 
	
	
	 
	   
//		@RequestMapping("/login")
//		public String login(Model model) {
//			return "/login";

		
		@RequestMapping("/notice_detail")
		public String notice_detail(Model model) {
			return "/notice_detail";	
		}
		
		
//		@RequestMapping("/myPage")
//		public String myPage(Model model) {
//			return "/myPage";	
//		}
		
//		  @GetMapping("/main")
//		    public String hello (Model model) {
//			  log.info("@# mainPage");
//			   return "/main";
//		    }
		  
		@RequestMapping("/main")
		public String MainEmpPost(@RequestParam HashMap<String, String> param , Model model) {
			 // 요청 파라미터를 HashMap 형태로 받습니다.
			 log.info("@# MainController MainEmpPost called with params: {}", param);
			
			 List<EmpPostDTO> dto = empPostService.MainEmpPost(param);
			 List<MainDTO> Maindto = mainService.MainMyPage(param);
			 // 서비스 레이어의 company_list 메서드를 호출하여 DTO 객체를 반환받습니다.
			 log.info("@# MainController MainEmpPost returned DTO: {}", dto);
			 log.info("@# MainController Maindto returned DTO: {}", param);
			 
			model.addAttribute("MainEmpPost", dto);
			model.addAttribute("MainMyPage", Maindto);
			log.info("@# MainController MainMyPage Maindto: {}", Maindto);
			// 반환받은 DTO 객체를 "company_list"라는 이름으로 모델에 추가합니다.
			
			
			
			return "main"; 
		}
		
		   @RequestMapping("/faq")
		    public String showFaqPage() {
		        return "faq"; // JSP 파일명 (faq.jsp)
		    }

}
