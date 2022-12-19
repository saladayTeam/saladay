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
    
    
</head>

<body>

    <main>
        <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
        
        
        <div class="nutrition-header">
            <h1 class="main-title">영양성분 검색</h1>
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
    footer include
    
</body>
</html>