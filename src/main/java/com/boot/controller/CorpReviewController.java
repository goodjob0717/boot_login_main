
package com.boot.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.dto.CorpInfoDTO;
import com.boot.dto.CorpReviewDTO;
import com.boot.dto.Criteria;
import com.boot.dto.PageDTO;
import com.boot.service.CorpReviewServiceImpl;
import com.boot.service.PageService;

import lombok.extern.slf4j.Slf4j;

//나상엽
//
@Controller
@Slf4j
public class CorpReviewController {
	
	@Autowired
    private CorpReviewServiceImpl corpreviewService;
	
	@Autowired
	private PageService pageService;

	@GetMapping("/corpReviewList")
    public String corpReviewList(Criteria cri, Model model) {
    	log.info("@# corpReviewList");
    	log.info("@# cri=>"+cri);
        
    	List<CorpInfoDTO> reviews = pageService.listWithPaging(cri);
    	int total = pageService.getTotalCount(cri);
		log.info("@# total=>"+total);
		
		// reviews 리스트에서 각 CorpInfoDTO의 corp_name을 추출
	    for (CorpInfoDTO review : reviews) {
	        log.info("@# corp_name=>" + review.getCorp_name());
	    }
    	
        model.addAttribute("reviews", reviews);
        model.addAttribute("pageMaker", new PageDTO(total, cri));
        
        
        
        return "corpReviewList";
    }

    @PostMapping("/searchKeywords")
    @ResponseBody
    // 아직 미구현
    public List<CorpReviewDTO> searchKeywords(@RequestBody List<String> keywords) {
    	log.info("@# searchKeywords");
    	
        return corpreviewService.searchKeywords(keywords);
    }
    
    @RequestMapping("/corpReviewWrite")
    public String corpReviewWrite() {
    	log.info("@# corpReviewWrite");
    	
		return "corpReviewWrite";
	}
    
    @PostMapping("/write_review")
    public String writeReview(@RequestParam HashMap<String, String> param) {
    	log.info("@# writeReview");
    	log.info("@# param=>" + param);
    	
    	corpreviewService.writeReview(param);
    	
    	return "redirect:corpReviewList";
    }
}
