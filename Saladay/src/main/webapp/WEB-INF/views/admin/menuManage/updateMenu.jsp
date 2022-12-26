<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자- 메뉴 추가</title>

    <%-- 폰트어썸 --%>
    <script src="https://kit.fontawesome.com/2aa49fc46f.js"crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <link rel="stylesheet" href="/resources/css/admin/menuManage/updateMenu.css">

  </head>

<body>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    
    <section class="menu-wrapper">
    
      <div class="menu-m-tit">
        <span><h1>메뉴관리</h1></span>
      </div>

      <div>
        <p class="m-h-row">
          <span class="chek"><input type="checkbox"></span>
          <%-- <span>메뉴사진</span> --%>
          <span>메뉴이름</span>
          <span>메뉴설명</span>
          <span>가격</span>
          <span>칼로리</span>
        </p>

        <p class="m-h-row">
          <span class="chek"><input type="checkbox"></span>
          <span><img src="/resources/images/menu/salad/로스트치킨.png" width="50px" height="50px" alt=""></span>
          <span>메뉴이름</span>
          <span>메뉴설명</span>
          <span>가격</span>
          <span>칼로리</span>
        </p>
      </div>

      

    <div class="m-btn-area">
      <button type="button">추가</button>
      <button type="button">삭제</button>
    </div>
    </section>  
    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>

