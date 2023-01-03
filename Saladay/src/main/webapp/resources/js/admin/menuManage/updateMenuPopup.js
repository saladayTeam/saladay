// 닫기 버튼
const closeBtn =document.getElementById("closeBtn");
if (closeBtn!=null) {
    closeBtn.addEventListener("click", function(){
        window.close();
    })
}


// 메뉴 이미지 변경
const menuImage = document.getElementById("menu-image"); // preview
const deleteImage = document.getElementById("delete-image"); 
const inputMenuImg = document.getElementById("inputMenuImg"); // inputImage



// inputMenuImg 요소의 값이 변했을 때
inputMenuImg.addEventListener("change", (event)=>{

        // event.target.files : 선택한 요소의 값이 배열 형태로 반환
    if(event.target.files[0] != undefined ){ // 선택된 파일이 있을 경우
        
        const reader = new FileReader(); // 파일을 읽는 객체
        
        reader.readAsDataURL(event.target.files[0]);
        // 지정된 input type="file"의 파일을 읽어와 URL 형태로 저장

        reader.onload = e => { // 파일을 다 읽어온 후
            // e.target ==  reader
            // e.target.result == 읽어온 url파일
            menuImage.setAttribute("src", e.target.result)
        }

    } else { // 취소를 누른 경우
        // 미리보기가 보여지고 있으면 미리보기 지우기
        menuImage.removeAttribute("src"); // src속성 제거
    }
});



// 제출 전 유효성 검사
const menuName = document.getElementById("menuName");
const menuContent = document.getElementById("menuContent");
const menuPrice = document.getElementById("menuPrice");
const calorie = document.getElementById("menuCalorie");

function  updateValidate(){

    // 메뉴명
    if(menuName.value.trim().length == 0) {
        alert("메뉴명을 입력하세요.");
        menuName.focus();
        return false;
    } else {
        const reg1 =  /^[a-zA-Zㄱ-힣0-9\s!~@#$%^&*()_-]{2,50}$/;
        if(!reg1.test(menuName.value)) {
            alert("메뉴명을 확인하세요.");
            menuName.focus();
            return false;
        }
    }


    // 메뉴설명
    if(menuContent.value.trim().length == 0) {
        alert("메뉴의 설명을 입력하세요.");
        menuContent.focus();
        return false;
    }  else {
        const reg2 = /^[a-zA-Zㄱ-힣0-9!~@#$%^&*()_-\s]{2,1000}$/;
        if(!reg2.test(menuContent.value)) {
            alert("메뉴의 설명을 확인하세요.");
            menuContent.focus();
            return false;
        }
    }

    // 메뉴 가격
    if(menuPrice.value.trim().length == 0) {
        alert("메뉴 가격을 입력하세요.");
        menuPrice.focus();
        return false;
    } else {
        const reg3 = /^[0-9]+$/; 
        if (!reg3.test(menuPrice.value)) {
            alert("메뉴 가격은 숫자만 입력 가능합니다.");
            menuPrice.value="";
            menuPrice.focus();
            return false;
        }
    }

    // 칼로리
    if(calorie.value.trim().length == 0) {
        alert("칼로리를 입력하세요.");
        calorie.focus();
        return false;
    } else {
        const reg4 = /^[0-9]+$/; 
        if (!reg4.test(calorie.value)) {
            alert("칼로리는 숫자만 입력 가능합니다.");
            calorie.value='';
            calorie.focus();
            return false;
        }
    }

    return true;
}







