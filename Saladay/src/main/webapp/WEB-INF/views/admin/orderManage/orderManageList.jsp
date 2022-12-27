<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link rel="stylesheet" href="/resources/css/admin/orderManage/adminOrderList.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    <main>
        <div class="admin-order-title">
            <span><h1>주문관리</h1></span>
            <br />
            <span>고객의 주문 내역을 조회할 수 있습니다</span>
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
                <tr>
                    <td>123</td>
                    <td>2022-12-27</td>
                    <td>[1주] 샐러드 3팩 패키지</td>
                    <td>김샐러드</td>
                    <td>35000원</td>
                    <td>취소요청중</td>
                </tr>
                <tr>
                    <td>122</td>
                    <td>2022-12-27</td>
                    <td>[2주] 샐러드 3팩 패키지</td>
                    <td>김샐러드</td>
                    <td>70000원</td>
                    <td></td>
                </tr>
            </tbody>
        </table>

        <div class="pagination-area">
<%--             <c:if test="${not empty reviewList}"> --%>
                <ul class="pagination">
                    <!-- 이전 목록 마지막 번호로 이동 --> 
                    <li><a href="?cp=${pagination.prevPage}">&lt;</a></li>
                        <c:forEach var="i" begin="${pagination.startPage}" 
                        end="${pagination.endPage}" step="1">
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="?cp=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="?cp=${pagination.nextPage}">&gt;</a></li>
                </ul>
<%--             </c:if> --%>
        </div>

    </main>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>