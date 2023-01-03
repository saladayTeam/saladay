console.log("메뉴관리");

const allCheck = document.getElementById("allCheck");
const chks = document.getElementsByName("rowCheck");

// 즉시 실행 함수()();
(function() {
    // 전체 선택 및 해제
    allCheck.addEventListener("click", function(){
        console.log("전체선택");
        for(let i=0; i<chks.length; i++){
            chks[i].checked = this.checked;
        }
    });
})();

function deleteValue(){
    const valueArr = new Array();
    const list = chks;
    
    for(let i=0; i<list.length; i++) { 
        if(list[i].checked){ // 선택된 내용을 배열에 저장
            valueArr.push(list[i].value);
        }
    }
    
    console.log(valueArr);
    
    if(valueArr.length==0){
        alert("선택된 메뉴가 없습니다.");
    
    } else {
        if(confirm("정말로 삭제하시겠습니까?")) {
            // console.log("ajax연결해서 삭제하기");

            $.ajax({
                url : "/admin/deleteMenu",
                type : "post",
                data : {valueArr:valueArr},
                success : function() {
                    alert("선택하신 메뉴가 삭제되었습니다.");
                    location.reload("/admin/menuManage"); // 페이지 새로고침
                },
                error: function(){
                    alert("메뉴 삭제 실패")
                }
            })
        }
    }
}


// 메뉴 추가 팝업창
const addBtn = document.getElementById("addBtn");

if(addBtn!= null) {
    addBtn.addEventListener("click", function(){
        const options = "width=610, height=600, left=-200, top=-900";
        window.open("/admin/regist/menu", "popupWindow", options)
    })
}


// 메뉴명 클릭시 modal 출력 -> 즉시 실행 함수 사용 ()()
(()=>{
    const imgList = document.getElementsByClassName("m-img");

    if(imgList.length > 0) { 

        // Modal 관련 요소 얻어오기
        const modal = document.querySelector(".modal");
        const modalClose = document.getElementById("modal-close");
        const modalImage = document.getElementById("modal-image");

        // 클릭 이벤트 추가
        for(let i of imgList) {
            i.addEventListener("click", () => {

                // .show 없으면 추가 (있으면 삭제) => toggle 사용
                modal.classList.toggle("show"); 

                // 클릭한 이미지 src속성값을 얻어와서 modal-image의 src속성으로 세팅
                modalImage.setAttribute("src", i.getAttribute("src"));

            });
        }


        // x버튼 동작
        modalClose.addEventListener("click", () => {

            // 0.5초 후에 show, hide 클래스를 모두 제거
            setTimeout(()=>{
                modal.classList.remove("show", "hide");
            }, 500);
        });
        
    }
})();