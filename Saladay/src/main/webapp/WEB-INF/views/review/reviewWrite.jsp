<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 쓰기</title>

    <link rel="stylesheet" href="/resources/css/review/reviewWrite.css">
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <main>
        <div class="my-page-content">
			<jsp:include page="/WEB-INF/views/member/myPage/myPage-list.jsp"></jsp:include>
            <div class="right-side">
                <div class="my-info-list">
                    <div class="my-page-header">
                        <h1 class="main-title">리뷰 쓰기</h1>
                    </div>

                    <div class="rw-info-area">
                        <div class="rw-orderNo">
                            주문번호 : ${reviewInfo.orderNo}
                        </div>
                        <div class="rw-package">
                            주문상품 : ${reviewInfo.packageName}
                        </div>
                        <div class="rw-menu">
                            주문메뉴 : ${reviewInfo.menuName} 샐러드
                        </div>
                    </div>
                    <form action="/member/myPage/reviewWrite/${orderMenuNo}" enctype="multipart/form-data" method="POST" class="review-write">
                        <div class="rw-rating-area">

                            <div class="rw-rating">
                                이 메뉴 어땠나요?
                            </div>
                            <div class="rw-star-area">
                                <span class="rw-star">
                                    ★★★★★
                                    <span>★★★★★</span>
                                    <input name = "rating" type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="5">
                                </span>
                            </div>
                        </div>
                        <div class="rw-review-content-area">
                            <div class="rw-question">
                                어떤 점이 좋았나요?
                            </div>
                            <div class="rw-review-content">
                                <label for="reviewContent"></label>
                                <textarea placeholder="리뷰를 작성해주세요." name="reviewContent"></textarea>
                            </div>
                        </div>
                        <div class="rw-image-area">
                            <div class="rw-images">이미지 추가</div>
                                <label for="img0">
                                    <img class="preview">
                                </label>
                                <input type="file" class="inputImage" id="img0" name="images" accept="image/*">
                                <span class="delete-image">&times;</span>
                            <div class="rw-images">이미지 추가</div>
                            <div class="rw-images">이미지 추가</div>
                        </div>
                        <div class="rw-btn-area">
                            <button type="submit" class="submit-btn">글쓰기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/resources/js/review/reviewWrite.js"></script>
</body>
</html>