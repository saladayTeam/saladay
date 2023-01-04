<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>packageList</title>
    
	<link rel="stylesheet" href="/resources/css/main/main.css">
	<link rel="stylesheet" href="/resources/css/menu/packageList2.css">

    <style>
        @font-face {
            font-family: 'NanumSquareNeo-Variable';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
    </style>

</head>
<body>

    <!-- header -->
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>


    <main>
        <div class="package">
            <div id="one-week">
            <a href="/menu/packageList">1 WEEK</a>
            </div>
            <div id="two-week">
            <a href="#">2 WEEK</a>
            </div>
        </div>
        <div id="main-title">
            <div id="main-content">
                ENJOY
                <em>SALADAY</em>
                FOR 2WEEK
            </div>
            <div id="main-detail">샐러데이의 신선함을 집에서도 경험할 수 있습니다.</div>
            <div class="package-type">* 2주차는 1주차와 동일한 구성입니다.</div>

        </div>
        <ul class="package-ol">
            <a href="/selectMenu/${packageList[3].packageNo}">
                <li class="package-list" id="second-list">
                    <div class="package-box" id="second-box">
                        <div class="package-name" id="second-name">
                            <div class="package-title">
                                2 WEEK &nbsp; 3 SALADAY
                            </div>
                            <div class="package-detail">
                                <%-- 어쩌구저쩌구
                                <br>
                                짱나 --%>
                            </div>
                        </div>
                        <div id="second-img">
                        <img src="/resources/images/package/2week3days.png" alt="">
                        </div>
                    </div>
                </li>
            </a>
            
            <a href="/selectMenu/${packageList[4].packageNo}">
                <li class="package-list" id="firstList">
                    <div class="package-box">
                        <div id="package-img">
                        <img src="/resources/images/package/2week5days.png" alt="">
                        </div>
                        <div class="package-name">
                            <div class="package-title">
                                2 WEEK &nbsp; 5 SALADAY
                            </div>
                            <div class="package-detail">
                                <%-- 어쩌구저쩌구
                                <br>
                                짱나 --%>
                            </div>
                        </div>
                    </div>
                </li>
            </a>
            <a href="/selectMenu/${packageList[5].packageNo}">
                <li class="package-list" id="second-list">
                    <div class="package-box" id="second-box">
                        <div class="package-name" id="second-name">
                            <div class="package-title">
                                2 WEEK &nbsp; 7 SALADAY
                            </div>
                            <div class="package-detail">
                                <%-- 어쩌구저쩌구
                                <br>
                                짱나 --%>
                            </div>
                        </div>
                        <div id="second-img">
                        <img src="/resources/images/package/2week7days.png" alt="">
                        </div>
                    </div>
                </li>
            </a>
        </ul>
        <div id="footer"></div>
    </main>
		
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>