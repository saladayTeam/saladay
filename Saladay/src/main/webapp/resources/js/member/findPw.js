console.log("Hello findPw");

const validate = { 
    "memberEmail" : false, 
    "authKey" : false
}

//form이 제출되면 유효성 검사
document.getElementById("findPw-frm").addEventListener("submit", function (event) {
    let message = "";
    for(let key in validate) {      // 유효성 객체 돌면서
        if(!validate[key]) {        // 한개라도 false면
            switch(key) {   
                case "memberEmail": message = "이메일 형식이 유효하지 않습니다."; break;
                case "authKey": message = "이메일 인증을 진행해주세요."; break;
            }
            alert(message);
            e.preventDefault();     // form 제출 막기
            
            return;
        }
    }
});


// 이메일 유효성
const memberEmail = document.getElementById("memberEmail");                             // 이메일
const memberEmailMessage = document.getElementById("memberEmailMessage");               // 이메일 메세지

memberEmail.addEventListener("input", function () {
     // 문자가 입력되지 않은 경우
    if (memberEmail.value.trim().length == 0) {
        memberEmailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
        memberEmail.value = "";
        // confirm, error 클래스 제거
        emailMessage.classList.remove("confirm", "error");

        // 이메일 유효성 검사 결과 저장 객체에 현재상태 저장
        validate.memberEmail = false;
        return;
    }

    //정규표현식 검사
    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if (regEx.test(memberEmail.value.trim())) { // 이메일 형식이 유효할때
        memberEmailMessage.innerText = "유효한 형식의 이메일입니다.";
        memberEmailMessage.classList.add("confirm");
        memberEmailMessage.classList.remove("error");

        validate.memberEmail = true;
    } else { // 이메일 형식이 유효하지 않을때
        memberEmailMessage.innerText = "유효하지 않은 형식의 이메일입니다.";
        memberEmailMessage.classList.add("error");
        memberEmailMessage.classList.remove("confirm");

        validate.memberEmail = false;
    }
});

// 이메일 인증
const getAuthKeyBtn = document.getElementById("getAuthKeyBtn");                         // 인증번호 받기 버튼
const authKeyMessage = document.getElementById("authKeyMessage");                       // 인증번호 메세지

let authTimer;
let authMin = 4;
let authSec = 59;
// 인증번호 받기

getAuthKeyBtn.addEventListener("click", function (){
    if(validate.memberEmail) {      // 이메일 유효성 검사 통과한 경우에만 인증번호 받기 진행
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
    }
});


// 인증번호 확인
const authKey = document.getElementById("authKey");                                     // 인증번호 입력창
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn")                      // 인증번호 확인 버튼

checkAuthKeyBtn.addEventListener("click", ()=>{
    if(authMin > 0 || authSec > 0) {        // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행
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
