package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//나성엽

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserMemDTO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private int user_birthNo;
	private String user_email;
	private String user_phone;
	private String user_address;
}