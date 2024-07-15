<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!--	나성엽-->
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
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
            margin-bottom: 15px;
            position: relative;
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
            border-radius: 5px;
        }
        .form-group input:invalid {
            border: 1px solid #ccc;
        }
        .form-group input:invalid + .error-message {
            border-color: red;
            display: block;
        }
        .error-message {
            display: none;
            color: red;
            font-size: small;
            margin-top: 5px;
        }
        .form-group input:focus:invalid + .error-message {
            display: block;
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
        .links {
            margin-top: 20px;
        }
        .links a {
            margin: 0 5px;
            text-decoration: none;
            color: #03A9F4;
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
        .main-logo {
            font-size: x-large;
            margin-bottom: 100px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="main-logo">
        <h1>Good Job</h1>
    </div>
    <div class="tabs">
        <button class="tab-btn active" onclick="switchTab('personal', event)">개인</button>
        <button class="tab-btn" onclick="switchTab('corporate', event)">기업</button>
    </div>
    <div class="login-box">
        <div id="personal" class="form-box active">
            <form id="user_loginForm" method="post" action="login_yn" novalidate>
                <div class="form-group">
                    <input type="text" id="user_id" name="user_id" required placeholder="아이디" oninput="setCustomValidity('')" onfocus="showError(this)" onblur="showError(this)">
                    <div class="error-message">아이디를 입력하세요.</div>
                </div>
                <div class="form-group">
                    <input type="password" id="user_pw" name="user_pw" required placeholder="비밀번호" oninput="setCustomValidity('')" onfocus="showError(this)" onblur="showError(this)">
                    <div class="error-message">비밀번호를 입력하세요.</div>
                </div>
                <div class="form-group">
                    <button type="submit">로그인</button>
                </div>
                <div class="links" style="font-size: smaller;">
                    <a href="register">회원가입</a>
                </div>
            </form>
        </div>
        <div id="corporate" class="form-box">
            <!-- 기업 로그인 폼 여기에 추가 -->
            <form id="corp_loginForm" method="post" action="corp_login_yn" novalidate>
                <div class="form-group">
                    <input type="text" id="corp_id" name="corp_id" required placeholder="아이디" oninput="setCustomValidity('')" onfocus="showError(this)" onblur="showError(this)">
                    <div class="error-message">아이디를 입력하세요.</div>
                </div>
                <div class="form-group">
                    <input type="password" id="corp_pw" name="corp_pw" required placeholder="비밀번호" oninput="setCustomValidity('')" onfocus="showError(this)" onblur="showError(this)">
                    <div class="error-message">비밀번호를 입력하세요.</div>
                </div>
                <div class="form-group">
                    <button type="submit">로그인</button>
                </div>
                <div class="links" style="font-size: smaller;">
                    <a href="register">회원가입</a>
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

    function showError(element) {
        // 모든 오류 메시지를 숨기기
        document.querySelectorAll('.error-message').forEach(function (el) {
            el.style.display = 'none';
        });

        // 현재 요소의 오류 메시지만 표시
        if (element.value === '') {
            element.nextElementSibling.style.display = 'block';
        } else {
            element.nextElementSibling.style.display = 'none';
        }
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
            input.nextElementSibling.style.display = 'none'; // 오류 메시지 숨기기
        });
    }

    document.addEventListener('DOMContentLoaded', function() {
        clearForm(); // 페이지 로드 시 폼 필드 초기화
        //처음 화면 탭 개인으로 설정
        switchTab('personal', {currentTarget: document.querySelector('.tab-btn:nth-child(1)')});
    });

    // 입력 필드에 포커스가 있을 때/없을 때 showError 함수를 호출
    document.querySelectorAll('input').forEach(function(input) {
        input.addEventListener('focus', function() {
            showError(this);
        });

        input.addEventListener('blur', function() {
            showError(this);
        });

        input.addEventListener('input', function() {
            showError(this);
        });
    });

    // 폼 제출 시 유효하지 않은 필드를 포커스
    document.querySelectorAll('form').forEach(function(form) {
        form.addEventListener('submit', function(event) {
            var invalidFields = form.querySelectorAll('input:invalid');
            if (invalidFields.length > 0) {
                invalidFields[0].focus();
                event.preventDefault();
            }
        });
    });
</script>
</body>
</html>