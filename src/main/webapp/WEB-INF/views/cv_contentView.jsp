<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/main2.css' />">
	<link rel="stylesheet" type="text/css" href="/css/cv_write.css">
	<script src="/js/cv_write.js"></script>
	<script type="text/javascript" src="/js/jquery.js"></script>
</head>
<body>
	${contentView}
	<div class="sidebar">
		<a href="#user_bar">개인정보</a>
		<a href="#edu_bar">학력</a>
		<a href="#skill_bar">스킬</a>
		<a href="#career_bar">경력</a>
		<a href="#activity_bar">경험/활동</a>
		<a href="#training_bar">교육</a>
		<a href="#license_bar">자격증</a>
		<a href="#prize_bar">수상</a>
		<a href="#portfolio_bar">포트폴리오</a>
		<a href="#selfIntro_bar">자기소개서</a>
	</div>
	<div class="content">
		<form method="post" action="cv_modify">
			<input type="hidden" value="${contentView.cv_no}">
			${CVDTO}
			<h2>제목</h2>
			<p><input type="text" placeholder="이력서 제목" name="cv_title" id="cv_title" value="${contentView.cv_title}" required></p><br>
			<h2 id="user_bar">개인정보</h2>
			<table id="user_info" border="1" style="height: 150px; border-radius: 5px;"><!-- 개인정보 -->
				<tr>
				  	<td width="10%">
						<div class="user_info">
							<input type="text" placeholder="이름*" name="cv_name" value="${contentView.cv_name}" required>
						</div>
				  	</td>
				  	<td width="15%">
						<div class="user_info">
						<input type="date" placeholder="생년월일*" name="cv_birth" value="${contentView.cv_birth}" required>
						</div>
					</td>
					<td class="left" width="5%">
						<div class="user_info">
							<select name="cv_sex" value="${contentView.cv_sex}" required>
								<option value="${cv_sex}" selected>성별*</option>
								<option value="남성">남성</option>
								<option value="여성">여성</option>
							</select>
						</div>
					</td>
					<td width="35%">
						<div class="user_info">
						<input type="email" placeholder="이메일*" name="cv_email" value="${contentView.cv_email}" required>
						</div>
					</td>
					<td rowspan="2">
						<input type="file" onchange="readURL(this);" name="cv_photo" value="${contentView.cv_photo}"> 
						<img id="preview" style="width: 103px; height: 132px;"/><br>
						<button onclick="clearPreview()">삭제</button>
				  	</td>
				</tr>
				<tr>
					<td colspan="1" width="25%">
						<div class="user_info">
						<input type="tel" placeholder="휴대폰번호" name="cv_phone" value="${contentView.cv_phone}" required>
						</div>
					</td>
					<td colspan="3" width="70%">
						<div class="user_info">
							<input type="text"placeholder="주소" name="cv_address" value="${contentView.cv_address}" required>
						</div>
					</td>
					</tr>
			</table><br><!-- end 개인정보 -->
		
		<h2 id="edu_bar">학력</h2>
		<table id="education" border="1">
			<tr>
				<td class="left">
					<select name="e_school" id="dropdown" value="${contentView.e_school}" onchange="showTable(this.value)">
						<option value="고등학교" selected>고등학교</option>
						<option value="대학교">대학교</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<div id="tableContainer">
						<table id="highschool" class="hidden" border="1">
							<tr>
								<td>
									<input type="text" placeholder="학교명*" name="e_hi_name" value="${contentView.e_hi_name}">
								</td>
								<td>
									<div class="item">
										졸업년월 <input type="text" name="e_hi_endMon" value="${contentView.e_hi_endMon}">
									</div>
								</td>
								<td>
									<div class="item"> 
										<select name="e_status" value="${contentView.e_hi_status}"> 
											<option value="" selected disabled>졸업상태*</option> 
											<option value="졸업">졸업</option> 
											<option value="졸업예정">졸업예정</option> 
											<option value="재학중">재학중</option> 
										</select> 
									</div>
								</td>
							</tr>
						</table>
						<table id="university" class="hidden" border="1">
							<tr>
								<td>
									<div class="item">
										<input type="text" placeholder="학교명*" name="e_name" value="${contentView.e_uni_name}">
									</div>
								</td>
								<td>
									<div class="item">
										입학년월* <input type="date" name="e_uni_startMon" value="${contentView.e_uni_startMon}">
									</div>
								</td>
								<td>
									<div class="item">
										졸업년월* <input type="date" name="e_uni_endMon" value="${contentView.e_uni_endMon}">
									</div>
								</td>
								<td rowspan="2">
									<div class="item"> 
										<select name="e_status" value="${contentView.e_uni_status}"> 
											<option value="" selected>졸업상태*</option> 
											<option value="졸업">졸업</option> 
											<option value="졸업예정">졸업예정</option> 
											<option value="재학중">재학중</option> 
											<option value="중퇴">중퇴</option> 
											<option value="수료">수료</option> 
											<option value="휴학">휴학</option> 
										</select> 
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" placeholder="전공명*" name="e_major" value="${contentView.e_major}">
								</td>
								<td>
									<input type="text" placeholder="학점" name="e_credit" value="${contentView.e_credit}">
								</td>
								<td>
									<input type="number" placeholder="총점" name="e_score" value="${contentView.e_score}">
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
			<br><!-- end 학력 -->
			
			<h2 id="skill_bar">스킬</h2>
		<table>
			<tr>
				<td>
					<div class="container">
						<div class="write-container">
							<div class="review-keysearch">
								<div class="keywords" id="keywords">
									<div class="spring1">Spring Boot</div>
									<div class="javaScript1">JavaScript</div>
									<div class="java1">Java</div>
									<div class="python1">Python</div>
									<div class="htmlcss1">HTML/CSS</div>
									<div class="asp1">ASP</div>
									<div class="api1">API</div>
									<div class="jsp1">JSP</div>
									<div class="oracle1">Oracle</div>
									<div class="mysql1">MySQL</div>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="left">
					<h5 style="font-weight: bold;">추가된 목록</h5>
					<div id="itemList">
						<div class="keywords" id="keywords">
							<div class="spring2">Spring Boot</div>
							<div class="javaScript2">JavaScript</div>
							<div class="java2">Java</div>
							<div class="python2">Python</div>
							<div class="htmlcss2">HTML/CSS</div>
							<div class="asp2">ASP</div>
							<div class="api2">API</div>
							<div class="jsp2">JSP</div>
							<div class="oracle2">Oracle</div>
							<div class="mysql2">MySQL</div>
						</div>
					</div>
				</td>
			</tr>
		</table><br>			

		<h2 id="career_bar">경력</h2>
			<table id="career" border="1"><!-- 경력 -->
				<tr>
					<td width="40%">
						<div class="item">
							<input type="text" placeholder="회사명" name="c_corpName" class="c_corpName" value="${contentView.c_corpName}">
						</div>
					</td>
					<td width="40%">
						<div class="item">
							<input type="text" placeholder="부서명" name="c_dept" value="${contentView.c_dept}">
						</div>
					</td>
					<td width="10%">
						<div class="item">
							입사년월 <input type="date" placeholder="입사년월" name="c_startMon" value="${contentView.c_startMon}">
						</div>
					</td>
					<td width="10%">
						<div class="item">
							퇴사년월 <input type="date" placeholder="퇴사년월" name="c_endMon" value="${contentView.c_endMon}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="item">
							<input type="text" placeholder="직급/직책" name="c_position" value="${contentView.c_position}">
						</div>
					</td>
					<td class="left">
						<div class="item">
							<input type="text" placeholder="담당직무" name="c_duty" value="${contentView.c_duty}">
						</div>
					</td>
					<td colspan="2">
						<div class="item">
							<input type="number" placeholder="연봉" name="c_salary" value="${contentView.c_salary}">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="left">
						<div class="item">담당업무<br>
							<textarea class="auto-resize" name="c_assignedTask">${contentView.c_assignedTask}</textarea>
							<!-- <textarea class="auto-resize" name="c_assignedTask" value="${contentView.c_assignedTask}"></textarea> -->
							<!-- <input type="text" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요." class="auto-resize" name="c_assignedTask"> -->
						</div>
					</td>        
				</tr>
			</table>
			<br><!-- end 경력 -->

		<h2 id="activity_bar">경험/활동</h2>
			<table border="1"><!-- 활동 -->
				<tr>
					<td width="10%">
						<div class="item">
							<select name="a_activitySort" id="a_activitySort" value="${contentView.a_activitySort}">
							  <option value="" selected>활동구분*</option>
							  <option value="인턴">인턴</option>
							  <option value="아르바이트">아르바이트</option>
							  <option value="동아리">동아리</option>
							  <option value="자원봉사">자원봉사</option>
							  <option value="사회활동">사회활동</option>
							  <option value="교내활동">교내활동</option>
							</select>
						  </div>
					</td>
					<td colspan="4" width="70%">
						<div class="item">
							<input type="text" placeholder="회사/기관/단체명*" name="a_corpName" value="${contentView.a_corpName}">
						</div>
					</td>
					<td width="10%">
						<div class="item">
							시작년월 <input type="date" placeholder="시작년월" name="a_startMon" value="${contentView.a_startMon}">
						</div>
					</td>
					<td width="10%">
						<div class="item">
							종료년월 <input type="date" placeholder="종료년월" name="a_endMon" value="${contentView.a_endMon}">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="8" class="left">
						<div class="item">활동내역<br>
							<textarea class="auto-resize" name="a_content">${contentView.a_content}</textarea>
							<!-- <textarea class="auto-resize" name="a_content" value="${contentView.a_content}"></textarea> -->
							<!-- <input type="text" placeholder="내역" class="auto-resize" name="a_content" value="${contentView.a_content}"> -->
						</div>
					</td>    
				</tr>
			</table><br><!-- end 활동 -->

		<h2 id="training_bar">교육</h2>
			<table border="1"><!-- 교육 -->
				<tr>
					<td width="40%">
						<div class="item">
							<input type="text" placeholder="교육명*" name="t_name" value="${contentView.t_name}">
						</div>
					</td>
					<td width="40%">
						<div class="item">
							<input type="text" placeholder="교육기관" name="t_institution" value="${contentView.t_institution}">
						</div>
					</td>
					<td width="10%">
						<div class="item">
							시작년월 <input type="date" placeholder="시작년월" name="t_startMon" value="${contentView.t_startMon}">
						</div>
					</td>
					<td width="10%">
						<div class="item">
							종료년월 <input type="date" placeholder="종료년월" name="t_endMon" value="${contentView.t_endMon}">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="8" class="left">
						<div class="item">교육내용<br>
							<textarea class="auto-resize" name="t_content">${contentView.t_content}</textarea>
							<!-- <textarea class="auto-resize" name="t_content" value="${contentView.t_content}"></textarea> -->
							<!-- <input type="text" placeholder="내용" class="auto-resize" name="t_content" value="${contentView.t_content}"> -->
						</div>
					</td>    
				</tr>
			</table><br><!-- end 교육 -->

		<h2 id="license_bar">자격증</h2>
			<table border="1">
				<tr>
					<td width="40%">
						<div class="item">
							<input type="text" placeholder="자격증명*" name="l_name" value="${contentView.l_name}">
						</div>
					</td>
					<td width="40%">
						<div class="item">
							<input type="text" placeholder="발행처/기관" name="l_institution" value="${contentView.l_institution}">
						</div>
					</td>
					<td width="20%">
						<div class="item">
							취득년월 <input type="date" placeholder="취득년월" name="l_passMon" value="${contentView.l_passMon}">
						</div>
					</td>
				</tr>
			</table><br>

		<h2 id="prize_bar">수상</h2>
			<table border="1">
				<tr>
					<td colspan="2" width="40%">
						<div class="item">
							<input type="text" placeholder="수상 공모전명" name="p_name" value="${contentView.p_name}">
						</div>
					</td>
					<td width="40%">
						<div class="item">
							<input type="text" placeholder="수여 주최기관" name="p_corp" value="${contentView.p_corp}">
						</div>
					</td>
					<td width="20%">
						<div class="item">
							수상 공모일<input type="date" placeholder="수상 공모일" name="p_date" value="${contentView.p_date}">
						</div>
					</td>
				</tr>
			</table><br>

		<h2 id="portfolio_bar">포트폴리오</h2>
			<table border="1">
				<tr>
					<td width="20%">
						<select id="dropdown" name="po_sort" value="${contentView.po_sort}">
							<option value="">구 분</option>
							<option value="이력서">이력서</option>
							<option value="포트폴리오">포트폴리오</option>
							<option value="증명서">증명서</option>
							<option value="자격증">자격증</option>
							<option value="추천서">추천서</option>
							<option value="기획서">기획서</option>
							<option value="기타">기타</option>
						</select>
					</td>
					<td width="80%">
						<input type="text" placeholder="url" name="po_url" value="${contentView.po_url}">
					</td>
				</tr>
			</table><br>

		<h2 id="selfIntro_bar">자기소개서</h2>
			<table border="1">
				<tr>
					<td>
						<div class="item">
							<textarea class="auto-resize" name="cv_selfIntro">${contentView.cv_selfIntro}</textarea>
							<!-- <textarea class="auto-resize" name="cv_selfIntro" value="${contentView.cv_selfIntro}"></textarea> -->
							<!-- <input type="text" placeholder="해당내용을 입력하세요." class="auto-resize" name="cv_selfIntro" value="${contentView.cv_selfIntro}"> -->
						</div>
					</td>    
				</tr>
			</table><br>
			<input type="submit" class="btn btn-primary" value="저장">
			<div id="hiddenInputs"></div>
		</form>		
	</div>
