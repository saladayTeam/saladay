<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/resources/css/member/findID.css">
	
</head>
<body>
    <section class="find-area-section">
        <!-- 로고 -->
        <header class="logo-box">
            <a href="/">
                <img src="/resources/images/saladay-logo.png" alt="logo" class="logo">
            </a>
        </header>
        
        <!-- 로그인 영역 -->
        <section class="find-box">
            <form action="/member/findID" method="post" name="findID-frm" id= "findID-frm">
                <div class="findID-frm">

                    <h4 class="find-box-title">이름</h4>
                    <div class="find-box-wrap">
                        <div class="find-box-row">
                            <input type="text" id="memberName" name="memberName" placeholder="'이름' 을 입력하세요" maxlength="5"  autocomplete="off">
                        </div>
                    </div>

                    <h4 class="find-box-title">전화번호</h4>
                    <div class="find-box-wrap">
                        <div class="find-box-row">
                            <input type="text" id="memberTel" name="memberTel" placeholder="'-' 없이 입력하세요"  maxlength="11" >
                        </div>
                    </div>
                    
                    <div>
                        <button class="find-btn">아이디 찾기</button>
                    </div>
                </div>
            </form>
            
            <div class="find-area">
                <a href="/member/findPw">비밀번호 재설정</a>
            </div>


        </section>
    </section>



</body>
</html>