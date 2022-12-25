<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    
    <section>
        <div class="view-title">
            <span><h1>주문완료</h1></span>
            <br>
        </div>
        
        <div class="view-wrapper">
            <!-- <div class="view-info">
                <span>주문상품정보</span>
            </div> -->

            <div class="view-content">
                <p><img class="view-img" src="/resources/images/menu/salad/로스트 닭다리살 샐러드.jpg" alt=""></p>
                
                <p class="info-p">
                    <span>주문이 완료되었습니다!</span>
                </p>
                
                <div class="view-row">
                    <span class="view-h">주문번호</span>
                    <span class="view-d">1</span>
                </div>
                
                <div class="view-row">
                    <span class="view-h">수령인</span>
                    <span class="view-d">이성호</span>
                </div>
                
                <div class="view-row">
                    <span class="view-h">배송주소</span>
                    <span class="view-d">서울시 중구 남대문로120</span>
                </div>
                
                <div class="view-row">
                    <span class="view-h">수령상품</span>
                    <span class="view-d">[1주] 샐러드 3팩 패키지</span>
                </div>
                
                <div class="view-row">
                    <span class="view-h">결제금액</span>
                    <span class="view-d">53500 원</span>
                </div>
            </div>
        </div>
        
        <div class="view-btn-area">
            <button type="button" class="order-view-btn">주문내역 확인하기</button>
            <button type="button" class="shopping-btn">계속 쇼핑하기</button>
        </div>
    
    </section>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
</body>
</html>