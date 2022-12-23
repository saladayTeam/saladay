<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="left-side">
	<div class="left-side-header">마이 페이지</div>
	<ul class="my-page-list">
		<li>
			<input type="radio" name="myPageType" value="1" id="myPageType1" checked> 
			<label for="myPageType1"><a href="/member/myPage/info" class="myPageType1">회원 정보 수정</a></label>
		</li>
		
		<li>
			<input type="radio" name="myPageType" value="2" id="myPageType2"> 
			<label for="myPageType2"><a href="/member/myPage/myPageChangePw" class="myPageType2">비밀번호 변경</a></label>
		</li>
		
		<li>
			<input type="radio" name="myPageType" value="3" id="myPageType3"> 
			<label for="myPageType3"><a href="/member/myPage/myOrder" class="myPageType3">주문 내역</a></label>
		</li>
		
		<li>
			<input type="radio" name="myPageType" value="4" id="myPageType4"> 
			<label for="myPageType4"><a href="/member/myPage/myReview" class="myPageType4">나의 리뷰</a></label>
		</li>
		
		<li>
			<input type="radio" name="myPageType" value="5" id="myPageType5"> 
			<label for="myPageType5"><a href="/member/myPage/secession" class="myPageType5">회원 탈퇴</a></label>
		</li>
	</ul>
</div>
