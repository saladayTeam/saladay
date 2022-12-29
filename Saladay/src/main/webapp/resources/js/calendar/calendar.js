let list;
document.addEventListener('DOMContentLoaded', function() {
  
  $.ajax({
    url : "deliveryList", // 리스트를 받아올 경로
    type : "GET", // 요청 방식
    dataType : "JSON", // 응답 데이터 형식
    async : false,
    success : (result) => { // controller에서 받아온 데이터
      console.log(result);
      
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
              borderColor: "#17633d",
              extendedProps: {
                risk: '7'
              }
          });
        }

        if(li.deliveryCode==='A'&&li.packageNo===1) { // 패키지번호 1
            tempList.push({
              id: li.deliveryNo,
              title: li.orderNo +") "+ li.orderName,
              start: li.deliveryDate,
              end : li.deliveryDate,
              allDay: true,
              backgroundColor: "#f1828d",
              borderColor: "#f1828d",
              extendedProps: {
                risk: li.packageNo
              }
          });
        }

        if(li.deliveryCode==='A'&&li.packageNo===2) { // 패키지번호 2
            tempList.push({
              id: li.deliveryNo,
              title: li.orderNo +") "+ li.orderName,
              start: li.deliveryDate,
              end : li.deliveryDate,
              allDay: true,
              backgroundColor: "#848ccf",
              borderColor: "#848ccf",
              extendedProps: {
                risk: li.packageNo
              }
          });
        }

        if(li.deliveryCode==='A'&&li.packageNo===3) { // 패키지번호 3
            tempList.push({
              id: li.deliveryNo,
              title: li.orderNo +") "+ li.orderName,
              start: li.deliveryDate,
              end : li.deliveryDate,
              allDay: true,
              backgroundColor: "#252958",
              borderColor: "#252958",
              extendedProps: {
                risk: li.packageNo
              }
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
                backgroundColor: "#f9b42d",
                borderColor: "#f9b42d",
                extendedProps: {
                  risk: li.packageNo
                }
              });
            }else{
                tempList.push({
                  id: li.deliveryNo,
                  title: li.orderNo +"-2) "+ li.orderName,
                  start: li.deliveryDate,
                  end : li.deliveryDate,
                  allDay: true,
                  backgroundColor: "#f9b42d",
                  borderColor: "#f9b42d",
                  extendedProps: {
                    risk: li.packageNo
                  }
                });
              }
            }

        if(li.deliveryCode==='A'&&li.packageNo===5) { // 패키지번호 5
          if(li.rowNum==1){
            tempList.push({
              id: li.deliveryNo,
              title: li.orderNo +"-1) "+ li.orderName,
              start: li.deliveryDate,
              end : li.deliveryDate,
              allDay: true,
              backgroundColor: "#3498db",
              borderColor: "#3498db",
              extendedProps: {
                risk: li.packageNo
              }
            });
          }else{
              tempList.push({
                id: li.deliveryNo,
                title: li.orderNo +"-2) "+ li.orderName,
                start: li.deliveryDate,
                end : li.deliveryDate,
                allDay: true,
                backgroundColor: "#3498db",
                borderColor: "#3498db",
                extendedProps: {
                  risk: li.packageNo
                }
              });
            }
          }

        if(li.deliveryCode==='A'&&li.packageNo===6) { // 패키지번호 6
          if(li.rowNum==1){
            tempList.push({
              id: li.deliveryNo,
              title: li.orderNo +"-1) "+ li.orderName,
              start: li.deliveryDate,
              end : li.deliveryDate,
              allDay: true,
              backgroundColor: "#ff4c30",
              borderColor: "#ff4c30",
              extendedProps: {
                risk: li.packageNo
              }
            });
          }else{
              tempList.push({
                id: li.deliveryNo,
                title: li.orderNo +"-2) "+ li.orderName,
                start: li.deliveryDate,
                end : li.deliveryDate,
                allDay: true,
                backgroundColor: "#ff4c30",
                borderColor: "#ff4c30",
                extendedProps: {
                  risk: li.packageNo
                }
              });
            }
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
    eventDidMount : function(info){
      // console.log(info);
      // console.log(info.event.extendedProps);

      // if(info.event.extendedProps.risk != null){
        info.el.classList.add("no" + info.event.extendedProps.risk );
      // }
    }
  });


    
  calendar.render();
});



$(".inputGroup .filter").on("click", function(){

  if($(this).prop("checked")){
    $("." + $(this).attr("id")).show();
  }else{
    $("." + $(this).attr("id")).hide();
  }
});



// var inputGroup = false;
//   if( $('#calendar').find(".input-group").length == 1 ){
//     inputGroup = true;
//   }

// if ( events.risk == 6 ) {
//   element.addClass("no6");
//   if( ".inputGroup" && !$("#no6").is(":checked") ){
//     element.hide();
//   }
// }
// Click handler
// $("#calendar").on("click", "input[type='checkbox']", function(){
//   if($(this).is(":checked")){
//     $('#calendar').find("."+$(this).attr("id")).show();
//   }else{
//     $('#calendar').find("."+$(this).attr("id")).hide();
//   }
// });


// 안씀


// $('.filter').on('change', function () {
//   $('#calendar').fullCalendar('rerenderEvents');
// });


// function filtering(event) {
//   var show_packageNo = true;

//   var packageNo = $('input:checkbox.filter:checked').map(function () {
//     return $(this).val();
//   }).get();
//   var types = $('#type_filter').val();

//   show_packageNo = packageNo.indexOf(event.packageNo) >= 0;

//   // if (packageNo && packageNo.length > 0) {
//   //   if (packageNo[0] == "all") {
//   //     show_packageNo = true;
//   //   } else {
//   //     show_type = types.indexOf(event.type) >= 0;
//   //   }
//   // }

//   return show_packageNo;
// }





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

