// 폼
console.log("Hello Script");
const changePwForm = document.getElementById("changePwForm");

changePwForm.addEventListener("mouseover", function(event){
    const btn = event.target;
    if(!btn.classList.contains("visiable-btn")) {
        return;
    }
    btn.previousElementSibling.setAttribute("type", "text");
});

changePwForm.addEventListener("mouseout", function(event){
    const btn = event.target;
    if(!btn.classList.contains("visiable-btn")) {
        return;
    }
    btn.previousElementSibling.setAttribute("type", "password");
});



const validate = {
    "memberPw": false,
    "memberPwConfirm": false
};

const currentMemberPw = document.getElementById("currentMemberPw");
if(currentMemberPw != null) {
    // 유효성 검사 key에 현재 비밀번호 확인 추가
    validate.currentMemberPw = false;
    document.getElementById("currentMemberPwCheck").addEventListener("click", e => {
        if(currentMemberPw.value.trim().length == 0) {           // 현재 비밀번호확인이 작성되지 않았다면 메시지 출력 후 리턴
            alert("현재 비밀번호를 입력해주세요.");
            validate.currentMemberPw = false;
            return;
        }

        $.ajax({
            url: "/member/memberPwCheck",
            data: {"currentMemberPw": currentMemberPw.value},
            type: "POST",
            success: result => {
                const currentMemberPwMessage = document.getElementById("currentMemberPwMessage");
                if(result > 0) {
                    currentMemberPwMessage.innerText = "현재 비밀번호가 일치합니다.";
                    currentMemberPwMessage.classList.add("confirm");
                    currentMemberPwMessage.classList.remove("error");
                    currentMemberPw.setAttribute("read-only");
                    validate.currentMemberPw = true;
                } else {
                    currentMemberPwMessage.innerText = "현재 비밀번호가 일치하지않습니다."
                    currentMemberPwMessage.classList.add("error");
                    currentMemberPwMessage.classList.remove("confirm");
                    validate.currentMemberPw = false;
                }
            }
        })
    });
}





// 비밀번호 유효성 검사

const memberPw = document.getElementById("memberPw");
const memberPwMessage = document.getElementById("memberPwMessage");

const memberPwConfirm = document.getElementById("memberPwConfirm");
const memberPwConfirmMessage = document.getElementById("memberPwConfirmMessage");
// 비밀번호 정규식
const regEx = /^[\w!@#_-]{6,20}$/;
memberPw.addEventListener("change", function(){             // 비밀번호 입력이 바뀔 때 마다

    if(memberPw.value.trim().length == 0) {        // 비밀번호가 입력되지 않았다면
        memberPw.value = "";
        memberPwMessage.innerText= "영어, 숫자, 특수문자(!,@,#,-,_) 6 ~ 20 글자 사이로 입력해주세요.";
        memberPwMessage.classList.remove("confirm", "error");
        validate.memberPw = false;
        return;
    }

    if(regEx.test(memberPw.value.trim())) {        // 비밀번호 형식이 유효하다면
        memberPwMessage.innerText = "유효한 형식의 비밀번호 입니다."
        memberPwMessage.classList.add("confirm");
        memberPwMessage.classList.remove("error");
        validate.memberPw = true;

        if(memberPw.value == memberPwConfirm.value) {   // 비밀번호 확인과 일치하면
            memberPwConfirmMessage.innerText = "비밀번호가 일치합니다.";
            memberPwConfirmMessage.classList.add("confirm");
            memberPwConfirmMessage.classList.remove("error");
            validate.memberPwConfirm = true;

        } else {                                        // 비밀번호 확인과 일치하지 않다면
            memberPwConfirmMessage.innerText = "비밀번호가 일치하지않습니다.";
            memberPwConfirmMessage.classList.add("error");
            memberPwConfirmMessage.classList.remove("confirm");
            validate.memberPwConfirm = false;
        }

    } else {                                       // 유효하지 않을 때
        memberPwMessage.innerText = "유효하지 않은 형식의 비밀번호 입니다."
        memberPwMessage.classList.add("error");
        memberPwMessage.classList.remove("confirm");
        validate.memberPw = false;
    }
});

memberPwConfirm.addEventListener("change", function(){

    if(memberPwConfirm.value.trim().length == 0) {        // 비밀번호가 입력되지 않았다면
        memberPwConfirm.value = "";
        memberPwConfirmMessage.innerText = "";
        memberPwConfirmMessage.classList.remove("confirm", "error");
        return;
    }

    if(memberPw.value == memberPwConfirm.value) {   // 비밀번호 확인과 일치하면
        memberPwConfirmMessage.innerText = "비밀번호가 일치합니다.";
        memberPwConfirmMessage.classList.add("confirm");
        memberPwConfirmMessage.classList.remove("error");
        validate.memberPwConfirm = true;

    } else {                                        // 비밀번호 확인과 일치하지 않다면
        memberPwConfirmMessage.innerText = "비밀번호가 일치하지않습니다.";
        memberPwConfirmMessage.classList.add("error");
        memberPwConfirmMessage.classList.remove("confirm");
        validate.memberPwConfirm = false;
    }

});