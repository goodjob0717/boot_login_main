package com.boot.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyPageDTO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private int user_birthNo;
	private int user_sex;
	private String user_email;
	private int user_phone;
	private String user_address; //여기까지 회원가입에서 긁어오는것
	
	
	private String emp_title; 
	private int emp_postNo; 
	private Timestamp emp_startDate;//채용공고 컨텐츠테이블에서 긁어오는것
	
	private int cv_no;
	private String cv_title;
	//이력서에서 긁어온다
	
	
	
}
//








