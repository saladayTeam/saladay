// 닫기 버튼
const closeBtn =document.getElementById("closeBtn");
if (closeBtn!=null) {
    closeBtn.addEventListener("click", function(){
        window.close();
    })
}


// 옵션 이미지 변경
const optionImage = document.getElementById("option-image");
const deleteImage = document.getElementById("delete-image");
const inputOptionImg = document.getElementById("inputOptionImg");


// inputOptionImg 요소의 값이 변했을 때
inputOptionImg.addEventListener("change", (event)=>{

    // event.target.files : 선택한 요소의 값이 배열 형태로 반환
    if(event.target.files[0] != undefined ){ // 선택된 파일이 있을 경우
        
        const reader = new FileReader(); // 파일을 읽는 객체
        
        reader.readAsDataURL(event.target.files[0]);
        // 지정된 input type="file"의 파일을 읽어와 URL 형태로 저장

        reader.onload = e => { // 파일을 다 읽어온 후
            // e.target ==  reader
            // e.target.result == 읽어온 url파일
            optionImage.setAttribute("src", e.target.result)
        }

    } else { // 취소를 누른 경우
        // 미리보기가 보여지고 있으면 미리보기 지우기
        optionImage.removeAttribute("src"); // src속성 제거
    }
});



// 제출 전 유효성 검사
const optionName = document.getElementById("optionName");
const optionType = document.getElementById("optionType");
const optionPrice = document.getElementById("optionPrice");
const optionCalorie = document.getElementById("optionCalorie");

function registValidate(){

    // 옵션명
    if(optionName.value.trim().length == 0) {
        alert("옵션명을 입력하세요.");
        optionName.focus();
        return false;
    } else {
        const reg1 =  /^[a-zA-Zㄱ-힣0-9\s!~@#$%^&*()_-]{2,10}$/;
        if(!reg1.test(optionName.value)) {
            alert("옵션명을 확인하세요.");
            optionName.focus();
            return false;
        }
    }


    // 옵션 가격
    if(optionPrice.value.trim().length == 0) {
        alert("옵션 가격을 입력하세요.");
        optionPrice.focus();
        return false;
    } else {
        const reg2 = /^[0-9]+$/; 
        if (!reg2.test(optionPrice.value)) {
            alert("옵션 가격은 숫자만 입력 가능합니다.");
            optionPrice.value="";
            optionPrice.focus();
            return false;
        }
    }

    // 칼로리
    if(optionCalorie.value.trim().length == 0) {
        alert("칼로리를 입력하세요.");
        optionCalorie.focus();
        return false;
    } else {
        const reg3 = /^[0-9]+$/; 
        if (!reg3.test(optionCalorie.value)) {
            alert("칼로리는 숫자만 입력 가능합니다.");
            optionCalorie.value='';
            optionCalorie.focus();
            return false;
        }
    }


    return true;
}







