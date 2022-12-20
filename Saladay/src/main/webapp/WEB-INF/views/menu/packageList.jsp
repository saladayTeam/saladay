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
	<link rel="stylesheet" href="/resources/css/menu/packageList.css">

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
        <div id="main-title">
            <div id="main-content">
                ENJOY
                <em>SALADAY</em>
                FOR 1WEEK
            </div>
            <div id="main-detail">샐러데이의 신선함을 집에서도 경험할 수 있습니다.</div>
        </div>
        <ul class="package-ol">
            <a href="#">
                <li class="package-list" id="firstList">
                    <div class="package-box">
                        <div id="package-img">
                        </div>
                        <div class="package-name">
                            <div class="package-title">
                                1 WEEk &nbsp; 3 SALADAY
                            </div>
                            <div class="package-detail">
                                어쩌구저쩌구
                                <br>
                                짱나
                            </div>
                        </div>
                    </div>
                </li>
            </a>
            <a href="">
                <li class="package-list" id="second-list">
                    <div class="package-box" id="second-box">
                        <div class="package-name" id="second-name">
                            <div class="package-title">
                                1 WEEk &nbsp; 3 SALADAY
                            </div>
                            <div class="package-detail">
                                어쩌구저쩌구
                                <br>
                                짱나
                            </div>
                        </div>
                        <div id="second-img">
                        </div>
                    </div>
                </li>
            </a>
            <a href="">
                <li class="package-list">
                    <div class="package-box">
                        <div id="package-img">
                        </div>
                        <div class="package-name">
                            <div class="package-title">
                                1 WEEk &nbsp; 3 SALADAY
                            </div>
                            <div class="package-detail">
                                어쩌구저쩌구
                                <br>
                                짱나
                            </div>
                        </div>
                    </div>
                </li>
            </a>
        </ul>
    </main>
		
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>