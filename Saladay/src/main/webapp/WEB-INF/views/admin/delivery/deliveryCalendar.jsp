<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <script src='/resources/js/calendar/fullcalendar-6.0.1/dist/index.global.js'></script>
 
    <link rel="stylesheet" href="../../resources/css/admin/calendar/calendar.css">
    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
    <title>배송일정</title>

  </head>
  <body>
    <%-- 헤더 --%>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    <%-- 헤더 --%>
    <main>

    <%-- 모달 --%>
    <jsp:include page="/WEB-INF/views/admin/delivery/selectDeliveryCalendar.jsp"></jsp:include>
    <%-- 모달 --%>
          <div class="col-lg-6">
            <div class="inputGroup">
              <div class="checkbox" id="f1828d">
                  <label class="checkbox-inline">3팩</label>
                    <input class='filter' type="checkbox" id="no1" value="1" checked>
              </div>
              <div class="checkbox" id="a848ccf">
                  <label class="checkbox-inline">5팩</label>
                    <input class='filter' type="checkbox" id="no2" value="2"checked>
              </div>
              <div class="checkbox" id="a252958">
                  <label class="checkbox-inline">7팩</label>
                    <input class='filter' type="checkbox" id="no3" value="3" checked>
              </div>
              <div class="checkbox" id="f9b42d">
                  <label class="checkbox-inline">3팩2주</label>
                    <input class='filter' type="checkbox" id="no4" value="4" checked>
              </div>
              <div class="checkbox" id="a3498db">
                  <label class="checkbox-inline">5팩2주</label>
                    <input class='filter' type="checkbox" id="no5" value="5" checked>
              </div>
              <div class="checkbox" id="ff4c30">
                  <label class="checkbox-inline">7팩2주</label>
                    <input class='filter' type="checkbox" id="no6" value="6" checked>
              </div>
              <div class="checkbox" id="a17633d">
                  <label class="checkbox-inline">배송완료</label>
                    <input class='filter' type="checkbox" id="no7" value="D" checked>
              </div>
            </div>
          </div>
          </div>
            <%-- 캘린더 --%>
            <div id='calendar'></div>
          </div>
    </main>

    <%-- 푸터 --%>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <%-- 푸터 --%>

    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="/resources/js/calendar/calendar.js"></script>
  </body>
</html>