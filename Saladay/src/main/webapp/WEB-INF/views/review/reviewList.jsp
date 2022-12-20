<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="reviewList" value="${map.reviewList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>review</title>

	<link rel="stylesheet" href="/resources/css/main/main.css">
    <link rel="stylesheet" href="/resources/css/review/review.css">
</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <main>
        <div class="review-list-area">
            <div class="review-title">
                <span><h1>리뷰</h1></span>
                <br/>
                <span>고객님들의 생생한 리뷰를 읽어보세요!</span>
            </div>
            <div class="review-check">
                <input type="radio" name="review-check">
                <label for="review-check" id="#">최신순&nbsp&nbsp</label>

                <input type="radio" name="review-check">
                <label for="review-check" id="#">좋아요 순</label>
            </div>

            <!-- 리뷰 목록 내용 -->
            <div>
                <ul class="review-div">
                    <c:choose>
                        <c:when test="${empty reviewList}">
                        <!-- 리뷰 목록 조회 결과가 비어있다면 -->
                            <li>앗! 작성된 리뷰가 없어요!</li>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="review" items="${reviewList}">
                                <li class="albumLi">
                                    <%-- 리뷰 이미지가 있을 경우 --%>
                                    <c:if test="${not empty review.thumbnail}">  
                                    <a href="#">
                                    <img src="${review.thumbnail}" width="200px" height="200px"></a>
                                    </c:if>
                                    <%-- 리뷰 이미지가 없을 경우 --%>
                                    <c:if test="${empty review.thumbnail}">
                                    <a href="#">
                                    <img src="/resources/images/review/reviewImg.png" width="200px" height="200px"></a>
                                    </c:if> 
                                    <div class="review-text">
                                        <div class="review-content">
                                            <a href="#" class="review-content">
                                            ${review.reviewContent}</a>
                                        </div>
                                    </div>
                                    <div class="review-writer">
                                        ${review.memberNickname}
                                    </div>
                                    <div class="review-star">
                                        별점 ${review.rating}
                                    </div>
                                    <div class="review-like">
                                        좋아요 ${review.likeCount}
                                    </div>
                                </li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <div class="pagination-area">
                <c:if test="${not empty reviewList}">
                    <ul class="pagination">
                        <!-- 첫 페이지로 이동 -->
                        <li><a href="?cp=1">&lt;&lt;</a></li>
                        <!-- 이전 목록 마지막 번호로 이동 --> 
                        <li><a href="?cp=${pagination.prevPage}">&lt;</a></li>
                            <c:forEach var="i" begin="${pagination.startPage}" 
                            end="${pagination.endPage}" step="1">
                                <c:choose>
                                    <c:when test="${i == pagination.currentPage}">
                                        <!-- 현재 보고있는 페이지 -->
                                        <li><a class="current">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 현재 페이지를 제외한 나머지 -->
                                        <li><a href="?cp=${i}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        <!-- 다음 목록 시작 번호로 이동 -->
                        <li><a href="?cp=${pagination.nextPage}">&gt;</a></li>
                        <!-- 끝 페이지로 이동 -->
                        <li><a href="?cp=${pagination.maxPage}">&gt;&gt;</a></li>
                    </ul>
                </c:if>
            </div>

            <div class="search-area">
                <form action="#" method="get" id="reviewSearch" onsubmit="return true">
                    <select name="key" id="search-key" class="choice">
                        <option value="review-menu">메뉴</option>
                        <option value="review-writer">작성자</option>
                    </select>
                    <!-- 내부 input 태그의 값을 서버 또는 페이지로 전달(제출) -->
                    <input type="text" class="query" name="query" id="search-query"
                    placeholder="검색어를 입력해주세요">
                    <button class="search-btn">검색</button>
                </form>
            </div>
        </div>

    </main>
    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>