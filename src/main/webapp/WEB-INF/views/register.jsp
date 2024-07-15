<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	
<!--나성엽	-->
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        body {
            font-family: 'Nanum Gothic', sans-serif;
            background-color: #F0F8FF;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }
        .container {
            text-align: center;
            margin-bottom: 100px;
        }
        .login-box {
            width: 500px;
            background-color: #fff;
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid #ccc;
            border-radius: 10px;
            display: inline-block;
            text-align: left;
        }
        .tabs {
            display: flex;
            justify-content: center;
            margin-bottom: -1px;
        }
        .tabs button {
            flex: 1;
            padding: 10px;
            background: #f2f2f2;
            border: 1px solid #ccc;
            border-bottom: none;
            cursor: pointer;
            transition: background 0.3s;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .tabs button.active {
            background: #B3D4FC;
            color: #000;
            border-bottom: 1px solid #B3D4FC;
        }
        .form-box {
            display: none;
            border: 1px solid #ccc;
            padding: 30px;
        }
        .form-box.active {
            display: block;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background: #E6F0F8;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .form-group button:hover {
            background: #B3D4FC;
        }
        .validation-message {
            color: red;
            font-size: small;
            display: none;
            position: absolute;
        }
        .form-group {
            position: relative;
        }
        .links {
            margin-top: 20px;
        }
        .links a {
            margin: 0 5px;
            text-decoration: none;
            color: #949699;
        }
        .links a:hover {
            text-decoration: underline;
        }
        .home-link {
            display: block;
            margin-top: 30px;
            color: #03A9F4;
            text-decoration: none;
        }
        .home-link:hover {
            text-decoration: underline;
        }
        .register-title {
            font-size: x-large;
            margin-bottom: 50px;
            margin-top: 150px;
        }
        span button {
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
<div class="container">
	<h2 class="register-title">회원가입</h2>
	<div class="tabs">
		<button class="tab-btn active" onclick="switchTab('personal', event)">개인</button>
		<button class="tab-btn" onclick="switchTab('corporate', event)">기업</button>
	</div>
	<div class="login-box">
		<div id="personal" class="form-box active">
			<form name="user_registerForm" method="post" action="register_ok">
				<div class="form-group" style="color: rgb(239, 61, 61); font-size: small;">
					*표시는 필수사항 입니다.
				</div>
				<div class="form-group">
					<input type="text" id="user_id" name="user_id" placeholder="*아이디" style="width: 73%;">
					<div class="validation-message">아이디를 입력하세요.</div>
                    <span>
                        <button type="button" style="width: 25%; border: 1px solid #ccc;" onclick="verifyUserId()">중복 확인</button>
                    </span>
				</div>
				<div class="form-group">
					<input type="password" id="user_pw" name="user_pw" placeholder="*비밀번호">
					<div class="validation-message">비밀번호를 입력하세요.</div>
				</div>
				<div class="form-group">
					<input type="password" id="user_pwcheck" name="user_pwcheck" placeholder="*비밀번호확인">
					<div class="validation-message">비밀번호 확인을 입력하세요.</div>
				</div>
				<div class="form-group">
					<input type="text" id="user_name" name="user_name" placeholder="*이름">
					<div class="validation-message">이름을 입력하세요.</div>
				</div>
				<div class="form-group">
					<input type="text" id="user_birthNo" maxlength="6" name="user_birthNo" placeholder="*주민번호" style="width: 45%;">
                    <div class="validation-message">주민번호 앞자리를 입력하세요.</div>
					&nbsp; - &nbsp;
					<span>
                        <input type="text" id="user_sex" name="user_sex" maxlength="7" style="width: 45%;" oninput="maskUserSex()">
                        <div class="validation-message">주민번호 뒷자리를 입력하세요.</div>
					</span>
				</div>
				<div class="form-group">
                    <input type="text" id="user_phone" name="user_phone" placeholder="*휴대폰 번호">
                    <div class="validation-message">휴대폰 번호를 입력하세요.</div>
				</div>
				<div class="form-group">
					<input type="text" id="user_address" name="user_address" placeholder="*주소">
					<div class="validation-message">주소를 입력하세요.</div>
				</div>
				<div class="form-group">
                    <input type="text" id="user_email" name="user_email" placeholder="*이메일" style="width: 73%;">
                    <div class="validation-message">이메일을 입력하세요.</div>
                    <span>
                        <button type="button" id="sendVerificationButton" style="width: 25%; border: 1px solid #ccc;" onclick="sendVerificationCode()">인증번호 전송</button>
                    </span>
                </div>
                <div class="form-group">
                    <input type="text" id="user_checkNo" name="user_checkNo" placeholder="인증번호를 입력하세요" style="width: 73%;">
                    <div class="validation-message"></div>
                    <span>
                        <button type="button" style="width: 15%; border: 1px solid #ccc;" onclick="verifyCode()">확인</button>
                    </span>
                </div>
				<div class="form-group">
					<button type="submit">회원가입</button>
				</div>
				<div class="links" style="font-size: smaller;">
					<a href="login">이전으로</a>
				</div>
			</form>
		</div>
		<div id="corporate" class="form-box">
			<!-- 기업 회원가입 폼-->
			<form name="corp_registerForm" method="post" action="corp_register_ok">
				<div class="form-group" style="color: rgb(239, 61, 61); font-size: small;">
					*표시는 필수사항 입니다.
				</div>
				<div class="form-group">
					<input type="text" id="corp_id" name="corp_id" placeholder="*아이디" style="width: 73%;">
					<div class="validation-message">아이디를 입력하세요.</div>
                    <span>
                        <button type="button" style="width: 25%; border: 1px solid #ccc;" onclick="verifyCorpId()">중복 확인</button>
                    </span>
				</div>
				<div class="form-group">
					<input type="password" id="corp_pw" name="corp_pw" placeholder="*비밀번호">
					<div class="validation-message">비밀번호를 입력하세요.</div>
				</div>
				<div class="form-group">
					<input type="password" id="corp_pwcheck" placeholder="*비밀번호확인">
					<div class="validation-message">비밀번호 확인을 입력하세요.</div>
				</div>
				<div class="form-group">
					<input type="text" id="corp_name" name="corp_name" placeholder="*회사명">
					<div class="validation-message">회사명을 입력하세요.</div>
				</div>
				<div class="form-group">
					<select id="corp_type" name="corp_type">
						<option value="none" disabled selected>--기업업종선택--</option>
						<option>제조업</option>
						<option>서비스업</option>
						<option>IT 및 소프트웨어</option>
						<option>건설업</option>
						<option>유통업</option>
						<option>농업 및 수산업</option>
						<option>에너지 및 자원</option>
						<option>통신업</option>
						<option>미디어 및 엔터테인먼트</option>
						<option>공공 및 비영리</option>
                        <div class="validation-message">기업업종을 선택하세요.</div>
					</select>
				</div>
				<div class="form-group">
					<input type="text" id="epr_No" name="epr_No" placeholder="*사업자등록번호">
					<div class="validation-message">사업자등록번호를 입력하세요.</div>
				</div>
				<div class="form-group">
					<input type="text" id="corp_email" name="corp_email" placeholder="*이메일">
					<div class="validation-message">이메일을 입력하세요.</div>
				</div>
				<div class="form-group">
					<input type="text" id="corp_address" name="corp_address" placeholder="*회사주소">
					<div class="validation-message">회사주소를 입력하세요.</div>
				</div>
				<div class="form-group">
					<button type="submit">회원가입</button>
				</div>
				<div class="links" style="font-size: smaller;">
					<a href="login">이전으로</a>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
    // 다른 탭 눌렀을 때 input 정보 삭제
	function switchTab(tab, event) {
		document.querySelectorAll('.form-box').forEach(function (el) {
			el.classList.remove('active');
		});
		document.querySelectorAll('.tab-btn').forEach(function (el) {
			el.classList.remove('active');
		});
		document.getElementById(tab).classList.add('active');
		event.currentTarget.classList.add('active');
		clearForm(); // 폼 필드 초기화
	}

	// 뒤로 가기 눌렀을 때 input 정보 삭제
	window.addEventListener('pageshow', function(event) {
		if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
			clearForm();
		}
	});

	function clearForm() {
		document.querySelectorAll('input').forEach(function (input) {
			input.value = '';
		});
		document.querySelectorAll('.validation-message').forEach(function (message) {
			message.style.display = 'none';
		});
	}

    document.addEventListener('DOMContentLoaded', function() {
        clearForm(); // 페이지 로드 시 폼 필드 초기화

        // 폼 필드에 포커스가 있을 때만 오류 메시지를 표시하고, 다른 필드로 이동하면 숨김
        document.querySelectorAll('input, select').forEach(function (input) {
            input.addEventListener('focus', function() {
                if (this.nextElementSibling.classList.contains('validation-message') && this.nextElementSibling.style.display !== 'none') {
                    this.nextElementSibling.style.display = 'block';
                }
            });
            input.addEventListener('blur', function() {
                if (!this.value) {
                    this.nextElementSibling.style.display = 'none';
                }
            });
            // 입력할 때 오류 메시지 숨김
            input.addEventListener('input', function() {
                if (this.value) {
                    this.nextElementSibling.style.display = 'none';
                }
            });
        });

        // 제출 시 유효성 검사 및 오류 메시지를 표시하도록 함
        document.querySelectorAll('form').forEach(function (form) {
            form.addEventListener('submit', function(event) {
                event.preventDefault(); // 기본 제출 동작을 막음

                // 추가된 유효성 검사 함수 호출
                if (form.name === 'user_registerForm') {
                    if (!validateUserForm(form)) {
                        return;
                    }
                } else if (form.name === 'corp_registerForm') {
                    if (!validateCorpForm(form)) {
                        return;
                    }
                }
                
                // user_sex 값을 첫 번째 숫자만 남기도록 수정
                var userSexInput = form.querySelector('#user_sex');
                if (userSexInput) {
                    userSexInput.value = userSexInput.value.charAt(0);
                }
                
                alert("회원가입이 완료되었습니다.");
                form.submit(); // 모든 필드가 유효한 경우에만 폼을 제출함
            });
        });
    });

    // 개인회원 유효성 검사 함수
    function validateUserForm(form) {
        const user_id = form.user_id.value;
        const user_pw = form.user_pw.value;
        const user_pwcheck = form.user_pwcheck.value;
        const user_name = form.user_name.value;
        const user_birthNo = form.user_birthNo.value;
        const user_sex = form.user_sex.value;
        const user_email = form.user_email.value;
        const user_address = form.user_address.value;
        const user_phone = form.user_phone.value;
        const user_checkNo = form.user_checkNo.value;
        const userIdRegex = /^[a-zA-Z0-9]{4,12}$/;
        const userPwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$/;
        const userBirthNoRegex = /^[0-9]{6}$/;
        // 주민번호 뒷자리는 첫째자리 숫자만 필요함
        const userSexRegex = /^[0-9]\*{6}$/;
        const userPhoneRegex = /^[0-9]{10,11}$/;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!user_id) {
            form.user_id.nextElementSibling.textContent = '아이디를 입력하세요.';
            form.user_id.nextElementSibling.style.display = 'block';
            form.user_id.focus();
            return false;
        } else if (!userIdRegex.test(user_id)) {
            form.user_id.nextElementSibling.textContent = '아이디는 4자 이상 12자 이하의 영문자 또는 숫자이어야 합니다.';
            form.user_id.nextElementSibling.style.display = 'block';
            form.user_id.focus();
            return false;
        } else if (!isUserIdAvailable) {
            alert('아이디 중복 확인을 해주세요.');
            return false;
        } else {
            form.user_id.nextElementSibling.style.display = 'none';
        }

        if (!user_pw) {
            form.user_pw.nextElementSibling.textContent = '비밀번호를 입력하세요.';
            form.user_pw.nextElementSibling.style.display = 'block';
            form.user_pw.focus();
            return false;
        } else if (!userPwRegex.test(user_pw)) {
            form.user_pw.nextElementSibling.textContent = '비밀번호는 8자 이상이어야 하며 영문자, 숫자, 특수문자를 포함해야 합니다.';
            form.user_pw.nextElementSibling.style.display = 'block';
            form.user_pw.focus();
            return false;
        } else {
            form.user_pw.nextElementSibling.style.display = 'none';
        }

        if (user_pw !== user_pwcheck) {
            form.user_pwcheck.nextElementSibling.textContent = '비밀번호와 비밀번호 확인이 일치하지 않습니다.';
            form.user_pwcheck.nextElementSibling.style.display = 'block';
            form.user_pwcheck.focus();
            return false;
        } else {
            form.user_pwcheck.nextElementSibling.style.display = 'none';
        }

        if (!user_name) {
            form.user_name.nextElementSibling.textContent = '이름을 입력하세요.';
            form.user_name.nextElementSibling.style.display = 'block';
            form.user_name.focus();
            return false;
        } else {
            form.user_name.nextElementSibling.style.display = 'none';
        }

        if (!user_birthNo) {
            form.user_birthNo.nextElementSibling.textContent = '주민번호 앞자리를 입력하세요.';
            form.user_birthNo.nextElementSibling.style.display = 'block';
            form.user_birthNo.focus();
            return false;
        } else if (!userBirthNoRegex.test(user_birthNo)) {
            form.user_birthNo.nextElementSibling.textContent = '주민번호 앞자리는 6자리의 숫자이어야 합니다.';
            form.user_birthNo.nextElementSibling.style.display = 'block';
            form.user_birthNo.focus();
            return false;
        } else {
            form.user_birthNo.nextElementSibling.style.display = 'none';
        }

        if (!user_sex) {
            form.user_sex.nextElementSibling.textContent = '주민번호 뒷자리를 입력하세요.';
            form.user_sex.nextElementSibling.style.display = 'block';
            form.user_sex.focus();
            return false;
        } else if (!userSexRegex.test(user_sex)) {
            form.user_sex.nextElementSibling.textContent = '올바른 주민번호를 입력해 주세요.';
            form.user_sex.nextElementSibling.style.display = 'block';
            form.user_sex.focus();
            return false;
        } else {
            form.user_sex.nextElementSibling.style.display = 'none';
        }

        if (!user_phone) {
            form.user_phone.nextElementSibling.textContent = '휴대폰 번호를 입력하세요.';
            form.user_phone.nextElementSibling.style.display = 'block';
            form.user_phone.focus();
            return false;
        } else if (!userPhoneRegex.test(user_phone)) {
            form.user_phone.nextElementSibling.textContent = '휴대폰 번호는 10~11자리의 숫자이어야 합니다.';
            form.user_phone.nextElementSibling.style.display = 'block';
            form.user_phone.focus();
            return false;
        } else {
            form.user_phone.nextElementSibling.style.display = 'none';
        }
        
        if (!user_address) {
            form.user_address.nextElementSibling.textContent = '주소를 입력하세요.';
            form.user_address.nextElementSibling.style.display = 'block';
            form.user_address.focus();
            return false;
        } else {
            form.user_address.nextElementSibling.style.display = 'none';
        }
        
        if (!user_email) {
            form.user_email.nextElementSibling.textContent = '이메일을 입력하세요.';
            form.user_email.nextElementSibling.style.display = 'block';
            form.user_email.focus();
            return false;
        } else if (!emailRegex.test(user_email)) {
            form.user_email.nextElementSibling.textContent = '유효한 이메일 형식을 입력하세요.';
            form.user_email.nextElementSibling.style.display = 'block';
            form.user_email.focus();
            return false;
        } else {
            form.user_email.nextElementSibling.style.display = 'none';
        }

        // 이메일 인증 상태 확인
        if (!verifyEmailStatus(user_email)) {
            alert("이메일 인증을 완료해주세요.");
            form.user_email.focus();
            event.preventDefault();
            return false;
        }

        return true;
    }

    // 기업회원 유효성 검사 함수
   function validateCorpForm(form) {
        const corp_id = form.corp_id.value;
        const corp_pw = form.corp_pw.value;
        const corp_pwcheck = form.corp_pwcheck.value;
        const corp_name = form.corp_name.value;
        const corp_type = form.corp_type.value;
        const epr_No = form.epr_No.value;
        const corp_email = form.corp_email.value;
        const corp_address = form.corp_address.value;
        const corpIdRegex = /^[a-zA-Z0-9]{4,12}$/;
        const corpPwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$/;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const eprNoRegex = /^[0-9]{10}$/;
    
        if (!corp_id) {
            form.corp_id.nextElementSibling.textContent = '아이디를 입력하세요.';
            form.corp_id.nextElementSibling.style.display = 'block';
            form.corp_id.focus();
            return false;
        } else if (!corpIdRegex.test(corp_id)) {
            form.corp_id.nextElementSibling.textContent = '아이디는 4자 이상 12자 이하의 영문자 또는 숫자이어야 합니다.';
            form.corp_id.nextElementSibling.style.display = 'block';
            form.corp_id.focus();
            return false;
        } else if (!isCorpIdAvailable) {
            alert('아이디 중복 확인을 해주세요.');
            return false;
        } else {
            form.corp_id.nextElementSibling.style.display = 'none';
        }

        if (!corp_pw) {
            form.corp_pw.nextElementSibling.textContent = '비밀번호를 입력하세요.';
            form.corp_pw.nextElementSibling.style.display = 'block';
            form.corp_pw.focus();
            return false;
        } else if (!corpPwRegex.test(corp_pw)) {
            form.corp_pw.nextElementSibling.textContent = '비밀번호는 8자 이상이어야 하며 영문자, 숫자, 특수문자를 포함해야 합니다.';
            form.corp_pw.nextElementSibling.style.display = 'block';
            form.corp_pw.focus();
            return false;
        } else {
            form.corp_pw.nextElementSibling.style.display = 'none';
        }

        if (corp_pw !== corp_pwcheck) {
            form.corp_pwcheck.nextElementSibling.textContent = '비밀번호와 비밀번호 확인이 일치하지 않습니다.';
            form.corp_pwcheck.nextElementSibling.style.display = 'block';
            form.corp_pwcheck.focus();
            return false;
        } else {
            form.corp_pwcheck.nextElementSibling.style.display = 'none';
        }
        
        if (!corp_name) {
            form.corp_name.nextElementSibling.textContent = '회사명을 입력하세요.';
            form.corp_name.nextElementSibling.style.display = 'block';
            form.corp_name.focus();
            return false;
        } else {
            form.corp_name.nextElementSibling.style.display = 'none';
        }
        
        if (!epr_No) {
            form.epr_No.nextElementSibling.textContent = '사업자등록번호를 입력하세요.';
            form.epr_No.nextElementSibling.style.display = 'block';
            form.epr_No.focus();
            return false;
        } else if (!eprNoRegex.test(epr_No)) {
            form.epr_No.nextElementSibling.textContent = '올바른 번호를 입력하세요.';
            form.epr_No.nextElementSibling.style.display = 'block';
            form.epr_No.focus();
            return false;
        } else {
            form.epr_No.nextElementSibling.style.display = 'none';
        }
        
        if (!corp_email) {
            form.corp_email.nextElementSibling.textContent = '이메일을 입력하세요.';
            form.corp_email.nextElementSibling.style.display = 'block';
            form.corp_email.focus();
            return false;
        } else if (!emailRegex.test(corp_email)) {
            form.corp_email.nextElementSibling.textContent = '유효한 이메일 형식을 입력하세요.';
            form.corp_email.nextElementSibling.style.display = 'block';
            form.corp_email.focus();
            return false;
        } else {
            form.corp_email.nextElementSibling.style.display = 'none';
        }
        
        if (!corp_address) {
            form.corp_address.nextElementSibling.textContent = '회사주소를 입력하세요.';
            form.corp_address.nextElementSibling.style.display = 'block';
            form.corp_address.focus();
            return false;
        } else {
            form.corp_address.nextElementSibling.style.display = 'none';
        }

        if (corp_type === "none") {
            alert("기업업종을 선택하세요.");
            form.corp_type.focus();
            event.preventDefault();
            return false;
        }

        return true;
    }

    // 주민번호 뒷자리 *처리
    
    function maskUserSex() {
        var input = document.getElementById('user_sex');
        var value = input.value;
        var maskedValue = value[0] + '*'.repeat(value.length - 1);
        input.value = maskedValue;
    }

    // 유저 아이디 중복 확인 함수
    let isUserIdAvailable = false;

    function verifyUserId() {
        const userId = document.getElementById('user_id').value;
        const verifyUserButton = document.querySelector('button[onclick="verifyUserId()"]');
        const userIdRegex = /^[a-zA-Z0-9]{4,12}$/;

        if (!userId) {
            alert('아이디를 입력하세요.');
            return;
        } else if (!userIdRegex.test(userId)) {
            alert('올바른 아이디를 입력하세요.');
            return;
        }

        $.ajax({
            type: 'POST',
            url: 'check_user_id',  // 서버의 아이디 중복 확인 URL
            data: { user_id: userId },
            success: function(response) {
                if (response.available) {
                    alert('사용 가능한 아이디입니다.');
                    isUserIdAvailable = true;
                    verifyUserButton.innerText = '사용 가능';
                    // verifyUserButton.disabled = true;  // 중복 확인 후 버튼 비활성화
                } else {
                    alert('이미 사용 중인 아이디입니다.');
                    verifyUserButton.innerText = '중복 확인';
                    isUserIdAvailable = false;
                }
            },
            error: function() {
                alert('아이디 중복 확인에 실패했습니다.');
            }
        });
    }

    // 기업 아이디 중복 확인 함수
    let isCorpIdAvailable = false;

    function verifyCorpId() {
        const corpId = document.getElementById('corp_id').value;
        const verifyCorpButton = document.querySelector('button[onclick="verifyCorpId()"]');
        const corpIdRegex = /^[a-zA-Z0-9]{4,12}$/;

        if (!corpId) {
            alert('아이디를 입력하세요.');
            return;
        } else if (!corpIdRegex.test(corpId)) {
            alert('올바른 아이디를 입력하세요.');
            return;
        }

        $.ajax({
            type: 'POST',
            url: 'check_corp_id',  // 서버의 아이디 중복 확인 URL
            data: { corp_id: corpId },
            success: function(response) {
                if (response.available) {
                    alert('사용 가능한 아이디입니다.');
                    isCorpIdAvailable = true;
                    verifyCorpButton.innerText = '사용 가능';
                } else {
                    alert('이미 사용 중인 아이디입니다.');
                    verifyCorpButton.innerText = '중복 확인';
                    isCorpIdAvailable = false;
                }
            },
            error: function() {
                alert('아이디 중복 확인에 실패했습니다.');
            }
        });
    }
</script>

<!-- 이메일 인증 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function sendVerificationCode() {
        var email = document.getElementById("user_email").value;
        var sendButton = document.getElementById("sendVerificationButton");
        
        if (!email) {
            alert("이메일을 입력하세요.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "email/register",
            data: { email: email },
            success: function(response) {
                alert(response);
                // 버튼 텍스트를 '재전송'으로 변경
                sendButton.innerText = "재전송";
                // 버튼을 비활성화 후 60초 후에 활성화
                sendButton.disabled = true;
                setTimeout(function() {
                    sendButton.disabled = false;
                }, 60000); // 60초
            },
            error: function() {
                alert("인증번호 전송에 실패했습니다.");
            }
        });
    }

    function verifyCode() {
        var email = document.getElementById("user_email").value;
        var code = document.getElementById("user_checkNo").value;
        const verifyCodeButton = document.querySelector('button[onclick="verifyCode()"]');

        if (!email || !code) {
            alert("이메일과 인증번호를 입력하세요.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "email/verify",
            data: { email: email, code: code },
            success: function(response) {
                alert(response);
                verifyCodeButton.disabled = true;  // 중복 확인 후 버튼 비활성화
            },
            error: function() {
                alert("인증번호 확인에 실패했습니다.");
            }
        });
    }

    function verifyEmailStatus(email) {
        var isVerified = false;

        $.ajax({
            type: "GET",
            url: "email/status",
            data: { email: email },
            async: false, // 동기 요청으로 이메일 인증 상태 확인
            success: function(response) {
                isVerified = response.verified;
            },
            error: function() {
                alert("이메일 인증 상태를 확인할 수 없습니다.");
            }
        });

        return isVerified;
    }
</script>
</body>
</html>