package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.CompanyListDAO;
import com.boot.dto.CompanyListDTO;

import lombok.extern.slf4j.Slf4j;

//인터페이스 상속 받고 오버라이딩한다 
@Slf4j
@Service("CompanyListService")
public class CompanyListServiceImpl implements CompanyListService {

	@Autowired
	private SqlSession sqlSession;
//	SqlSession은 MyBatis의 SQL 세션을 관리하는 객체입니다.
//	Spring이 자동으로 주입합니다.
	
	// 2. 추가
	@Override
	public  List<CompanyListDTO> company_list(HashMap<String, String> param) {
//		log.info("@# BoardServiceImpl contentView");
		
		CompanyListDAO dao = sqlSession.getMapper(CompanyListDAO.class);
//		sqlSession.getMapper(CompanyListDAO.class): 
//		MyBatis의 CompanyListDAO 인터페이스의 구현체를 가져옵니다.
		
		 List<CompanyListDTO> dto = dao.company_list(param); 
//		dao.company_list(param):
//			DAO의 메서드를 호출하여 데이터베이스에서 데이터를 조회합니다.
		
		return dto;
	}

	@Override
	public CompanyListDTO getCompanyById(int id) {
	    CompanyListDAO dao = sqlSession.getMapper(CompanyListDAO.class);
        return dao.getCompanyById(id);
	}

	@Override
	public List<CompanyListDTO> RankedBySalary(HashMap<String, String> param) {
//		log.info("@# BoardServiceImpl contentView");
		
		CompanyListDAO dao = sqlSession.getMapper(CompanyListDAO.class);
//		sqlSession.getMapper(CompanyListDAO.class): 
//		MyBatis의 CompanyListDAO 인터페이스의 구현체를 가져옵니다.
		
		 List<CompanyListDTO> dto = dao.RankedBySalary(param); 
//		dao.company_list(param):
//			DAO의 메서드를 호출하여 데이터베이스에서 데이터를 조회합니다.
		
		return dto;
	}

	@Override
	public List<CompanyListDTO> searchCompany(HashMap<String, String> param) {
		
		CompanyListDAO dao = sqlSession.getMapper(CompanyListDAO.class);
		
		 List<CompanyListDTO> dto = dao.searchCompany(param); 
		
		return dto;
	}

	
}
