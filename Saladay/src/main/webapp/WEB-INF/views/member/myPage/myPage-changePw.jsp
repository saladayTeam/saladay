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
    <title>비밀번호 변경</title>

    <link rel="stylesheet" href="/resources/css/member/myPage/myPage-info.css">
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <script src="https://kit.fontawesome.com/72842759a7.js" crossorigin="anonymous"></script>	

 
</head>

<body>
    
    <main>
        <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

        
        <div class="my-page-content">
        	<jsp:include page="/WEB-INF/views/member/myPage/myPage-list.jsp"></jsp:include>
        	

            <div class="right-side">
                
                <form action="/member/changePw" method="post" name="changePw-frm" id= "changePw-frm">
	                <div class="my-info-list">

                    <div class="my-page-header">
                        <h1 class="main-title">비밀번호 변경</h1>
                    </div>

                    <div class="my-info-detail">
                        <span class="empty-space3">현재 비밀번호</span>
                        <input type="password" class="writable input-password" name="currentMemberPw" id="currentMemberPw" placeholder="현재 비밀번호" autocomplete="off">
                        <span class="input-row-message" id="currentMemberPwMessage"></span>
                    </div>

                    <div class="my-info-detail">
                        <span class="empty-space4">새 비밀번호</span>
                        <input type="password" class="writable input-password" id="memberPw" name="memberPw" placeholder="새 비밀번호" maxlength="20"  autocomplete="off">
                        <span class="input-row-message" id="memberPwMessage"></span>
                    </div>
                    
                    <div class="my-info-detail">
                        <span>새 비밀번호 확인</span>
                        <input type="password" class="writable input-password" id="memberPwConfirm" name="memberPwConfirm" placeholder="새 비밀번호 확인" maxlength="20"  autocomplete="off">
                        <span class="input-row-message" id="memberPwConfirmMessage"></span>
                    </div>

	                
	                <button class="submit-btn">비밀번호 변경</button>
	             
	                </div>
	            </form>
            
            </div>
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/member/validate.js"></script>
</body>
</html>