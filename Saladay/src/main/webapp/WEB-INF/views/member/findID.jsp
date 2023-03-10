<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디찾기</title>
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
        
        <!-- 로그인 영역 -->
        <section class="find-box">
            <form action="/member/findID" method="post" name="findID-frm" id= "findID-frm">
                <div class="findID-frm">

                    <h4 class="find-box-title">이름</h4>
                    <div class="find-box-wrap">
                        <div class="find-box-row">
                            <input type="text" oninput="this.value = this.value.replace(/[^ㄱ-힣.]/g, '').replace(/[a-z0-9]/g, '');" id="memberName" name="memberName" placeholder="'이름' 을 입력하세요" maxlength="5"  autocomplete="off">
                            <span class="white-space"></span>
                        </div>
                    </div>

                    <h4 class="find-box-title">전화번호</h4>
                    <div class="find-box-wrap">
                        <div class="find-box-row">
                        	<!-- input 값이 바뀌면 발생하는 이벤트 이며 이 이벤트가 발생할 때 숫자만 입력받는 정규식이 적용되고 숫자가 아닌 값이 입력되면 replace 함수로 대체하게 된다 -->
                            <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="memberTel" name="memberTel" placeholder="'-' 없이 입력하세요"  maxlength="11" >
                            <span class="white-space"></span>
                        </div>
                    </div>
                    
                    <div>
                        <button class="find-btn">아이디 찾기</button>
                    </div>
                </div>
            </form>
            
            <div class="find-area">
                <a href="/member/findPw">비밀번호 찾기</a>
            </div>


        </section>
    </section>

	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    
	<script src="/resources/js/member/findID.js"></script>
	<%-- session scope 내에 message속성이 존재하는 경우 alert(JS)기능을 이용해서 처리한 메세지 내용 출력 --%>
    <c:if test="${!empty message}">
        <script> 
            alert("${message}");
        </script> 
        <c:remove var="message" />
    </c:if>
</body>
</html>