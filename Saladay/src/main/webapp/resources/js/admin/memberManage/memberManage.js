console.log("회원관리");

// 체크박스
$(document).ready(function() {
    $("#allCheck").click(function() {
		if($("#allCheck").is(":checked")) $("input[name=rowCheck]").prop("checked", true);
		else $("input[name=rowCheck]").prop("checked", false);
	});
    
    $("input[name=rowCheck]").click(function() {
        var total = $("input[name=rowCheck]").length;
        var checked = $("input[name=rowCheck]:checked").length;

        if(total != checked) $("#allCheck").prop("checked", false);
        else $("#allCheck").prop("checked", true); 
    }); 
});


// 회원탈퇴처리
function secessionValue(){
    const memberArr = new Array();
    const list = document.getElementsByName("rowCheck");
    
    for(let i=0; i<list.length; i++) { 
        if(list[i].checked){ // 선택된 내용을 배열에 저장
            memberArr.push(list[i].value);
        }
    }
    
    // console.log(memberArr);
    
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



