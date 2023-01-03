<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="orderList" value="${map.orderList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문관리</title>

    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <link rel="stylesheet" href="/resources/css/admin/orderManage/orderManageList.css">
</head>
<body>

    <%-- 검색을 진행한 경우 --%>
    <c:if test="${not empty param.orderStatus}">
        <c:set var="sURL" value="&orderStatus=${orderStatus}"/>
    </c:if>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    <main>
        <div class="admin-order-title">
            <span><h1>주문관리</h1></span>
            <div class="tit">
                <span>고객의 주문 내역을 조회할 수 있습니다</span>
                <div class="order-status-area">
                    <form action ="/admin/orderManage" method="get">
                        <select id = "orderStatus" class="${orderStatus}" name="orderStatus">
                            <option value="0">전체주문</option>
                            <option value="1">정상주문</option>
                            <option value="2">취소요청</option>
                            <option value="3">취소완료</option>
                        </select>
                        <button type="submit" class="osBtn">
                            검색
                        </button>
                        <button type="button" class="osBtn" id="goToImport">아임포트</button>
                    </form>
                </div>
            </div>
        </div>

        <table class="admin-order-table">
            <thead>
                <tr class="admin-order-thead">
                    <th>주문번호</th>
                    <th>주문일자</th>
                    <th>주문상품</th>
                    <th>주문자명</th>
                    <th>결제금액</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orderList}">
                    <tr onClick="location.href='/admin/orderManage/${order.orderNo}'" class="admin-order-click">
                        <td>${order.orderNo}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.packageName}</td>
                        <td>${order.memberName}</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${order.orderPrice}" /> 원</td>
                        <c:if test="${order.orderDeleteFlag=='N'}">
                        <td></td>
                        </c:if>
                        <c:if test="${order.orderDeleteFlag=='Y'}">
                        <td>취소요청중</td>
                        </c:if>
                        <c:if test="${order.orderDeleteFlag=='A'}">
                        <td>취소완료</td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="pagination-area">
            <c:if test="${not empty orderList}">
                <ul class="pagination">
                    <!-- 이전 목록 마지막 번호로 이동 --> 
                    <li><a href="?cp=${pagination.prevPage}${sURL}">&lt;</a></li>
                        <c:forEach var="i" begin="${pagination.startPage}" 
                        end="${pagination.endPage}" step="1">
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="?cp=${i}${sURL}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="?cp=${pagination.nextPage}${sURL}">&gt;</a></li>
                </ul>
            </c:if>
        </div>

    </main>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
    <script src="/resources/js/admin/orderManage/orderManageList.js"></script>
</html>