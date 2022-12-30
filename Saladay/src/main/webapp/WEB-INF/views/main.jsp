<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/resources/css/main/main.css">
  <link rel="stylesheet" href="/resources/css/main/swiper.min.css" />
  
  <!-- fontawesome 아이콘 -->
  <script src="https://kit.fontawesome.com/2aa49fc46f.js" crossorigin="anonymous"></script>

  <title>Saladay</title>
</head>
<body>
  <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

    <div class="swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="/resources/images/main/mainImage1.png" alt="메인 이미지" />
        </div>
        <div class="swiper-slide">
          <img src="/resources/images/main/mainImage2.png" alt="메인 이미지" />
        </div>
        <div class="swiper-slide">
          <img
            src="/resources/images/main/TastesBetter.jpg" alt="메인 이미지" />
        </div>
        <div class="swiper-slide">
          <img src="/resources/images/main/EatBetter.jpg" alt="메인 이미지" />
        </div>
        <%-- <div class="swiper-slide">
          <img src="/resources/images/main-image4.png" alt="메인 이미지" />
        </div>
        <div class="swiper-slide">
          <img src="/resources/images/main-image5.png" alt="메인 이미지" />
        </div> --%>
      </div>
    </div>

    <div class="menu-intro">
      <span>saladay's menu</span>
    </div>

    <div class="slide_wrapper ">
      <ul class="slides flex">
        <c:forEach var="menu" items="${menuList}">
          <li><img src="${menu.menuImage}" alt="메뉴이미지" height="250px"></li>
        </c:forEach>
      </ul>
      <p class="controls">
        <span class="prev"><i class="fas fa-chevron-left"></i></span>
        <span class="next"><i class="fas fa-chevron-right"></i></span>
      </p>
    </div>

    <div class="ha"></div>

    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script src="/resources/js/main/main.js"></script>
    <script src="/resources/js/main/swiper.min.js"></script>

</body>
</html>