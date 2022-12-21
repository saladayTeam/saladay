<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script
      src="https://kit.fontawesome.com/2aa49fc46f.js"
      crossorigin="anonymous"
    ></script>

    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/cart/cart.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">

  </head>
  <body>

    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

    <div class="cart-title">
      <span><h1>장바구니</h1></span>
      <br />
      <span>주문하실 상품의 제품명과 수량을 정확히 확인해주세요</span>
    </div>

    <form action="" method="post">
        <div class="cart-wrapper">
        <span>장바구니 정보</span>
        <hr />
        <li class="cart-table-header">
            <div class="cart-package-image"><span>패키지</span></div>
            <div class="cart-package-info"><span>상품정보</span></div>
            <div class="cart-package-count"><span>수량</span></div>
            <div class="cart-package-price"><span>가격</span></div>
            <div class="cart-package-total"><span>상품금액</span></div>
        </li>

        <hr />
        <!-- 패키지 -->
        <li class="cart-container">
            <div class="cart-package-image">
            <img src="" alt="이미지" />
            </div>
            <div class="cart-package-info">
            <span>[1주] 샐러드 3팩 패키지 </span>
            </div>
            <div class="cart-package-count">
            <span>1</span>
            </div>
            <div class="cart-package-price">
            <span>30000</span>
            </div>
            <div class="cart-package-total">
            <span></span>
            </div>
        </li>
        <!-- 메뉴 -->
        <li class="cart-container">
            <div class="cart-package-image"></div>
            <div class="cart-menu-info menu">
            <span>로스트 치킨</span>
            </div>
            <div class="cart-package-count">
            <span>1</span>
            </div>
            <div class="cart-package-price">
            <span>8000</span>
            </div>
            <div class="cart-package-total">
            <span></span>
            </div>
        </li>

        <!-- 옵션 -->
        <li class="cart-container">
            <div class="cart-package-image"></div>
            <div class="cart-option-info menu">
            <span>양파</span>
            </div>
            <div class="cart-package-count">
            <span>2</span>
            </div>
            <div class="cart-package-price">
            <span>1000</span>
            </div>
            <div class="cart-package-total">
            <span></span>
            </div>
        </li>
        
        <hr />
        <!-- 패키지 총 금액 -->
        <li class="cart-table-header">
            <div class="cart-package-image"></div>
            <div class="cart-package-info"></div>
            <div class="cart-package-count"></div>
            <div class="cart-package-price"></div>
            <div class="cart-package-total"><span>35000</span></div>
        </li>
        </div>


        <hr />

        <div class=delete-cart><span>장바구니 삭제</span></div>

        <hr />

        <button class="total">주문 / 결제</button>
    </form>
    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script src="/resources/js/cart/cart.js"></script>
  </body>
</html>
