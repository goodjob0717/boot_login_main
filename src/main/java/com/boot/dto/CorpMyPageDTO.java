package com.boot.dto;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CorpMyPageDTO {
	private String corp_id;
	private String corp_pw;
	private String corp_name;
	private String corp_email;
	private int corp_phone;
	private String corp_address;
	private int epr_No;
	private String corp_type; 
	private String corp_boss;//여기까지 회원가입에서 긁어오는것
	
	
	private String emp_title; 
	private int emp_postNo; 
	private Timestamp emp_startDate;//채용공고 컨텐츠테이블에서 긁어오는것

	
	
}
//








