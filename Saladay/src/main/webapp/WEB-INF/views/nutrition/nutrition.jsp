<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>nutrition</title>
    <link rel="stylesheet" href="/resources/css/nutrition/nutrition.css">
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    
    
</head>

<body>

    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    
    <main>
        
        
        <div class="nutrition-header">
            <h1 class="main-title">칼로리 계산하기</h1>
        </div>

        <!-- <label for="menu">메뉴</label>
        <select>
            <option value="">메뉴</option>
            <c:forEach var="menu" items="${menuList}">
                <option value="${menu.menuName}">${menu.menuName}</option>
            </c:forEach>
        </select>
        
        <label for="menu">메인토핑</label>
        <select>
            <option value="">메인토핑</option>
            <c:forEach var="main" items="${mainTopping}">
                <option value="${main.optionName}">${main.optionName}</option>
            </c:forEach>
        </select>

        <label for="menu">서브토핑</label>
        <select>
            <option value="">서브토핑</option>
            <c:forEach var="sub" items="${subTopping}">
                <option value="${sub.optionName}">${sub.optionName}</option>
            </c:forEach>
        </select>

        <label for="menu">소스</label>
        <select>
            <option value="">소스</option>
            <c:forEach var="source" items="${sourceList}">
                <option value="${source.optionName}">${source.optionName}</option>
            </c:forEach>
        </select> -->

        <div class="main-box">
            <!-- <div>설명</div> -->
            
            <div class="big-box">
                <div class="select-box">
                    <div>
                        <label for="menu">메뉴</label>
                        <select class="select">
                            <option value=""  hidden>메뉴</option>
                            <c:forEach var="menu" items="${menuList}">
                                <option value="${menu.menuCalorie}">${menu.menuName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div>
                        <label for="menu">메인토핑</label>
                        <select class="select">
                            <option value=""  hidden>메인토핑</option>
                            <c:forEach var="main" items="${optionList}">
                            <c:if test="${main.optionType eq 'M'}">
                                <option value="${main.optionCalorie}">${main.optionName}</option>
                            </c:if>
                            </c:forEach>
                        </select>
                    </div>
            
                    <div>
                        <label for="menu">서브토핑</label>
                        <select class="select">
                            <option value=""  hidden>서브토핑</option>
                            <c:forEach var="sub" items="${optionList}">
                            <c:if test="${sub.optionType eq 'T'}" >
                            <%-- 이름만 보여주고 칼로리는 밸류에 넣어둠 --%>
                                <option value="${sub.optionCalorie}">${sub.optionName}</option>
                            </c:if>
                            </c:forEach>
                        </select>
                    </div>
            
                    <div>
                        <label for="menu">소스</label>
                        <select class="select">
                            <option value=""  hidden>소스</option>
                            <c:forEach var="source" items="${optionList}">
                            <c:if test="${source.optionType eq 'S'}" >
                                <option value="${source.optionCalorie}">${source.optionName}</option>
                            </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="calorie">
                    <div class="option-box">
                    <div class="empty">

                        <div class="empty-text">선택된 메뉴, 토핑, 소스가 없습니다.</div>
                    
                        <%-- <div class="select-container">
                            <div class="menu-name">토마토</div>
                            <div class="menu-calorie">(71.5 Kcal)</div>
                            <div class="delete-btn"><img src="/resources/images/icon/쓰레기.png"></div>
                        </div> --%>

                    </div>
                    </div>
                    <div class="total">
                    Total
                    <strong class="strong" id="totalCal">
                    0
                    </strong>
                    <strong class="strong">kcal</strong>
                    </div>
                </div>
            </div>
        </div>



    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
    <script src="/resources/js/nutrition/nutrition.js"></script>
</body>
</html>