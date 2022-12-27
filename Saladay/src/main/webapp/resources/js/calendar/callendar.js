var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth' //기본 캘린더 
   , selectable: true //날짜 드래그해서 지정가능
   , selectMirror: true
   , displayEventEnd: {//시작시간, 끝나는 시간 다 보이게 하기
        month: false
       , basicWeek: true
       , "default": true
    }
   , dayMaxEventRows: true //일정이 너무 많으면 more버튼으로 일정확인
   , views: {
      timeGrid: {
        dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
      }
    }
    , events: data, //이 부분이 json을 받아서 calendar에 뿌리는 공간

  });