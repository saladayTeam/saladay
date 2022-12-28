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

    <link rel="stylesheet" href="/resources/css/member/myPage/myPage-myReview.css">
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
               
                <div class="my-info-list">

                    <div class="my-page-header">
                        <h1 class="main-title">나의 리뷰</h1>
                    </div>

					<div class="review-list">
						
						<c:if test="${empty reviewList}">
							<div class="my-review-detail">
							
								<div class="empty-review">앗! 작성한 리뷰가 없어요.
								 상품을 구매하시고 리뷰를 작성해보세요.</div>
							
							</div>
							<button class="order-btn"><a href="/menu/packageList">상품 구매하러 가기</a></button>
						</c:if>
					
					
						<c:forEach items="${reviewList}" var="review">
	                    <div class="my-review-detail">
	                    	
	                    	<div class="review-img-wrapper">	
		                    	<c:if test="${review.thumbnail == null }">
			               			<div class="review-img">
			                        	<img src="/resources/images/review/reviewImg.png" width="200px" height="200px">
			                        </div>
		                        </c:if>
		                        
		                        <c:if test="${review.thumbnail != null}">
			                 	    <div class="review-img">
			                        	<img src="${review.thumbnail}"  width="200px" height="200px">
			                        </div>
		                        </c:if>
	                        </div>    
	                        
	                        <div class="content">
	                        	<div class="review-del-btn" onclick="reviewDel(${review.reviewNo})">리뷰 삭제</div>
		                        <ul>
		                        	<li>리뷰 작성일 : ${review.reviewDate}</li>
		                        	<li><span class="text-muted ${review.rating}"></span></li>
		                        	<li>${review.menuName}</li>
		                        	<li class="review-content">내용 : ${review.reviewContent}</li>
		                        </ul>
	                        </div>
	                    </div>
						</c:forEach>
						
                    </div>
                </div>
           
            </div>
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script>
        $(".1").html("&#9733; &#9734; &#9734; &#9734; &#9734;");
        $(".2").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
        $(".3").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
        $(".4").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
        $(".5").html("&#9733; &#9733; &#9733; &#9733; &#9733;");
    </script>
    <script>
    const reviewDel=(reviewNo)=>{
        if( confirm("정말 삭제 하시겠습니까?") ){
        $.ajax({
            url : "/review/delete",
            type : "get",
            data : { reviewNo : reviewNo },
            success : result => {
                if(result > 0){
                    alert("리뷰가 삭제되었습니다");
                }else{
                    alert("삭제 실패");
                }
                location.reload();
            },
            error : error => {
                console.log(error);
            }
        })
        }
    }
    </script>
    
</body>
</html>