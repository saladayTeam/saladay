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
            <div class="option-name" id="type1"> 
                <a href="/menu/menuList" id="a1"> Salad</a>
            </div>
            <div class="option-name" id="type2"> 
                <a href="/menu/mainTopping" id="a2">Main Topping</a>
            </div>
            <div class="option-name" id="type3"> 
                <a href="/menu/subTopping" id="a3">Sub Topping</a>
            </div>
            <div class="option-name" id="type4"> 
                <a href="/menu/sourceList" id="a4">Source</a> 
            </div>
        </div>
        
        <div class="pd-list-wrapper">
            <div class="menu-detail">
                <c:forEach items="${menuList}" var="menu">
                    <div class="menu-wrapper">
                        <div class="menu-list">
                            <li class="menu-img"><img src="${menu.menuImage}" alt=""></li>
                            <li class="menu-title"><span>${menu.menuName}</span></li>
                        </div>
                        <div class="summary">
                            <li class="menu-title"><span>${menu.menuName}</span></li> <br>
                            <li class="menu-content">${menu.menuContent}</li> <br>
                            <li class="menu-content">${menu.menuCalorie} Kcal</li> <br>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    <!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
    <script src="/resources/js/menu/menuList.js"></script>
</body>
</html>