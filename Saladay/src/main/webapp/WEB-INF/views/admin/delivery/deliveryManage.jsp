<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="deliveryList" value="${map.deliveryList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <link rel="stylesheet" href="/resources/css/admin/calendar/deliveryManage.css">

    <title>배송관리</title>
</head>
<body>
    <%-- 헤더 --%>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    <%-- 헤더 --%>
    <main>
      <div class="admin-order-title">
            <span><h1>배송관리</h1></span>
            <div class="tit">
                <span>고객의 주문 내역을 조회할 수 있습니다</span>
                <div class="delivery-status-area">
                    <form action ="/admin/orderManage" method="get">
                        <select id = "deliveryStatus" name="deliveryStatus">
                            <option value="D">&nbsp; 배송완료</option>
                            <option value="B">&nbsp; 배송준비중</option>
                            <option value="C">&nbsp; 배송중</option>
                            <option value="A">&nbsp; 결제완료</option>
                        </select>
                        <button type="button" class="osBtn" onclick="updateDelivery();">
                            수정
                        </button>
                        <button onclick="location.href='/admin/deliveryCalendar'" type="button" class="osBtn" id="goToImport">캘린더</button>
                    </form>
                </div>
            </div>
        </div>
        <%-- <div class="admin-order-title">
            <div class="title">
              <span><h1>배송관리</h1></span>
              <br/>
              <span>고객의 배송 정보를 업데이트할 수 있습니다</span>
            </div>
            <div class="btnBox"> 
              <div class="display-none">
                <select id="deliveryStatus" name="deliveryStatus">
                  <option value="D">배송완료</option>
                  <option value="B">배송준비중</option>
                  <option value="C">배송중</option>
                  <option value="A">결제완료</option>
                </select>
                <div class="calendarBtn">
                  <button onclick="location.href='/admin/deliveryCalendar'" id="updateBtn" class="calendar">수정</button>
                </div>
              </div>
              <div class="calendarBtn">
                <button onclick="location.href='/admin/deliveryCalendar'" class="calendar">캘린더</button>
              </div>
            </div> --%>

            <%-- <div>${list}</div> --%>
        </div>

       <table>
        <caption style="display:none">
            <summary>메뉴조회</summary>
        </caption>

        <colgroup>
          <col width="2%">
          <col width="6%">
          <col width="6%">
          <col width="18%">
          <col width="10%">
          <col width="15%">
          <col width="33%">
          <col width="12%">
        </colgroup>

        <thead>
          <tr>
            <th scope="col"><input type="checkbox" name="allCheck" id="allCheck"></th>
            <th scope="col"><span>배송번호</span></th>
            <th scope="col"><span>주문번호</span></th>
            <th scope="col"><span>상품명</span></th>
            <th scope="col"><span>수령자</span></th>
            <th scope="col"><span>배송일자</span></th>
            <th scope="col"><span>배송주소</span></th>
            <th scope="col"><span>배송상태</span></th>
          </tr>
        </thead>

        <tbody>
          <c:forEach items="${deliveryList}" var="delivery">
            <tr id="delivery-click">
              <td scope="col"><input type="checkbox" name="rowCheck" value="${delivery.deliveryNo}"></td>
              <td onClick="location.href='/admin/orderManage/${delivery.orderNo}'" scope="col"><span class="menu-n">${delivery.deliveryNo}</a></span></td>
              <td onClick="location.href='/admin/orderManage/${delivery.orderNo}'" scope="col"><span class="menu-n" >${delivery.orderNo}</a></span></td>
              <td onClick="location.href='/admin/orderManage/${delivery.orderNo}'" scope="col"><span class="menu-i">${delivery.packageName}</span></td>
              <td onClick="location.href='/admin/orderManage/${delivery.orderNo}'" scope="col"><span class="menu-p">${delivery.orderName}</span></td>
              <td onClick="location.href='/admin/orderManage/${delivery.orderNo}'" scope="col"><span class="menu-c">${delivery.deliveryDate}</span></td>
              <td onClick="location.href='/admin/orderManage/${delivery.orderNo}'" scope="col"><span class="menu-c">${fn:replace(delivery.orderAddress, ',,', ' ')}</span></td>
              <td onClick="location.href='/admin/orderManage/${delivery.orderNo}'" scope="col"><span class="menu-c">${delivery.deliveryStatus}</span></td>
              <%-- 배송완료일 경우 텍스트만 --%>
              <%-- <c:if test="${delivery.deliveryCode=='D'}">
                <td scope="col"><span class="menu-c">${delivery.deliveryStatus}</span></td>
              </c:if>
              <%-- 결제완료인 경우 버튼
              <c:if test="${delivery.deliveryCode=='A'}">
                <td scope="col"><button id="changeBtn" onclick="changeBtn('${delivery.deliveryNo}')" type="button">${delivery.deliveryStatus}</button>
                <input type="hidden" value="${delivery.deliveryNo}" ></td>
              </c:if> --%>
            </tr>
          </c:forEach>
        </tbody>
      
      </table>

      <div class="pagination-area">
            <c:if test="${not empty deliveryList}">
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
            </c:if>
        </div>


    </main>

    <%-- 푸터 --%>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <%-- 푸터 --%>
    <script src="/resources/js/admin/deliveryManage/deliveryManage.js"></script>
</body>
</html>