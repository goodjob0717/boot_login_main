package com.boot.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.CorpReviewDTO;

//나상엽

@Mapper
public interface CorpReviewDAO {
	public List<CorpReviewDTO> searchKeywords(List<String> keywords);// 아직 미구현
	public void writeReview(HashMap<String, String> param);
	public void writeKeywordList(HashMap<String, String> param);
	public void writeWelfare(HashMap<String, String> param);
	// 리뷰 작성 후 review_No 반환
    public int getReviewNo();
}