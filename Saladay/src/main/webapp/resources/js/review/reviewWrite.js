/* 리뷰 별점 드래그 */
const drawStar = (target) => {
    document.querySelector(".rw-star span").style.width = `${target.value * 20}%`;
    console.log(target.value);
}

/* 리뷰 이미지 */
const inputImage = document.getElementsByClassName("inputImage"); // 리뷰이미지 
const preview = document.getElementsByClassName("preview"); // 미리보기

/* 이미지 삭제 관련 */
const deleteImage = document.getElementsByClassName("delete-image"); // 이미지 삭제버튼

/* 이미지 id에 붙일 번호(하나씩 추가될때마다 +1) */
let idCount = 1;
/* 리뷰이미지 영역이 몇개인지 체크하는 변수 */
let reviewImgCount = 0;


// 이미지 파일이 선택됐을 때
for(let i=0; i<inputImage.length; i++){

    inputImage[i].addEventListener("change", function(){

        if(this.files[0] != undefined){ // 이미지 파일이 undefined가 아닐 때
            const reader = new FileReader(); // FileReader() : 자바스크립트 파일입출력 객체, 비동기로 작동
            reader.readAsDataURL(this.files[0]); // readAsDataURL : 파일 객체를 읽은 후 데이터 URL 표현으로 변환

            reader.onload = function(e){ 
                // FileReader.onload() 읽기 동작이 성공적으로 완료되었을 때마다 발생
                // 비동기이므로 원하는 동작을 위해 CALLBACK 함수를 이용

                // 프리뷰 영역에 파일리더로 읽어온 result url을 setAttribute
                preview[i].setAttribute("src", e.target.result);
                
                // 리뷰이미지영역 갯수 +1
                reviewImgCount++;

                // 기존에 있던 이미지의 아이디 지우고
                // 이미지 아이디는 이미지 순서별로 다르니까 지워줘야함
                inputImage[i].removeAttribute("id");

                // 리뷰이미지 div 생성 함수
                addReviewImg();
            }
        } else { // 이미지 파일이 undefined 일때 프리뷰의 result url remove
            preview[i].removeAttribute("src");
        }

    });

    // 미리 보기 삭제 버튼 눌렀을 때
    deleteImage[i].addEventListener("click", function(){
    
        // 미리보기 이미지 안에 소스(src)가 존재하는 경우에만
        if( preview[i].getAttribute("src") != null){
            
            // 기존에 존재하던 미리보기 이미지 소스(src) 삭제
            preview[i].removeAttribute("src");
    
            // 입력한 이미지 값 삭제
            inputImage[i].value = "";
            
            // 이미지 삭제 리스트에 추가
/*             deleteSet.add[i]; */

            // 리뷰이미지 클래스(프리뷰+인풋이미지+삭제버튼을 포함한 div)가 2개이상 있을 때
            if(document.getElementsByClassName("reviewImg").length > 1){
                this.parentElement.remove(); // 리뷰이미지 div 삭제

                reviewImgCount--; // 리뷰 이미지 영역 -1

                if(reviewImgCount == 2){ // 리뷰이미지 영역이 2개일때 삭제 버튼을 눌렀을 경우
                    addReviewImg();
                    // 리뷰이미지 미리보기 area 생성
                    // 남은 하나를 지워도 추가 생성된 div에서 이미지를 다시 추가할 수 있기 때문
                }

            }else{ //리뷰이미지 클래스(프리뷰+인풋이미지+삭제버튼을 포함한 div)가 1개이거나 없을때
                preview[i].removeAttribute("src"); // 미리보기 이미지 소스(src) 삭제
                this.previousElementSibling.value = ""; // 인풋이미지 값 삭제
                // 2개일때 만들어둔 div에서 다시 이미지 추가 가능
            }
        }
    
    });
}


// 리뷰이미지 조립 함수
function addReviewImg(){

    // 리뷰이미지 클래스(프리뷰+인풋이미지+삭제버튼을 포함한 div)가 3개 이하일 때만 생성한다
    // 이미지는 3개까지만 입력 가능하므로
    if(document.getElementsByClassName("reviewImg").length < 3){

        // reviewImg
        const div = document.createElement("div");
        div.classList.add("reviewImg");
        
        const label = document.createElement("label");
        label.setAttribute("for" , "img" + idCount);
        // idCount 이미지 id에 붙이는 번호(하나씩 추가될때마다 +1)
        
        // 미리보기(preview)
        const img = document.createElement("img");
        img.classList.add("preview");
    
        label.append(img);
    
        // inputImage
        const input = document.createElement("input");
        input.classList.add("inputImage");
        input.setAttribute("type", "file");
        input.setAttribute("name", "images");
        input.setAttribute("accept", "image/*");
        input.setAttribute("id", "img" + idCount);
    
    
        // delete-image
        const span = document.createElement("span");
        span.classList.add("delete-image");
        span.innerHTML = "&times;";
    
        div.append(label, input, span);
        idCount++; // div 조립 하나씩 끝날때마다 idCount++
    
        document.querySelector(".rw-image-area").append(div); // 조립 끝난 reviewImg div를 부모 div에 append
    
        // 인풋이미지 함수, 위에 작성한 함수와 같음.
        // 새로 조립할때마다 같이 만들어줘야 비동기로 생성된 div에서도 동일하게 함수가 작동.
        input.addEventListener("change", function(){
    
            if(this.files[0] != undefined){
                const reader = new FileReader();
                reader.readAsDataURL(this.files[0]);
    
                reader.onload = function(e){ 
                    input.previousElementSibling.children[0].setAttribute("src", e.target.result);
                    reviewImgCount++;

                    input.removeAttribute("id");

                    addReviewImg();
                }
            } else {
                input.previousElementSibling.children[0].removeAttribute("src");
            }
    
        });

        // 미리보기 삭제버튼 함수. 마찬가지로 위에 작성한 함수와 같음.
        span.addEventListener("click", function(){
            const preview = this.previousElementSibling.previousElementSibling.children[0];

            if( preview.getAttribute("src") != null){
                
                preview.removeAttribute("src");
        
                if(document.getElementsByClassName("reviewImg").length > 1){
                    this.parentElement.remove();

                    reviewImgCount--;
                    if(reviewImgCount == 2){
                        addReviewImg();
                    }
                }else{
                    preview.removeAttribute("src");
                    this.previousElementSibling.value = "";
                }
            }
        });  
    }
}

// 리뷰 insert전 유효성 검사
const rating = document.getElementById("rating");
const reviewContent = document.getElementById("reviewContent");

function rwValidate(){

    // 별점
    if(rating.value==0){
        alert("별점을 1점 이상 입력하세요.");
        rating.focus();
        return false;
    }

    // 리뷰 내용
    if(reviewContent.value.trim().length == 0) {
        alert("리뷰 내용을 입력하세요.");
        reviewContent.focus();
        return false;
    }  else {
        const reg = /^[a-zA-Zㄱ-힣0-9~!.@#$%^&*()_+|<>?:{}-\s]{5,1000}$/;
        if(!reg.test(reviewContent.value)) {
            alert("리뷰 내용을 5자 이상 입력해주세요.");
            reviewContent.focus();
            return false;
        }
    }
    
}