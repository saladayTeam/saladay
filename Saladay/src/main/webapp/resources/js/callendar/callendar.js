// var calendar = new FullCalendar.Calendar(calendarEl, {
//     initialView: 'dayGridMonth' //기본 캘린더 
//    , selectable: true //날짜 드래그해서 지정가능
//    , selectMirror: true
//    , displayEventEnd: {//시작시간, 끝나는 시간 다 보이게 하기
//         month: false
//        , basicWeek: true
//        , "default": true
//     }
//    , dayMaxEventRows: true //일정이 너무 많으면 more버튼으로 일정확인
//    , views: {
//       timeGrid: {
//         dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
//       }
//     }
//     , //events: data, //이 부분이 json을 받아서 calendar에 뿌리는 공간
//     events: [{
//         title: '이미나', 
//          start: '2022-12-14'
//         , end: '2022-12-14' 
//         // , backgroundColor: "green"
//       },
//       {
//         title: '이고미', 
//          start: '2022-12-15'
//         , end: '2022-12-15' 
//         // , backgroundColor: "green"
//       }
//   ],

//   });

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
          events: 
          [{
        title: '이미나', 
        start: '2022-12-14',
        end: '2022-12-14' 
        , backgroundColor: "green"
      },
      {
        title: '이고미', 
        start: '2022-12-15',
        end: '2022-12-15',
        backgroundColor: "green",
        border: "solid 1px green"
      }]
      ,
      eventClick:function(info){
          window.location.href(info.event.url);
          }
        });
        calendar.render();
      });

var calendar = new Calendar(calendarEl, {
events: [
    { // this object will be "parsed" into an Event Object
    title: 'The Title', // a property!
    allDay: true // a property! ** see important note below about 'end' **
    }
]
})


// 리스트 가져오기
$.ajax({
  url : "admin/delivery", // 리스트를 받아올 경로
  data : {"groupNo": groupNo}, 
  type : "GET", // 요청 방식
  dataType : "JSON", // 응답 데이터 형식

  success : (planList) => { // controller에서 받아온 데이터
  for(let item of planList) {

      if(item.planAllday==='Y') { // 시간을 설정 안한경우
          calendar.addEvent({
              id: item.planNo,
              title: item.planTitle,
              start: item.planStart,
              end : item.planEnd,
              allDay: true,
              backgroundColor: item.planColor,
          });
      }

      if(item.planAllday==='F') { // 시간을 설정한 경우
          calendar.addEvent({
              id: item.planNo,
              title: item.planTitle,
              start: item.planStart,
              end : item.planEnd,
              allDay: false,
              backgroundColor: item.planColor,
          });
      }
  }
  }
})