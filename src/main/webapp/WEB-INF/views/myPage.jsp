<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myPage.css">
</head>
<body>
    <div id="wrap">
        <header id="header">
            <div class="header_logo"><a href="${pageContext.request.contextPath}/main">
                <div class="header_logo_img"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></div>
            </a></div>
            <h3>Good Job</h3>
            <a class="header_user_id" id="header_user_id">
				<c:out value="${cont_mypage_ID}" />님 
			</a><!-- 여기에 사용자 아이디 받아서 올리기-->
			<div class="user_ico">
                <div class="user_ico_img"><img src="${pageContext.request.contextPath}/resources/img/user-icon.png"></div>
            </div>
        </header><!-- end header -->

        <div id="leftMenu">
            <nav>
                <ul>
                    <li><div class="leftMenu_mypage"><img src="${pageContext.request.contextPath}/resources/img/user.png">개인정보</div></li>
                    <li><div class="leftMenu_mypageEdit"><img src="${pageContext.request.contextPath}/resources/img/user-icon.png">개인정보변경</div></li>
                    <li><div class="leftMenu_apply"><img src="${pageContext.request.contextPath}/resources/img/send.png">지원현황<!--여기에 apply 총 갯수--></div></li>
                    <li><div class="leftMenu_recommend"><img src="${pageContext.request.contextPath}/resources/img/recomand.png">지원할만한공고 0<!--여기에 recommend 총 갯수--></div></li>
                    <li><div class="leftMenu_scrap"><img src="${pageContext.request.contextPath}/resources/img/scrap.png">스크랩/관심기업 0<!--여기에 scrap 총 갯수--></div></li>
                    <li><div class="leftMenu_resume"><img src="${pageContext.request.contextPath}/resources/img/scrap.png">이력서 0<!--여기에 resume 총 갯수--></div></li>
                    <li><div class="leftMenu_myQuestion"><img src="${pageContext.request.contextPath}/resources/img/question.png">내가 한 질문 0<!--여기에 myQuestion 총 갯수--></div></li>
                </ul>
            </nav>
        </div><!-- end leftMenu -->

        <div id="cont_mypage">
            <h2>개인정보</h2><br><br>
            <div class="cont_mypage_wrap">
                <div class="cont_mypage_left">
                    <a class="cont_mypage_ID">아이디</a><br><br>
                    <a class="cont_mypage_sex">성별</a><br><br>
                    <a class="cont_mypage_name">이름</a><br><br>
                    <a class="cont_mypage_birth">생년월일</a><br><br>
                    <a class="cont_mypage_email">이메일</a><br><br>
                </div>
                <c:forEach items="${list1}" var="dto">
                    <div class="cont_mypage_right">
                        <a class="cont_mypage_ID">${dto.user_id}</a><br><br>
						<c:set var="cont_mypage_ID" value="${dto.user_id}" scope="session"/>
                        <a class="cont_mypage_sex">${dto.user_sex}</a><br><br>
                        <a class="cont_mypage_name">${dto.user_name}</a><br><br>
                        <a class="cont_mypage_birth">${dto.user_birthNo}</a><br><br>
                        <a class="cont_mypage_email">${dto.user_email}</a><br><br>
						
                    </div>
                </c:forEach>
            </div>
            <div class="mypage_button">
                <button>정보수정</button>
            </div>
        </div><!-- end cont_mypage -->

        <div id="cont_mypageEdit">
            <form method="post" action="myPageModify" id="mypageForm">
                <h2>개인정보변경</h2><br><br>
                <div class="cont_mypageEditWrap">
                    <div class="cont_mypageEdit_left">
                        <a>아이디</a><br><br>
                        <a>비밀번호</a><br><br>
                        <a>성별</a><br><br>
                        <a>이름</a><br><br>
                        <a>생년월일</a><br><br>
                        <a>전화번호</a><br><br>
                        <a>이메일</a><br><br>
                        <a>주소</a><br><br>
                    </div>
                    <c:forEach items="${list1}" var="dto">
                        <div class="cont_mypageEdit_right">
                            <a class="cont_mypageEdit_ID">${dto.user_id}</a><br>
                            <input type="text" name="cont_mypageEdit_PWD" size="50" value="${dto.user_pw}"><br>
                            <a class="cont_mypageEdit_sex">${dto.user_sex}</a><br>
                            <a class="cont_mypageEdit_name">${dto.user_name}</a><br>
                            <a class="cont_mypageEdit_birth">${dto.user_birthNo}</a><br>
                            <input type="text" name="cont_mypageEdit_phoneNumber" size="10" value="${dto.user_phone}"><br>
                            <input type="text" name="cont_mypageEdit_email" size="20" value="${dto.user_email}"><br>
                            <input type="text" name="cont_mypageEdit_address" size="50" value="${dto.user_address}"><br>
						</div>
                    </c:forEach>
                </div>
                <div class="mypageEdit_button">
                    <input type="submit" value="정보수정">
                    <input type="reset" value="취소하기">
                </div>
            </form>
        </div><!-- end cont_mypageEdit -->

        <div id="cont_apply">
            <h2>지원현황</h2>
            <ul class="cont_apply_box">
                <li class="cont_apply_box1">
                    <div class="cont_apply_box1_txt">
                        <a class="cont_apply_box1_left_txt">지원현황</a>
						<c:set var="count" value="0" />
			            <c:forEach items="${list_cv}" var="dto" varStatus="status">
			                <c:set var="count" value="${status.count}" />
			            </c:forEach>
						<a>총 ${count}건</a>
                    </div>
                </li>
                <li class="cont_apply_box2">
                    <div class="cont_apply_box2_txt">
                        <a class="cont_apply_box1_left_txt">지원완료</a>
						<c:set var="count" value="0" />
			            <c:forEach items="${list_cv}" var="dto" varStatus="status">
			                <c:set var="count" value="${status.count}" />
			            </c:forEach>
			            <a>총 ${count}건</a>
                    </div>
                </li>
            </ul><!-- 지원완료,지원결과 box end-->
            <h2>내역</h2>
            <div class="cont_apply_util_wrap">
                <ul class="cont_apply_util">
                    <li>지난1개월</li>
                    <li>지난1년</li>
                </ul>
            </div>
            <a class="cont_apply_update">업데이트순</a>
            <hr class="hr"><!--  내역 아래 선 -->
            <c:forEach items="${list_apply}" var="dto">
                <ul>
                    <li class="cont_apply_li" href="${dto.emp_postNo}">
						<div class="cont_apply_li_wrap">
	                        <a class="move_link">${dto.emp_title}</a>
	                        <a class="move_link">${dto.emp_startDate}</a>
						</div>
                    </li>
                </ul>
	         </c:forEach>
        </div><!-- end cont_apply -->

        <div id="cont_recommend">
            <h2>지원할만한공고</h2>
            <ul>
                <!-- 지원한 공고 리스트-->
                <!-- paging의 content_view 167번째단처럼 로직으로 li -->
                <!-- 둥근사각형 안에 별(스크랩/언스크랩버튼)이미지 넣어야함 -->
            </ul>
            <ul class="cont_recommend_ex">
                <li><img src="${pageContext.request.contextPath}/resources/img/roundSquare.png"></li>
                <li><img src="${pageContext.request.contextPath}/resources/img/roundSquare.png"></li>
                <li><img src="${pageContext.request.contextPath}/resources/img/roundSquare.png"></li>
            </ul>
        </div><!-- end cont_recommend -->

        <div id="cont_scrap">
            <h2>스크랩/관심기업</h2>
            <ul>
                <!-- 스크랩한 공고 리스트-->
                <!-- paging의 content_view 167번째단처럼 로직으로 li -->
                <!-- 둥근사각형 안에 별(스크랩/언스크랩버튼)이미지 넣어야함 -->
            </ul>
            <ul class="cont_scrap_ex">
                <li><img src="${pageContext.request.contextPath}/resources/img/roundSquare.png"></li>
                <li><img src="${pageContext.request.contextPath}/resources/img/roundSquare.png"></li>
                <li><img src="${pageContext.request.contextPath}/resources/img/roundSquare.png"></li>
            </ul>
        </div><!-- end cont_scrap -->
		
        <div id="cont_resume">
			
			<form method="post" action="myPageDelete" id="resumeForm">
	            <div class="cont_resume_header">
	                <h2>이력서관리</h2>
	                <div class="resume_write_wrap">
	                    <div class="resume_write">
	                        <a class="resume_write_txt" href="cv_write">이력서작성</a>
	                    </div>
	                </div>
	                <div class="cont_resume_img"><img src="${pageContext.request.contextPath}/resources/img/resume_img.png"></div>
					<a:set var="count" value="0" />
		            <a:forEach items="${list_cv}" var="dto" varStatus="status">
		                <a:set var="count" value="${status.count}" />
		            </a:forEach>
		            <a class="cont_resume_count">총 ${count}건</a>
	            </div>
	            <a:forEach items="${list_cv}" var="dto">
	                <ul>
	                    <!-- 이력서 리스트-->
	                    <li class="cont_resume_li" href="${dto.cv_no}">
							<div class="cont_resume_list">
								<div class="cont_resume_list_left">
		                        	<a class="move_link">${dto.cv_title}</a>
								</div>
		                        <div class="cont_resume_editButton">
		                            <a class="resume_edit_txt" href="cv_contentView?cv_no=${dto.cv_no}">이력서수정</a>
									<input type="hidden" name="cv_no" value="${dto.cv_no}">
		                            <input type="submit" value="삭제하기" class="cont_resume_delete"> <!-- 컨트롤러단에 delete 생성하기-->
		                        </div>
							<div class="cont_resume_list">
	                    </li>
	                </ul>
	            </a:forEach>
			</form>
        </div><!-- end cont_resume -->

        <div id="cont_myQuestion">
            <h2>내가 한 질문</h2>
            <ul class="cont_myQuestion_box">
                <li class="cont_myQuestion_box1">
                    <div class="cont_myQuestion_box1_txt">
                        <a class="cont_myQuestion_box1_left_txt">지원완료</a>
                        <a class="cont_myQuestion_box1_number">0 <!--여기에 지원완료인 공고 총 갯수--></a>
                    </div>
                </li>
                <li class="cont_myQuestion_box2">
                    <div class="cont_myQuestion_box2_txt">
                        <a class="cont_myQuestion_box2_left_txt">지원현황</a>
                        <a class="cont_myQuestion_box2_number">0 <!--여기에 지원완료인 공고 총 갯수--></a>
                    </div>
                </li>
            </ul><!-- 지원완료,지원결과 box end-->
            <h2>내역</h2>
            <div class="cont_myQuestion_util_wrap">
                <ul class="cont_myQuestion_util">
                    <li>지난1개월</li>
                    <li>지난1년</li>
                </ul>
            </div>
            <a class="cont_myQuestion_update">업데이트순</a>
            <hr class="hr"><!--  내역 아래 선 -->
            <ul>
                <!-- 지원한 공고 리스트-->
                <!-- paging의 content_view 167번째단처럼 로직으로 li -->
            </ul>
            <ul>
                <li class="cont_resume_li" href="${dto.qna_no}">
                    <a class="move_link">${dto.qna_title}</a>
                    <a class="move_link">${dto.qna_no}</a>
                </li>
            </ul>
        </div><!-- end cont_myQuestion -->

        <footer id="footer">
            <ul class="footer_left">
                <li><img src="${pageContext.request.contextPath}/resources/img/f_sns1.png"></li>
                <li><img src="${pageContext.request.contextPath}/resources/img/f_sns2.png"></li>
                <li><img src="${pageContext.request.contextPath}/resources/img/f_sns3.png"></li>
            </ul>
            <div class="footer_center">
                <ul class="footer_center_left">
                    <li>권혁재(팀장) gurwo0535@naver.com</li>
                    <li>차혜영 gpdud4094@gmail.com</li>
                    <li>나성엽 fgghk132@naver.com</li>
                    <li>서영수 tjdudtn7879@naver.com</li>
                    <li>최민중 choimin0915@naver.com</li>
                </ul>
                <ul class="footer_center_right">
                    <li><a href="https://www.notion.so/640668240d804de19cda6b6ad9e82f1a">권혁재(팀장) gurwo0535@naver.com</a></li>
                    <li><a href="https://www.notion.so/640668240d804de19cda6b6ad9e82f1a">차혜영 gpdud4094@gmail.com</a></li>
                    <li><a href="https://www.notion.so/640668240d804de19cda6b6ad9e82f1a">나성엽 fgghk132@naver.com</a></li>
                    <li><a href="https://www.notion.so/640668240d804de19cda6b6ad9e82f1a">서영수 tjdudtn7879@naver.com</a></li>
                    <li><a href="https://www.notion.so/640668240d804de19cda6b6ad9e82f1a">최민중 choimin0915@naver.com</a></li>
                </ul>
            </div>
            <div class="footer_right">
                <a>도로명 : 부산광역시 부산진구 중앙대로 749</a><br>
                <a>지번 : 부산광역시 부산진구 부전동 266-2</a><br>
                <a>우편번호 : 47254</a><br>
            </div>
        </footer>
    </div><!-- end wrap -->
