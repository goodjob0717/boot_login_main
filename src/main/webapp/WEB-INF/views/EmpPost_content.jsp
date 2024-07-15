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
    <div id="wrap">
        <h1>구인구직 홈페이지  </h1>
        <!-- 여기에 콘텐츠 추가 -->
    </div>

    

    <%@ include file="footer.jsp" %>
</body>
</html>