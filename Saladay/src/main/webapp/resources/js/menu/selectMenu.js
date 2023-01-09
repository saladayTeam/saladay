// 선택한 상품
const temp = [];

const x = [3,5,7,3,5,7];

for(let i=0 ; i<x[packageNo-1] ; i++){
  temp.push({});
}


const toppingName = document.getElementsByClassName("topping-name");
const toppingPrice = document.getElementsByClassName("topping-price");

// var optionList = ${optionList};

// 상품 가격 총합
let sum = 0;

// 옵션 추가, 감소 버튼
$(document).ready(function() {
    $('.minus').click(function () {
      var $input = $(this).parent().find('input');
      var count = parseInt($input.val()) - 1;
      let slideNo = $input.attr("slide");

      count = count < 1 ? 0 : count;
      $input.val(count);
      $input.change();
      
        // 여기서부터
        // 토핑이름 가져오기
        var toppingName = $(this).parent().prev().prev().text().trim();
        // console.log(toppingName);
        // 토핑가격 가져오기
        var toppingPrice = $(this).parent().prev().text().trim();
        // 토핑가격 숫자만
        var number = toppingPrice.replace(/[^0-9]/g, '');
        // 추가한 토핑 개수
        var toppingCount = parseInt($input.val());

        // console.log('토핑개수 : ', toppingCount);

        // console.log(toppingPrice);
        // console.log(temp);

        // 배열[토핑이름] = {가격 : ?, 담긴개수 : ?}
        // temp[toppingName] = {price : number, amount : toppingCount};
        
        // 담은 토핑객체가 없지않거나 0보다 많을때
        if(temp[slideNo][toppingName] != undefined && temp[slideNo][toppingName].amount > 0){

          temp[slideNo][toppingName].amount--;

        }else if(temp[slideNo][toppingName].amount == 0){

          // 제이쿼리 삭제 코드
          delete temp[slideNo][toppingName];
        }
        // 여기까지 추가
        
        sumPrice()
        return false;
      });

    $('.plus').click(function () {

      var $input = $(this).parent().find('input');
      var count = parseInt($input.val()) + 1;
      let slideNo = $input.attr("slide");


      count = 5 < count ? 5 : count;
      // $input.val(parseInt($input.val()) + 1);
      $input.val(count);
      // $input.change();

      // 추가한 토핑 이름 가져오기
      var toppingName = $(this).parent().prev().prev().text().trim();
      // console.log('추가한 토핑 = ', toppingName);

      // 추가한 토핑 가격 가져오기
      var toppingPrice = $(this).parent().prev().text().trim();

      // 토핑가격 숫자만
      var number = toppingPrice.replace(/[^0-9]/g, '');

      // 추가한 토핑 개수
      var toppingCount = parseInt($input.val());
      // console.log('토핑개수 : ', toppingCount);
      
      // 배열[토핑이름] = {가격 : ?, 담긴개수 : ?}
      // temp[toppingName] = {price : number, amount : toppingCount};
      
      if(temp[slideNo][toppingName] == undefined){
        temp[slideNo][toppingName] = {price : number, amount : toppingCount};
      }else if(temp[slideNo][toppingName].amount < 5){
          temp[slideNo][toppingName].amount++;
      }
      
      // 가격(숫자)만 가져오기

      // console.log('토핑가격 = ', toppingPrice);
      // console.log("담은토핑객체 = ", temp);
      // console.log("담은토핑 개수 = ", count);
      // console.log("토핑가격 숫자만 = ", number);
      // console.log("토핑가격 숫자만 = ", temp[toppingName].price);

      // sum += Number(temp[toppingName].price);
      // console.log(sum);

      // for (var i = 0; i < temp[toppingName]; i++){
      //   result += temp[toppingName].price[i];

      //   // return result;
      // }
      // console.log('우짤',result);

      sumPrice()
      return false;
    });
});


function sumPrice(){
  let sum = 0;

  for(let i=0 ; i<temp.length ; i++){

    for(key in temp[i]){
      sum += Number(temp[i][key].price) * Number(temp[i][key].amount);
    }

    
    // if(Number(temp[i][key].amount) > 5){
  
    // }else{
  
    // }
    document.getElementById("totalPrice").innerText = sum.toLocaleString(); // toLocalString = 숫자에 , 찍어줌
  }

}



