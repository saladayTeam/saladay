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
    <title>Review</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/main/main.css">
    <link rel="stylesheet" href="/resources/lib/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/review/review.css">
    <script src="https://kit.fontawesome.com/9f94c365a1.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <main>
        <div class="review-list-area">
            <div class="review-title">
                <h1 class="review-main-title">전체 샐러드 리뷰</h1>
            </div>
            <div class="review-check">
<%--                 <input type="radio" name="review-check">
                <label for="review-check" id="#">최신순&nbsp&nbsp</label>

                <input type="radio" name="review-check">
                <label for="review-check" id="#">좋아요 순</label> --%>
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
                                    <div class="review-img-wrapper">
                                        <img src="${review.thumbnail}" class="review-img list-thumbnail" onclick="selectReviewDetail(${review.reviewNo}, ${review.memberNo})">
                                    </div>
                                    </c:if>
                                    <%-- 리뷰 이미지가 없을 경우 --%>
                                    <c:if test="${empty review.thumbnail}">
                                    <div class="review-img-wrapper">
                                        <img src="/resources/images/review/reviewImg.png" class="review-img list-thumbnail" onclick="selectReviewDetail(${review.reviewNo}, ${review.memberNo})">
                                    </div>
                                    </c:if> 
                                    <div class="review-content">
                                        <a href="/review/${review.menuNo}" class="review-menu-name">[${review.menuName}]</a>
                                        <span class="review-content">${review.reviewContent}</span>
                                    </div>
                                    <div class="review-writer">
                                        ${review.memberNickname}
                                    </div>
                                    <div class="rating">
                                        <span class="${review.rating}"></span>
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
                    </ul>
                </c:if>
            </div>
        </div>
    </main>
        <div class="review-modal">
            <span id="modal-close">&times;</span>
            <jsp:include page="/WEB-INF/views/review/reviewDetail.jsp"></jsp:include>
        </div>

    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <!-- jQuery 라이브러리(.js 파일) 추가(CDN 방식) -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script>
        $(".1").html("&#9733; &#9734; &#9734; &#9734; &#9734;");
        $(".2").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
        $(".3").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
        $(".4").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
        $(".5").html("&#9733; &#9733; &#9733; &#9733; &#9733;");
        const memberNo = "${loginMember.memberNo}";
        const authority = "${loginMember.authority}";
        const reviewNo = "${review.reviewNo}";
        const likeCheck = "${review.likeCheck}";
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/resources/js/review/review.js"></script>
</body>
</html>