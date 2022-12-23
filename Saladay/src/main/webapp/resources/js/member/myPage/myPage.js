
const myPageType = document.getElementsByName("myPageType");



for(let myPage of  myPageType){
    myPage.addEventListener("click", function(){

        //회원정보 수정
    if(myPage.value == 4){
            $.ajax({
                url : "/member/myPage/selectMyReview",
                type : "GET",
                dataType : "json",
                success : reviewAll => {
                    console.log(reviewAll);
                    console.log(reviewAll[0]);
                    const reviewList= document.getElementsByClassName("review-list")[0];
                    reviewList.innerHTML = "";

                    for(let review of reviewAll){
                        console.log(review);
                        //div 생성
                        const myReviewDetail = document.createElement("div");
                        myReviewDetail.className = "my-review-detail";
                        reviewList.appendChild(myReviewDetail);

                        //div 안에 ul 생성
                        const myReviewUl = document.createElement("ul");
                        myReviewDetail.appendChild(myReviewUl);

                        //ul 안에 li 생성
                        const myReviewLi1 = document.createElement("li");
                        myReviewUl.appendChild(myReviewLi1);
                        myReviewLi1.innerText = "리뷰 작성일 : " + review.reviewDate;

                        const myReviewLi2 = document.createElement("li");
                        myReviewUl.appendChild(myReviewLi2);
                        myReviewLi2.innerText = "평점 : " + review.rating;

                        const myReviewLi3 = document.createElement("li");
                        myReviewUl.appendChild(myReviewLi3);
                        myReviewLi3.innerText = review.menuName;

                        const myReviewLi4 = document.createElement("li");
                        myReviewUl.appendChild(myReviewLi4);
                        myReviewLi4.innerText = review.reviewContent;
                    }
                },
                error : error => {
                    console.log(error);
                }
            })
        };
    })
}


