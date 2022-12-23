
const myPageType = document.getElementsByName("myPageType");


for(let myPage of  myPageType){
    management.addEventListener("click", function(){

        //회원정보 수정
        if(myPage.value == 4){
            $.ajax({
                url : "/member/myPage/selectMyReview",
                type : "GET",
                dataType : "json",
                success : reportAll => {
                    console.log(reportAll);
                    console.log(reportAll[0]);
                    const reportList= document.getElementsByClassName("report-list")[0];
                    reportList.innerHTML = "";

                    for(let report of reportAll){
                        console.log(report);
                        //div 생성
                        const managementDetail = document.createElement("div");
                        managementDetail.className = "management-detail";
                        reportList.appendChild(managementDetail);

                        //div 안에 ul 생성
                        const managementUl = document.createElement("ul");
                        managementDetail.appendChild(managementUl);

                        //ul 안에 li 생성
                        const managementLi = document.createElement("li");
                        managementUl.appendChild(managementLi);
                        managementLi.innerText = "불량 회원 :" + report.memberNo;
                        
                        const managementLi2 = document.createElement("li");
                        managementUl.appendChild(managementLi2);
                        managementLi2.innerText = "리뷰 번호 : " + report.reviewNo;
                        
                        const managementLi3 = document.createElement("li");
                        managementUl.appendChild(managementLi3);
                        managementLi3.innerText ="신고 횟수 : " + report.reviewReportCount;

                        const managementLi4 = document.createElement("li");
                        managementUl.appendChild(managementLi4);
                        managementLi4.innerText = "신고된 리뷰 내용  : " + report.reviewContent;

                        const managementBtn = document.createElement("button");
                        managementBtn.className = "report-list-btn";
                        managementBtn.innerText = "블라인드";
                        managementUl.appendChild(managementBtn);
                    }
                },
                error : error => {
                    console.log(error);
                }
            })
        };
        //비밀번호 변경
        if(myPage.value == 2){
            $.ajax({
                url : "/management/selectBlind",
                type : "GET",
                dataType : "json",
                success : reportAll => {
                    console.log(reportAll);
                    console.log(reportAll[0]);
                    const reportList= document.getElementsByClassName("report-list")[0];
                    reportList.innerHTML = "";

                    for(let report of reportAll){
                        console.log(report);
                        //div 생성
                        const managementDetail = document.createElement("div");
                        managementDetail.className = "management-detail";
                        reportList.appendChild(managementDetail);

                        //div 안에 ul 생성
                        const managementUl = document.createElement("ul");
                        managementDetail.appendChild(managementUl);

                        //ul 안에 li 생성
                        const managementLi = document.createElement("li");
                        managementUl.appendChild(managementLi);
                        managementLi.innerText = "불량 회원 : " + report.memberNo;
                        
                        const managementLi2 = document.createElement("li");
                        managementUl.appendChild(managementLi2);
                        managementLi2.innerText = "블라인드 리뷰 횟수 : " + report.blindReviewCount;
                        
                        const managementBtn = document.createElement("button");
                        managementBtn.className = "secession-btn";
                        managementBtn.innerText = "회원 기능 정지";
                        managementUl.appendChild(managementBtn);
                    }
                },
                error : error => {
                    console.log(error);
                }
            })
        };
        //주문내역
        if(myPage.value == 3){
            $.ajax({
                url : "/management/selectBanMember",
                type : "GET",
                dataType : "json",
                success : reportAll => {
                    console.log(reportAll);
                    console.log(reportAll[0]);
                    const reportList= document.getElementsByClassName("report-list")[0];
                    reportList.innerHTML = "";

                    for(let report of reportAll){
                        console.log(report);
                        //div 생성
                        const managementDetail = document.createElement("div");
                        managementDetail.className = "management-detail";
                        reportList.appendChild(managementDetail);

                        //div 안에 ul 생성
                        const managementUl = document.createElement("ul");
                        managementDetail.appendChild(managementUl);

                        //ul 안에 li 생성
                        const managementLi = document.createElement("li");
                        managementUl.appendChild(managementLi);
                        managementLi.innerText = "불량 회원 : " + report.memberNo;
                        
                        const managementLi2 = document.createElement("li");
                        managementUl.appendChild(managementLi2);
                        managementLi2.innerText = "블라인드 리뷰 횟수 : " + report.blindReviewCount;

                        const managementBtn = document.createElement("button");
                        managementBtn.className = "secession-cancel-btn";
                        managementBtn.innerText = "회원 정지 취소";
                        managementUl.appendChild(managementBtn);

                    }
                },
                error : error => {
                    console.log(error);
                }
            })

        };
        });

    };
