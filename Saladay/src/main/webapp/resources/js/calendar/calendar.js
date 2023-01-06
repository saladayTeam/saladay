
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
                risk: '7',
                orderNo: li.orderNo
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
                risk: li.packageNo,
                orderNo: li.orderNo
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
                risk: li.packageNo,
                orderNo: li.orderNo
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
                risk: li.packageNo,
                orderNo: li.orderNo
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
                  risk: li.packageNo,
                  orderNo: li.orderNo
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
                    risk: li.packageNo,
                    orderNo: li.orderNo
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
                risk: li.packageNo,
                orderNo: li.orderNo
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
                  risk: li.packageNo,
                  orderNo: li.orderNo
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
                risk: li.packageNo,
                orderNo: li.orderNo
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
                  risk: li.packageNo,
                  orderNo: li.orderNo
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
    eventClick: function(info) {
      deliveryNo = info.event.id;
      orderNo = info.event.extendedProps.orderNo;
      selectOne(deliveryNo, orderNo);
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


// 체크박스 클릭 시 캘린더에서 event 숨기기/보이기
$(".inputGroup .filter").on("click", function(){

  // console.log(this.parentElement.classList);
  const cls = this.parentElement.classList[1];
  if(cls.indexOf("-c") == -1){ // -c 없음
    this.parentElement.classList.toggle(cls);
    this.parentElement.classList.toggle(cls+"-c");
  }else{
    this.parentElement.classList.toggle(cls);
    this.parentElement.classList.toggle(cls.substring(0, cls.length-2));
  }

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
function selectOne(thisId, thisIds){
  let deliveryNo = thisId;
  let orderNo = thisIds;
  let delivery;
  
    $.ajax({
        url : "/admin/delivery/selectDeliveryCalendar",
        data : {"deliveryNo":deliveryNo, "orderNo":orderNo},
        type : "GET",
        dataType : "JSON",  
        
        success : function(delivery){
          console.log(delivery);
          console.log(delivery.length);
          console.log(delivery[1]);
          console.log(delivery[2]);
          
            // 배송번호
            const deliveryNo = document.getElementById("deliveryNo");
            deliveryNo.innerText = "\u00a0"+ delivery[0].deliveryNo;

            // 주문번호
            const orderNo = document.getElementById("orderNo");
            orderNo.innerText = "\u00a0"+ delivery[0].orderNo;

            // 배송날짜
            const deliveryDate = document.getElementById("deliveryDate");
            deliveryDate.innerText = "\u00a0"+ delivery[0].deliveryDate;

            // 수령인
            const deliveryName = document.getElementById("deliveryName");
            deliveryName.innerText = "\u00a0"+ delivery[0].orderName;

            // 배송지 주소
            const deliveryAddress = document.getElementById("deliveryAddress");
            deliveryAddress.innerText = "\u00a0"+ delivery[0].orderAddress.replaceAll(',,',' ');

            // 버튼
            // 배송상태가 결제완료일 경우
            // if(delivery[0].deliveryCode == 'A'){
            //   $("#selectbox option:selected").val('A');
            //   // function chageLangSelect(){
            //   //   var langSelect = document.getElementById("selectbox");
                 
            //   //   // select element에서 선택된 option의 value가 저장된다.
             
            //   //   // select element에서 선택된 option의 text가 저장된다.
            //   //   var selectText = langSelect.options[langSelect.selectedIndex].text;
            // }else if(delivery[0].deliveryCode == 'D'){
            //   $("#selectbox option:selected").val('D');
            // }

            const options = document.querySelectorAll("#selectbox > option");
            for(let op of options){
              if(op.value == delivery[0].deliveryCode){
                op.selected = true;
                break;
              }
            }

            // 배송지 전화번호
            const deliveryPhone = document.getElementById("deliveryPhone");
            deliveryPhone.innerText = "\u00a0"+ delivery[0].orderTel;

            // 패키지 이름
            const packageName = document.getElementById("packageName");
            packageName.innerText = "\u00a0" + delivery[0].packageName;

            // 배송할 샐러드 div
            const deliverySalad1 = document.getElementById("deliverySalad1");
            const deliverySalad2 = document.getElementById("deliverySalad2");
            const deliverySalad3 = document.getElementById("deliverySalad3");
            const deliverySalad4 = document.getElementById("deliverySalad4");
            const deliverySalad5 = document.getElementById("deliverySalad5");
            const deliverySalad6 = document.getElementById("deliverySalad6");
            const deliverySalad7 = document.getElementById("deliverySalad7");

            // 메뉴가 3개일 경우
            if(delivery.length == 3){
              deliverySalad1.innerText = "\u00a0"+ delivery[0].menuName + ','+ "\u00a0";
              deliverySalad2.innerText = delivery[1].menuName + ',' + "\u00a0";
              deliverySalad3.innerText = delivery[2].menuName;
              // 메뉴가 5개일 경우
            }else if(delivery.length == 5){
              deliverySalad1.innerText = "\u00a0"+ delivery[0].menuName + ','+ "\u00a0";
              deliverySalad2.innerText = delivery[1].menuName + ','+ "\u00a0";
              deliverySalad3.innerText = delivery[2].menuName + ','+ "\u00a0";
              deliverySalad4.innerText = delivery[3].menuName + ','+ "\u00a0";
              deliverySalad5.innerText = delivery[4].menuName;
              // 메뉴가 7개일 경우
            }else if(delivery.length == 7){
              deliverySalad1.innerText = "\u00a0"+ delivery[0].menuName + ','+ "\u00a0";
              deliverySalad2.innerText = delivery[1].menuName + ','+ "\u00a0";
              deliverySalad3.innerText = delivery[2].menuName + ','+ "\u00a0";
              deliverySalad4.innerText = delivery[3].menuName + ','+ "\u00a0";
              deliverySalad5.innerText = delivery[4].menuName + ','+ "\u00a0";
              deliverySalad6.innerText = delivery[5].menuName + ','+ "\u00a0";
              deliverySalad7.innerText = delivery[6].menuName;
            }

            // 배송 상태
            // const deliveryStatus = document.getElementById("deliveryStatus");
            // deliveryStatus.innerText = "\u00a0"+ delivery[0].deliveryStatus;

        }

    })
    const detailModal = document.getElementById('modal');
    detailModal.classList.toggle('modal');
    const ModalBox = document.getElementById('modalBox');
    ModalBox.classList.toggle('modalBox');
    // const closeModal = document.getElementById('closeModal');
    // closeModal.classList.toggle('closeModal');

} // 일정 상세조회 창

const changeBtn = document.getElementById("changeBtn");
const options = document.querySelectorAll("#selectbox > option");

// 배송상태 관련 select
$(document).ready(function(){
  $("#selectbox").change(function(){
    // Value값 가져오기
    var deliveryCode = $("#selectbox :selected").val();
    changeBtn.style.display = "block";
    
    console.log(deliveryCode);
    
  });
});

// (모달)수정버튼 클릭 시 배송상태 수정
$(changeBtn).click(function() {

  var deliveryCode = $("#selectbox :selected").val();

  console.log("value : " + deliveryNo);
  console.log("value : " + deliveryCode);

    if(confirm("배송상태를 변경하시겠습니까?")) {

      $.ajax({
          url : "/admin/calendar/updateDelivery",
          type : "get",
          data : {"deliveryNo":deliveryNo, "deliveryCode":deliveryCode},
          success : function() {
              alert("배송상태를 수정합니다.");
              location.reload("/admin/delivery/deliveryCalendar"); // 페이지 새로고침
          },
          error: function(){
              alert("배송상태 변경 실패")
          }
      })
      
    }else{

      alert("배송상태 변경을 취소했습니다.");
  }
});

const modalClose=document.getElementById("closeModal");

/* 모달창 닫기(외부영역 클릭 시) */
const modalBox = document.getElementById("modalBox");

modalBox.addEventListener("click", e => {
    const evTarget = e.target;

    if(evTarget.classList.contains("modalBox")){
        evTarget.classList.toggle("modalBox");

        const modal = document.getElementById("modal");
        if(!modal.classList.contains("modal")) {
            modal.classList.toggle("modal");
        }

        const closeModal = document.getElementById("closeModal");
        if(!closeModal.classList.contains("closeModal")) {
          closeModal.classList.toggle("closeModal");
        }
        return;
    }
    
})

const closeModal = document.getElementById("closeModal");

closeModal.addEventListener("click", () => {

  const modalBox = document.getElementById("modalBox");
  modalBox.classList.toggle("modalBox");
  const modal = document.getElementById("modal");
  modal.classList.toggle("modal");
  // closeModal.classList.toggle("closeModal");

  changeBtn.style.display = "none";
    
})

// // 3팩 div
// const pack1 = document.getElementById("f1828d");
// // 체크박스 js
// $(pack1).click(function(){
//   var checked = $('#no1').is(':checked');
//   $('#no1').prop('checked',!checked);
//   $('#no1').prop('checked',checked);
//   console.log("되냐")
// });

// $('#a848ccf').click(function(){
//   var checked = $('#no2').is(':checked');
//   $('#a848ccf').prop('checked',!checked);
// });

// $('#a252958').click(function(){
//   var checked = $('#no3').is(':checked');
//   $('#a252958').prop('checked',!checked);
// });

// $('#f9b42d').click(function(){
//   var checked = $('#no4').is(':checked');
//   $('#f9b42d').prop('checked',!checked);
// });

// $('#a3498db').click(function(){
//   var checked = $('#no5').is(':checked');
//   $('#a3498db').prop('checked',!checked);
// });

// $("#f1828d").on('click', function(){	
//   // 클릭한 article의 하위 체크박스 상태 변경
//   if ($('#no1').prop('checked')) {
//     // $(this).removeClass("check-ok");
//     $('#no1').prop('checked',false);
//   } else {
//     // $(this).addClass("check-ok");
//     $('#no1').prop('checked',true);
//   }
// });

$("div[id='f1828d']").on('click', function(){	
  
  console.log('되니?')
  // 클릭한 article의 하위 체크박스 상태 변경
  if ($(this).children("input[id='no1']").prop('checked')) {
    console.log("체크돼있는지 확인")
    // $(this).removeClass("check-ok");
    $(this).children('input').prop('checked',false);
    $("." + $(this).attr("id")).hide();
  } else {
    // $(this).addClass("check-ok");
    $(this).children('input').prop('checked',true);
    $("." + $(this).attr("id")).show();
  }
});