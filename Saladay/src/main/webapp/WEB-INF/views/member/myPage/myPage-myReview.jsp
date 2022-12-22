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
                <div class="my-info-list">

                    <div class="my-page-header">
                        <h1 class="main-title">나의 리뷰</h1>
                    </div>

					<c:forEach items="${reviewList}" var="review">
                    <div class="my-info-detail">
                        <ul>
                        	<li>리뷰 작성일 : ${review.reviewDate}</li>
                        	<li>평점 : ${review.rating} </li>
                        	<li>${review.menuName}</li>
                        	<li>내용 : ${review.reviewContent}</li>
                        </ul>
                    </div>
					</c:forEach>
                    
                </div>
                </form>
            </div>
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    
</body>
</html>