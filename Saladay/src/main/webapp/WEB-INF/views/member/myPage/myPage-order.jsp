<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역</title>

    <link rel="stylesheet" href="/resources/css/member/myPage/myPage-info.css">
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    
</head>

<body>
    
    <main>
        <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

        
        <div class="my-page-content">
			<jsp:include page="/WEB-INF/views/member/myPage/myPage-list.jsp"></jsp:include>
			
            <div class="right-side">

                    <div class="my-page-header">
                        <h1 class="main-title">주문 내역</h1>
                    </div>

                    <div class="my-secession-detail">
                
                        <div class="my-secession-package">
                            <c:if test="${packageList == null}">
                                <p>
                                ${loginMember.memberName} 님의 현재 구독 정보 입니다.<br>
                                현재 구독중인 상품이 없습니다.
                                </p>
                            </c:if>

                            <c:if test="${packageList != null}">
                                <p>
                                ${loginMember.memberName} 님의 현재 구독 정보 입니다.<br>
                                <c:forEach var="packageList" items="${packageList}">
                                ${packageList.packageName}<br>
                                </c:forEach>
                                </p>
                            </c:if>
                        </div>
                        
                    </div>

                  

            </div>
        </div>


    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    
</body>
</html>