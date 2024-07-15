package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.CorpMemDAO;
import com.boot.dto.CorpMemDTO;

import lombok.extern.slf4j.Slf4j;

//나 성엽

@Slf4j
@Service("CorpMemService")
public class CorpMemServiceImpl implements CorpMemService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
    private CorpMemDAO corpMemDAO;
	
	@Override
	public ArrayList<CorpMemDTO> loginyn(HashMap<String, String> param) {
		log.info("@# CorpMemServiceImpl loginyn");
		CorpMemDAO dao = sqlSession.getMapper(CorpMemDAO.class);
		ArrayList<CorpMemDTO> list=dao.loginyn(param);
		
		return list;
	}

	@Override
	public void write(HashMap<String, String> param) {
		log.info("@# CorpMemServiceImpl write");
		
		CorpMemDAO dao = sqlSession.getMapper(CorpMemDAO.class);
		dao.write(param);
	}

	@Override
	public boolean checkCorpId(String corpId) {
		log.info("@# CorpMemServiceImpl checkCorpId");
		return corpMemDAO.checkCorpId(corpId) == null;
	}
}