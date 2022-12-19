const validate = {
    "memberEmail" : false,
    "emailDupCheck" : false,        // 이메일 중복검사 (ajax)
    "authKey" : false,        // 이메일 인증 구현 필요
    "memberPw" : false,
    "memberPwConfirm" : false,
    "memberName" : false,
    "memberNickname" : false,
    "memberTel" : false,
}

const form = document.getElementById("signUp-frm");
form.addEventListener("submit", e => {             // form이 제출 되었을 때

    let message = "";        
    for(let key in validate) {      // 유효성 객체 돌면서
        if(!validate[key]) {        // 한개라도 false면


            switch(key) {   
                case "memberEmail": message = "이메일 형식이 유효하지 않습니다."; break;
                case "emailDupCheck": message = "중복된 이메일 입니다."; break;
                case "memberPw": message = "비밀번호 형식이 휴효하지 않습니다."; break;
                case "memberPwConfirm": message = "비밀번호가 일치하지 않습니다."; break;
                case "memberNickname": message = "닉네임 형식이 유효하지 않습니다."; break;
                case "memberTel": message = "전화번호 형식이 유효하지 않습니다."; break;
                case "authKey": message = "이메일 인증을 진행해주세요."; break;
            }
            alert(message);
            e.preventDefault();     // form 제출 막기
            if(key == "emailDupCheck") {
                document.getElementById("memberEmail").focus();
            } else {
                document.getElementById(key).focus();
            }
            return;
        }   
    }

    if(form.querySelectorAll("input[type='checkbox']:checked").length != 2) {   // 약관 2개가 모두 체크 되어있지 않으면
        alert("약관에 동의해주세요");
        e.preventDefault();
        return;
    }
});



// 이메일 유효성 검사
const memberEmail = document.getElementById("memberEmail");
const memberEmailMessage = document.getElementById("memberEmailMessage");

// 이메일 인증
const getAuthKeyBtn = document.getElementById("getAuthKeyBtn"); // 인증번호 받기 버튼
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn") // 인증번호 확인 버튼
const authKeyMessage = document.getElementById("authKeyMessage");  // 인증번호 메세지

memberEmail.addEventListener("input", () => {

    // 이메일인증 초기화
    validate.authKey = false;
    authKeyMessage.innerText = "";
    authKeyMessage.classList.remove("confirm");



    if(memberEmail.value.trim().length == 0) {      // 아무것도 적히지 않았을 때
        memberEmail.value = "";
        memberEmailMessage.classList.remove("error", "confirm");
        memberEmailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
        validate.memberEmail = false;
        return;
    }

    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if(regEx.test(memberEmail.value.trim())){           // 이메일 형식이 유효할때
        validate.memberEmail = true;
    
        $.ajax({
            url: "/member/emailDupCheck",
            data: {"memberEmail" : memberEmail.value},
            type: "GET",
            success: (result) => {
                if(result > 0) {    // 중복 O
                    memberEmailMessage.innerText = "중복된 이메일입니다.";
                    memberEmailMessage.classList.add("error");
                    memberEmailMessage.classList.remove("confirm");
                    validate.emailDupCheck = false;
                } else {            // 중복 X    
                    memberEmailMessage.innerText = "사용가능한 이메일입니다.";
                    memberEmailMessage.classList.add("confirm");
                    memberEmailMessage.classList.remove("error");
                    validate.emailDupCheck = true;
                }
            }
        });
        
        
    } else {                                            // 이메일 형식이 유효하지 않을 때
        memberEmailMessage.innerText = "유효하지 않은 형식의 이메일입니다.";
        memberEmailMessage.classList.remove("confirm");
        memberEmailMessage.classList.add("error");
        validate.memberEmail = false;
    }
});


let authTimer;
let authMin = 4;
let authSec = 59;
// 인증번호 받기
getAuthKeyBtn.addEventListener("click", e => {
    if(validate.emailDupCheck) {       // 인증번호를 받을 이메일이 유효한 이메일이 아니라면
        authMin = 4;
        authSec = 59;
        
        validate.authKey = false;

        $.ajax({
            url: "/sendEmail/signUp",
            data: {"email": memberEmail.value},
            success: result=> {
                if(result > 0) {
                    console.log("인증번호가 발송되었습니다.");
                } else {
                    console.log("인증번호 발송 실패");
                }
            },
            error: () => {
                console.log("이메일 발송 중 에러 발생");
            }
        });

        alert("인증번호가 발송 되었습니다.");

        authKeyMessage.innerText = "05:00";
        authKeyMessage.classList.remove("confirm");
        
        authTimer = window.setInterval(()=>{
            authKeyMessage.innerText = "0" + authMin + ":" + (authSec < 10 ? "0" + authSec : authSec);

            // 남은 시간이 0분 0초인 경우
            if(authMin == 0 && authSec == 0) {
                validate.authKey = false;       // 인증실패
                clearInterval(authTimer);       // 타이머 종료
                return;                         // 리턴
            }

            // 0초인 경우
            if(authSec == 0) {
                authSec = 60;
                authMin--;
            }

            authSec--;  // 1초 감소
        }, 1000);   // 1초마다 실행

    } else {
        // 경고창 출력
        alert("중복되지 않은 이메일을 작성해주세요.");
        validate.authKey = false;

        // 이메일입력창 포커스
        memberEmail.focus();
    }
});

