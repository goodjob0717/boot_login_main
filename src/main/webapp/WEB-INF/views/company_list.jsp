<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>기업 리스트</title>

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
        /* padding: 0 10%;   3개씩 배열할수있는수치 0 10%*/

    }

    .company-box {
        display: flex;
        align-items: center;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 15px;
        background: white;
        width: 350px; /* Fixed width for each card */
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

    <h1>기업 리스트</h1>
    <div class="container">
        <c:forEach var="company" items="${company_list}">
            <a href="<c:url value='/company_content?id=${company.corpInfo_No}' />" class="company-box">
                <div class="company-info">
                    <h3>${company.corp_name}</h3>
                    <p>기업 형태: ${company.corp_type}</p>
                    <p>주소: ${company.corp_address}</p>
                    <p>업종: IT</p>
                </div>
                <img class="company-logo" src="<c:url value='/corp_img/corp_01.png' />" alt="${company.corp_name} 로고">
            </a>
        </c:forEach>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>