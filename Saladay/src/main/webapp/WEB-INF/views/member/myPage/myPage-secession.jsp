<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>

    <link rel="stylesheet" href="/resources/css/member/myPage/myPage-info.css">
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    
</head>

<body>
    
    <main>
        <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

        
        <div class="my-page-content">
            <div class="left-side">
                <div class="left-side-header">마이 페이지</div>
                <ul class="my-page-list">
                    <li>
                        <input type="radio" name="myPageType" value="1" id="myPageType1" checked >
                        <label for="myPageType1"><a href="/member/info" class="myPageType1">회원 정보 수정</a></label>
                    </li>
                    <li>
                        <input type="radio" name="myPageType" value="2" id="myPageType2" >
                        <label for="myPageType1"><a class="myPageType2">비밀번호 변경</a></label>
                    </li>
                    <li>
                        <input type="radio" name="myPageType" value="3" id="myPageType3" >
                        <label for="myPageType2"><a href="/member/myOrder" class="myPageType3">주문 내역</a></label>
                    </li>
                    <li>
                        <input type="radio" name="myPageType" value="4" id="myPageType4" >
                        <label for="myPageType3"><a class="myPageType4">나의 리뷰</a></label>
                    </li>
                    <li>
                        <input type="radio" name="myPageType" value="5" id="myPageType5" >
                        <label for="myPageType5"><a href="/member/secession" class="myPageType5">회원 탈퇴</a></label>
                    </li>
                </ul>
            </div>

            <div class="right-side">
			
				<form action="/member/secession" class="my-page-secession-frm" name="my-page-secession-frm" method="post">
               
                    <div class="my-page-header">
                        <h1 class="main-title">회원 탈퇴</h1>
                    </div>

                    <div class="my-info-detail">
                        
                        <div class="my-secession-content">
                            <p>
                            샐러데이를 아끼고 사랑해주신 시간에 감사드립니다.<br>
                            더욱 건강한 서비스를 제공할 수 있는 샐러데이가 되도록 노력하겠습니다.
                            </p>
                        </div>
                        
                    </div>
                    <button class="submit-btn">회원 탈퇴</button>
                     
				</form>
            
            </div>
            
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
</body>
</html>