</body>
<script>
    document.querySelector('.leftMenu_mypage').addEventListener('click', function() {
        document.getElementById('cont_mypage').style.display = 'block';
        document.getElementById('cont_mypageEdit').style.display = 'none';
        document.getElementById('cont_apply').style.display = 'none';
        document.getElementById('cont_recommend').style.display = 'none';
        document.getElementById('cont_scrap').style.display = 'none';
        document.getElementById('cont_resume').style.display = 'none';
        document.getElementById('cont_myQuestion').style.display = 'none';
    });//leftMenu_mypage 클릭시 보여지게

    document.querySelector('.leftMenu_mypageEdit').addEventListener('click', function() {
        document.getElementById('cont_mypage').style.display = 'none';
        document.getElementById('cont_mypageEdit').style.display = 'block';
        document.getElementById('cont_apply').style.display = 'none';
        document.getElementById('cont_recommend').style.display = 'none';
        document.getElementById('cont_scrap').style.display = 'none';
        document.getElementById('cont_resume').style.display = 'none';
        document.getElementById('cont_myQuestion').style.display = 'none';
    });//leftMenu_mypageEdit 클릭시 보여지게

    document.querySelector('.leftMenu_apply').addEventListener('click', function() {
        document.getElementById('cont_mypage').style.display = 'none';
        document.getElementById('cont_mypageEdit').style.display = 'none';
        document.getElementById('cont_apply').style.display = 'block';
        document.getElementById('cont_recommend').style.display = 'none';
        document.getElementById('cont_scrap').style.display = 'none';
        document.getElementById('cont_resume').style.display = 'none';
        document.getElementById('cont_myQuestion').style.display = 'none';
    });//leftMenu_apply 클릭시 보여지게

    document.querySelector('.leftMenu_recommend').addEventListener('click', function() {
        document.getElementById('cont_mypage').style.display = 'none';
        document.getElementById('cont_mypageEdit').style.display = 'none';
        document.getElementById('cont_apply').style.display = 'none';
        document.getElementById('cont_recommend').style.display = 'block';
        document.getElementById('cont_scrap').style.display = 'none';
        document.getElementById('cont_resume').style.display = 'none';
        document.getElementById('cont_myQuestion').style.display = 'none';
    });//leftMenu_recommend 클릭시 보여지게

    document.querySelector('.leftMenu_scrap').addEventListener('click', function() {
        document.getElementById('cont_mypage').style.display = 'none';
        document.getElementById('cont_mypageEdit').style.display = 'none';
        document.getElementById('cont_apply').style.display = 'none';
        document.getElementById('cont_recommend').style.display = 'none';
        document.getElementById('cont_scrap').style.display = 'block';
        document.getElementById('cont_resume').style.display = 'none';
        document.getElementById('cont_myQuestion').style.display = 'none';
    });//leftMenu_scrap 클릭시 보여지게

    document.querySelector('.leftMenu_resume').addEventListener('click', function() {
        document.getElementById('cont_mypage').style.display = 'none';
        document.getElementById('cont_mypageEdit').style.display = 'none';
        document.getElementById('cont_apply').style.display = 'none';
        document.getElementById('cont_recommend').style.display = 'none';
        document.getElementById('cont_scrap').style.display = 'none';
        document.getElementById('cont_resume').style.display = 'block';
        document.getElementById('cont_myQuestion').style.display = 'none';
    });//leftMenu_resume 클릭시 보여지게

    document.querySelector('.leftMenu_myQuestion').addEventListener('click', function() {
        document.getElementById('cont_mypage').style.display = 'none';
        document.getElementById('cont_mypageEdit').style.display = 'none';
        document.getElementById('cont_apply').style.display = 'none';
        document.getElementById('cont_recommend').style.display = 'none';
        document.getElementById('cont_scrap').style.display = 'none';
        document.getElementById('cont_resume').style.display = 'none';
        document.getElementById('cont_myQuestion').style.display = 'block';
    });//leftMenu_myQuestion 클릭시 보여지게

    document.querySelector('.mypage_button').addEventListener('click', function() {
        document.getElementById('cont_mypage').style.display = 'none';
        document.getElementById('cont_mypageEdit').style.display = 'block';
        document.getElementById('cont_apply').style.display = 'none';
        document.getElementById('cont_recommend').style.display = 'none';
        document.getElementById('cont_scrap').style.display = 'none';
        document.getElementById('cont_resume').style.display = 'none';
        document.getElementById('cont_myQuestion').style.display = 'none';
    });//mypage 정보수정 클릭시 mypageEdit 보여지게
	
	
</script>

<script>
    $(".move_link").on("click", function(e){
        e.preventDefault();

        var targetBno = $(this).attr("href");

        var inputName = $(this).hasClass("emp_post") ? "emp_postNo" : "cv_no";
        var bno = actionForm.find(`input[name='${inputName}']`).val();
        if (bno != ""){
            actionForm.find(`input[name='${inputName}']`).remove();
        }

        actionForm.append(`<input type='hidden' name='${inputName}' value='${targetBno}'>`);

        var action = $(this).hasClass("emp_post") ? "content" : "cv";
        actionForm.attr("action", action).submit();
    });
</script>

</html>

