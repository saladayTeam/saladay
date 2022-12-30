<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <footer>
      <div class="footer-util">
        <ul>
          <li><a href="/member/TermsOfService">이용약관</a></li>
          <li><a href="/member/privacyPolicy">개인정보처리방침</a></li>
          <li><a href="채팅봇연결">1:1 문의</a></li>
        </ul>
      </div>
      <div class="footer-info">
        <span>서울시 중구 남대문로 120 대일빌딩 3층 |</span>
        <span>대표 : TEAM SALADAY(팀 샐러데이) |</span>
        <span>제휴업체 : 팜팜(FarmFarm)</span>
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

    <!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "1aee3e26-c62c-45fb-a8c0-756b3bcfb327" //please fill with your plugin key
  });
  </script>
  <!-- End Channel Plugin -->