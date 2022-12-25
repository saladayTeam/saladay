<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="/resources/css/main/header.css" />
    <link rel="stylesheet" href="/resources/css/intro/intro.css" />
    <link rel="stylesheet" href="/resources/css/main/footer.css" />

    <title>소개</title>
  </head>
  <body>

    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

    <main>
      <div class="intro-wrapper">
        <div class="intro-image-area">
          <img
            src="/resources/images/intro-image.png"
            alt=""
            id="intro-image"
          />
        </div>
        <div class="intro-pre">
          <pre>
            매일 바쁜 삶을 사는 현대인들에게 건강하고 신선한 음식을!
            일주일 내내 신선한 샐러드 원하는 날짜에 원하는 구성
            내가 만들어가는 나만의 건강한 일상
            건강함을 구독하세요
          </pre>
        </div>
      </div>
    </main>


    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    
  </body>
</html>