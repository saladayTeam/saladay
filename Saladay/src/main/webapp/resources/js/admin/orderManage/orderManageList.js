// 주문상태 검색한 경우 selected option 고정
(()=>{
    const orderStatus = document.getElementById("orderStatus").className;
    $("#orderStatus").val(orderStatus).prop('selected', true);
})();