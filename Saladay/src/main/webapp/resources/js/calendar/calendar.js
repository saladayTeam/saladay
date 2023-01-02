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
    // editable: true,
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
      deliveryNo = info.event.id;
      selectOne(deliveryNo);
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

/* 일정 조회(selectOne) */

// 일정 조회 함수
function selectOne(thisId){
    let deliveryNo = thisId;

    $.ajax({
        url : "/admin/delivery/selectDeliveryCalendar",
        data : {"deliveryNo":deliveryNo},
        type : "POST",
        dataType : "JSON",

        success : (list) => {
          deliveryNo = list.deliveryNo;

            // 시작 날짜
            const deliveryNo = document.getElementById('deliveryNo');
            deliveryNo.innerText = list.deliveryNo;

            // 요일
            const orderNo = document.getElementById('orderNo');
            orderNo.innerText = plan.planStartDate;

            // 2. 제목 상자
            const titleBox = document.getElementById('titleBox');
            titleBox.innerText = plan.planTitle;

            // 3. 기간 상자
            const periodBox = document.getElementById('periodBox');

            // 기간 변수 조립하기
            let period = "";

            // 시작 연도
            const startYear = plan.planStart.substring(0, 4) + '년';

            // 시작 월
            const startMonth = plan.planStart.substring(5, 7) + '월';
            
            // 시작 일
            // startDay 사용함

            // 기간에 시작 날짜까지 추가
            period = startYear + " " + startMonth + " " + startDay + "일";

            // 시작 시간
            let startMeridiem = "";
            let startHour = "";
            let startMinute = "";

            if(plan.planStart.length > 10) {
                
                startHour = plan.planStart.substring(11, 13);

                if(startHour >= 12) {
                    startMeridiem = "오후";
                    startHour -= 12;
                    if(startHour < 10) {
                        startHour = '0' + startHour;
                    }
                } else {
                    startMeridiem = "오전";
                }
                
                // 시작 분
                startMinute = plan.planStart.substring(14, 16);

                period += " " + startMeridiem + " " + startHour + ":" + startMinute;

            }

            if(!(plan.planStart === plan.planEnd)) {

                // 종료 연도
                const endYear = plan.planEnd.substring(0, 4) + '년';

                // 종료 월
                const endMonth = plan.planEnd.substring(5, 7) + '월';

                // 종료 일
                const endDay = plan.planEnd.substring(8, 10) + '일';

                // 종료 시간
                let endMeridiem = "";
                let endHour = "";
                let endMinute = "";

                period += " - " + endYear + " " + endMonth + " " + endDay + " ";

                if(plan.planEnd.length > 10) {

                    endHour = plan.planEnd.substring(11, 13);

                    if(endHour >= 12) {
                        endMeridiem = "오후";
                        endHour -= 12;
                        if(endHour < 10) {
                            endHour = '0' + endHour;
                        }

                    } else {
                        endMeridiem = "오전";
                    }

                    // 종료 분
                    endMinute = plan.planEnd.substring(14, 16);

                    period += endMeridiem + " " + endHour + ":" + endMinute;
                }
            }

            periodBox.innerText = period;
            
            // 4. 색깔 상자
            const colorBox = document.getElementById('selectedColor');
            colorBox.setAttribute("style", "background-color:" + plan.planColor);

            // 5. 작성자 상자
            const memberNameBox = document.getElementById('memberNameBox');
            memberNameBox.innerHTML = "&nbsp;&nbsp;&#183;&nbsp;&nbsp;" + plan.memberName;


            // 6. 내용 상자
            const contentBox = document.getElementById('contentBox');
            const content = plan.planContent;
            contentBox.innerText = content;
        },
        error : () => {
            alert("데이터 전송에 실패하였습니다.")
        }
    })
    const detailModal = document.getElementById('modal');
    detailModal.classList.toggle('modal');


} // end makePlanDetail