package com.boot.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.CVDAO;
import com.boot.dto.CVDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("CVService") //인터페이스 
public class CVServiceImpl implements CVService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void write(CVDTO cv) {
		log.info("@# CVServiceImpl write");
		CVDAO dao = sqlSession.getMapper(CVDAO.class);
		dao.write(cv);
		log.info("@# CVDTO cv=>"+cv);
	}
	
	@Override
	public CVDTO contentView(HashMap<String, String> param) {
		log.info("@# CVServiceImpl contentView" + param);
		
		CVDAO dao = sqlSession.getMapper(CVDAO.class);
		CVDTO dto = dao.contentView(param);
		
		return dto;
	}

	@Override
	public void modify(HashMap<String, String> param) {
		log.info("@# CVServiceImpl modify");
		CVDAO dao = sqlSession.getMapper(CVDAO.class);
		dao.modify(param);
		log.info("@# CVDTO cv=>"+param);
	}
	
	
}