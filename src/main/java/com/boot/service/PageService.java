package com.boot.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.boot.dto.CorpInfoDTO;
import com.boot.dto.Criteria;

//나성엽

public interface PageService {
	public ArrayList<CorpInfoDTO> listWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public ArrayList<CorpInfoDTO> corpKeywordsList(@Param("corp_name") String corp_name);
}