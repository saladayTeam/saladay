<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>

    <link rel="stylesheet" href="/resources/css/member/find-result.css">
    
</head>
<body>

    <main>
        <!-- 로고 -->
        <header class="logo-box">
            <a href="/">
                <img src="/resources/images/saladay-logo.png" alt="logo" class="logo">
            </a>
        </header>
        
        <span class="result-message"><span id="memberName">${memberName}</span> 님의 회원 아이디</span>
        
        <c:choose>
        	<c:when test="${not empty result }">
        		<div class="result-box">
            		"${result}"
        		</div>
        		
        		<div>
		            <div class="btn1"><a href="/member/login">로그인</a></div>
		            <div class="btn2"><a href="/member/findPw">비밀번호 찾기</a></div>
		        </div>
        	</c:when>
        	<c:otherwise>
        		<div class="result-box">
            		"일치하는 회원정보가 존재하지않습니다."
        		</div>
        	
        		<div>
					<div class="btn1"><a href="/">메인페이지</a></div>
		            <div class="btn2"><a href="/member/findID">아이디 찾기</a></div>
		        </div>
        	</c:otherwise>
        </c:choose>


    </main>
	<%-- session scope 내에 message속성이 존재하는 경우 alert(JS)기능을 이용해서 처리한 메세지 내용 출력 --%>
    <c:if test="${!empty message}">
        <script> 
            alert("${message}");
        </script> 
        <c:remove var="message" />
    </c:if>


</body>
</html>