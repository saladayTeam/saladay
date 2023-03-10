// Modal 관련 요소 얻어오기
const modal= document.querySelector(".review-modal");
const modalClose=document.getElementById("modal-close");

// 리뷰 상세조회 Modal 즉시 실행
(()=>{
    const thumbnailList = document.getElementsByClassName("list-thumbnail");

    if(thumbnailList.length>0){ // 썸네일이 존재할 경우
        
        // 썸네일 요소에 클릭 이벤트 추가
        for(let rd of thumbnailList){
            rd.addEventListener("click", ()=>{
                modal.style.display = "flex";
            })
        }
        // Modal 닫기 버튼
        modalClose.addEventListener("click", () =>{
            modal.style.display="none";
            location.reload("");
        });
    }
})();


// 리뷰 상세조회 요소 얻어오기
const reviewStar = document.querySelector(".review-detail-star");
const reviewDate = document.querySelector(".review-detail-date");
const reviewSalad = document.querySelector(".review-detail-salad");
const reviewNickname = document.querySelector(".review-detail-nickname");
const reviewText = document.querySelector(".review-detail-text");
const reviewLike = document.querySelector(".review-detail-likeCount");
const indicators = document.querySelector(".carousel-indicators");
const prev = document.querySelector(".carousel-control-prev");
const next = document.querySelector(".carousel-control-next");
const heartArea = document.getElementById("heart-area");
const reviewHeart = document.getElementById("reviewHeart");

// 첨부 이미지 유무를 확인하는 변수
// true : 첨부 이미지 있음, false : 첨부 이미지 없음
let imgCheck = false;

// 리뷰 이미지 클릭시 실행
function selectReviewDetail(reviewNo, reviewMemberNo){

    //reviewNo 전역 변수 사용
    $.ajax({

        url : "/review/detail",
        data : {"reviewNo" : reviewNo, "memberNo" : reviewMemberNo},
        type : "GET",
        dataType : "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환
        success : function(rDetail){
            // rDetail : 반환 받은 리뷰 상세 조회 내용 
            // console.log(rDetail);
            // console.log(rDetail[0].imageList);

            // 이미지 슬라이드 부분
            const carouselInner = document.getElementsByClassName("carousel-inner")[0];
            carouselInner.innerHTML = "";
            
            /* 이미지가 2개 이상일 경우 */
            if(rDetail[0].imageList.length != 0){
                for(let i = 0; i<rDetail[0].imageList.length; i++){
                    const carouselItem = document.createElement("div");
                    carouselItem.classList.add("carousel-item");
                    
                    if(i==0){
                        carouselItem.classList.add("active");
                    }
                    
                    const image = document.createElement("img");
                    image.setAttribute("src", rDetail[0].imageList[i].imagePath + rDetail[0].imageList[i].imageRename);
                   /*  image.classList.add("d-block"); */
                    /* image.classList.add("w-100"); */
                    image.classList.add("review-images");

                    carouselItem.append(image);
                    carouselInner.append(carouselItem);
                    
                    /* 버튼 다시 보이게 처리 */
                    indicators.classList.remove("rd-hidden");
                    prev.classList.remove("rd-hidden");
                    next.classList.remove("rd-hidden");
                    imgCheck = true;
                }
            }

            /* 이미지가 1개일 경우 */
            if(rDetail[0].imageList.length == 1){
                for(let i = 0; i<rDetail[0].imageList.length; i++){
                    const carouselItem = document.createElement("div");
                    carouselItem.classList.add("carousel-item");
                    
                    if(i==0){
                        carouselItem.classList.add("active");
                    }
                    
                    const image = document.createElement("img");
                    image.setAttribute("src", rDetail[0].imageList[i].imagePath + rDetail[0].imageList[i].imageRename);
                    /* image.classList.add("d-block"); */
                    /* image.classList.add("w-100"); */
                    image.classList.add("review-images");

                    carouselItem.append(image);
                    carouselInner.append(carouselItem);
                }
                /* 버튼들 삭제 */
                indicators.classList.add("rd-hidden");
                prev.classList.add("rd-hidden");
                next.classList.add("rd-hidden");
                imgCheck = true;
            } 
            
            /* 첨부 이미지가 없을 경우 기본 이미지 보여주는 코드 */
            if(rDetail[0].imageList.length == 0){

                carouselInner.innerHTML = "";
                const carouselItem = document.createElement("div");
                carouselItem.classList.add("carousel-item");
                carouselItem.classList.add("active");
                const image = document.createElement("img");
                image.setAttribute("src", "/resources/images/review/reviewImg.png");
                /* image.classList.add("d-block");
                image.classList.add("w-100"); */
                image.classList.add("review-images");

                carouselItem.append(image);
                carouselInner.append(carouselItem);

                /* 버튼들 삭제 */
                indicators.classList.add("rd-hidden");
                prev.classList.add("rd-hidden");
                next.classList.add("rd-hidden");
                imgCheck = false;
            }

            // 리뷰 삭제
            const deleteBtn = document.getElementById("review-modal-delete");
            if(memberNo == ""){
                deleteBtn.style.display="none";
            }
            if(memberNo !=reviewMemberNo){
                deleteBtn.style.display="none";
            }
            if(authority == ""){
                deleteBtn.style.display="none";
            }
            // 관리자 권한이거나 본인이작성한 리뷰인 경우
            // 리뷰 삭제 버튼 노출
            if(authority==99||memberNo==reviewMemberNo){
                deleteBtn.style.display="";
                deleteBtn.setAttribute("onclick", "deleteReview("+rDetail[0].reviewNo+")");
                // 개인 삭제
                // 관리자 삭제
            }

            // 리뷰 조회
            // 기존에 있던 별점 class 삭제
            reviewStar.classList.remove("5");
            reviewStar.classList.remove("4");
            reviewStar.classList.remove("3");
            reviewStar.classList.remove("2");
            reviewStar.classList.remove("1");

            reviewStar.classList.add(rDetail[0].rating);
            reviewDate.innerText = rDetail[0].reviewDate;
            reviewSalad.innerText = "[" + rDetail[0].menuName + "]";
            reviewNickname.innerText = rDetail[0].memberNickname;
            reviewText.innerHTML = rDetail[0].reviewContent;
            reviewLike.innerText = rDetail[0].likeCount;

            $(".1").html("&#9733; &#9734; &#9734; &#9734; &#9734;");
            $(".2").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
            $(".3").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
            $(".4").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
            $(".5").html("&#9733; &#9733; &#9733; &#9733; &#9733;");

            // 좋아요 여부 체크하여 빈하트/채워진 하트 출력
            if(rDetail[0].likeCheck==0){ // 로그인X이거나 좋아요를 누르지 않은 리뷰 == 빈하트
                // reviewHeart.classList.remove("fa-solid");
                // reviewHeart.classList.add("fa-heart");
                // reviewHeart.classList.add("fa-regular");

                // 폰트어썸X -> 이미지로 처리
                reviewHeart.setAttribute("src", "/resources/images/review/heart01.png");
                reviewHeart.classList.add("rd-heart");
                reviewHeart.classList.remove("fa-solid");
                reviewHeart.classList.add("fa-regular");

            } else{ // 좋아요를 누른 리뷰 == 채워진 하트
                reviewHeart.setAttribute("src", "/resources/images/review/heart02.png");
                reviewHeart.classList.add("rd-heart");
                reviewHeart.classList.remove("fa-regular");
                reviewHeart.classList.add("fa-solid");
            }

            // 리뷰하트에 리뷰번호 값 넣어두기
            reviewHeart.setAttribute("reviewNo", rDetail[0].reviewNo);
            reviewHeart.setAttribute("reviewCheck", rDetail[0].likeSelf);
        },
        error : function(req, status, error){
            // console.log("에러 발생");
            // console.log(req.responseText);
        }
    });
}


