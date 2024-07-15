<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>기업 내용</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main2.css' />">

<script>
    $(document).ready(function(){
        $('header, nav').hover(function(){
            $('.submenu').stop(true, true).slideDown();
        }, function(){
            $('.submenu').stop(true, true).slideUp();
        });
    });
</script>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }

    .content {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 3rem; /* 여백 설정 */
        padding-top: 0rem; /* 헤더 높이만큼 패딩 추가 */
        padding-bottom: 12rem; /* 푸터 높이만큼 패딩 추가 */
        background: whitesmoke;
        min-height: calc(100vh - 17rem); /* 전체 높이에서 헤더와 푸터 높이만큼 빼기 */
    }
    
    .company-details {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 90%;
        max-width: 1200px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin: 20px 0;
    }
    
    .company-details h1 {
        margin-bottom: 20px;
    }
    
    .details-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        width: 100%;
        margin-bottom: 20px;
    }
    
    .details-box {
        flex: 1;
        min-width: 250px;
        margin: 10px;
        padding: 15px;
        background: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    
    .details-box p {
        margin: 5px 0;
    }
    
    .details-box h2 {
        font-size: 20px;
        color: #333;
        margin-bottom: 10px;
    }
    
    .image-box {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px 0;
        width: 100%;
    }
    
    .image-box img {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
</style>

</head>
<body>

    <div class="content">
        <h1 style="  font-size: 35px; color: lightblue;">기업 내용</h1>
        <div class="company-details">
            
            <div class="details-container">
                <div class="details-box">
                    <h2>기업 정보</h2>
                    <p><strong>이름:</strong> ${company.corp_name}</p>
                    <p><strong>유형:</strong> ${company.corp_type}</p>
                    <p><strong>주소:</strong> ${company.corp_address}</p>
                </div>
                <div class="details-box">
                    <h2>재무 정보</h2>
                    <p><strong>매출액:</strong> ${company.corpInfo_money}</p>
                    <p><strong>평균 연봉:</strong> ${company.corpInfo_Sal}</p>
                    <p><strong>사원수:</strong> ${company.corpInfo_empNo}</p>
                </div>
            </div>
            
            <div class="image-box">
                <!-- 여기에 이미지 URL을 추가하세요 -->
                <img src="<c:url value='/corp_img/corp_01.png' />" alt="기업 이미지">
            </div>
            
            <div class="details-box">
                <h2>기타 정보</h2>
                <p><strong>소개:</strong> ${company.corpInfo_intro}</p>
                <p><strong>설립 연도:</strong> ${company.corpInfo_birth}</p>
            </div>
        </div>
        <div>
            <h1 >진행중인 구인공고</h1>
        </div>
    </div>


    <%@ include file="footer.jsp" %>
</body>
</html>