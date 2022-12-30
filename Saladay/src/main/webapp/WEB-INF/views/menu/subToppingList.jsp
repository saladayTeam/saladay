<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saladay Menu</title>
    
	<link rel="stylesheet" href="/resources/css/menu/menuList.css">
</head>
<body>
    <!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

    <section class="menu-section">
        <div class="menu">
            <div class="option-name"> 
                <a href="/menu/menuList"> Salad</a>
            </div>

            <div class="option-name"> 
                <a href="/menu/mainTopping">Main Topping</a>
            </div>

            <div class="option-name"> 
                <a href="/menu/subTopping">Sub Topping</a>
            </div>

            <div class="option-name"> 
                <a href="/menu/sourceList">Source</a> 
            </div>
        </div>
        
        <div class="pd-list-wrapper">
            <div class="menu-detail">
                <c:forEach items="${optionList}" var="sOption">
                <c:if test="${sOption.optionType eq 'T'}">
                    <div class="menu-wrapper">
                        <div class="menu-list">
                            <li class="menu-img"><img src="${sOption.optionImage}" alt=""></li>
                            <li class="menu-title"><span>${sOption.optionName}</span></li>
                        </div>
                        <div class="summary">
                            <li class="menu-title"><span>${sOption.optionName}</span></li> <br>
                            <li class="menu-title"><span>${sOption.optionCalorie} Kcal</span></li> <br>
                        </div>
                    </div>
                </c:if>
                </c:forEach>
            </div>
        </div>
    </section>
    
    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
    <script src="/resources/js/menu/menuList.js"></script>
</body>
</html>