package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 나상엽 

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CorpMemDTO {
	private String corp_id;
	private String corp_pw;
	private String corp_name;
	private String corp_type;
	private String corp_email;
	private String epr_No;
	private String corp_address;
}