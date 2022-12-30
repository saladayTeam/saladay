<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
    
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/FAQ/FAQ.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    
	<script src="https://kit.fontawesome.com/72842759a7.js" crossorigin="anonymous"></script>
</head>

<body>

    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    
    <main>
        
        <div class="faq-header">
            <h1 class="main-title">자주 하는 질문 FAQ</h1>
            <c:if test="${loginMember.authority eq 99}">
            <div class="faq-btn-area">
                <button type="button" id="addBtn">FAQ 작성</button>
            </div>
            </c:if>
        </div>


        <div class="faq-content">
            <ul class="faq">
                <c:forEach var="faq" items="${faqList}"  varStatus="status">
                <li> 
                    <input type="checkbox" id="qna-${status.index+1}">
                    <label for="qna-${status.index+1}" class="question"><i class="fa-solid fa-q">&nbsp;</i>${faq.faqTitle}</label>
                    <c:choose>
                        <c:when test="${loginMember.authority eq 99}"> 
                            <span onclick="deleteFAQ(${faq.faqNo})" class="delBtn"><i class="fa-solid fa-trash-can"></i></span>
                        </c:when>
                        <c:otherwise>
                            <span></span>
                        </c:otherwise>
                    </c:choose>
                    <div class="answer">
                        <i class="fa-solid fa-a">&nbsp;</i>
                        <span>${faq.faqContent}</span>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script src="/resources/js/FAQ/FAQ.js"></script>
</body>
</html>