<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ작성</title>
    <link rel="stylesheet" href="/resources/css/FAQ/registFAQ.css">
	<script src="https://kit.fontawesome.com/72842759a7.js" crossorigin="anonymous"></script>
</head>

<body>
    <form action="/FAQ/reg" method="post">
    <div class="regist-popup">
        <h2 id="HeaderTitle">FAQ작성</h2>
        
        <div class="wrapper">
            <div class="regist-h">
                <div><label for="faqTitle"> 제목 </label></div>
                <input type="text" name="faqTitle" id="faqTitle" autocompleate="off" placeholder="제목을 입력해 주세요." >
            </div>
            
            <div class="regist-c">
                <div><label for="faqContent"> 내용 </label></div>
                <textarea name="faqContent" id="faqContent" placeholder="내용을 입력하세요."></textarea>
            </div>
        </div>


        <div class="b-area">
            <button id="registBtn"><strong>등록</strong></button>
            <button type="button" id="closeBtn"><strong>취소</strong></button>
        </div> 
    </div>
    </form>
</body>
</html>