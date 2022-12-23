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
            <form action="/member/changePw" method="post" name="changePw-frm" id= "changePw-frm">
                <div class="changePw-frm">

                    <h4 class="find-box-title">새 비밀번호</h4>
                    <div class="find-box-wrap2">
                        <div class="find-box-row">
                            <input type="password" id="memberPw" name="memberPw" placeholder="새 비밀번호" maxlength="20"  autocomplete="off">
                            <span class="white-space"></span>
                        </div>
                    </div>
                    <div id="memberPwMessage" class="message">영어, 숫자, 특수문자(!,@,#,-,_) 5 ~ 20 글자 사이로 입력해주세요.</div>

                    
                    <h4 class="find-box-title">새 비밀번호 확인</h4>
                    <div class="find-box-wrap2">
                        <div class="find-box-row">
                            <input type="password" id="memberPwConfirm" name="memberPwConfirm" placeholder="새 비밀번호 확인" maxlength="20"  autocomplete="off">
							<span class="white-space"></span>                        
                        </div>
                    </div>
                    <div id="memberPwConfirmMessage" class="message"></div>
                    
                    
                    <div class="btn-box">
                        <button class="find-btn">비밀번호 변경</button>
                    </div>
                </div>
            </form>
            


        </section>
    </section>

	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    
    <script src="/resources/js/member/validate.js"></script>
    <%-- session scope 내에 message속성이 존재하는 경우 alert(JS)기능을 이용해서 처리한 메세지 내용 출력 --%>
    <c:if test="${!empty message}">
        <script> 
            alert("${message}");
        </script> 
        <c:remove var="message" />
    </c:if>
</body>
</html>