// 슬라이드 코드
window.onload = function() {
    const kindWrap =  document.querySelector('.kind_wrap');
    const slider = kindWrap.querySelector('.slider');
    const slideLis = slider.querySelectorAll('.slide')
    const moveButton = kindWrap.querySelector('.arrow');
  
    /* ul 넓이 계산해 주기 */
    const liWidth = slideLis[0].clientWidth; // li 1개의 넓이
    const sliderWidth = liWidth * slideLis.length; // li개수만큼의 넓이
    slider.style.width = `${sliderWidth}px` ; // 전체 ul 넓이 선언해줌
  
    /* 리스너 설치하기 */
    let currentIdx = 0; // 슬라이드 현재 번호
    let translate = 0; // 슬라이드 위치 값
    moveButton.addEventListener('click', moveSlide);
  
    function moveSlide(event) {
      event.preventDefault();
        // 다음 버튼을 눌렀을때
      if (event.target.className === 'next') {
          // console.log(`${currentIdx} /  ${slideLis.length}`);
          window.scrollTo({ top: 440, behavior: "smooth" }); 
        if(currentIdx == slideLis.length -1){
            return;
        }


        // 슬라이드 현재 번호가 리스트의 길이의 -1이 아닐 경우
        if (currentIdx !== slideLis.length -1) {
            // 슬라이드 현재위치값 = - 리스트넓이
          translate -= liWidth;
          slider.style.transform = `translateX(${translate}px)`;
            // 슬라이드 현재번호 + 1
          currentIdx += 1;
        //   currentIdx = slideLis[0];
        }
      } else if (event.target.className === 'prev') {
          if (currentIdx !== 0) {
            window.scrollTo({ top: 440, behavior: "smooth" }); 
            translate += liWidth;
            slider.style.transform = `translateX(${translate}px)`;
            currentIdx -= 1;
          }
        }
    }

    // function moveSlide(event) {
    //     event.preventDefault();
    //     if (event.target.className === 'next') {
    //       if (currentIdx === slideLis.length - 1) false;
    //         currentIdx++;
    //         translate += -liWidth;
    //         slider.style.left = `${translate}px`;
    //     } else {
    //       if (currentIdx === 0) return;
    //         currentIdx--;
    //         translate += liWidth;
    //         slider.style.left = `${translate}px`;
    //     }
    //   }
  
    $(function(){
    
        // 메뉴이름 클릭시
        $('.menu-box li a').click(function(){
            // 현재 보고 있는 li의 href(이미지경로) 가져옴
            $('.menu-img img').eq(currentIdx).attr('src',$(this).attr('href'))

            // $(this).css("background","#17633D");
            // $(this).css("color","white");
            // $(this).css("font-weight","bold");
            // $(this).css("border-color","#17633D");
            
            // 메뉴이름 = 클릭한곳의 text
            var mName = $(this).text();
            // eq = 제이쿼리 배열 
            // 제이쿼리 text == innerText
            // 제이쿼리 html == innerHtml
            $('.menu-title').eq(currentIdx).text(mName);
            $('.menu-detail').eq(currentIdx).html($(this).next().val())
            $('.menu-price').eq(currentIdx).text($(this).next().next().next().val().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
            $('.menuNo').eq(currentIdx).val($(this).next().next().val()) // 메뉴 번호 넘기기 위해서 .val사용
            // console.log("aaaaa", $('.menu-detail').val());
            // console.log("vvvvvvv",$('.menuNo').val());
            // console.log( $('.menu-title'));

            var menuPrice = $(this).next().next().next().val();
            let slideNo = $(this).attr("slide");


            // console.log(menuPrice);

            if(temp[slideNo]['salad'] == undefined){

              temp[slideNo]['salad'] = {price : menuPrice, amount : 1};
              
            }else if(temp[slideNo]['salad'].amount == 1){
              
              delete temp[slideNo]['salad'];
              temp[slideNo]['salad'] = {price : menuPrice, amount : 1};

            }

            // console.log(temp);
            sumPrice()

            return false;
        })
    })
}

// const menuBox = document.querySelectorAll('.menu-box');

// function select(ulEl, liEl){
//   Array.from(ulEl.children).forEach(
//     v => v.idList.remove('select')
//   )
//   if(liEl) liEl.attr.add('select');
// }

// menuBox.addEventListener('click', e=>{
//   const select = e.target;
//   select(menuBox, select);
// })

// 메뉴버튼 클릭 시 버튼 css 변경
$('.menu-box li a').click(function(){
  // eq(currentIdx).$('.menu-box li a').removeClass("select");
  
  // $('.menu-box li a').removeClass("select");

  $(this).parent().parent().find("a").removeClass("select");

  $(this).addClass('select');

  
  // if($(this).hasClass('select')){
  //   $(this).removeClass('select');
  //   // $(this).css("color", "#666666");
  // }else{
  //   // $(this).css("color", "white");
  // }

  // sumPrice()

});



// 장바구니 담기 버튼
const menuNo = document.getElementsByClassName("menuNo");
const optionNo = document.getElementsByClassName("optionNo");
const optionCount = document.getElementsByClassName("optionCount");

function selectValidate() {
  // console.log("메뉴선택확인");
  
  if(loginMemberNo==''){
    alert("로그인 후 이용해주세요.")
    location.href = "/member/login";
    return false;
  }  

  if(cartNo == '') { // 장바구니 내역이 없을 때
  
    for(let i=0; i < menuNo.length; i++) {
      if(menuNo[i].value.trim() == ''){
        alert(i+1 +"번째 메뉴가 선택되지 않았습니다.");
        return false;
      }
    }

    return true;

  } else { // 장바구니 내역이 있을 때
    
    for(let i=0; i < menuNo.length; i++) { // 메뉴 선택되었는지 확인
      if(menuNo[i].value.trim() == ''){
        alert(i+1 +"번째 메뉴가 선택되지 않았습니다.");
        return false;
      }
    }
    
    // 메뉴가 다 선택되면, 이전 장바구니 내역은 지우고 새로 추가
    if(confirm("장바구니에 이미 선택하신 내역이 존재합니다. 이전 내역을 취소하시겠습니까?")){
      return true;
    
    } else{
      location.href = "#";
      return false;
    }
  }
}


// form태그
const addCartForm = document.getElementById("addCartForm");

// 주문하기 버튼
const orderBtn = document.getElementById("order-btn");
if(orderBtn != null) {
  orderBtn.addEventListener("click", ()=>{
    
    if(loginMemberNo==''){
      alert("로그인 후 이용해주세요.")
      location.href = "/member/login";
    
    } else { // 로그인 되어있을 때
      
      for(let i=0; i < menuNo.length; i++) { // 메뉴 선택되었는지 확인
        if(menuNo[i].value.trim() == ''){
          alert(i+1 +"번째 메뉴가 선택되지 않았습니다.");
          return false;
        }
      }

      
      addCartForm.setAttribute("action", "/order");
      addCartForm.submit();

    }
  })
}



