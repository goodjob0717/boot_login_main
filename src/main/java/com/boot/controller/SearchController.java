package com.boot.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.CompanyListDTO;
import com.boot.service.CompanyListService;

@Controller
public class SearchController {
	
	@Autowired
	private CompanyListService companyListService;

    @GetMapping("/search")
    public String search(@RequestParam(name = "query", required = false) String query, Model model) {
        HashMap<String, String> param = new HashMap<>();
        param.put("query", query);

        List<CompanyListDTO> companyList = companyListService.searchCompany(param);
        model.addAttribute("query", query);
        model.addAttribute("companyList", companyList);
        
        return "search";
    }
}