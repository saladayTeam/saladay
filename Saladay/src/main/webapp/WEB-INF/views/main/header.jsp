<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <header>
    <section></section>
    <section>
      <a href="/">
        <img src="/resources/images/saladay-logo.png" alt="로고 이미지" width="135px" height="84px">
      </a>
    </section>
    <section>
      <ul class="header-menu">
        <li><a href="장바구니페이지"
              ><img
                src="/resources/images/main/shopping-cart.png"
                alt=""
                width="25px"
                height="25px"
            /></a></li>
        <c:choose>
          <%-- 로그인 상태라면 --%>
          <c:when test="${not empty loginMember}">
            <li><a href="/member/logout">로그아웃</a></li>
            <li><a href="/member/info">마이페이지</a></li>
          </c:when>
          <%-- 로그인 상태가 아니라면 --%>
          <c:otherwise>
            <li><a href="/member/login">로그인</a></li>
            <li><a href="/member/signUp">회원가입</a></li>
          </c:otherwise>
        </c:choose>  
      </ul>
    </section>

  </header>
  <nav>
    <ul>
      <li><a href="/intro">소개</a></li>
      <li><a href="/menu/menuList">메뉴</a></li>
      <li><a href="/menu/selectMenu">정기구독</a></li>
      <li><a href="/nutrition">영양정보</a></li>
      <li><a href="">리뷰</a></li>
      <li><a href="/FAQ">FAQ</a></li>
    </ul>
  </nav>
