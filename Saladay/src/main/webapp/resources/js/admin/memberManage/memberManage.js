console.log("회원관리");

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


// 회원탈퇴처리
function secessionValue(){
    const memberArr = new Array();
    const list = chks;
    
    for(let i=0; i<list.length; i++) { 
        if(list[i].checked){ // 선택된 내용을 배열에 저장
            memberArr.push(list[i].value);
        }
    }
    
    console.log(memberArr);
    
    if(memberArr.length==0){
        alert("선택된 회원이 없습니다.");
    
    } else {
        if(confirm("탈퇴시키겠습니까?")) {
            $.ajax({
                url : "/admin/secession",
                type : "post",
                data : {memberArr:memberArr},
                success : function() {
                    alert("선택하신 회원이 탈퇴처리되었습니다.");
                    location.reload(""); // 페이지 새로고침
                },
                error: function(){
                    alert("실패")
                }
            })
        }
    }
}