checkAuthKeyBtn.addEventListener("click", ()=>{
    if(authKey > 0 || authSec > 0) {        // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행
        $.ajax({
            url: "/sendEmail/checkAuthKey",
            data: {"inputKey": authKey.value},
            success: result => {
                if(result > 0) {
                    clearInterval(authTimer);
                    authKeyMessage.innerText = "인증되었습니다.";
                    authKeyMessage.classList.add("confirm");
                    validate.authKey = true;    // 인증완료
                } else {
                    alert("인증번호가 일치하지 않습니다.");
                    validate.authKey = false;
                }
            },
            error: () => {
                console.log("인증번호 확인 오류");
            }
        })
    } else {
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.");
    }
});










// 비밀번호 유효성 검사
const memberPw = document.getElementById("memberPw");
const memberPwMessage = document.getElementById("memberPwMessage");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const memberPwConfirmMessag = document.getElementById("memberPwConfirmMessage");

memberPw.addEventListener("input", () => {
    if(memberPw.value.trim().length == 0) {             // 비밀번호가 입력되지 않았다면
        memberPw.value = "";
        memberPwMessage.classList.remove("error", "confirm");
        memberPwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6 ~ 20 글자 사이로 입력해주세요.";
        validate.memberPw = false;
        return;
    }

    // 비밀번호 형식 확인
    const regEx = /^[a-zA-z0-9!@#-_]{6,20}$/;
    if(regEx.test(memberPw.value)){              // 비밀번호 형식이 유효할 때
        memberPwMessage.innerText = "유효한 형식의 비밀번호입니다.";
        memberPwMessage.classList.add("confirm");
        memberPwMessage.classList.remove("error");
        validate.memberPw = true;
    } else {
        memberPwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6 ~ 20 글자 사이로 입력해주세요."
        memberPwMessage.classList.add("error");
        memberPwMessage.classList.remove("confirm");
        validate.memberPw = false;
    }

    if(memberPw.value == memberPwConfirm.value) {       // 비밀번호 == 비밀번호 확인
        memberPwConfirmMessag.innerText = "비밀번호가 일치합니다."
        memberPwConfirmMessag.classList.add("confirm");
        memberPwConfirmMessag.classList.remove("error");
        validate.memberPwConfirm = true;
    } else {                                            // 비밀번호 != 비밀번호 확인
        memberPwConfirmMessag.innerText = "비밀번호가 일치하지 않습니다.."
        memberPwConfirmMessag.classList.add("error");
        memberPwConfirmMessag.classList.remove("confirm");
        validate.memberPwConfirm = false;
    }
});

// 비밀번호 확인
memberPwConfirm.addEventListener("input", () => {
    if(memberPwConfirm.value.trim().length == 0) {             // 비밀번호가 입력되지 않았다면
        memberPwConfirm.value = "";
        memberPwConfirmMessag.classList.remove("error", "confirm");
        memberPwConfirmMessag.innerText = "";
        validate.memberPw = false;
        return;
    }
    
    // 비밀번호 확인과 일치 확인
    if(memberPw.value == memberPwConfirm.value) {       // 비밀번호 == 비밀번호 확인
        memberPwConfirmMessag.innerText = "비밀번호가 일치합니다."
        memberPwConfirmMessag.classList.add("confirm");
        memberPwConfirmMessag.classList.remove("error");
        validate.memberPwConfirm = true;
    } else {                                            // 비밀번호 != 비밀번호 확인
        memberPwConfirmMessag.innerText = "비밀번호가 일치하지 않습니다.."
        memberPwConfirmMessag.classList.add("error");
        memberPwConfirmMessag.classList.remove("confirm");
        validate.memberPwConfirm = false;
    }
});


// 이름 유효성 검사
const memberName = document.getElementById("memberName");
const memberNameMessage = document.getElementById("memberNameMessage");
memberName.addEventListener("input", function(){
    if(memberName.value.trim().length == 0) {       // 이름이 입력되지 않았다면
        memberName.value = "";
        memberNameMessage.classList.remove("error", "confirm");
        memberNameMessage.innerText = "한글 2 ~ 5글자";
        validate.memberName = false;
        return;
    }

    const regEx = /^[가-힣]{2,5}$/;
    if(regEx.test(memberName.value)) {          // 이름이 유효한 형식이면
        memberNameMessage.innerText = "유효한 형식의 이름입니다.";
        memberNameMessage.classList.add("confirm");
        memberNameMessage.classList.remove("error");
        validate.memberName = true;
    } else {
        memberNameMessage.innerText = "유효하지 않은 형식의 이름입니다.";
        memberNameMessage.classList.add("error");
        memberNameMessage.classList.remove("confirm");
        validate.memberName = false;
    }
});



// 닉네임 유효성 검사
const memberNickname = document.getElementById("memberNickname");
const memberNicknameMessage = document.getElementById("memberNicknameMessage");

memberNickname.addEventListener("input", () => {
    if(memberNickname.value.trim().length == 0) {           // 아무것도 입력되지 않았을 때
        memberNickname.value = "";
        memberNicknameMessage.innerText = "특수문자를 제외한 2 ~ 6글자";
        memberNicknameMessage.classList.remove("confirm", "error");
        validate.memberNickname = false;
        return;
    }

    const regEx = /^[a-zA-Z가-힣0-9]{2,6}$/;

    if(regEx.test(memberNickname.value)) {                  // 유효한 형식일 때
        memberNicknameMessage.innerText = "유효한 형식의 닉네임입니다.";
        memberNicknameMessage.classList.add("confirm");
        memberNicknameMessage.classList.remove("error");
        validate.memberNickname = true;
    } else {                                                 // 유효한 형식이 아닐 때 
        memberNicknameMessage.innerText = "특수문자를 제외한 2 ~ 6글자";
        memberNicknameMessage.classList.add("error");
        memberNicknameMessage.classList.remove("confirm");
        validate.memberNickname = false;
    }
});


// 전화번호 유효성 검사
const memberTel = document.getElementById("memberTel");
const memberTelMessage = document.getElementById("memberTelMessage");

memberTel.addEventListener("input", () => {
    if(memberTel.value.trim().length == 0) {
        memberTel.value = "";
        memberTelMessage.innerText = "휴대전화 번호 입력";
        memberTelMessage.classList.remove("confirm", "error");
        validate.memberTel = false;
        return;
    }
    

    const regEx = /^010[0-9]{8}$/;
    if(regEx.test(memberTel.value)) {       // 유효한 형식일 때
        memberTelMessage.innerText = "유효한 형식의 전화번호입니다.";
        memberTelMessage.classList.add("confirm");
        memberTelMessage.classList.remove("error");
        validate.memberTel = true;
    } else {                                // 유효하지 않은 형식일 때
        memberTelMessage.innerText = "휴대전화 번호를 입력해주세요. 010~";
        memberTelMessage.classList.add("error");
        memberTelMessage.classList.remove("confirm");
        validate.memberTel = false;
    }
});


// 주소 Daum API
document.getElementById("addressSearch").addEventListener("click", execDaumPostcode);

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: data => {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();

            validate.detailAddress = true;
        }
    }).open();
}



// 비밀번호 CapsLock알람
function checkCapsLock(e) {

    var myKeyCode=0;
    var myShiftKey=false;
    var myMsg='<Caps Lock>이 켜져있습니다.\n\nCaps Lock이 켜져있으면 암호를 올바르게 입력하지 못할 수 있습니다.\n암호를 입력하기 전 확인해주세요.';

    // Internet Explorer 4+
    if ( document ) {
        myKeyCode=e.keyCode;
        myShiftKey=e.shiftKey;

    // Netscape 4
    } else if ( document.layers ) {
        myKeyCode=e.which;
        myShiftKey=( myKeyCode == 16 ) ? true : false;

    // Netscape 6
    } else if ( document.getElementById ) {
        myKeyCode=e.which;
        myShiftKey=( myKeyCode == 16 ) ? true : false;
    }

    
    if ( ( myKeyCode >= 65 && myKeyCode <= 90 ) && !myShiftKey ) {
        alert( myMsg );
        return false;

    
    } else if ( ( myKeyCode >= 97 && myKeyCode <= 122 ) && myShiftKey ) {
        alert( myMsg );
        return false;
    }
}