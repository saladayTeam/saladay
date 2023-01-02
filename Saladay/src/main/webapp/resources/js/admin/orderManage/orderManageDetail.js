// 주문한 메뉴 목록 상세 조회
const showIcon = document.getElementById("icon");
const showArea = document.querySelector(".show-area");

if (showIcon != null) {
    showIcon.addEventListener("change", () => {
    if (showIcon.checked) {
        showArea.style.display = "block";
    } else {
        showArea.style.display = "none";
    }
    });
}

// 주문 취소
const withdrawOrderBtn = document.getElementById("withdrawOrderBtn");
if (withdrawOrderBtn != null) {
    withdrawOrderBtn.addEventListener("click", ()=>{

        console.log("연결확인");

        if(orderDeleteFlag=='N'){

            if(confirm("취소요청이 등록되지 않은 주문건입니다. \n주문을 취소하시겠습니까?")) {
                // /admin/orderManage/{orderNo}/delete GET방식
                // 삭제 후 /admin/orderManage/{orderNo}
                
                location.href = location.pathname + "/delete";
            }

        } else{
            if(confirm("주문을 취소하시겠습니까?")) {
                
                location.href = location.pathname + "/delete";
            }
        }

    });

}
// 주문 취소 요청 철회
const cancleBtn = document.getElementById("cancleBtn");
if (cancleBtn != null) {
    cancleBtn.addEventListener("click", ()=>{

        if(confirm("고객의 취소 요청이 등록된 주문건입니다. \n요청을 철회하시겠습니까?")) {
            // /admin/orderManage/{orderNo}/update GET방식
            // 삭제 후 /admin/orderManage/{orderNo}
            
            location.href = location.pathname + "/update";
        }
    });

}