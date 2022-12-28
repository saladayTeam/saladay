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
    <title>주문/결제하기</title>

    <link rel="stylesheet" href="/resources/css/order/order.css">

    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>

</head>
<body>
    <!-- header -->
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    
    <main>
        <div class="section-tit">
            <h3>주문/결제하기</h3>
        </div>

        <hr />

        <!-- 폼태그로 넘길 값은 주문번호, 가격, 주문자명, 폰번호, 주소, 패키지 번호 등-->
        <section class="order-wrapper">
            <div class="orderer">
                <div class="orderer-left">
                    <h3 class="orderer-info">주문자 정보</h3>
                    <p>
                        <span class="o-th">주문자</span><span class="o-td" name="memberNo">${loginMember.memberName}</span>
                    </p>
                    <p>
                        <span class="o-th">이메일</span><span class="o-td">${loginMember.memberEmail}</span>
                    </p>
                    <p>
                        <span class="o-th">핸드폰</span><span class="o-td">${loginMember.memberTel}</span>
                    </p>
                    <p>
                        <span class="o-th">주소</span><span class="o-td">${fn:replace(loginMember.memberAddress, ',,', ' ')}</span>
                    </p>
                </div>
                
                <div class="orderer-right">
                    <form action="/orderView" method="post" id="payform"><!-- 배송정보 변경 초기화 -->
                        <p>
                            <span class="o-th">수령인</span>
                            <span class="o-td"><input type="text" name="orderName" id="orderName" placeholder="${loginMember.memberName}"></span> 
                        </p>
                        <p>
                            <span class="o-th">수령인 연락처</span>
                            <span class="o-td"><input type="tel" name="orderTel" id="orderTel" placeholder="${loginMember.memberTel}"></span>
                        </p>

                        <!-- 주소 입력 영역 -->
                        <p>
                            <span class="o-th"> 수령인 주소 </span>
                            <%-- <span class="o-td">
                                <input type="checkbox" id="memberAddr" name="newAddress"><label for="memberAddr"> 기본 배송지 선택</label>
                            </span> --%>
                        </p>
                            
                        <p class="address-area">
                            <input type="text" name="address" id="sample6_postcode" placeholder="우편번호" 
                                maxlength="6" autocomplete="off" readonly> <!-- value="${addr[0]}" -->
                            <button type="button" onclick="sample6_execDaumPostcode()"> 찾기 </button>     
                        </p>

                        <p class="address-area">
                            <input type="text" name="address" id="sample6_address" placeholder="도로명/지명주소" 
                            autocomplete="off" readonly> <!-- value="${addr[1]}" -->    
                        </p>

                        <p class="address-area">
                            <input type="text" name="address" id="sample6_detailAddress" placeholder="상세주소" 
                            autocomplete="off" > <!-- value="${addr[2]}" -->
                        </p>

                    </div>
                
            </div>

            <hr />
            <div class="order-items">
                <h3>주문 목록</h3>
                <div class="order-package" id="order-package">
                    <div class="pack-name"><span>${cart.packageName}</span></div>
                    <div class="pack-price"><span><fmt:formatNumber type="number" maxFractionDigits="0"  value="${cart.packagePrice}" /> 원</span></div>
                    <div class="pack-i"><input type="checkbox" id="icon"><label for="icon"><i class="fa-solid fa-caret-down"></i></label></div>
                </div>

                <div class="show-area"> <!-- 화살표 누르면 고른 메뉴 조회 가능-->
                    <li class="order-header">
                        <div class="order-menu"><span>주문상품</span></div>
                        <div class="order-quantity"><span>수량</span></div>
                        <div class="order-price"><span>가격</span></div>
                    </li>
                    <div class=week>1주</div>
                    <c:forEach var="menu" items="${cart.menuList}">
                        <div class="order-all">
                        <!-- 주문한 메뉴 내용 c:forEach -->
                            <%-- 선택 메인 메뉴 --%>
                            <li class="order-area">
                                <div class="order-menu headline">${menu.menuName}</div>
                                <div class="order-quantity headline">1</div>
                                <div class="order-price headline">${menu.menuPrice}</div>
                            </li>
                            <c:forEach var="option" items="${menu.optionList}">
                            <%-- 선택한 옵션 --%>
                                <li class="order-area">
                                    <div class="order-option">${option.optionName}</div>
                                    <div class="order-quantity">${option.optionCount}</div>
                                    <div class="order-price">${option.optionPrice}</div>
                                </li>
                            </c:forEach>
                        </div>
                    </c:forEach>

                    <c:if test="${cart.packageType==2}">

                        <div class=week>2주</div>

                        <c:forEach var="menu" items="${cart.menuList}">
                            <div class="order-all">
                            <!-- 주문한 메뉴 내용 c:forEach -->
                                <%-- 선택 메인 메뉴 --%>
                                <li class="order-area">
                                    <div class="order-menu headline">${menu.menuName}</div>
                                    <div class="order-quantity headline">1</div>
                                    <div class="order-price headline">${menu.menuPrice}</div>
                                </li>
                                <c:forEach var="option" items="${menu.optionList}">
                                <%-- 선택한 옵션 --%>
                                    <li class="order-area">
                                        <div class="order-option">${option.optionName}</div>
                                        <div class="order-quantity">${option.optionCount}</div>
                                        <div class="order-price">${option.optionPrice}</div>
                                    </li>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </c:if>

                </div>
            </div>

            <hr />

            <div class="select-delivery">
                <h3>배송일 선택</h3>
                <div class="cal-container">
                    <div class=cal>
                        <p>원하는 수령 날짜를 선택해주세요</p>
                        <%-- <p><input type="date" data-placeholder="배송일 선택" required></p> --%>
                        <p><input type="text" id="deliveryDate" name="deliveryDate" placeholder="배송일 선택" required autocomplete="off"></p>
                    </div>
                    <%-- 선택한 패키지 번호에 따라서 2차 배송일 지정 --%>
                    <c:if test="${cart.packageType==2}">
                        <div class=cal>
                            <p>2차 수령 날짜를 선택해주세요</p>
                            <p><input type="text" id="deliveryDate2" name="deliveryDate2" placeholder="배송일 선택" required autocomplete="off"></p>
                        </div>
                    </c:if>
                </div>    
            </div>
            
            <hr />

            <div class="payment-area">
                <h3>결제수단</h3>
                <input type=radio id=kakaopay checked>&nbsp;&nbsp;<img src="/resources/images/order/kakaoPay.svg" alt="">
            </div>

            <hr />

            <div class="check-area">
                <h3>결제 예상 금액</h3>
                <div class=check-info>
                    <span class="check-info-head headline">패키지 금액</span>
                    <span class="check-info-data headline"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${cart.packagePrice}" /> 원</span>
                </div>
                <div class=check-info>
                    <span class="check-info-head">배송비</span>
                    <span class="check-info-data">0 원(무료 배송)</span>
                </div>
                <div class=check-info>
                    <span class="check-info-head">할인금액</span>
                    <c:choose>
                        <c:when test="${cart.packageType==1}">
                            <span class="check-info-data">0 원</span>
                        </c:when>
                        <c:otherwise>
                            <span class="check-info-data"> <fmt:formatNumber type="number" maxFractionDigits="0"  value="${cart.packagePrice*0.1}" /> 원</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class=check-info>
                    <span class="check-info-head headline">총 금액</span>
                    <c:choose>
                        <c:when test="${cart.packageType==1}">
                            <span class="check-info-data headline"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${cart.packagePrice}" /> 원</span>
                        </c:when>
                        <c:otherwise>
                            <span class="check-info-data headline"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${cart.packagePrice*0.9}" /> 원</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <button id="payBtn" type="button" onclick="payment()">구매하기</button>
        </section>
    </main>


    <!-- footer -->
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script>
        // 결제 정보 전달을 위한 변수 선언
        const packageName="${cart.packageName}"; // 주문한 패키지 이름
        const memberName="${loginMember.memberName}"; // 주문한 멤버 이름

        // 주문한 패키지 가격
        let packagePrice=0;
        if("${cart.packageType==1}"){
            packagePrice=<fmt:formatNumber type="number" maxFractionDigits="0"  value="${cart.packagePrice}" />;
        } else {
            packagePrice=<fmt:formatNumber type="number" maxFractionDigits="0"  value="${cart.packagePrice*0.9}" />;
        }

        const memberEmail="${loginMember.memberEmail}"; // 주문한 멤버 아이디(이메일)
        const memberTel="${loginMember.memberTel}"; // 주문한 멤버 전화번호
        const memberAddress="${loginMember.memberAddress}"; // 주문한 멤버 주소
    </script>

    <!-- 다음 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    
    <!-- Datepicker -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <script src="/resources/js/order/order.js"></script>
</body>
</html>