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
			<jsp:include page="/WEB-INF/views/member/myPage/myPage-list.jsp"></jsp:include>
			
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