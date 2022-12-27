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
	                            			<li>${order.packageName}</li>
	                            			<li><span>1주차 배송 ${order.deliveryCode}</span><span>2주차 배송</span></li>
	                            			<li>주문일자 : ${order.orderDate}</li>
	                            			<li>수취인 : ${order.orderName}</li>
	                            			<li> ${order.orderTel}</li>
	                            			<li>${order.orderAddress}</li>
	                            		</ul>
	                            	</div>
                            	</div>
                            	<!-- 메뉴 -->
                            	<c:forEach var="menu" items="${order.orderMenuList}">
                            		 <div class="menu-list">
                            		 	<div>
                            		 		<ul>
                            		 			<li><div>${menu.menuName}</div><div class="review-btn" onclick="">리뷰 작성</div></li>
                            		 			<li>${menu.menuPrice}</li>
                            					
                            					<!-- 옵션 -->
							                    <c:forEach var="option" items="${menu.optionList}">
							                    	
								                    <c:if test="${option.optionCount > 0}">
								                    <li class="cart-container">
								                        <div class="cart-package-image"></div>
								                        <div class="cart-option-info option">
								                        <span>${option.optionName}</span>
								                        </div>
								                        <div class="cart-package-count option">
								                        <span>${option.optionCount}</span>
								                        </div>
								                        <div class="cart-package-price option">
								                        <span>${option.optionPrice*option.optionCount}</span>
								                        </div>
								                        <div class="cart-package-total">
								                        <span></span>
								                        </div>
								                    </li>
								                    </c:if>
								                    
							                    </c:forEach>
							                    
                            		 		</ul>
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