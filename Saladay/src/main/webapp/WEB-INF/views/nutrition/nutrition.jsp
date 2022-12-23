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
            <h1 class="main-title">영양성분 검색</h1>
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
            <div>설명</div>
            
            <div class="big-box">
                <div class="select-box">
                    <div>
                        <label for="menu">메뉴</label>
                        <select>
                            <option value="">메뉴</option>
                            <c:forEach var="menu" items="${menuList}">
                                <option value="${menu.menuName}">${menu.menuName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div>
                        <label for="menu">메인토핑</label>
                        <select>
                            <option value="">메인토핑</option>
                            <c:forEach var="main" items="${mainTopping}">
                                <option value="${main.optionName}">${main.optionName}</option>
                            </c:forEach>
                        </select>
                    </div>
            
                    <div>
                        <label for="menu">서브토핑</label>
                        <select>
                            <option value="">서브토핑</option>
                            <c:forEach var="sub" items="${subTopping}">
                                <option value="${sub.optionName}">${sub.optionName}</option>
                            </c:forEach>
                        </select>
                    </div>
            
                    <div>
                        <label for="menu">소스</label>
                        <select>
                            <option value="">소스</option>
                            <c:forEach var="source" items="${sourceList}">
                                <option value="${source.optionName}">${source.optionName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div>
                    칼로리
                </div>
            </div>
        </div>

        <div class="search-input-area">
            <div class="search-input-form">
                <form action="#<!-- 검색어 제출페이지 -->" method="post" name="search-frm" id="search-frm">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" name="search" id="input-search" placeholder="원하시는 재료의 영양성분을 검색하세요" 
                    maxlength="20" autocomplete="off" required>
                </form>
            </div>
            <button type="button">검색</button>
        </div>

        <div class="nutrition-content">
           
            
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
</body>
</html>