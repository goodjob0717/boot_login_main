package com.boot.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.PageDAO;
import com.boot.dto.CorpInfoDTO;
import com.boot.dto.Criteria;

import lombok.extern.slf4j.Slf4j;

//나성엽

@Slf4j
@Service("PageService")
public class PageServiceImpl implements PageService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<CorpInfoDTO> listWithPaging(Criteria cri) {
		log.info("@# PageServiceImpl listWithPaging");
		log.info("@# cri=>"+cri);
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		ArrayList<CorpInfoDTO> list=dao.listWithPaging(cri);
		
		return list;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		log.info("@# PageServiceImpl getTotalCount");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		int total=dao.getTotalCount(cri);
		
		return total;
	}

	@Override
	public ArrayList<CorpInfoDTO> corpKeywordsList(String corp_name) {
		
		return null;
	}
}