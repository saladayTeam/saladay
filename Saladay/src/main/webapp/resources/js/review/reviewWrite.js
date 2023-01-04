/* 리뷰 별점 드래그 */
const drawStar = (target) => {
    document.querySelector(".rw-star span").style.width = `${target.value * 20}%`;
    console.log(target.value);
}

/* 리뷰 이미지 */
const inputImage = document.getElementsByClassName("inputImage");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-image");

/* 이미지 삭제 관련 */
const deleteList = document.getElementById("deleteList");
const deleteSet = new Set();


let idCount = 1;
let reviewImgCount = 0;


// 이미지 파일이 선택됐을 때
for(let i=0; i<inputImage.length; i++){

    inputImage[i].addEventListener("change", function(){

        if(this.files[0] != undefined){
            const reader = new FileReader();
            reader.readAsDataURL(this.files[0]);

            reader.onload = function(e){ 
                preview[i].setAttribute("src", e.target.result);
                
                reviewImgCount++;

                inputImage[i].removeAttribute("id");

                addReviewImg();
            }
        } else {
            preview[i].removeAttribute("src");
        }

    });

    // 미리 보기 삭제 버튼
    deleteImage[i].addEventListener("click", function(){
    
        // 미리보기가 존재하는 경우에만
        if( preview[i].getAttribute("src") != null){
            
            preview[i].removeAttribute("src");
    
            inputImage[i].value = "";
            
            deleteSet.add[i];

            if(document.getElementsByClassName("reviewImg").length > 1){
                this.parentElement.remove();

                reviewImgCount--;

                if(reviewImgCount == 2){
                    addReviewImg();
                }
            }else{
                preview[i].removeAttribute("src");
                this.previousElementSibling.value = "";
            }
        }
    
    });
}



function addReviewImg(){

    if(document.getElementsByClassName("reviewImg").length < 3){
        const div = document.createElement("div");
        div.classList.add("reviewImg");
        
        const label = document.createElement("label");
        label.setAttribute("for" , "img" + idCount);
        
        const img = document.createElement("img");
        img.classList.add("preview");
    
        label.append(img);
    
    
        const input = document.createElement("input");
        input.classList.add("inputImage");
        input.setAttribute("type", "file");
        input.setAttribute("name", "images");
        input.setAttribute("accept", "image/*");
        input.setAttribute("id", "img" + idCount);
    
    
        const span = document.createElement("span");
        span.classList.add("delete-image");
        span.innerHTML = "&times;";
    
        div.append(label, input, span);
        idCount++;
    
        document.querySelector(".rw-image-area").append(div);
    
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

        span.addEventListener("click", function(){
            const preview = this.previousElementSibling.previousElementSibling.children[0];
            //미리보기가 존재하는 경우에만
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