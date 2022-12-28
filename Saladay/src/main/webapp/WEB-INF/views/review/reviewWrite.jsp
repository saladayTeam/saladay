<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 쓰기</title>

    <link rel="stylesheet" href="../../resources/css/review/reviewWrite.css">
    <link rel="stylesheet" href="../../resources/css/main/header.css">
    <link rel="stylesheet" href="../../resources/css/main/footer.css">
</head>
<body>
    header
    <!-- <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include> -->
    <main>
        <div class="my-page-content">
            myPage-list
        <!-- <jsp:include page="/WEB-INF/views/member/myPage/myPage-list.jsp"></jsp:include> -->
            <div class="right-side">
                <div class="my-info-list">
                    <div class="my-page-header">
                        <h1 class="main-title">리뷰 쓰기</h1>
                    </div>

                    <div class="rw-info-area">
                        <div class="rw-package">
                            선택한 주문번호 - 패키지명
                        </div>
                        <div class="rw-menu">
                            메뉴명(옵션도 보이게 할건지?)
                        </div>
                    </div>
                    <div class="rw-rating-area">
                        <div class="rw-rating">
                            이 메뉴 어땠나요?
                        </div>
                        <div class="rw-star">
                            ★★★☆☆
                        </div>
                    </div>
                    <div class="rw-review-content-area">
                        <div class="rw-question">
                            어떤 점이 좋았나요?
                        </div>
                        <div class="rw-review-content">
                            리뷰내용 리뷰내용 리뷰내용 리뷰내용 아주 긴 리뷰내용 긴 리뷰 긴 리뷰 긴긴긴 리뷰리뷰리뷰
                        </div>
                    </div>
                    <div class="rw-image-area">
                        <div class="rw-images">이미지 추가</div>
                        <div class="rw-images">이미지 추가</div>
                        <div class="rw-images">이미지 추가</div>
                    </div>
                    <div class="rw-btn-area">
                        <button class="submit-btn">글쓰기</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
    footer
    <!-- <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include> -->
</body>
</html>