const changePwForm = document.getElementById("changePw-frm");

const validate = {
    "memberPw": false,
    "memberPwConfirm": false
};

// 비밀번호 유효성 검사

const memberPw = document.getElementById("memberPw");
const memberPwMessage = document.getElementById("memberPwMessage");

const memberPwConfirm = document.getElementById("memberPwConfirm");
const memberPwConfirmMessage = document.getElementById("memberPwConfirmMessage");

// 비밀번호 정규식
const regEx = /^[\w!@#_-]{5,20}$/;

// 비밀번호
memberPw.addEventListener("input", function(){             // 비밀번호 입력이 바뀔 때 마다

    if(memberPw.value.trim().length == 0) {        // 비밀번호가 입력되지 않았다면
        memberPw.value = "";
        memberPwMessage.innerText= "영어, 숫자, 특수문자(!,@,#,-,_) 5 ~ 20 글자 사이로 입력해주세요.";
        memberPwMessage.classList.remove("confirm", "error");

        validate.memberPw = false;
        return;
    }

    if(regEx.test(memberPw.value.trim())) {        // 비밀번호 형식이 유효하다면
        memberPwMessage.innerText = "유효한 형식의 비밀번호 입니다."
        memberPwMessage.classList.add("confirm");
        memberPwMessage.classList.remove("error");

        validate.memberPw = true;
    }
});

// 비밀번호 확인
memberPwConfirm.addEventListener("input", function() {     // 비밀번호 확인 입력이 바뀔 때 마다

    if(memberPw.value != memberPwConfirm.value) {   // 비밀번호 확인과 일치하지 않다면
        memberPwConfirmMessage.innerText = "비밀번호가 일치하지않습니다.";
        memberPwConfirmMessage.classList.add("error");
        memberPwConfirmMessage.classList.remove("confirm");
        
        validate.memberPwConfirm = false;
        
    } else {                                        // 비밀번호 확인과 일치하면
        memberPwConfirmMessage.innerText = "비밀번호가 일치합니다.";
        memberPwConfirmMessage.classList.add("confirm");
        memberPwConfirmMessage.classList.remove("error");
        
        validate.memberPwConfirm = true;
    }
});

//validate.memberPwConfirm = true, validate.memberPw = true 일 때 submit 가능
changePwForm.addEventListener("submit", function(e) {
    if(!validate.memberPwConfirm || !validate.memberPw) {
        e.preventDefault();
        
    }
});




