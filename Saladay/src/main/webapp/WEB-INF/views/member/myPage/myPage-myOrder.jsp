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

                    <div class="my-secession-detail">
                
                        <div class="my-secession-package">
                            <c:if test="${empty myOrder}">
                                <div>
                                	앗! 주문 내역이 없어요. 샐러데이를 구독해보세요
                                </div>
                                <button class="order-btn"><a href="/menu/packageList">상품 구매하러 가기</a></button>
                            </c:if>

                            <c:if test="${!empty myOrder}">
                            	<c:forEach var="menu" items="${myOrder.orderMenuList }">
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