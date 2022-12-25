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
const reviewHeart = document.getElementById("reviewHeart");

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
            console.log(rDetail);

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
                reviewHeart.classList.remove("fa-solid");
                reviewHeart.classList.add("fa-heart");
                reviewHeart.classList.add("fa-regular");
                /* reviewHeart.setAttribute("onclick", "reviewLikeUp("+rDetail[0].reviewNo+", "+memberNo+")"); */

            } else{ // 좋아요를 누른 리뷰 == 채워진 하트
                reviewHeart.classList.remove("fa-regular");
                reviewHeart.classList.add("fa-heart");
                reviewHeart.classList.add("fa-solid");
                /* reviewHeart.setAttribute("onclick", "reviewLikeDown("+rDetail[0].reviewNo+", "+memberNo+")"); */
            }

            if (reviewHeart != null) {

                reviewHeart.addEventListener("click", e =>{
                    // 로그인 상태가 아닌 경우
                    if(memberNo==""){
                        alert("로그인 후 이용해주세요.")
                        return;
                    }
            
                    // 로그인 상태이면서 좋아요 상태가 아닌 경우
                    if(reviewHeart.classList.contains('fa-regular')){ //빈하트인 경우 좋아요 증가
            
                        $.ajax({
                            url : "/review/likeUp",
                            data : {"reviewNo" : rDetail[0].reviewNo , "memberNo" : memberNo},
                            type : "GET" ,
                            success : (result)=>{
                                if(result >0){ // 성공
            
                                    reviewHeart.classList.remove('fa-regular'); // 빈하트 클래스 삭제
                                    reviewHeart.classList.add('fa-solid'); // 채워진 하트 클래스 추가
                                    reviewLike.innerText = Number(reviewLike.innerText)+1; // 1증가
                                }else{ // 실패
                                    console.log("증가 실패");
                                }
                            },
                            error : ()=>{ console.log("증가 에러"); }
                        });
            
                    } else{ // 채워진 하트인 경우 좋아요 감소
                        $.ajax({
                            url : "/review/likeDown",
                            data : {"reviewNo" : rDetail[0].reviewNo , "memberNo" : memberNo},
                            type : "GET" ,
                            success : (result)=>{
                                if(result >0){ // 성공
                
                                    reviewHeart.classList.add('fa-regular'); // 빈하트 클래스 추가
                                    reviewHeart.classList.remove('fa-solid'); // 채워진 하트 클래스 삭제
                                    reviewLike.innerText = Number(reviewLike.innerText)-1; // 1감소
                                }else{ // 실패
                                    console.log("감소 실패");
                                }
                            },
                            error : ()=>{ console.log("감소 에러"); }
                        });   
                    }
                });
            }
        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });
}


//리뷰 삭제
function deleteReview(reviewNo){
    if( confirm("정말 삭제 하시겠습니까?") ){
        $.ajax({
            url : "/review/delete",
            data : {"reviewNo" : reviewNo},
            type : "GET",
            success: function(result){
                if(result > 0){
                    alert("리뷰가 삭제되었습니다");
                    modal.style.display="none";
                }else{
                    alert("삭제 실패");
                }
            },

            error : function(req, status, error){
                console.log("리뷰 삭제 실패")
                console.log(req.responseText);
            }
        });
    }
}
