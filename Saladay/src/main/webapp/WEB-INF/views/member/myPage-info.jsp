<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPage-info</title>

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
                        <label for="myPageType1"><a class="myPageType1">회원 정보 수정</a></label>
                    </li>
                    <li>
                        <input type="radio" name="myPageType" value="2" id="myPageType2" >
                        <label for="myPageType1"><a class="myPageType2">비밀번호 변경</a></label>
                    </li>
                    <li>
                        <input type="radio" name="myPageType" value="3" id="myPageType3" >
                        <label for="myPageType2"><a class="myPageType3">주문 내역</a></label>
                    </li>
                    <li>
                        <input type="radio" name="myPageType" value="4" id="myPageType4" >
                        <label for="myPageType3"><a class="myPageType4">나의 리뷰</a></label>
                    </li>
                    <li>
                        <input type="radio" name="myPageType" value="5" id="myPageType5" >
                        <label for="myPageType5"><a class="myPageType5">회원 탈퇴</a></label>
                    </li>
                </ul>
            </div>

            <div class="right-side">
                <form action="#" class="my-page-info-form" name="my-page-info-form" method="post">
                <div class="my-info-list">

                    <div class="my-page-header">
                        <h1 class="main-title">회원 정보</h1>
                        <p class="main-sub-title">회원 정보를 수정할 수 있습니다</p>
                    </div>

                    <div class="my-info-detail">
                        <span>이메일</span>
                        <input type="text" id="memberEmail" name="memberEmail" autocomplete="off" readonly class="input-read-only" maxlength="6" value="${loginMember.memberEmail}">
                        <span class="input-row-message" id="memberEmailMessage"></span>
                    </div>

                    <div class="my-info-detail">
                        <span>이 &nbsp  름  </span>
                        <input type="text" id="memberName" name="memberName" autocomplete="off" readonly class="input-read-only" maxlength="5" value="${loginMember.memberName}">
                        <span class="input-row-message" id="memberNameMessage"></span>
                    </div>

                    <div class="my-info-detail">
                        <span>닉네임</span>
                        <input type="text" class="writable input-read-only" id="memberNickname" name="memberNickname" autocomplete="off" maxlength="6" value="${loginMember.memberNickname}">
                        <span class="input-row-message" id="memberNicknameMessage"></span>
                    </div>

                    <div class="my-info-detail">
                        <span>전화번호</span>
                        <input class="writable input-read-only" type="text" id="memberTel" name="memberTel" autocomplete="off" maxlength="11" value="${loginMember.memberTel}">
                        <span class="input-row-message" id="memberTelMessage"></span>
                    </div>

                    <div class="my-info-detail">
                        <span class="empty-space">주 &nbsp 소</span>
                        
                        <button type="button" class="hide address-search-btn">검색</button>
                        
                        <c:if test=""></c:if>
                        <c:set var="address" value="${fn:split(loginMember.memberAddress, ',,')}"/>
						
                        <input type="text" id="postCode" name="memberAddress" autocomplete="off" class="input-read-only address-input" value="${address[0]}">
                        
                        <input type="text" id="address" name="memberAddress" autocomplete="off"  class="input-read-only address-input" value="${address[1]}">

                        <input type="text" id="detailAddress" name="memberAddress" autocomplete="off" class="writable input-read-only address-input" value="${address[2]}">
                    
                        
                    </div>
                    <button class="submit-btn">정보 수정</button>
                </div>
                </form>
            </div>
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    
</body>
</html>