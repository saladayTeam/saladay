<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="review-detail">
    <div class="review-delete-area">
        <button id="review-modal-delete">삭제</button>
    </div>
    <div class="review-detail-content">
        <div class="review-img-area">
            <span>◁</span>
            <img class="review-images" src="/resources/images/review/reviewImg.png">
            <span>▷</span>
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