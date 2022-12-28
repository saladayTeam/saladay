<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문완료</title>

    <link rel="stylesheet" href="/resources/css/order/orderView.css">

</head>
<body>
    <!-- header -->
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    
    <section class="order-view-section">
        <div class="view-title">
            <span><h1>주문완료</h1></span>
            <br>
        </div>
        
        <div class="view-wrapper">
            <!-- <div class="view-info">
                <span>주문상품정보</span>
            </div> -->

            <div class="view-content">
                <p><img class="view-img" src="/resources/images/order/checked.png" alt=""></p>
                
                <p class="info-p">
                    <span>주문이 완료되었습니다.</span>
                </p>
                
                <div class="view-row">
                    <span class="view-h">주문번호</span>
                    <span class="view-d">${order.orderNo}</span>
                </div>
                
                <div class="view-row">
                    <span class="view-h">수령인</span>
                    <span class="view-d">${order.orderName}</span>
                </div>
                
                <div class="view-row">
                    <span class="view-h">배송주소</span>
                    <span class="view-d">${fn:replace(order.orderAddress, ',,', ' ')}</span>
                </div>
                
                <div class="view-row">
                    <span class="view-h">수령상품</span>
                    <span class="view-d">${order.cart.packageName}</span>
                </div>
                
                <div class="view-row">
                    <span class="view-h">결제금액</span>
                    <span class="view-d"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${order.orderPrice}" /> 원</span>
                </div>
            </div>
        </div>
        
        <div class="view-btn-area">
            <button type="button" class="order-view-btn" id="myOrderView">주문내역 확인하기</button>
            <button type="button" class="shopping-btn" id="continueShopping">계속 쇼핑하기</button>
        </div>
    </section>
    
    <!-- footer -->
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
    <script src="/resources/js/order/orderView.js"></script>
</body>
</html>