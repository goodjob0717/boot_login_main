<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

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
</head>
<body>
   


    <div id="wrap">
        <div>
            <h1  style="color: black; margin: 2rem 0;">검색 결과 </h1>        
        </div>
        <c:if test="${not empty param.query}">
                  <p>검색어: ${param.query}</p>
        </c:if>

          <!-- 여기에 실제 검색 결과를 추가 -->
          <c:forEach var="company" items="${companyList}">
            <p>${company.corp_name} - ${company.corp_address} - ${company.corpInfo_Sal}</p>
        </c:forEach>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>