
// 유효성 검사 객체
const validate = {};

const form = document.getElementById("my-page-info-form");

// 닉네임 유효성 검사
const memberNickname = document.getElementById("memberNickname");
const memberNicknameMessage = document.getElementById("memberNicknameMessage");

// 전화번호 유효성 검사
const memberTel = document.getElementById("memberTel");
const memberTelMessage = document.getElementById("memberTelMessage");

// 주소 Daum API
const addressBtn = document.getElementById("addressSearch");

// form 제출 시 유효성 검사
form.addEventListener("submit", e=>{   
    let message = "";        
    for(let key in validate) {      // 유효성 객체 돌면서
        if(!validate[key]) {        // 한개라도 false면
            switch(key) {   
                case "memberNickname": message = "닉네임 형식이 유효하지 않습니다."; break;
                case "memberTel": message = "전화번호 형식이 유효하지 않습니다."; break;
            }
            alert(message);
            e.preventDefault();     // form 제출 막기
            
            return;
        }
    }
});

// 닉네임 -------------------------------------------------------------------------------------------------------
    memberNickname.addEventListener("input", () => {
        if(memberNickname.value.trim().length == 0) {           // 아무것도 입력되지 않았을 때
            memberNickname.value = "";
            memberNicknameMessage.innerText = "특수문자를 제외한 2 ~ 6글자";
            if(infoPage) {
                memberNicknameMessage.innerText = "";
            }
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



// 전화번호 -------------------------------------------------------------------------------------------------------
    memberTel.addEventListener("input", () => {
        if(memberTel.value.trim().length == 0) {
            memberTel.value = "";
            memberTelMessage.innerText = "휴대전화 번호 입력";
            if(infoPage) {
                memberTelMessage.innerText = "";
            }
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