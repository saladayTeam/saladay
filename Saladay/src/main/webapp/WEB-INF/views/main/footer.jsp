<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <footer>
      <div class="footer-util">
        <ul>
          <li><a href="/member/TermsOfService">이용약관</a></li>
          <li><a href="/member/privacyPolicy">개인정보처리방침</a></li>
          <li><a href="관리자페이지">관리자</a></li>
          <li><a href="FAQ페이지">FAQ</a></li>
          <li><a href="채팅봇연결">1:1 문의</a></li>
        </ul>
      </div>
      <div class="footer-info">
        <span>서울시 중구 남대문로 120 대일빌딩 3층 |</span>
        <span>대표 : TEAM SALADAY(팀 샐러데이)</span>
        <p>KH 정보교육원 종로지원 TEAM SALADAY 파이널 프로젝트 </p>
      </div>
    </footer>

    <%-- session scope 내에 message속성이 존재하는 경우 alert(JS)기능을 이용해서 처리한 메세지 내용 출력 --%>
    <c:if test="${!empty message}">
        <script> 
            alert("${message}");
        </script> 
        <c:remove var="message" />
    </c:if>