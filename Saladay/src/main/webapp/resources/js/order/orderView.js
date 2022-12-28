const myOrderView=document.getElementById("myOrderView");
const continueShopping=document.getElementById("continueShopping");

myOrderView.addEventListener("click",()=>{
    location.href="/member/myPage/selectMyOrder";
})

continueShopping.addEventListener("click",()=>{
    location.href="/menu/packageList";
})