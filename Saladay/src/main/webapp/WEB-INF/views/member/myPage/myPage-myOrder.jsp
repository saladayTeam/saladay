<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역</title>

    <link rel="stylesheet" href="/resources/css/member/myPage/myPage-myOrder.css">
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/72842759a7.js" crossorigin="anonymous"></script>
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
                                </div>
                                <button class="order-btn"><a href="/menu/packageList">상품 구매하러 가기</a></button>
                            	
                            </c:if>

                            <c:if test="${!empty myOrder}">
                            
                            <c:forEach var="order" items="${myOrder}" varStatus="vs" >
                            
                            <div  class="my-order-content">
                            	<div class="order-content-header">
	                            	<div class="order-number">주문번호 ${order.orderNo}</div>
	                            	<div>
	                            	<c:forEach var="delivery" items="${myDelivery}" >
	                            	 	<c:if test="${delivery.orderNo == order.orderNo }">
	                            	 	<div class="delivery-content">
	                            	 		<span class="font">${delivery.rowNum}주차 배송 :</span>
	                            	 		<span>${delivery.deliveryDate}</span>
	                            	 		<span class="delivery-status">${delivery.deliveryStatus}</span>
	                            	 	</div>
	                            	 	</c:if>
	                            	</c:forEach>
	                            	</div>
                            	</div>
                            	
                            	
                            	<div class="order-detail">
	                            	<div class="package-img">
	                            		<img src="${order.packageImage}" width="180px" height="110px" >
	                            	</div>
	                            	<div class="package-detail">
	                            		<ul>
	                            			<li>주문 상품 : ${order.packageName}</li>
	                            			<li>주문일자 : ${order.orderDate}</li>
	                            			<li>수령인 : ${order.orderName}</li>
	                            			<li>수령인 연락처 : ${order.orderTel}</li>
	                            			<li>수령인 주소 : ${fn:replace(order.orderAddress, ',,', ' ')}</li>
	                            		</ul>
	                            	</div>
                            	</div>
                           		
                            	<!-- 메뉴 -->
                            	<input type="checkbox" id="hide-${order.orderNo}" class="hide-checkbox">
                				<label for="hide-${order.orderNo}"><span class="hide-text">상세내역</span><i class="fa-solid fa-caret-down"></i></label>
                            	<div class="hide">
                            	
	                            	<div class="package-type">1주차</div>
	                            	<div class="tr">
	                            		<span class="tr1">메뉴 이름</span>
	                            		<span class="tr2">수량</span>
	                            		<span class="tr3">가격</span>
	                            	</div>
                            	
                           
                            	<c:forEach var="menu" items="${order.orderMenuList}">
                            		 <div class="menu-list">
                            		 	
                            		 	<div class="menu-table">
                            		 		
                            		 		<ul>
                            		 			<li class="menu-td">${menu.menuName}</li>
                            		 			<li>1</li>
                            		 			<li>${menu.menuPrice}원</li>
                            		 			<c:if test="${menu.deliveryCode eq 'D'}">
                            		 				
                            		 				<c:if test="${reviewCheck.orderMenuNo == menu.orderMenuNo }">
                            		 					<c:if test="${reviewCheck.reviewCheck eq 'possible'}">
                            		 					<li><div class="review-btn" onclick="location='/review/write'">리뷰 작성</div></li>
                            		 					</c:if>
                            		 				
	                            		 				<c:if test="${reviewCheck.reviewCheck eq 'done'}">
	                            		 				<li><div class="review-completed-btn">작성 완료</div></li>
	                            		 				</c:if>
                            		 				</c:if>
                            		 				
                            		 			</c:if>
                            		 		</ul>
                            					
                            					<!-- 옵션 -->
							                    <c:forEach var="option" items="${menu.optionList}">
							                    	
								                    <c:if test="${option.optionCount > 0}">
								                    <ul>
		                            		 			<li class="menu-td">${option.optionName}</li>
		                            		 			<li>${option.optionCount}</li>
		                            		 			<li>${option.optionPrice*option.optionCount}원</li>
                            		 				</ul>
								                    </c:if>
								                    
							                    </c:forEach>
                            		 	</div>
                            		 </div>
                            	</c:forEach>
                            	
                            	<c:if test="${order.packageType==2}">
                            		
                            		<div class="package-type"><i class="fa-solid fa-truck-fast fa-flip-horizontal"></i></i>2주차는 1주차와 동일한 구성으로 배송됩니다.</div>
                                
                            	</c:if>
                            	</div>
                            	
                            <!-- 배송상태가 결제완료 일 때 주문취소 버튼(1개만 나오게 flag) -->	
                            <div class="order-bottom">
                            	<c:set var="loop_flag" value="false" />
                            	<c:forEach var="delivery" items="${myDelivery}">
                            	 	<c:if test="${delivery.orderNo == order.orderNo }">
                            	 		<c:if test="${delivery.deliveryCode eq 'A' }">
	                            	 		<c:if test="${not loop_flag }">
	                            	 		<div class="order-cancel-btn" onclick="cancelMyOrder(${order.orderNo})">주문 취소</div>
	                            	 		<c:set var="loop_flag" value="true" />
	       									</c:if>
                            	 		</c:if>
                            	 	</c:if>
                            	</c:forEach>
	                            
	                            <div class="total-price">결제 금액 : <fmt:formatNumber type="number" maxFractionDigits="0"  value="${order.orderPrice}" />원</div>
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
    <script>
    const cancelMyOrder=(orderNo)=>{
        if( confirm("정말 취소 하시겠습니까?") ){
        $.ajax({
            url : "/member/myPage/cancelMyOrder",
            type : "get",
            data : { orderNo : orderNo },
            success : result => {
                if(result > 0){
                    alert("주문을 취소했습니다");
                }else{
                    alert("취소 실패");
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