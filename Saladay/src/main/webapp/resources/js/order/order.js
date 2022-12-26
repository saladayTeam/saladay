// 기본배송지로 등록
const memberAddr = document.getElementById("memberAddr");
if (memberAddr != null) {
  memberAddr.addEventListener("change", () => {
    if (memberAddr.checked) {
      const str = "배송지를 정확하게 확인하세요.";
      if (!confirm(str)) {
        memberAddr.checked = false;
      }
    }
  });
}

// 주문한 메뉴 목록 상세 조회
const showIcon = document.getElementById("icon");
const showArea = document.querySelector(".show-area");

if (showIcon != null) {
  showIcon.addEventListener("change", () => {
    if (showIcon.checked) {
      showArea.style.display = "block";
    } else {
      showArea.style.display = "none";
    }
  });
}

// 주소 Daum API
function sample6_execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ""; // 주소 변수
      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === "R") {
        // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else {
        // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.jibunAddress;
      }
      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById("sample6_postcode").value = data.zonecode;
      document.getElementById("sample6_address").value = addr;
      // 커서를 상세주소 필드로 이동한다.
      document.getElementById("sample6_detailAddress").focus();
    },
  }).open();
}

// 배송일자 선택시 오늘 이전 날짜는 선택 불가
// var now_utc = Date.now() // 지금 날짜를 밀리초로
// // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
// var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
// // new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
// var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
// document.getElementById("datepicker").setAttribute("min", today);

// 배송일자 선택시 오늘, 오늘 이전 날짜는 선택 불가 & 주말도 선택 불가
var today = $.datepicker.formatDate("yy-mm-dd", new Date());
$.datepicker.setDefaults({
  dateFormat: "yy-mm-dd", //Input Display Format 변경
  //,prevText: '이전 달'	// 마우스 오버시 이전달 텍스트
  //,nextText: '다음 달'	// 마우스 오버시 다음달 텍스트
  showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
  showMonthAfterYear: true, //년도 먼저 나오고, 뒤에 월 표시
  changeYear: true, //콤보박스에서 년 선택 가능
  changeMonth: true, //콤보박스에서 월 선택 가능
  monthNamesShort: [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ], //달력의 월 부분 텍스트
  monthNames: [
    "1월",
    "2월",
    "3월",
    "4월",
    "5월",
    "6월",
    "7월",
    "8월",
    "9월",
    "10월",
    "11월",
    "12월",
  ], //달력의 월 부분 Tooltip 텍스트
  dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"], //달력의 요일 부분 텍스트
  dayNames: [
    "일요일",
    "월요일",
    "화요일",
    "수요일",
    "목요일",
    "금요일",
    "토요일",
  ], //달력의 요일 부분 Tooltip 텍스트
  minDate: "+1D", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
  maxDate: "+1M", //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
  beforeShowDay: function (date) {
    var day = date.getDay();
    return [day != 0 && day != 6];
  },
});

$(function () {
  //input을 datepicker로 선언
  $("#deliveryDate, #deliveryDate2").datepicker();
  //초기값을 오늘 날짜로 설정
  // $('#datepicker').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
});

// 2차배송일을 더 이전 날짜로 지정한 경우
if ("$(#deliveryDate)" != null) {
  $("#deliveryDate2").change(function () {
    if ($("#deliveryDate").val() > $("#deliveryDate2").val()) {
      alert("2차 수령일을 확인하세요.");
      $("#deliveryDate2").val().empty();
    }
  });
}

//문서가 준비되면 제일 먼저 실행
$(document).ready(function () {
  $("#payBtn").click(function () {
    payment(); //버튼 클릭하면 호출
  });
});

//카카오 결제 API
var IMP = window.IMP; // 생략가능
IMP.init("impimp50312116"); // 가맹점 식별코드
// IMP.request_pay(param, callback) 결제창 호출
IMP.request_pay(
  {
    pg: "kakaopay", //pg사 선택 (kakao, kakaopay 둘다 가능)
    pay_method: "card",
    merchant_uid: "merchant_" + new Date().getTime(), //주문번호
    name: "Bunddeuk", // 상품명
    amount: 1,
    //customer_uid 파라메터가 있어야 빌링키 발급을 시도함
    customer_uid: memberName + new Date().getTime(),
    buyer_email: email,
    buyer_name: buyer_name,
    buyer_tel: hp,
    buyer_addr: addr,
  },
  function (rsp) {
    //callback
    if (rsp.success) {
      console.log("빌링키 발급 성공", rsp);
      //빌링키 발급이 완료되었으므로, 서버에 결제 요청
      alert("예약 결제가 완료되었습니다!");
    } else {
      var msg = "결제에 실패하였습니다.\n";
      msg += rsp.error_msg;
      alert(msg);
      return false;
    }
    $("#final-support-submit").submit();
  }
);
