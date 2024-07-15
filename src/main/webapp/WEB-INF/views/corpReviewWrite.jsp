<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
<!DOCTYPE html>
<html lang="ko">
	
<!--나성엽-->
<head>
    <meta charset="UTF-8">
    <title>기업 리뷰</title>
<style>
    body {
        font-family: 'Nanum Gothic', sans-serif;
        font-size: 12px;
        color: #696B86;
        background-color: #F0F8FF;
        margin: 0;
        padding: 0;
    }
    * 페이지 콘텐츠 영역을 헤더와 푸터 사이에 배치 */
    .content {
        padding-top: 12rem;  /* 헤더 높이 + 네비게이션 높이 */
        padding-bottom: 12rem;  /* 푸터 높이만큼 패딩 추가 */
        min-height: calc(100vh - 17rem);  /* 전체 높이에서 헤더와 푸터 높이만큼 빼기 */
    }
    .container {
        width: 1000px;
        margin: 0 auto;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .write-container {
        border: 1px solid #b1b1b1;
        padding: 30px;
        border-radius: 10px;
        margin-bottom: 20px;
        margin-top: 40px;
    }
    .footer {
        text-align: center;
        margin-bottom: 20px;
    }
    .review-keysearch {
        margin-bottom: 20px;
    }
    .review-keysearch .keywords {
        display: flex;
        flex-wrap: wrap;
        border: 1px solid #ddd;
        padding: 10px;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
    .keywords div {
        margin: 5px;
        padding: 5px 10px;
        border: 1px solid #ddd;
        border-radius: 15px;
        cursor: pointer;
        background-color: #e9f4ff;
    }
    .keywords div.selected {
        background-color: #007bff;
        color: #fff;
    }
    .writereview-corpinfo {
        display: flex;
        align-items: center;
        border: 1px solid #b1b1b1;
        border-radius: 10px;
        padding: 20px;
        background-color: #ffffff;
    }
    .writereview-corpinfo img {
        width: 100px;
        height: 100px;
        margin-right: 20px;
    }
    .corpinfo-content {
        flex-grow: 1;
    }
    .corpinfo-content p {
        margin: 5px;
    }
    .view-count {
        margin-right: 20px;
        color: #888;
    }
    .favorite-button {
        padding: 5px 10px;
        border: 1px solid #b1b1b1;
        background-color: #ffffff;
        border-radius: 5px;
        cursor: pointer;
    }
    .welfares {
        margin-top: 50px;
        margin-bottom: 50px;
    }
    .welfares-list {
        display: flex;
        flex-wrap: wrap;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        gap: 10px;
        margin-bottom: 20px;
    }
    .welfares-list div {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
        text-align: center;
        cursor: pointer;
    }
    .welfares-list div.selected {
        background-color: #007bff;
        color: #fff;
    }
    .review-section {
        margin-bottom: 20px;
    }
    .review-comment {
        width: 100%;
        height: 100px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 10px;
    }
    .submit-review {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #AFDBF5;
        color: #000000;
        cursor: pointer;
    }
    .submit-review:hover {
        background-color: #007bff;
        color: #fff;
    }
</style>
</head>
<body>
<!-- 헤더와 푸터에 의해 가려지지 않도록 하는 부분 -->
<div class="content">
    <div class="container">
        <div class="writereview-corpinfo">
            <img src="기업로고.png" alt="기업 로고">
            <div class="corpinfo-content">
                <p>${review.corp_name}</p>
                <p>${review.corp_type}</p>
                <p>#키워드 #키워드 #키워드</p>
            </div>
            <div class="view-count">(조회수) ${review.views}</div>
            <button class="favorite-button">관심 기업 ☆</button>
        </div>

        <div class="write-container">
            <form id="writeReviewForm" action="write_review" method="POST">
                <div class="review-keysearch">
                    <h2>기업 특징 CheckList</h2>
                    <div class="keywords">
                        <div># 업무 복장 자유로움</div>
                        <div># 연봉 인상률 높음</div>
                        <div># 남성직원 비율 높음</div>
                        <div># 여성직원 비율 높음</div>
                        <div># 복지제도</div>
                        <div># 워라벨</div>
                        <div># 자율출퇴근</div>
                        <div># 회식없음</div>
                        <div># 수평적 조직문화</div>
                        <div># 경력 개발 지원</div>
                        <div># 다양한 프로젝트</div>
                        <div># 사내 교육 프로그램</div>
                        <div># 유연 근무제</div>
                        <div># 재택 근무 가능</div>
                        <div># 장기 근속 포상</div>
                        <div># 해외 출장 기회</div>
                        <div># 멘토링 프로그램</div>
                        <div># 사내 동호회 지원</div>
                        <div># 자기 계발 지원</div>
                        <div># 직원 휴게실</div>
                        <div># 건강 관리 프로그램</div>
                    </div>
                    <input type="hidden" name="corp_keyword" id="selectedKeywords">
                </div>

                <div class="welfares">
                    <h2>복리후생</h2>
                    <div class="welfares-list">
                        <div>퇴직금</div>
                        <div>성과급</div>
                        <div>상여금</div>
                        <div>야근수당</div>
                        <div>식사 제공</div>
                        <div>건강 검진</div>
                        <div>연차 휴가</div>
                        <div>출산 휴가</div>
                        <div>육아 휴직</div>
                        <div>자녀 학자금 지원</div>
                        <div>사내 동호회 지원</div>
                        <div>교통비 지원</div>
                        <div>주택 자금 지원</div>
                        <div>복지 포인트</div>
                        <div>단체 상해보험</div>
                        <div>법인 휴양소</div>
                    </div>
                    <input type="hidden" name="corp_welfare" id="selectedWelfares">
                </div>
            
                <div class="review-section">
                    <h2>리뷰 작성하기</h2>
                    <textarea class="review-comment" name="review_coment" placeholder="리뷰 코멘트"></textarea>
                </div>
                
                <button type="submit" class="submit-review">작성하기</button>
            </form>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// 뒤로 가기 눌렀을 때 input 정보 삭제
    window.addEventListener('pageshow', function(event) {
        if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            document.getElementById('writeReviewForm').reset();
            $('.keywords div').removeClass('selected');
            $('.welfares-list div').removeClass('selected');
        }
    });

    $(document).ready(function() {
        const keywords = $('.keywords div');
        const welfares = $('.welfares-list div');
        
        // 키워드 클릭시 selected 로 변경
        keywords.click(function() {
            $(this).toggleClass('selected');
        });

        // 복리후생 클릭시 selected 로 변경
        welfares.click(function() {
            $(this).toggleClass('selected');
        });

        // selected 된 요소들 hidden에 담음
        $('#writeReviewForm').submit(function(event) {
            const selectedKeywords = [];
            const selectedWelfares = [];

            $('.keywords div.selected').each(function() {
                selectedKeywords.push($(this).text());
            });

            $('.welfares-list div.selected').each(function() {
                selectedWelfares.push($(this).text());
            });

            $('#selectedKeywords').val(selectedKeywords.join(','));
            $('#selectedWelfares').val(selectedWelfares.join(','));

            return true;
        });
    });
</script>
</body>
</html>