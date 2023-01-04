// // 배송완료로 변경
// const changeBtn = document.getElementById("changeBtn");
// if (changeBtn != null) {
//     changeBtn.addEventListener("click", ()=>{

//         console.log("연결확인");

//         if(confirm("배송상태를 배송완료로 변경하시겠습니까?")) {
//             // /admin/orderManage/{orderNo}/delete GET방식
//             // 삭제 후 /admin/orderManage/{orderNo}
            
//             location.href = location.pathname + "/updateDelivery";
//             location.reload("/admin/deliveryManage"); // 페이지 새로고침
//         }
         
      

//     });

// }

const deliveryNo = document.getElementById("${delivery.deliveryNo}");

function changeBtn(deliveryNo){

    // const btn = document.getElementById("changeBtn");s

    // var value = $(this).prop("value");
    // var value = $(this).attr("value");
    // var value = $(this).value;
    // var value = $(this).find('value').val();
    // var value = $(this).value.val;
    // var value = btn.find('value').val();
    // var value = $(this).value;
    console.log("value : " + deliveryNo);

    if(confirm("배송완료로 변경하시겠습니까?")) {
        // /admin/orderManage/{orderNo}/delete GET방식
        // 삭제 후 /admin/orderManage/{orderNo}

        $.ajax({
            url : "/admin/updateDelivery",
            type : "get",
            data : {deliveryNo:deliveryNo},
            success : function() {
                alert("배송완료 됐습니다.");
                location.reload("/admin/deliveryManage"); // 페이지 새로고침
            },
            error: function(){
                alert("배송상태 변경 실패")
            }
        })
        
    }else{

        alert("취소잼");
    }

}

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

// selectbox 값 가져오기

const chks = document.getElementsByName("rowCheck");

$(document).ready(function(){
    $("#deliveryStatus").change(function(){
      // Value값 가져오기
      var deliveryCode = $("#deliveryStatus :selected").val();
    //   changeBtn.style.display = "flex";
      
      console.log(deliveryCode);
      
    });
  });
// 배송정보 수정
function updateDelivery(){
    var deliveryCode = $("#deliveryStatus :selected").val();
    const deliveryArr = new Array();
    const list = chks;
    
    for(let i=0; i<list.length; i++) { 
        if(list[i].checked){ // 선택된 내용을 배열에 저장
            deliveryArr.push(list[i].value);
        }
    }
    
    console.log(deliveryArr, deliveryCode);
    
    if(deliveryArr.length==0){
        alert("선택된 배송정보가 없습니다.");
    
    } else {
        if(confirm("배송정보를 수정 하시겠습니까?")) {
            $.ajax({
                url : "/admin/updateDelivery",
                type : "get",
                data : {deliveryArr:deliveryArr, deliveryCode:deliveryCode},
                success : function() {
                    alert("배송정보를 수정했습니다.");
                    location.reload(""); // 페이지 새로고침
                },
                error: function(){
                    alert("배송정보 수정을 실패했습니다.")
                }
            })
        }
    }
}
