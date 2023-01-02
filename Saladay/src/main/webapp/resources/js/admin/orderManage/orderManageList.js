// 주문상태 검색한 경우 selected option 고정
(()=>{
    const orderStatus = document.getElementById("orderStatus").className;
    $("#orderStatus").val(orderStatus).prop('selected', true);
})();

// 아임포트로 이동
const goToImport = document.getElementById("goToImport");
if(goToImport !=null){
    goToImport.addEventListener("click",()=>{

        window.open('https://classic-admin.iamport.kr/users/login', '_blank');
    });

}