package com.boot.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.CompanyListDTO;
import com.boot.service.CompanyListService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class CompanyListController {

	@Autowired 
//	@Autowired: Spring의 의존성 주입(DI) 기능을 사용하여 
//	CompanyListService 객체를 주입받습니다.
	private CompanyListService companyListService;

//	2. 변경
//	@GetMapping("/company_list")
	//2. 변경
	@RequestMapping("/company_list")
	public String company_list(@RequestParam HashMap<String, String> param , Model model) {
		 // 요청 파라미터를 HashMap 형태로 받습니다.
		
		 List<CompanyListDTO> dto = companyListService.company_list(param);
		 // 서비스 레이어의 company_list 메서드를 호출하여 DTO 객체를 반환받습니다.
		model.addAttribute("company_list", dto);
		// 반환받은 DTO 객체를 "company_list"라는 이름으로 모델에 추가합니다.
		
		return "company_list"; 
		 // "company_list"라는 뷰 이름을 반환합니다. 
		//이는 /WEB-INF/views/company_list.jsp 파일을 가리킵니다.
	}
    @GetMapping("/company_content")
    public String companyContent(@RequestParam("id") int companyId, Model model) {
        // 회사 ID로 회사 정보 가져오기
        CompanyListDTO company = companyListService.getCompanyById(companyId);
        model.addAttribute("company", company);
        return "company_content"; // JSP 파일명
	    }
	
    // 연봉 정보 줄세이는 페이지 
    @GetMapping("/salary")
    	public String salary (@RequestParam HashMap<String, String> param , Model model) {
		
		 List<CompanyListDTO> dto = companyListService.RankedBySalary(param);
		model.addAttribute("salary_list", dto);
//		
		return "salary"; 
	}
	
    
}