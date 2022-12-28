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
    <%-- <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          locale: "ko",
          // navLinks: true,
          editable: true,
          // default: {
          //   start   : 'today, prevYear, nextYear, viewWeekends',
          //   center : 'prev, title, next',
          //   end  : 'month, agendaWeek, agendaDay, listWeek'
          // },
          headerToolbar : {
        	start: "",
            center: "prev title next",
            end: 'dayGridMonth,dayGridWeek,dayGridDay'
            },
      //     events: [{
      //   title: '이미나', 
      //   start: '2022-12-14',
      //   end: '2022-12-14' 
      //   , backgroundColor: "green"
      // },
      // {
      //   title: '이고미', 
      //   start: '2022-12-15',
      //   end: '2022-12-15',
      //   backgroundColor: "green",
      //   border: "solid 1px green"
      // }]
      // ,
      eventClick:function(info){
          window.location.href(info.event.url);
          }
        });
        calendar.render();
      });
      
    </script> --%>


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
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="/resources/js/calendar/calendar.js"></script>
  </body>
</html>