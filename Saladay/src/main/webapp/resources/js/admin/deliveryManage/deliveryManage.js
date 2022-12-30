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


