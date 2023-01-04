<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/72842759a7.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    <main>
        <div class="admin-order-title">
            <span><h1>주문상세조회</h1></span>
            <div class="tit">
                <span>고객의 주문 내역을 조회하고 주문을 취소할 수 있습니다.</span>
                <div class="order-status-area">
                    <button onclick="location.href='/admin/orderManage'" class="osBtn">목록으로</button>
                </div>
            </div>
        </div>
        <div class="admin-order-number">
            <div class="ao-info">주문번호 : ${orderDetail.orderNo}</div>
            <br />
            <div class="ao-info">주문일시 : ${orderDetail.orderDate}</div>
            <br />
            <div class="ao-info">
                <span>주문상태 : </span>
                <c:if test="${orderDetail.orderDeleteFlag=='N'}">
                <span>정상주문</span>
                </c:if>
                <c:if test="${orderDetail.orderDeleteFlag=='Y'}">
                <span style="color:blue;">취소요청중</span>
                </c:if>
                <c:if test="${orderDetail.orderDeleteFlag=='A'}">
                <span style="color:red;">취소완료</span>
                </c:if>
            </div>
            <br />
            <hr />
        </div>
        <section class="order-wrapper">
            <div class="orderer">
                <div class="orderer-left">
                    <h3 class="orderer-info">주문자 정보</h3>
                    <p>
                        <span class="o-th">주문자</span><span class="o-td" name="memberNo"> ${orderDetail.memberName}</span>
                    </p>
                    <p> 
                        <span class="o-th">이메일</span><span class="o-td">${orderDetail.memberEmail}</span>
                    </p>
                    <p>
                        <span class="o-th">핸드폰</span><span class="o-td">
                            ${fn:substring(orderDetail.memberTel,0,3)} -
                            ${fn:substring(orderDetail.memberTel,3,7)} -
                            ${fn:substring(orderDetail.memberTel,7,11)}
                        </span>
                    </p>
                    <p>
                        <span class="o-th">주소</span><span class="o-td">${fn:replace(orderDetail.memberAddress, ',,', ' ')}</span>
                    </p>
                </div>
                
                <div class="orderer-right">
                    <h3 class="orderer-info">배송지 정보</h3>
                    <p>
                        <span class="o-th">수령인</span><span class="o-td" name="memberNo">${orderDetail.orderName}</span>
                    </p>
                    <p>
                        <span class="o-th">배송지 전화번호</span><span class="o-td">
                            ${fn:substring(orderDetail.orderTel,0,3)} -
                            ${fn:substring(orderDetail.orderTel,3,7)} -
                            ${fn:substring(orderDetail.orderTel,7,11)}
                        </span>
                    </p>
                    <p>
                        <span class="o-th">배송지 주소</span><span class="o-td">${fn:replace(orderDetail.orderAddress, ',,', ' ')}</span>
                    </p>

                </div>
                
            </div>

            <hr />
            <div class="order-items">
                <h3>주문 목록</h3>
                <div class="order-package" id="order-package">
                    <div class="pack-name"><span>${orderDetail.packageName}</span></div>
                    <div class="pack-price"><span><fmt:formatNumber type="number" maxFractionDigits="0"  value="${orderDetail.packagePrice}" /> 원</span></div>
                    <div class="pack-i"><input type="checkbox" id="icon"><label for="icon"><i class="fa-solid fa-caret-down"></i></label></div>
                </div>

                <div class="show-area"> <!-- 화살표 누르면 고른 메뉴 조회 가능-->
                    <li class="order-header">
                        <div class="order-menu"><span>주문상품</span></div>
                        <div class="order-quantity"><span>수량</span></div>
                        <div class="order-price"><span>가격</span></div>
                    </li>
                    <div class="week">1주</div>
                    <c:forEach var="menu" items="${orderDetail.orderMenuList}">
                        <div class="order-all">
                        <!-- 주문한 메뉴 내용 c:forEach -->
                            <%-- 선택 메인 메뉴 --%>
                            <li class="order-area">
                                <div class="order-menu headline">${menu.menuName}</div>
                                <div class="order-quantity headline">1</div>
                                <div class="order-price headline">${menu.orderMenuPrice}</div>
                            </li>
                            <c:forEach var="option" items="${menu.optionList}">
                            <%-- 선택한 옵션 --%>
                                <li class="order-area">
                                    <div class="order-option">${option.optionName}</div>
                                    <div class="order-quantity">${option.optionCount}</div>
                                    <div class="order-price">${option.orderOptionPrice*option.optionCount}</div>
                                </li>
                            </c:forEach>
                        </div>
                    </c:forEach>

                    <c:if test="${orderDetail.packageType==2}">

                        <div class="week">2주</div>
                        <div class="package-type">
                            <i class="fa-solid fa-truck-fast fa-flip-horizontal"></i></i>2주차는 1주차와 동일한 구성으로 배송됩니다.
                        </div>
                    </c:if>

                </div>
            </div>

            <hr />

            <div class="select-delivery">
                <h3>배송 정보</h3>
                <div class="cal-container">
                    <%-- 취소 요청중인 주문인 경우 --%>
                    <c:if test="${orderDetail.orderDeleteFlag=='Y'}">
                        <div style="color:blue;" class="ao-message">앗! 취소요청중인 주문입니다.</div>
                        <div class=cal>
                            <p>1차 배송일 : ${orderDetailDelivery[0].deliveryDate}</p>
                            <p>배송 상태 : ${orderDetailDelivery[0].deliveryStatus}</p>
                        </div>
                        <%-- 2차 배송일이 있는 경우 --%>
                        <c:if test="${orderDetail.packageType==2}">
                            <hr />
                            <div class=cal>
                                <p>2차 배송일 : ${orderDetailDelivery[1].deliveryDate}</p>
                                <p>배송 상태 : ${orderDetailDelivery[1].deliveryStatus}</p>
                            </div>
                        </c:if>
                    </c:if>
                    <%-- 정상 주문인 경우 --%>
                    <c:if test="${orderDetail.orderDeleteFlag=='N'}">
                        <div class=cal>
                            <p>1차 배송일 : ${orderDetailDelivery[0].deliveryDate}</p>
                            <p>배송 상태 : ${orderDetailDelivery[0].deliveryStatus}</p>
                        </div>
                        <%-- 2차 배송일이 있는 경우 --%>
                        <c:if test="${orderDetail.packageType==2}">
                            <hr />
                            <div class=cal>
                                <p>2차 배송일 : ${orderDetailDelivery[1].deliveryDate}</p>
                                <p>배송 상태 : ${orderDetailDelivery[1].deliveryStatus}</p>
                            </div>
                        </c:if>
                    </c:if>
                    <%-- 취소 완료된 주문인 경우 --%>
                    <c:if test="${orderDetail.orderDeleteFlag=='A'}">
                    <div style="color:red;" class="ao-message">배송 정보가 없습니다.</div>
                    </c:if>

                </div>    
            </div>
            
            <hr />

            <div class="check-area">
                <h3>결제 금액</h3>
                <div class=check-info>
                    <span class="check-info-head headline">패키지 금액</span>
                    <span class="check-info-data headline"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${orderDetail.packagePrice}" /> 원</span>
                </div>
                <div class=check-info>
                    <span class="check-info-head">배송비</span>
                    <span class="check-info-data">0 원(무료 배송)</span>
                </div>
                <div class=check-info>
                    <span class="check-info-head">할인금액</span>
                    <c:choose>
                        <c:when test="${orderDetail.packageType==1}">
                            <span class="check-info-data">0 원</span>
                        </c:when>
                        <c:otherwise>
                            <span class="check-info-data"> <fmt:formatNumber type="number" maxFractionDigits="0"  value="${orderDetail.orderPrice*1/9}" /> 원</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class=check-info>
                    <span class="check-info-head headline">총 금액</span>
                    <span class="check-info-data headline"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${orderDetail.orderPrice}" /> 원</span>
                </div>
            </div>
            <%-- 정상주문인 경우 --%>
            <c:if test="${orderDetail.orderDeleteFlag=='N'}">
                <c:choose>
                    <c:when test="${orderDetail.packageType==1}">
                        <%-- 1주패키지인 경우 첫번째 배송건이 결제 완료인 상태에만 주문 취소 버튼 생성 --%>
                        <c:if test="${orderDetailDelivery[0].deliveryCode=='A'}"> 
                            <button id="withdrawOrderBtn" type="button" class="withdrawOrderBtn">주문 취소</button>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <%-- 2주패키지인 경우 모든 배송건이 결제 완료인 상태에만 주문 취소 버튼 생성 --%>
                        <c:if test="${orderDetailDelivery[0].deliveryCode=='A' && orderDetailDelivery[1].deliveryCode=='A'}"> 
                            <button id="withdrawOrderBtn" type="button" class="withdrawOrderBtn">주문 취소</button>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </c:if>

            <%-- 취소요청중인 주문인 경우 --%>
            <c:if test="${orderDetail.orderDeleteFlag=='Y'}">
                <div class="btn-area">
                    <button id="cancleBtn" type="button">요청 철회</button>
                    <button id="withdrawOrderBtn" class="withdrawBtn" type="button">주문 취소</button>
                </div>
            </c:if>

            <%-- 취소완료된 주문인 경우 --%>
            <c:if test="${orderDetail.orderDeleteFlag=='A'}">
                <hr />
                <div class="select-delivery">
                    <h3>취소 내역</h3>
                    <div class="cal-container">
                        <div style="color:red;" class="ao-message">취소완료된 주문입니다.</div>
                        <br />
                        <div>취소일시 : ${orderDetail.cancleDate}</div>
                    </div>
                </div>
            </c:if>
        </section>

    </main>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
    <script>
        const orderDeleteFlag = "${orderDetail.orderDeleteFlag}";
    </script>
    <script src="/resources/js/admin/orderManage/orderManageDetail.js"></script>
</html>