</body>
</html>

<script>
	document.querySelector('.spring1').addEventListener('click', function() {
	document.querySelector('.spring2').style.display = 'block';
});
	document.querySelector('.spring2').addEventListener('click', function() {
	document.querySelector('.spring2').style.display = 'none';
});
	document.querySelector('.javaScript1').addEventListener('click', function() {
	document.querySelector('.javaScript2').style.display = 'block';
});
	document.querySelector('.javaScript2').addEventListener('click', function() {
	document.querySelector('.javaScript2').style.display = 'none';
});
	document.querySelector('.java1').addEventListener('click', function() {
	document.querySelector('.java2').style.display = 'block';
});
	document.querySelector('.java2').addEventListener('click', function() {
	document.querySelector('.java2').style.display = 'none';
});
	document.querySelector('.python1').addEventListener('click', function() {
	document.querySelector('.python2').style.display = 'block';
});
	document.querySelector('.python2').addEventListener('click', function() {
	document.querySelector('.python2').style.display = 'none';
});
	document.querySelector('.htmlcss1').addEventListener('click', function() {
	document.querySelector('.htmlcss2').style.display = 'block';
});
	document.querySelector('.htmlcss2').addEventListener('click', function() {
	document.querySelector('.htmlcss2').style.display = 'none';
});
	document.querySelector('.asp1').addEventListener('click', function() {
	document.querySelector('.asp2').style.display = 'block';
});
	document.querySelector('.asp2').addEventListener('click', function() {
	document.querySelector('.asp2').style.display = 'none';
});
	document.querySelector('.api1').addEventListener('click', function() {
	document.querySelector('.api2').style.display = 'block';
});
	document.querySelector('.api2').addEventListener('click', function() {
	document.querySelector('.api2').style.display = 'none';
});
	document.querySelector('.jsp1').addEventListener('click', function() {
	document.querySelector('.jsp2').style.display = 'block';
});
	document.querySelector('.jsp2').addEventListener('click', function() {
	document.querySelector('.jsp2').style.display = 'none';
});
	document.querySelector('.oracle1').addEventListener('click', function() {
	document.querySelector('.oracle2').style.display = 'block';
});
	document.querySelector('.oracle2').addEventListener('click', function() {
	document.querySelector('.oracle2').style.display = 'none';
});
	document.querySelector('.mysql1').addEventListener('click', function() {
	document.querySelector('.mysql2').style.display = 'block';
});
	document.querySelector('.mysql2').addEventListener('click', function() {
	document.querySelector('.mysql2').style.display = 'none';
});
</script>