package com.boot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyListDTO {
	private int ranking;                   // 순위
    private int corpInfo_No;           // 기업정보의번호
    private String corp_name;          // 기업명
    private String corp_type;          // 기업형태
    private String corp_address;       // 회사주소
    private int corpInfo_Sal;          // 평균 연봉
    private int corpInfo_empNo;        // 사원수
    private Long corpInfo_money;       // 매출액
    private String corpInfo_intro;     // 기업소개
    private Date  corpInfo_birth;        // 설립년도
}

