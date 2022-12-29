<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매출관리</title>

    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <link rel="stylesheet" href="/resources/css/admin/salesManage/salesManage.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
</head>
<body>

    <!-- header -->
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>

    <main>
        <div class="menu-m-tit">
            <div>
            <span>매출 관리</span>
            </div>
        </div>

        <div class="chart-container">
            <canvas id="myChart1" width="300" height="400"></canvas>
            <canvas id="myChart2" width="300" height="400"></canvas>
            <canvas id="myChart3" width="300" height="400"></canvas>
        </div>
    </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>


    <script>
        // 월별 주문 개수
        const monthOrderCount=JSON.parse("${monthOrderCount}");

        // 월별 매출액
        const monthOrderPrice=JSON.parse("${monthOrderPrice}");

        // 주문한 패키지 별 개수
        const packageCount=JSON.parse("${packageCount}")

        // 주문한 메뉴별 개수
        const menuCount=JSON.parse("${menuCount}")


    </script>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script> 
    <script src="/resources/js/admin/salesManage/salesManage.js"></script>
    <script src="/resources/js/admin/salesManage/utils.js"></script>

</html>