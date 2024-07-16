<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<header>
    <a href="<c:url value='/main' />">
        <img src="<c:url value='/img/logo.png' />" alt="Logo">
    </a>
    <div class="header-content">
        Good job  
    </div>
    <div class="search-container">
        <form action="/search" method="get">
        <!-- <form action="/search.jsp" method="get"> -->
            <!-- <form action="${pageContext.request.contextPath}/search" method="get"> -->
            <input type="text" name="query" placeholder="굿 잡">
            <input type="submit" value=" ">
        </form>
    </div>
    <nav>
        <div class="submenu-back">
        <ul >
            <li>
                <a href="#">채용 공고</a>
                <div class="submenu">
                    <ul>
                        <li><a href="#">채용 공고</a></li>
                        <li><a href="#">지역별</a></li>
                        <li><a href="#">직무별</a></li>
                        <li><a href="#">역세권별</a></li>
                        <li><a href="#">TOP 100</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">기업 정보</a>
                <div class="submenu">
                    <ul>
                        <li><a href="#">기업 정보</a></li>
                        <li><a href="<c:url value='/company_list' />">기업 리스트</a></li>
                        <li><a href="<c:url value='/salary' />">연봉</a></li>
                        <li><a href="#">기업 리뷰</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">커뮤니티</a>
                <div class="submenu">
                    <ul>
                        <li><a href="#">커뮤니티</a></li>
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="#">현직자 인터뷰</a></li>
                        <li><a href="#">QnA</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">고객지원</a>
                <div class="submenu">
                    <ul>
                        <li><a href="#">고객지원</a></li>
                        <li><a href="<c:url value='/faq' />">FQA (자주하는 질문)</a></li>
                        <li><a href="#">1:1 문의 </a></li>
                        <li><a href="#">공지사항</a></li>
                    </ul>
                </div>
            </li>

              <!-- 로그인 및 회원가입 링크 추가 -->
              <li class="nav-right">
		
                <!-- 혹여나 마이페이지 이동중  오류 발생시 a href방식으로 변경할수도  -->
                <form action="myPage" method="get" id="myPageForm">
<!--                <a href="myPage?user_id=${user_id}">${user_id}마이페이지</a>-->
                    <input type="hidden" name="user_id" value="${user_id}"/>
<!--                    <a type="button" onclick="document.getElementById('myPageForm').submit();">마이페이지</a>-->
					<a href="myPage?user_id=${user_id}">${user_id}마이페이지</a>
					<input type="submit" value="마이페이지">
						
                </form>
                <a href="login">로그아웃</a>
            </li>
        </ul>
    </div>
    </nav>
</header>