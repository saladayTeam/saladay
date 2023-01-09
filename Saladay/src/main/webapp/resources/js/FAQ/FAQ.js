
// FAQ작성 버튼
const addBtn = document.getElementById("addBtn");

if( addBtn != null ){

    addBtn.addEventListener("click", function(){
        const options = "width=700, height=580, left=-200, top=-900";
        window.open("/FAQ/reg", "popupWindow", options);
    })
}


// 삭제버튼
const deleteFAQ=(faqNo)=>{
    if( confirm("선택한 내용을 삭제하겠습니까?") ){
        // console.log(faqNo);


    $.ajax({
        url : "/FAQ/delete",
        type : "POST",
        data : { "faqNo" : faqNo },
        success : () => {
            alert("선택한 내용이 삭제되었습니다.");
            location.reload("/FAQ"); // 페이지 새로고침
        },
        error : ()=> {
            alert("FAQ삭제 실패")
        }
    })
    }
}
    