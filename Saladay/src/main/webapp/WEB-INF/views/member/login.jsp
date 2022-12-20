<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/member/login.css">


</head>
<body>
    <section class="login">
        <!-- 로고 -->
        <header class="logo-box">
            <a href="#">
                <img src="/resources/images/saladay-logo.png" alt="logo" class="logo">
            </a>
        </header>
        
        <!-- 로그인 영역 -->
        <section class="login-box">
            <form action="#">
                <div class="login-frm">
                    <div class="id-pw-wrap">
                        <div class="id-pw-row">
                            <input type="text" id="memberEmail" name="memberEmail" placeholder="아이디(이메일)" maxlength="50">
                        </div>
                    </div>

                    <div class="id-pw-wrap">
                        <div class="id-pw-row">
                            <input type="password" id="memberPw" name="memberPw" placeholder="비밀번호"  maxlength="50" onKeyPress="return checkCapsLock(event)">
                        </div>
                    </div>
                    
                    <div class="saveId-area">
                        <label for="saveId">
                            <input type="checkbox" name="saveId" id="saveId">
                            <label for="saveId"> <i class="fas fa-check"></i>아이디 저장</label>
                        </label>
                    </div>
                    
                    <div>
                        <button class="login-btn">로그인</button>
                    </div>
                </div>
            </form>
        
            <div class="find-area">
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
                <a href="/member/signUp">회원가입</a>
            </div>

            <div class="kakao-login">
                <!-- 카카오 로그인 할 경우를 생각해 넣은 임시설정이므로 수정 필요 -->
                <img src="/resources/images/member/kakao_login_medium_wide.png" alt="">
            </div>
        </section>
    </section>

    <footer>
        <!-- footer.jsp 추가하기 -->
        <!-- <jsp:include page="" /> -->
    </footer>

    <script src="/resources/js/member/login.js"></script>

</body>
</html>