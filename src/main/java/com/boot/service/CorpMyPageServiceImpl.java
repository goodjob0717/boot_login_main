package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.CorpMyPageDAO;
import com.boot.dto.CorpMyPageDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("CorpMyPageService")
public class CorpMyPageServiceImpl implements CorpMyPageService{
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public ArrayList<CorpMyPageDTO> list() {
		log.info("@# MyPageServiceImpl list");
		
		CorpMyPageDAO dao = sqlSession.getMapper(CorpMyPageDAO.class);
		ArrayList<CorpMyPageDTO> list=dao.list();
		
		return list;
	}

	@Override
	public ArrayList<CorpMyPageDTO> list_corp() {
		log.info("@# CorpMyPageServiceImpl list_corp");
		
		CorpMyPageDAO dao = sqlSession.getMapper(CorpMyPageDAO.class);
		ArrayList<CorpMyPageDTO> list=dao.list_corp();
		
		return list;
	}

	@Override
	public void modify(HashMap<String, String> param) {
		log.info("@# MyPageServiceImpl modify");
		
		CorpMyPageDAO dao = sqlSession.getMapper(CorpMyPageDAO.class);
		dao.modify(param);
	}

	@Override
	public void delete(HashMap<String, String> param) {
		log.info("@# MyPageServiceImpl delete");
		log.info("@# param=>"+param);
		
		CorpMyPageDAO dao = sqlSession.getMapper(CorpMyPageDAO.class);
		
		dao.delete(param);
	}
	

}







