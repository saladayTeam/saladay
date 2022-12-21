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
    <link rel="stylesheet" href="/resources/css/member/find.css">
	
</head>
<body>
    <section class="find-area-section">
        <!-- 로고 -->
        <header class="logo-box">
            <a href="/">
                <img src="/resources/images/saladay-logo.png" alt="logo" class="logo">
            </a>
        </header>
        
        <section class="find-box">
            <form action="/member/findPw" method="post" name="findPw-frm" id= "findPw-frm">
                <div class="findPw-frm">

                    <h4 class="find-box-title">이메일</h4>
                    <div class="find-box-wrap">
                        <div class="find-box-row">
                            <input type="text" id="memberEmail" name="memberEmail" placeholder="아이디(이메일)" maxlength="30"  autocomplete="off">
                            <button type="button" id="getAuthKeyBtn" class="input-btn">인증번호 받기</button>
                        </div>
                    </div>

                    
                    <h4 class="find-box-title">인증번호</h4>
                    <div class="find-box-wrap2">
                        <div class="find-box-row">
                            <input type="text" id="authKey" name="authKey" placeholder="인증번호 입력"  maxlength="6" autocomplete="off">
                            <button type="button" id="checkAuthKeyBtn" class="input-btn" >인증하기</button>
                        </div>
                    </div>
                    <span class="authKey-message" id="authKeyMessage">인증되었습니다.</span><!-- / 인증번호가 일치하지 않습니다. -->
                    
                    
                    <div class="btn-box">
                        <button class="find-btn">비밀번호 찾기</button>
                    </div>
                </div>
            </form>
            


        </section>
    </section>


    <script src="/resources/js/member/validate.js"></script>
</body>
</html>