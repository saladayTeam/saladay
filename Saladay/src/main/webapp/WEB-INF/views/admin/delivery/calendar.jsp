<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <%-- <link href='../../resources/css/calendar/main.css' rel='stylesheet' />
    <script src='../../resources/js/calendar/main.js'></script> --%>
    <script src='/resources/js/calendar/fullcalendar-6.0.1/dist/index.global.js'></script>
 
    <link rel="stylesheet" href="../../resources/css/admin/calendar/calendar.css">
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>


    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>

    <main>

      <%-- <div class="admin-page-content">
        <jsp:include page="/WEB-INF/views/admin/sidemenu.jsp"></jsp:include>
          <div class="right-side"> --%>

            <div id='calendar'></div>

          <%-- </div>
      </div> --%>

    </main>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script src="/resources/js/callendar/callendar.js"></script>
  </body>
</html>