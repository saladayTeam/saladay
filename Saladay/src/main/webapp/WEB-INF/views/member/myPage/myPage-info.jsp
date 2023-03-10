<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" href="/resources/css/member/myPage/myPage-info.css">
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <script src="https://kit.fontawesome.com/72842759a7.js" crossorigin="anonymous"></script>	

 
</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    
        
    <main>
     
        <div class="my-page-content">
  			<jsp:include page="/WEB-INF/views/member/myPage/myPage-list.jsp"></jsp:include>

            <div class="right-side">
                <form action="/member/updateInfo" class="my-page-info-frm" name="my-page-info-frm" method="post">
                <div>

                    <div class="my-page-header">
                        <h1 class="main-title">회원 정보</h1>
                        <p class="main-sub-title">회원 정보를 수정할 수 있습니다</p>
                    </div>

                    <div class="my-info-detail">
                        <span class="info-margin2">이메일</span>
                        <input type="text" id="memberEmail" name="memberEmail" autocomplete="off" readonly class="input-read-only" maxlength="6" value="${loginMember.memberEmail}">
                        <span class="input-row-message" id="memberEmailMessage"></span>
                    </div>

                    <div class="my-info-detail">
                        <span class="info-margin3">이 &nbsp  름  </span>
                        <input type="text" id="memberName" name="memberName" autocomplete="off" readonly class="input-read-only" maxlength="5" value="${loginMember.memberName}">
                        <span class="input-row-message" id="memberNameMessage"></span>
                    </div>

                    <div class="my-info-detail">
                        <div class="info-margin"><i style="font-size:12px; color:#249C66;" class="fa-solid fa-check"></i></div><span class="empty-space2">닉네임</span>
                        <input type="text" class="writable" id="memberNickname" name="memberNickname" autocomplete="off" maxlength="6" value="${loginMember.memberNickname}">
                        <span class="input-row-message" id="memberNicknameMessage"></span>
                    </div>

                    <div class="my-info-detail">
                        <div class="info-margin"><i style="font-size:12px; color:#249C66;" class="fa-solid fa-check"></i></div><span>전화번호</span>
                        <input class="writable input-tel" type="text" id="memberTel" name="memberTel" autocomplete="off" maxlength="11" value="${loginMember.memberTel}">
                        <span class="input-row-message" id="memberTelMessage"></span>
                    </div>

                    <div class="my-info-detail-address">
                        <div class="info-margin"><i style="font-size:12px; color:#249C66;" class="fa-solid fa-check"></i></div><span class="empty-space">주 &nbsp 소</span>
                        
                        <button type="button" id="addressSearch" class="address-search-btn">주소 검색</button>
                        
                        
                        <c:set var="address" value="${fn:split(loginMember.memberAddress, ',,') }"/>
                        
                        	
                        <input type="text" id="postCode" name="memberAddress" autocomplete="off" placeholder="우편번호" readonly class="address-input1" value="${address[0]}">
                        
                        <input type="text" id="address" name="memberAddress" autocomplete="off" placeholder="주소" readonly class="address-input2" value="${address[1]}">

                        <input type="text" id="detailAddress" name="memberAddress" autocomplete="off" placeholder="상세 주소" class="address-input writable" value="${address[2]}">
                    
                        
                    </div>
                    <button class="submit-btn">정보 수정</button>
                </div>
                </form>
            </div>
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/member/myPage/myPage-radio-check.js"></script>
    <script src="/resources/js/member/myPage/myPage-update.js"></script>
</body>
</html>