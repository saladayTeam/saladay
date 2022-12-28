console.log("옵션관리");

const allCheck = document.getElementById("allCheck");
const chks = document.getElementsByName("rowCheck");

// 즉시 실행 함수()();
(function() {
    // 전체 선택 및 해제
    allCheck.addEventListener("click", function(){
        console.log("여긴 옵션");
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
        alert("선택된 옵션이 없습니다.");
    
    } else {
        if(confirm("정말로 삭제하시겠습니까?")) {
            // console.log("ajax연결해서 삭제하기");

            $.ajax({
                url : "/admin/deleteOption",
                type : "post",
                data : {valueArr:valueArr},
                success : function() {
                    alert("선택하신 옵션이 삭제되었습니다.");
                    location.reload("/admin/updateOption"); // 페이지 새로고침
                },
                error: function(){
                    alert("옵션 삭제 실패")
                }
            })
        }
    }
}