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
	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/lib/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/member/myPage/myPage-myReview.css">
    <script src="https://kit.fontawesome.com/72842759a7.js" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
 
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
                        <p class="main-sub-title">리뷰 이미지 클릭 시 상세조회를 할 수 있습니다</p>
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
			                        	<img src="/resources/images/review/reviewImg.png" class="review-img list-thumbnail" width="200px" height="200px" onclick="selectReviewDetail(${review.reviewNo}, ${loginMember.memberNo})">
			                        </div>
		                        </c:if>
		                        
		                        <c:if test="${review.thumbnail != null}">
			                 	    <div class="review-img">
			                        	<img src="${review.thumbnail}"  class="review-img list-thumbnail" width="200px" height="200px" onclick="selectReviewDetail(${review.reviewNo}, ${loginMember.memberNo})">
			                        </div>
		                        </c:if>
	                        </div>    
	                        
	                        <div class="content">
	                        	
		                        <ul>
		                        	<li class="review-content-1"><div>주문 번호</div>: ${review.orderNo} </li>
		                        	
		                        	<c:forEach var="order" items="${reviewOrder}">
		                        		<c:if test="${order.orderNo == review.orderNo}">
		                        		<li class="review-content-1"><div>주문 일자 </div>: ${order.orderDate}</li>
		                        		</c:if>
		                        	</c:forEach>
		                        	
		                        	<li class="review-content-1"><div>리뷰 작성일 </div>: ${review.reviewDate}</li>
		                        	<li class="review-content-2"><div>평점 </div>: <span class="text-muted ${review.rating}"></span></li>
		                        	<li class="review-content-2"><div>메뉴 </div>: ${review.menuName}</li>
		                        	<li class="review-content"><div>작성 내용 </div>${review.reviewContent}</li>
		                        </ul>
	                        </div>
	                    </div>
						</c:forEach>
						
                    </div>
                </div>
           
            </div>
        </div>
        
        <div class="review-modal">
            <span id="modal-close">&times;</span>
            <jsp:include page="/WEB-INF/views/review/reviewDetail.jsp"></jsp:include>
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
        const memberNo = "${loginMember.memberNo}";
        const authority = "${loginMember.authority}";
        const reviewNo = "${review.reviewNo}";
        const likeCheck = "${review.likeCheck}";
    </script>
    <%-- <script>
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
    </script>--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/resources/js/member/myPage/myPage.js"></script>
    <script src="/resources/js/review/review.js"></script>
</body>
</html>