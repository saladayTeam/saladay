console.log("Hello findID");
const form = document.getElementById("findID-frm");

form.addEventListener("submit", e => {
    const memberName = document.getElementById("memberName");
    
    if(memberName.value.trim().length == 0) {           // 이름 입력하지 않았을 때
        e.preventDefault();
        memberName.focus();
        alert("이름을 입력해주세요.");
        return;
    }

    const memberTel = document.getElementById("memberTel");

    if(memberTel.value.trim().length == 0) {            // 전화번호를 입력하지 않았을 때
        e.preventDefault();
        memberTel.focus();
        alert("전화번호를 입력해주세요.");
        return;
    }
});