// 리뷰 삭제
function deleteReview(reviewNo){
    if( confirm("정말 삭제 하시겠습니까?") ){
        $.ajax({
            url : "/review/delete",
            data : {"reviewNo" : reviewNo},
            type : "GET",
            success: function(result){
                if(result > 0){
                    /* 리뷰 이미지가 존재할 때 같이 삭제*/
                    if(imgCheck){
                        $.ajax({
                            url : "/review/deleteImg",
                            data : {"reviewNo" : reviewNo},
                            type : "GET",
                            success: function(result){
                                if(result > 0){
                                    alert("리뷰가 삭제되었습니다");
                                    modal.style.display="none";
                                    location.reload("");
                                }else{
                                    alert("리뷰 삭제 실패");
                                }
                            },
                            error : function(req, status, error){
                                // console.log("리뷰 삭제 실패")
                                // console.log(req.responseText);
                            }
                        });
                    } else{
                        /* 리뷰 이미지가 없을 때 */
                        alert("리뷰가 삭제되었습니다");
                        modal.style.display="none";
                        location.reload("");
                    }

                }else{
                    // alert("삭제 실패");
                }
            },

            error : function(req, status, error){
                // console.log("리뷰 삭제 실패")
                // console.log(req.responseText);
            }
        });
    }
}

/* 좋아요 증가/감소 ajax 실행 */
if (reviewHeart != null) {

    reviewHeart.addEventListener("click", e =>{

        const reviewCheck = reviewHeart.getAttribute("reviewCheck");

        // 로그인 상태가 아닌 경우
        if(memberNo==""){
            alert("로그인 후 이용해주세요.")
            return;
        }

        if(reviewCheck==1){
            alert("본인이 작성한 리뷰는 좋아요를 누를 수 없습니다.")
            return;
        }

        // 로그인 상태이면서 좋아요 상태가 아닌 경우
        if(reviewHeart.classList.contains('fa-regular')){ //빈하트인 경우 좋아요 증가

            $.ajax({
                url : "/review/likeUp",
                data : {"reviewNo" : reviewHeart.getAttribute("reviewNo")
                , "memberNo" : memberNo},
                type : "GET" ,
                success : (result)=>{
                    if(result >0){ // 성공
                        reviewHeart.setAttribute("src", "/resources/images/review/heart02.png");
                        reviewHeart.classList.remove('fa-regular'); // 빈하트 클래스 삭제
                        reviewHeart.classList.add('fa-solid'); // 채워진 하트 클래스 추가
                        reviewLike.innerText = Number(reviewLike.innerText)+1; // 1증가
                    }else{ // 실패
                        //console.log("증가 실패");
                    }
                },
                error : ()=>{ //console.log("증가 에러"); 
                }
            });

        } else{ // 채워진 하트인 경우 좋아요 감소
            $.ajax({
                url : "/review/likeDown",
                data : {"reviewNo" : reviewHeart.getAttribute("reviewNo")
                , "memberNo" : memberNo},
                type : "GET" ,
                success : (result)=>{
                    if(result >0){ // 성공
                        reviewHeart.setAttribute("src", "/resources/images/review/heart01.png");
                        reviewHeart.classList.add('fa-regular'); // 빈하트 클래스 추가
                        reviewHeart.classList.remove('fa-solid'); // 채워진 하트 클래스 삭제
                        reviewLike.innerText = Number(reviewLike.innerText)-1; // 1감소
                    }else{ // 실패
                        // console.log("감소 실패");
                    }
                },
                error : ()=>{ // console.log("감소 에러"); 
                }
            });   
        }
    });
}

