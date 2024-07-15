package com.boot.dto;

import java.sql.Blob;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CVDTO {

    // 개인정보 10
    private int cv_no;
    private String cv_title;
    private String cv_name;
    private Date cv_birth;
    private String cv_sex;
    private String cv_email;
    private int cv_phone;
    private String cv_address;
    private Blob cv_photo;
    private String cv_selfIntro;
    
    // 학력 11
    private String e_school;
    private String e_hi_name;
    private String e_hi_endMon;
    private String e_hi_status;
    private String e_uni_name;
    private Date e_uni_startMon;
    private Date e_uni_endMon;
    private String e_major;
    private double e_credit = 0.0;
    private int e_score = 0;
    private String e_uni_status;

    // 경력 8
    private String c_corpName;
    private String c_dept;
    private Date c_startMon;
    private Date c_endMon;
    private String c_position;
    private String c_duty;
    private int c_salary = 0;
    private String c_assignedTask;

    // 경험/활동 5
    private String a_corpName;
    private Date a_startMon;
    private Date a_endMon;
    private String a_content;
    private String a_activitySort;

    // 수상 3
    private String p_name;
    private Date p_date;
    private String p_corp;

    // 자격증 3
    private String l_name;
    private String l_institution;
    private Date l_passMon;

    // 교육 5
    private String t_name;
    private String t_institution;
    private Date t_startMon;
    private Date t_endMon;
    private String t_content;

    // 포트폴리오 1
    private String po_sort;
    private String po_url;
}