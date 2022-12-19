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
            <ul class="menu-box">
                <li class="option-name"><a href="" onclick="return false;">Salad</a></li>
                <li class="option-name"><a href="" onclick="return false;">Main Topping</a></li>
                <li class="option-name"><a href="" onclick="return false;">Source</a></li>
            </ul>
        </div>
        
        <div class="menu-detail">
            <c:forEach items="${menuList}" var="menu">
            <ul class="menu-list">
                <div class="jb-a">
                    <li class="menu-img"><img src="${menu.menuImage}" alt=""></li>
                    <li class="menu-title"><h1>${menu.menuName}</h1></li>
                </div>
                <div class="jb-b">
                    <li class="menu-content">${menu.menuContent}</li>
                </div>
            </ul>
            </c:forEach>
        </div>

    </section>
    
    <%-- 푸터 --%>
	<%-- <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include> --%>
</body>
</html>