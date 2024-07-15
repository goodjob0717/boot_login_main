package com.boot.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.CompanyListDAO;
import com.boot.dao.EmpPostDAO;
import com.boot.dto.CompanyListDTO;
import com.boot.dto.EmpPostDTO;

import lombok.extern.slf4j.Slf4j;

//인터페이스 상속 받고 오버라이딩한다 
@Slf4j
@Service("EmpPostService")
public class EmpPostServiceImpl implements EmpPostService {

	@Autowired
	private SqlSession sqlSession;
//	SqlSession은 MyBatis의 SQL 세션을 관리하는 객체입니다.
//	Spring이 자동으로 주입합니다.
	

	@Override
	public List<EmpPostDTO> MainEmpPost(HashMap<String, String> param) {
		log.info("@# EmpPostServiceImpl MainEmpPost");
		
		EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
//		sqlSession.getMapper(CompanyListDAO.class): 
//		MyBatis의 CompanyListDAO 인터페이스의 구현체를 가져옵니다.
		
		 List<EmpPostDTO> dto = dao.MainEmpPost(param); 
//		dao.company_list(param):
//			DAO의 메서드를 호출하여 데이터베이스에서 데이터를 조회합니다.
		 
		 log.info("@# EmpPostDTO: {}", dto); // DTO 내용 로그로 확인
		 
		 
		return dto;
	}

//	@Override
//	public CompanyListDTO getCompanyById(int id) {
//	    CompanyListDAO dao = sqlSession.getMapper(CompanyListDAO.class);
//        return dao.getCompanyById(id);
//	}


	
}
