<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <br />
            <span>고객의 배송 정보를 업데이트할 수 있습니다</span>
        </div>



        



    배송관리를 할거에요

    <button onclick="location.href='/admin/deliveryCalendar'">캘린더</button>
    </main>

    <%-- 푸터 --%>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <%-- 푸터 --%>
</body>
</html>