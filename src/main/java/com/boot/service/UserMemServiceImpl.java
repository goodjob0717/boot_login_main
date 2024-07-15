package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.UserMemDAO;
import com.boot.dto.UserMemDTO;

import lombok.extern.slf4j.Slf4j;

//나성엽

@Slf4j
@Service("UserMemService")
public class UserMemServiceImpl implements UserMemService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
    private UserMemDAO userMemDAO;
	
	@Override
	public ArrayList<UserMemDTO> loginyn(HashMap<String, String> param) {
		log.info("@# UserMemServiceImpl loginyn");
		UserMemDAO dao = sqlSession.getMapper(UserMemDAO.class);
		ArrayList<UserMemDTO> list=dao.loginyn(param);
		
		return list;
	}

	@Override
	public void write(HashMap<String, String> param) {
		log.info("@# UserMemServiceImpl write");
		
		UserMemDAO dao = sqlSession.getMapper(UserMemDAO.class);
		dao.write(param);
	}

	@Override
	public boolean checkUserId(String userId) {
		log.info("@# UserMemServiceImpl checkUserId");
		return userMemDAO.checkUserId(userId) == null;
	}

}