<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역</title>

    <link rel="stylesheet" href="/resources/css/member/myPage/myPage-myOrder.css">
    <link rel="stylesheet" href="/resources/css/member/myPage/myPage-info.css">
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>
    
</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    
    <main>
        
        
        <div class="my-page-content">
			<jsp:include page="/WEB-INF/views/member/myPage/myPage-list.jsp"></jsp:include>
			
            <div class="right-side">

                    <div class="my-page-header">
                        <h1 class="main-title">주문 내역</h1>
                    </div>

                    <div>
                
                        <div class="my-order-package">
                            <c:if test="${empty myOrder}">
                                <div class="my-order-content">
                                	앗! 주문 내역이 없어요. 샐러데이를 구독해보세요
                                
                                <button class="order-btn"><a href="/menu/packageList">상품 구매하러 가기</a></button>
                            	</div>
                            </c:if>

                            <c:if test="${!empty myOrder}">
                            
                            <c:forEach var="order" items="${myOrder}" >
                            <div  class="my-order-content">
                            	<div class="order-number">주문번호 ${order.orderNo}</div>
                            	<div class="order-detail">
	                            	<div class="package-img">
	                            		<img src="${order.packageImage}" width="180px" height="110px" >
	                            	</div>
	                            	<div class="package-detail">
	                            		<ul>
	                            			<li>주문 상품 : ${order.packageName}</li>
	                            			
	                            			<li>
	                            				<span>1주차 배송 : ${order.deliveryCode}</span>
	                            				<c:if test="${order.packageType==2}">
	                            				<span>2주차 배송 ${order.deliveryCode}</span>
	                            				</c:if>
	                            			</li>
	                            			<li>주문일자 : ${order.orderDate}</li>
	                            			<li>수령인 : ${order.orderName}</li>
	                            			<li>수령인 연락처 : ${order.orderTel}</li>
	                            			<li>수령인 주소 : ${order.orderAddress}</li>
	                            		</ul>
	                            	</div>
                            	</div>
                           		
                            	<!-- 메뉴 -->
                            	<c:forEach var="menu" items="${order.orderMenuList}">
                            		 <div class="menu-list">
                            		 	<div class="menu-table">
                            		 		<ul class="menu-tr">
                            		 			<li class="menu-td">메뉴 이름</li>
                            		 			<li>수량</li>
                            		 			<li>가격</li>
                            		 		</ul>
                            		 		<ul>
                            		 			<li class="menu-td">${menu.menuName}</li>
                            		 			<li>1</li>
                            		 			<li>${menu.menuPrice}원</li>
                            		 			<li><div class="review-btn" onclick="">리뷰 작성</div></li>
                            		 		</ul>
                            					
                            					<!-- 옵션 -->
							                    <c:forEach var="option" items="${menu.optionList}">
							                    	
								                    <c:if test="${option.optionCount > 0}">
								                    <ul>
		                            		 			<li class="menu-td">${option.optionName}</li>
		                            		 			<li>${option.optionCount}</li>
		                            		 			<li>${option.optionPrice*option.optionCount}</li>
                            		 				</ul>
								                    
								                    </c:if>
								                    
							                    </c:forEach>
                            		 	</div>
                            		 </div>
                            	</c:forEach>
                            <div class="order-bottom">
	                            <div class="order-cancel-btn" onclick="">주문 취소</div>
	                            <div class="total-price">결제 금액 : ${order.orderPrice} 원</div>
                            </div>
                            </div>
                            </c:forEach>

                            </c:if>
                        </div>
                        
                    </div>

                  

            </div>
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
</body>
</html>