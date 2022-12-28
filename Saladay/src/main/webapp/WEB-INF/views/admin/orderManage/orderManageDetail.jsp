<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문상세조회</title>

    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <link rel="stylesheet" href="/resources/css/admin/orderManage/orderManageDetail.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    <main>
        <div class="admin-order-title">
            <span><h1>주문상세조회</h1></span>
            <br />
            <span>고객의 주문 내역을 조회하고 주문을 취소할 수 있습니다.</span>
        </div>
        <div class="admin-order-wrapper">
            <span>주문번호 : 123</span>
            <hr />
            <li class="admin-order-table-header">
                <div class="admin-order-package-image"><span>패키지</span></div>
                <div class="admin-order-package-info"><span>상품정보</span></div>
                <div class="admin-order-package-count"><span>수량</span></div>
                <div class="admin-order-package-price"><span>가격</span></div>
                <div class="admin-order-package-total"><span>상품금액</span></div>
            </li>

            <hr />
                <!-- 패키지 -->
                
                <li class="admin-order-container">
                    <div class="admin-order-package-image">
                    <img src="${cart.packageImage}" alt="이미지" width="220px" height="140px"/>
                    </div>
                    <div class="admin-order-package-info">
                    <span>${cart.packageName}</span>
                    </div>
                    <div class="admin-order-package-count">
                    <span>1</span>
                    </div>
                    <div class="admin-order-package-price">
                    <span></span>
                    </div>
                    <div class="admin-order-package-total">
                    <span></span>
                    </div>
                </li>
                <div class="week">1주</div>
                <!-- 메뉴 -->
                <li class="admin-order-container">
                    <div class="admin-order-package-image"></div>
                    <div class="admin-order-menu-info">
                    <span>${menu.menuName}</span>
                    </div>
                    <div class="admin-order-package-count">
                    <span>1</span>
                    </div>
                    <div class="admin-order-package-price menu">
                    <span>${menu.menuPrice}</span>
                    </div>
                    <div class="admin-order-package-total">
                    <span></span>
                    </div>
                </li>

                  <!-- 옵션 -->
                    <li class="admin-order-container">
                        <div class="admin-order-package-image"></div>
                        <div class="admin-order-option-info option">
                        <span>${option.optionName}</span>
                        </div>
                        <div class="admin-order-package-count option">
                        <span>${option.optionCount}</span>
                        </div>
                        <div class="admin-order-package-price option">
                        <span>${option.optionPrice*option.optionCount}</span>
                        </div>
                        <div class="admin-order-package-total">
                        <span></span>
                        </div>
                    </li>

                <!-- 패키지 타입 2인 경우 -->

                  <div class="week">2주</div>
                    <li class="admin-order-container">
                        <div class="admin-order-package-image"></div>
                        <div class="admin-order-menu-info">
                        <span>${menu.menuName}</span>
                        </div>
                        <div class="admin-order-package-count">
                        <span>1</span>
                        </div>
                        <div class="admin-order-package-price menu">
                        <span>${menu.menuPrice}</span>
                        </div>
                        <div class="admin-order-package-total">
                        <span></span>
                        </div>
                    </li>

                    <li class="admin-order-container">
                        <div class="admin-order-package-image"></div>
                        <div class="admin-order-option-info option">
                        <span>${option.optionName}</span>
                        </div>
                        <div class="admin-order-package-count option">
                        <span>${option.optionCount}</span>
                        </div>
                        <div class="admin-order-package-price option">
                        <span>${option.optionPrice*option.optionCount}</span>
                        </div>
                        <div class="admin-order-package-total">
                        <span></span>
                        </div>
                    </li>

                <hr />

                <!-- 패키지 총 금액 -->
                <li class="admin-order-table-header">
                    <div class="admin-order-package-image"></div>
                    <div class="admin-order-package-info"></div>
                    <div class="admin-order-package-count"></div>
                    <div class="admin-order-package-price"></div>
                    <div class="admin-order-package-total">
                      <span><fmt:formatNumber type="number" maxFractionDigits="0"  value="${cart.packagePrice}" /> 원</span>
                    </div>
                </li>
                </div>
          </div>

    </main>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>