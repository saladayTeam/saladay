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
          <img src="/resources/images/main/EatBetter.jpg" alt="메인 이미지" />
        </div>
        <div class="swiper-slide">
          <img
            src="/resources/images/main/TastesBetter.jpg"
            alt="메인 이미지"
          />
        </div>
        <%-- <div class="swiper-slide">
          <img src="/resources/images/main-image3.png" alt="메인 이미지" />
        </div>
        <div class="swiper-slide">
          <img src="/resources/images/main-image4.png" alt="메인 이미지" />
        </div>
        <div class="swiper-slide">
          <img src="/resources/images/main-image5.png" alt="메인 이미지" />
        </div> --%>
      </div>
    </div>


    <script src="/resources/js/main/main.js"></script>
    <script src="/resources/js/main/swiper.min.js"></script>
</body>
</html>