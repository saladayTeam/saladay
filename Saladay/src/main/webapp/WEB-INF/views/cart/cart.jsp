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
            <img src="${cartPackage.packageImage}" alt="이미지" width="220px" height="140px"/>
            </div>
            <div class="cart-package-info">
            <span>${cartPackage.packageName}</span>
            </div>
            <div class="cart-package-count">
            <span>1</span>
            </div>
            <div class="cart-package-price">
            <span></span>
            </div>
            <div class="cart-package-total">
            <span></span>
            </div>
        </li>
        <!-- 메뉴 -->
        <c:forEach var="menu" items="${cartPackage.menuList}">
          <li class="cart-container">
              <div class="cart-package-image"></div>
              <div class="cart-menu-info">
              <span>${menu.menuName}</span>
              </div>
              <div class="cart-package-count">
              <span>1</span>
              </div>
              <div class="cart-package-price menu">
              <span>${menu.menuPrice}</span>
              </div>
              <div class="cart-package-total">
              <span></span>
              </div>
          </li>

          <!-- 옵션 -->
          <c:forEach var="option" items="${menu.optionList}">
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
          </c:forEach>
        </c:forEach>

        <hr />
        
        <!-- 패키지 총 금액 -->
        <li class="cart-table-header">
            <div class="cart-package-image"></div>
            <div class="cart-package-info"></div>
            <div class="cart-package-count"></div>
            <div class="cart-package-price"></div>
            <div class="cart-package-total"><span>${cartPackage.packagePrice}</span></div>
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
