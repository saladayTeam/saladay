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
    <div id="modalBox">
      <span id="closeModal" class="closeModal">&times;</span>
      <jsp:include page="/WEB-INF/views/admin/delivery/selectDeliveryCalendar.jsp"></jsp:include>
    </div>
    <%-- 모달 --%>
          <div class="col-lg-6">
            <div class="inputGroup">
              <label class="checkbox f1828d"  checkbox>3팩
                <input class='filter' type="checkbox" id="no1" value="1" checked>
              </label>
                    
              <label class="checkbox a848ccf" checkbox>5팩
                <input class='filter' type="checkbox" id="no2" value="2" checked>
              </label>
                    
              <label class="checkbox a252958" checkbox>7팩
                <input class='filter' type="checkbox" id="no3" value="3" checked>
              </label>
                    
              <label class="checkbox f9b42d" checkbox>3팩2주
                <input class='filter' type="checkbox" id="no4" value="4" checked>
              </label>
                    
              <label class="checkbox a3498db" checkbox>5팩2주
                <input class='filter' type="checkbox" id="no5" value="5" checked>
              </label>
                    
              <label class="checkbox ff4c30" checkbox>7팩2주
                <input class='filter' type="checkbox" id="no6" value="6" checked>
              </label>

              <label class="checkbox a17633d" checkbox>배송완료
                <input class='filter' type="checkbox" id="no7" value="7" checked>
              </label>
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