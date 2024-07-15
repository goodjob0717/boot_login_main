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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/notice.css' />">

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

    h1 {
        text-align: center;
        margin: 2rem 0;
        color: lightblue;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        padding: 0 10%;
    }

    .company-box {
        display: flex;
        align-items: center;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 15px;
        background: white;
        width: 350px;
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
        width: 80px;
        height: auto;
        margin-left: 15px;
    }
</style>
</head>
<body>
    <div id="wrap">
        <h1>구인구직 홈페이지</h1>
        <!-- 여기에 콘텐츠 추가 -->
    </div>

    <h1>채용 공고 리스트</h1>
    <div class="container">
        <c:forEach var="empPost" items="${MainEmpPost}">
            <a href="<c:url value='/EmpPost_content?id=${empPost.emp_postNo}' />" class="company-box">
                <div class="company-info">
                    <h3>${empPost.emp_title}</h3>
                    <p>기업 형태: ${empPost.corpInfo}</p>
                    <p>주소: ${empPost.emp_workPlace}</p>
                    <p>업종: IT</p>
                </div>
                <img class="company-logo" src="<c:url value='/corp_img/corp_01.png' />" alt="${empPost.emp_title} 로고">
            </a>
        </c:forEach>
    </div>

    <div id="wrap">
        <h1>공지사항</h1>
        <div class="notice-container">
            <!-- 공지사항 카드가 여기에 들어갑니다 -->
            <div class="notice-card">
                <li><a href="<c:url value='/notice_detail' />">
                <div class="notice-header">
                    <h2>공지사항입니다</h2>
                    <span class="notice-date">2024-07-15</span>
                </div>
                <p class="notice-content">프로젝트 1. 최종발표일은 7월 17일 입니다.</p>
            </div>
            <!-- 추가적인 공지사항 카드가 여기에 들어갑니다 -->
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>