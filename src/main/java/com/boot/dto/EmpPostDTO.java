package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpPostDTO {
	   private int emp_postNo;          // 채용 공고 번호
	    private int emp_career;          // 경력 (정수형)
	    private String emp_status;      // 학력 (문자열)
	    private String emp_duty;        // 직무 (문자열)
	    private int emp_money;          // 급여 (정수형)
	    private String emp_stime;       // 채용 공고 시작 시간 (문자열)
	    private String emp_etime;       // 채용 공고 종료 시간 (문자열)
	    private String emp_workPlace;   // 근무 장소 (문자열)
	    private String emp_type;        // 고용 형태 (문자열)
	    private Timestamp emp_startDate; // 채용 시작일 (타임스탬프)
	    private Timestamp emp_endDate;   // 채용 종료일 (타임스탬프)
	    private String emp_title;       // 채용 제목 (문자열)
	    private String emp_content;     // 채용 내용 (문자열)
	    private String corpInfo;        // 기업 업종 (문자열)
}

