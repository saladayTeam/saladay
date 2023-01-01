<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
    <div class="review-detail">
        <div class="review-delete-area">
            <button id="review-modal-delete">삭제</button>
        </div>
        <div class="review-detail-content">
            <div class="review-img-area">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                        <img src="#" class="d-block w-100">
                        </div>
                        <div class="carousel-item">
                        <img src="#" class="d-block w-100">
                        </div>
                        <div class="carousel-item">
                        <img src="#" class="d-block w-100">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <div class="review-detail-star"></div>
            <div class="review-detail-date"></div>
            <div class="review-detail-salad"></div>
            <div class="review-detail-nickname"></div>
            <div class="review-detail-text"></div>
        </div>
        <div class="review-detail-like">
            <span><i id="reviewHeart"></i></span><span class="review-detail-likeCount"></span>
        </div>
    </div>
</body>