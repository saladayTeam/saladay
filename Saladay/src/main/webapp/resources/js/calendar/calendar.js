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

let list;
document.addEventListener('DOMContentLoaded', function() {
  
  $.ajax({
    url : "deliveryList", // 리스트를 받아올 경로
    type : "GET", // 요청 방식
    dataType : "JSON", // 응답 데이터 형식
    async : false,
    success : (result) => { // controller에서 받아온 데이터
      // console.log(result);
      
      const tempList = [];

      for(let li of result) {

        if(li.deliveryCode==='D') { // 배송완료인 경우
          tempList.push({
              id: li.deliveryNo,
              title: li.orderNo +") "+ li.orderName,
              start: li.deliveryDate,
              end : li.deliveryDate,
              allDay: true,
              // backgroundColor: "#C21010",
              // borderColor: "#C21010"
              backgroundColor: "#17633d",
              borderColor: "#17633d"
          });
        }

        if(li.deliveryCode==='A'&&li.packageNo===1) { // 패키지번호 1
            tempList.push({
              id: li.deliveryNo,
              title: li.orderNo +") "+ li.orderName,
              start: li.deliveryDate,
              end : li.deliveryDate,
              allDay: true,
              backgroundColor: "red",
              borderColor: "red"
          });
        }

        if(li.deliveryCode==='A'&&li.packageNo===2) { // 패키지번호 2
            tempList.push({
              id: li.deliveryNo,
              title: li.orderNo +") "+ li.orderName,
              start: li.deliveryDate,
              end : li.deliveryDate,
              allDay: true,
              backgroundColor: "orange",
              borderColor: "orange"
          });
        }

        if(li.deliveryCode==='A'&&li.packageNo===3) { // 패키지번호 3
            tempList.push({
              id: li.deliveryNo,
              title: li.orderNo +") "+ li.orderName,
              start: li.deliveryDate,
              end : li.deliveryDate,
              allDay: true,
              backgroundColor: "yellow",
              borderColor: "yellow"
          });
        }

        if(li.deliveryCode==='A'&&li.packageNo===4) { // 패키지번호 4
          if(li.rowNum==1){
              tempList.push({
                id: li.deliveryNo,
                title: li.orderNo +"-1) "+ li.orderName,
                start: li.deliveryDate,
                end : li.deliveryDate,
                allDay: true,
                backgroundColor: "green",
                borderColor: "green"
              });
            }else{
                tempList.push({
                  id: li.deliveryNo,
                  title: li.orderNo +"-2) "+ li.orderName,
                  start: li.deliveryDate,
                  end : li.deliveryDate,
                  allDay: true,
                  backgroundColor: "green",
                  borderColor: "green"
                });
              }
            }

        if(li.deliveryCode==='A'&&li.packageNo===5) { // 패키지번호 5
          // if(li.orderNo===li.orderNo){
          //   if(li.deliveryNo>li.deliveryNo){
          //     tempList.push({
          //       id: li.deliveryNo,
          //       title: li.orderNo +"-1) "+ li.orderName,
          //       start: li.deliveryDate,
          //       end : li.deliveryDate,
          //       allDay: true,
          //       backgroundColor: "blue",
          //       borderColor: "blue"
          //     });
          //   }else{
          //     tempList.push({
          //       id: li.deliveryNo,
          //       title: li.orderNo +"-2) "+ li.orderName,
          //       start: li.deliveryDate,
          //       end : li.deliveryDate,
          //       allDay: true,
          //       backgroundColor: "blue",
          //       borderColor: "blue"
          //     });
          //   }
          // }
        }

        if(li.deliveryCode==='A'&&li.packageNo===6) { // 패키지번호 6
          // if(li.orderNo[0]){
          //   tempList.push({
          //     id: li.deliveryNo,
          //     title: li.orderNo +"-1) "+ li.orderName,
          //     start: li.deliveryDate,
          //     end : li.deliveryDate,
          //     allDay: true,
          //     backgroundColor: "purple",
          //     borderColor: "purple"
          //   });
          // }else{
          //   tempList.push({
          //     id: li.deliveryNo,
          //     title: li.orderNo +"-2) "+ li.orderName,
          //     start: li.deliveryDate,
          //     end : li.deliveryDate,
          //     allDay: true,
          //     backgroundColor: "purple",
          //     borderColor: "purple"
          //   });
          // }
        }
     }

     list = tempList;

    }
  })

  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    locale: "ko",
    // navLinks: true,
    editable: true,
    headerToolbar : {
    start: "",
      center: "prev title next",
      end: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
    dayMaxEvents: true,
    events: list,
    // eventClick:function(info){
    //   window.location.href(info.event.url);
    //   }
    eventClick: function(info) {
      li.deliveryNo = info.event.id;
      selectOne(li.deliveryNo);

    },
  });
    
  calendar.render();
});




// 리스트 가져오기
// $.ajax({
//   url : "admin/delivery", // 리스트를 받아올 경로
//   type : "GET", // 요청 방식
//   dataType : "JSON", // 응답 데이터 형식
//   success : (list) => { // controller에서 받아온 데이터
//   for(let li of list) {

//       if(li.deliveryCode==='D') { // 배송완료인 경우
//           calendar.addEvent({
//               list: li.orderNo,
//               title: li.userName,
//               start: li.deliveryDate,
//               end : li.deliveryDate,
//               allDay: true,
//               // backgroundColor: item.planColor,
//           });
//       }

//       if(li.deliveryCode==='A') { // 결제완료인 경우
//           calendar.addEvent({
//               id: li.orderNo,
//               title: li.userName,
//               start: li.deliveryDate,
//               end : li.deliveryDate,
//               allDay: true,
//               // backgroundColor: item.planColor,
//           });
//       }

      
//   }
//   }
// })