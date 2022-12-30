<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드</title>

    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <link rel="stylesheet" href="/resources/css/admin/dashboard/dashboard.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
</head>
<body>

    <!-- header -->
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>

    <main>
        <c:set var="lastindex" value="${fn:length(monthOrderPrice)-1}" />
        <div class="menu-m-tit">
            <div>
                <span>대시보드</span>
            </div>
        </div>

        <div class="chart-container-1">
            <span>월간 매출액 / 월간 주문 건수</span>
            <canvas id="myChart1" width="1200" height="400"></canvas>
            <table>
                <caption style="display:none">
                    <summary>매출액 비교</summary>
                </caption>

                <colgroup>
                    <col width="33%">
                    <col width="33%">
                    <col width="33%">
                </colgroup>

                <thead>
                    <tr>
                        <th scope="col">전월 총 매출액</th>
                        <th scope="col">당월 총 매출액</th>
                        <th scope="col">증감율</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td scope="col"> 
                            <fmt:formatNumber type="number" maxFractionDigits="0"  value="${monthOrderPrice[lastindex-1]}" />
                        </td>
                        <td scope="col">
                            <fmt:formatNumber type="number" maxFractionDigits="0"  value="${monthOrderPrice[lastindex]}" />
                        </td>
                        <td scope="col">
                            <fmt:formatNumber type="percent" value="${((monthOrderPrice[lastindex]-monthOrderPrice[lastindex-1])/monthOrderPrice[lastindex-1])}"  pattern="0.0%"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="chart-container-2">
            <div class="chart-order-container">
                <div class="chart-order">
                    <span>패키지 별 월간 주문 건수</span>
                    <canvas id="myChart2" width="500" height="400"></canvas>
                </div>
                <div class="chart-order">
                    <span>메뉴 별 월간 주문 건수</span>
                    <canvas id="myChart3" width="500" height="400"></canvas>
                </div>
            </div>
            <table>
                <caption style="display:none">
                    <summary>메뉴 별 판매량 및 매출액</summary>
                </caption>

                <colgroup>
                    <col width="20%">
                    <col width="10%">
                    <col width="15%">
                    <col width="10%">
                    <col width="15%">
                    <col width="15%">
                    <col width="15%">
                </colgroup>

                <thead>
                    <tr>
                        <th>구분</th>
                        <th>전월 판매 수량</th>
                        <th>전월 판매 매출</th>
                        <th>당월 판매 수량</th>
                        <th>당월 판매 매출</th>
                        <th>전월 대비 증감</th>
                        <th>매출 비중</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="salesMenu" items="${salesMenuList}">
                        <tr>
                            <td>
                                ${salesMenu.menuName}
                            </td>
                            <td>
                                ${salesMenu.preMonthSalesQuantity}
                            </td>
                            <td>
                                ${salesMenu.preMonthSales}
                            </td>
                            <td>
                                ${salesMenu.currentMonthSalesQuantity}
                            </td>
                            <td>
                                ${salesMenu.currentMonthSales}
                            </td>
                            <td>
                                ${salesMenu.changeRate}%
                            </td>
                            <td>
                                ${salesMenu.percentageOfSales}%
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
        const packageOrderCount=JSON.parse("${packageOrderCount}");

        // 주문한 메뉴별 개수
        const menuOrderCount=JSON.parse("${menuOrderCount}");

        // 월
        const month=JSON.parse('${month}');

        // 패키지 목록
        const packageNameList=JSON.parse('${packageNameList}');

        // 메뉴 목록
        const menuNameList=JSON.parse('${menuNameList}');

    </script>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script> 
    <script src="/resources/js/admin/dashboard/dashboard.js"></script>

</html>