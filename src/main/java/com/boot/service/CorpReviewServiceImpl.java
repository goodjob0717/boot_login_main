package com.boot.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.CorpReviewDAO;
import com.boot.dto.CorpInfoDTO;
import com.boot.dto.CorpReviewDTO;

import lombok.extern.slf4j.Slf4j;

// 나성엽

@Slf4j
@Service("CorpReviewService")
public class CorpReviewServiceImpl implements CorpReviewService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CorpReviewDAO corpReviewDAO;
	
	@Override
	// 아직 미구현
	public List<CorpReviewDTO> searchKeywords(List<String> keywords) {
		log.info("@# CorpReviewServiceImpl searchKeywords");
		return corpReviewDAO.searchKeywords(keywords);
	}

	@Override
	public void writeReview(HashMap<String, String> param) {
		log.info("@# CorpReviewServiceImpl writeReview");
		log.info("@# writeReview param=>"+param);
		
		CorpReviewDAO dao = sqlSession.getMapper(CorpReviewDAO.class);
		
		dao.writeReview(param);
		
		// 작성된 리뷰의 review_No 가져오기
	    int reviewNo = dao.getReviewNo();
	    param.put("review_No", String.valueOf(reviewNo));
		
		// 키워드 반복 작성
	    String keywords = param.get("corp_keyword");
	    if (keywords != null && !keywords.isEmpty()) {
	        String[] keywordArray = keywords.split(",");
	        for (String keyword : keywordArray) {
	            HashMap<String, String> keywordParam = new HashMap<>(param);
	            keywordParam.put("corp_keyword", keyword.trim());
	            dao.writeKeywordList(keywordParam);
	        }
	    }

	    // 복리후생 반복 작성
	    String welfares = param.get("corp_welfare");
	    if (welfares != null && !welfares.isEmpty()) {
	        String[] welfareArray = welfares.split(",");
	        for (String welfare : welfareArray) {
	            HashMap<String, String> welfareParam = new HashMap<>(param);
	            welfareParam.put("corp_welfare", welfare.trim());
	            dao.writeWelfare(welfareParam);
	        }
	    }
	}
}