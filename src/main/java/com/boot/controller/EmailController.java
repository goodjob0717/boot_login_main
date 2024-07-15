package com.boot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.boot.service.EmailService;
import com.boot.service.VerificationCodeService;

import lombok.extern.slf4j.Slf4j;

//나상엽

@RestController
@Slf4j
@RequestMapping("/email")
public class EmailController {
	
	@Autowired
    private EmailService emailService;
    
	@Autowired
    private VerificationCodeService verificationCodeService;

    @PostMapping("/register")
    public ResponseEntity<String> sendVerificationCode(@RequestParam String email) {
    	log.info("@# sendVerificationCode");
    	log.info("@# email=>",email);
    	
    	String code = verificationCodeService.generateCode();
        
        emailService.sendEmail(email, "이메일 인증 코드", "인증 코드: " + code);
        verificationCodeService.saveCode(email, code);
        
        return ResponseEntity.ok("인증번호가 이메일로 전송되었습니다.");
    }

    @PostMapping("/verify")
    public ResponseEntity<String> verifyCode(@RequestParam String email, @RequestParam String code) {
    	log.info("@# verifyCode");
    	log.info("@# email=>",email);
    	
        boolean isValid = verificationCodeService.verifyCode(email, code);
        
        if (isValid) {
            return ResponseEntity.ok("인증에 성공했습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인증번호가 올바르지 않습니다.");
        }
    }
    
    @GetMapping("/status")
    public ResponseEntity<Map<String, Boolean>> getEmailVerificationStatus(@RequestParam String email) {
        boolean isVerified = verificationCodeService.isEmailVerified(email);
        
        Map<String, Boolean> response = new HashMap<>();
        response.put("verified", isVerified);
        
        return ResponseEntity.ok(response);
    }
}