<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>review</title>

    <link rel="stylesheet" href="/resources/css/review/review.css">
</head>
<body>
    <main>
        <!-- 헤더 -->
        <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
            <div class="review-list-area">
                <div class="review-title">
                    <h3>리뷰목록입니당</h3>
                </div>
                <div class="review-check">
                    <input type="radio" name="review-check">
                    <label for="review-check" id="#">최신순</label>

                    <input type="radio" name="review-check">
                    <label for="review-check" id="#">좋아요 순</label>
                </div>
                    <!-- 앨범형 게시판 내용 -->
                <div class="review-div">
                    <ul>
                        <li class="albumLi">
                            <a href="#">
                                <img src="/resources/images/review/reviewImg.png" width="200px" height="200px"alt="">
                            </a>
                            
                            <div class="review-text">
                                <div class="review-content">
                                    <a href="#" class="review-content">
                                    리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰리뷰리뷰리뷰</a>
                                </div>
                            </div>
                            <div class="review-writer">
                                리뷰작성자
                            </div>
                            <div class="review-star">
                                ★★★☆☆
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="pagination-area">
                    <ul class="pagination">
                        <!-- 첫 페이지로 이동 -->
                        <li><a href="/board/${boardCode}?cp=1${sURL}">&lt;&lt;</a></li>
                        <!-- 이전 목록 마지막 번호로 이동 -->
                        <li><a href="/board/${boardCode}?cp=${pagination.prevPage}${sURL}">&lt;</a></li>
                            <c:forEach var="i" begin="${pagination.startPage}" 
                            end="${pagination.endPage}" step="1">
                                <c:choose>
                                    <c:when test="${i == pagination.currentPage}">
                                        <!-- 현재 보고있는 페이지 -->
                                        <li><a class="current">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 현재 페이지를 제외한 나머지 -->
                                        <li><a href="/board/${boardCode}?cp=${i}${sURL}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        <li><a href="/board/${boardCode}?cp=${pagination.nextPage}${sURL}">&gt;</a></li>
                        <!-- 끝 페이지로 이동 -->
                        <li><a href="/board/${boardCode}?cp=${pagination.maxPage}${sURL}">&gt;&gt;</a></li>
                    </ul>
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