// 닫기 버튼
const closeBtn =document.getElementById("closeBtn");
if (closeBtn!=null) {
    closeBtn.addEventListener("click", function(){
        window.close();
    })
}


// 메뉴 이미지 변경
const optionImage = document.getElementById("option-image");
const deleteImage = document.getElementById("delete-image");
const inputOptionImg = document.getElementById("inputOptionImg");

// 초기 이미지 상태를 저장하는 변수
// (true : 업로드된 이미지 있음,    false : 기본 이미지)
let initCheck;

// 이미지가 업로드 되었거나 삭제되었음을 나타내는 변수
// (-1 : 초기값(취소),  0 : 삭제(x버튼 클릭),  1 : 새 이미지 업로드 )
let deleteCheck = -1;

// 이미지 수정 페이지에 초기 이미지 경로
const originalImage = optionImage.getAttribute("src");

if(inputOptionImg != null) { 
    // 해당 화면 진입 시 이미지 상태를 저장(initCheck)
    if (optionImage.getAttribute("src") == "/resources/images/review/reviewImg.png") {
        // 기본이미지인 경우
        initCheck = false;
    } else {
        initCheck = true;
    }

    // input type="file" 요소의 값(value)이 없을 때는 ''(빈칸)
    // input type="file" 요소의 이전에 선택한 파일이 있었다가 취소하면 다시 ''(빈칸)
    // input type="file" 요소의 파일을 선택하면 change이벤트가 발생
    

    // 이미지가 선택되었을 때 미리보기
    // 파일선택의 값이 변했을 때(이미지 파일이 선택되었을 때)
    inputOptionImg.addEventListener("change", e => {
        
        // e.target(이미지가 발생한 요소, imageInput)
        // 화살표 함수에서 this는 window의 객체를 의미하므로 사용XXXXX 
        
        console.log(e.target.files); // 선택된 파일의 목록(FileList)
        console.log(e.target.files[0]); // 파일 정보만 명시

        // 파일 정보를 선택했을 때는 ok
        // 파일 취소버튼을 누르면 마찬가지로 change이벤트가 발생하는데
        // 이때 읽어올 파일의 정보가 없는 오류가 발생하기 때문에
        if(e.target.files[0] != undefined) { // 선택된 파일이 있는 경우

            const reader = new FileReader();
            // FileReader(file을 읽는 객체)
            // - 웹 애플리케이션이 비동기적으로 데이터를 읽기 위해 읽을 파일을 가리키는 file 객체(자바스크립트에서 제공)
            // - 읽어들인 파일을 사용자 컴퓨터에 저장할 수 있다.
        
            reader.readAsDataURL(e.target.files[0]);
            // FileReader().readAsDataURL("파일정보");
            // -> 지정된 파일을 실제로 읽기 시작
            
            
            // FileReader().onload 
            // -> 파일 읽기가 완료되었을 때의 동작 지정
            reader.onload = e => {
                // console.log(e.target);
                // e.target.result : 읽어진 파일 결과(실제 이미지 파일)의 경로

                // img태그의 src속성으로 읽은 파일의 경로 추가
                // 이미지 미리보기
                optionImage.setAttribute("src", e.target.result)
                deleteCheck = 1;
            };

        } else { // 파일 선택에서 취소를 누른 경우
            
            // 초기 이미지로 변경
            optionImage.setAttribute("src", originalImage);
            deleteCheck = -1;
        }
    });
    
    
    // x버튼이 클릭된 경우는 무조건 기본이미지로 변경
    deleteImage.addEventListener("click", ()=>{

        optionImage.setAttribute("src", "/resources/images/review/reviewImg.png");
        inputOptionImg.value="";
        deleteCheck = 0;
    });
}


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

    // 옵션이미지
    if (optionImage.src == 'http://localhost/resources/images/review/reviewImg.png') {
        alert("이미지를 선택하세요.")
        return false;
    }

    return true;
}







