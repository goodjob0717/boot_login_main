<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 페이지</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/main2.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css' />">
	<!-- <link rel="stylesheet" href="/css/faq.css"> -->
    <script src="<c:url value='/js/faq.js' />"></script>
</head>
<body>
    <div class="faq-container" style="margin-top: 10%; margin-bottom: 15%;">
        <h1>FAQ</h1>
    
        <!-- 스위치 탭 -->
        <div class="tabs">
            <button id="personalTab" class="active" onclick="showFAQ('personal')">개인회원</button>
            <button id="businessTab" onclick="showFAQ('business')">기업회원</button>
        </div>
    
        <!-- 개인회원 FAQ -->
        <div id="personalFAQ">
            <button class="accordion" aria-expanded="false">Q. 개인회원 가입정보를 기업회원을 변경 문의</button>
            <div class="panel">
                <p>A.<br>개인회원에서 기업회원으로 ID를 변경하는 것은 불가하며,<br>
                  기업회원에서 개인회원으로의 변경도 동일하게 불가합니다.</p>
            </div>
            <button class="accordion" aria-expanded="false">Q. 회원정보 중에 생년월일과 성별이 잘못 기입되었습니다. 어떻게 하나요?</button>
            <div class="panel">
                <p>A.<br>등록된 생년월일과 성별을 수정하실 수 없을 경우,<br> 
                고객센터로 문의 주시면 간단한 본인 확인 후 안내해 드리도록 하겠습니다.</p>
            </div>
            <button class="accordion" aria-expanded="false">Q. 회원정보를 수정하고 싶은데 어디서 하는 건가요?</button>
            <div class="panel">
                <p>A.<br>회원정보 변경은 로그인하신 후, 회원정보 관리 페이지에서 직접 변경이 가능합니다.</p>
            </div>
            <button class="accordion" aria-expanded="false">Q. 아이디를 변경하고 싶은데 가능한가요?</button>
            <div class="panel">
                <p>A.<br>이미 회원가입을 하신 경우, 아이디를 변경하실 수 없습니다.<br>
                    아이디 변경은 기존 회원의 아이디 중복 문제로 회원님이 임의로 변경하실 수 없으며, 
                    변경을 원하시면 회원탈퇴 후 신규로 가입하셔야 합니다.</p>
            </div>
            <button class="accordion" aria-expanded="false">Q. 이력서 제목 수정은 어떻게 하나요?</button>
            <div class="panel">
                <p>A.<br>개인회원 로그인 후 이력서 관리에서 이력서 [수정]을 클릭하세요.<br>
                    이력서 수정페이지에서 제목을 수정할 수 있습니다.</p>
            </div>
            <button class="accordion" aria-expanded="false">Q. 취업이 되었는데 이력서를 삭제해야 하나요?</button>
            <div class="panel">
                <p>A.<br>취업이 되신 점을 축하드립니다.<br>
                취업이 되었더라도 추후 나의 경력 관리를 위하여 이력서를 삭제하는것을 권장하지 않습니다.</p>
            </div>
        </div>
    
        <!-- 기업회원 FAQ -->
        <div id="businessFAQ" style="display:none;">
            <button class="accordion" aria-expanded="false">Q. 기업명이 변경되었는데 어떻게 수정하나요?</button>
            <div class="panel">
                <p>A.<br>회원가입 시 등록된 기업명은 회원님께서 수정하실 수 없습니다.<br>
                    번거로우시더라도 고객센터로 관련 서류를 접수해 주시면 확인 후 변경해 드리도록 하겠습니다.
                </p>
            </div>
            <button class="accordion" aria-expanded="false">Q. 해외에 있는 기업은 어떻게 회원가입을 할 수 있나요?</button>
            <div class="panel">
                <p>A.<br>해외기업이실 경우에는 해외에서 발급된 사업자등록증 사본을 아래의 담당자에게 회원가입신청서와 함께 보내주시면 확인 후 가입처리를 해 드리고 있습니다.</p>
            </div>
            <button class="accordion" aria-expanded="false">Q. 기업정보를 수정하고 싶으면 어디서 하는건가요?</button>
            <div class="panel">
                <p>A.<br>기업정보를 수정하는 방법은 다음과 같습니다.
                <p>
                    1단계. 회원 로그인 후 [기업정보 관리] 클릭해 주세요.<br>
                    2단계. 본인 확인을 위해 비밀번호를 한 번 더 입력해 주세요.<br>
                    3단계. 원하는 정보를 수정하신 후 [수정하기]를 클릭해 주시면 정보 수정이 완료가 됩니다.
                </p></p>
            </div>
            <button class="accordion" aria-expanded="false">Q. 채용공고의 등록일은 변경이 불가능 한가요?</button>
            <div class="panel">
                <p>A.<br>
                    채용공고의 등록일은 최초 공고 등록일이므로 수정이 불가능합니다.<br>
                    채용공고를 수정하면 수정한 날로 수정일은 변경이 되지만 등록일 <br>변경은 불가능 합니다.
                </p>
            </div>
            <button class="accordion" aria-expanded="false">Q. GoodJob 이력서만 접수 받고 싶어요.</button>
            <div class="panel">
                <p>A.<br>잡코리아 온라인 이력서만 접수받고 싶으신 경우에는
                <p>
                    1. 기업회원님의 아이디로 로그인 하신 후 기업홈 > 채용공고 등록에서<br>
                    2. 입사지원 방법 - 잡코리아 온라인 접수 을 선택하시고<br>
                    3. 이력서 양식 - 잡코리아 이력서를 선택하시면 됩니다.
                </p></p>
            </div>
            <button class="accordion" aria-expanded="false">Q. 홈페이지 접수로 지원자를 받고 싶어요.</button>
            <div class="panel">
                <p>A.<br>홈페이지 접수로 지원자를 받고 싶으신 경우에는
                <p>
                    1. 기업회원님의 아이디로 로그인 하신 후 기업홈 > 채용공고 등록에서<br>
                    2. 접수 방법 - 홈페이지 접수를 선택하시고<br>
                    3. 접수받으실 홈페이지 URL을 입력하시면 됩니다.
                </p></p>
            </div>
        </div>
    </div>

<script>
    // 아코디언 기능
    var acc = document.getElementsByClassName("accordion");
    for (var i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            var expanded = this.getAttribute("aria-expanded") === "true";
            this.setAttribute("aria-expanded", !expanded);
            panel.style.display = expanded ? "none" : "block";
        });
    }

    // FAQ 표시 기능
    function showFAQ(type) {
        var personalTab = document.getElementById('personalTab');
        var businessTab = document.getElementById('businessTab');
        var personalFAQ = document.getElementById('personalFAQ');
        var businessFAQ = document.getElementById('businessFAQ');

        personalTab.classList.remove('active');
        businessTab.classList.remove('active');
        personalFAQ.style.display = 'none';
        businessFAQ.style.display = 'none';
        
        if (type === 'personal') {
            personalTab.classList.add('active');
            personalFAQ.style.display = 'block';
        } else if (type === 'business') {
            businessTab.classList.add('active');
            businessFAQ.style.display = 'block';
        }
    }

    // 페이지 로드 시 개인회원 FAQ 표시
    window.onload = function() {
        showFAQ('personal');
    }
</script>

<script>
    $(document).ready(function(){
        $('header, nav').hover(function(){
            $('.submenu').stop(true, true).slideDown();
        }, function(){
            $('.submenu').stop(true, true).slideUp();
        });
    });
</script>
    
<%@ include file="footer.jsp" %>
</body>
</html>
