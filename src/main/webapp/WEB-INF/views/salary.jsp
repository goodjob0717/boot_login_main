<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>구인구직 홈페이지</title>

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
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 3rem; /* 여백 설정 */
        padding-top: 10rem; /* 헤더 높이만큼 패딩 추가 */
        padding-bottom: 12rem; /* 푸터 높이만큼 패딩 추가 */
        background: whitesmoke;
        min-height: calc(100vh - 17rem); /* 전체 높이에서 헤더와 푸터 높이만큼 빼기 */
    }
    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        padding: 0 40%;
    }

    .company-box {
        display: flex;
        align-items: center;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 15px;
        background: white;
        width: 550px; /* Fixed width for each card */
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        text-decoration: none;
        color: inherit;
    }

    .company-box:hover {
        transform: scale(1.02);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    .company-info {
        flex: 1;
    }

    .company-info h3 {
        margin: 0;
        font-size: 18px;
        color: #333;
    }

    .company-info p {
        margin: 5px 0;
        font-size: 14px;
        color: #666;
    }

    .company-logo {
        width: 80px; /* Adjusted logo size */
        height: auto;
        margin-left: 15px; /* Space between text and image */
    }
</style>
</head>
<body>
    <div id="wrap">
        <h1 style="color: black; margin: 2rem 0;"> 연봉 정보 </h1>
    </div>
    <div id="wrap">
        <h1 style="color: red; margin: 2rem 0;"> TOP 5 연봉 </h1>
    </div>
    <div id="wrap">
        <h1 style="color: red; margin: 2rem 0;"> 평균 연봉</h1>

    </div>

    <div class="container">
        <c:forEach var="company" items="${salary_list}">
            <a href="<c:url value='/company_content?id=${company.corpInfo_No}' />" class="company-box">
                <div class="company-info">
                    <h3>${company.corp_name}</h3>
                    <p>주소: ${company.corp_address}</p>
                    <p>업종: IT</p>
                    <p style="color: red;">연봉: ${company.corpInfo_Sal}</p>
                </div>
                <img class="company-logo" src="<c:url value='/number_img/number_${company.ranking}.png' />" alt="${company.corp_name} 순위">
            </a>
        </c:forEach>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>