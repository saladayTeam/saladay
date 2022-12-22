// 즉시 실행
(()=>{
    const thumbnailList = document.getElementsByClassName("list-thumbnail");

    if(thumbnailList.length>0){ // 썸네일이 존재할 경우

        // Modal 관련 요소 얻어오기
        const modal= document.querySelector(".review-modal");
        const modalClose=document.getElementById("modal-close");

        // 썸네일 요소에 클릭 이벤트 추가
        for(let th of thumbnailList){
            th.addEventListener("click", ()=>{
                modal.style.display = "flex";
            })
        }

        // 모달창 닫기 버튼
        modalClose.addEventListener("click", () =>{
            modal.style.display="none";
        });

    }
})();


const reviewStar = document.querySelector(".review-detail-star");
const reviewDate = document.querySelector(".review-detail-date");
const reviewSalad = document.querySelector(".review-detail-salad");
const reviewNickname = document.querySelector(".review-detail-nickname");
const reviewText = document.querySelector(".review-detail-text");
const reviewLike = document.querySelector(".review-detail-likeCount");

function selectReviewDetail(reviewNo){

    //reviewNo 전역 변수 사용
    $.ajax({

        url : "/review/detail",
        data : {"reviewNo" : reviewNo},
        type : "GET",
        dataType : "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환
        success : function(rDetail){
            // rDetail : 반환 받은 리뷰 상세 조회 내용 
            console.log(rDetail);
            reviewStar.innerText = rDetail[0].rating;
            reviewDate.innerText = rDetail[0].reviewDate;
            reviewSalad.innerText = rDetail[0].menuName;
            reviewNickname.innerText = rDetail[0].memberNickname;
            reviewText.innerHTML = rDetail[0].reviewContent;
            reviewLike.innerText = rDetail[0].likeCount;

        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });
}

