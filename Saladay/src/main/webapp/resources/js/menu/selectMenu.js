// 옵션 추가, 감소 버튼
$(document).ready(function() {
    $('.minus').click(function () {
        var $input = $(this).parent().find('input');
        var count = parseInt($input.val()) - 1;
        count = count < 1 ? 0 : count;
        $input.val(count);
        $input.change();
        return false;
    });
    $('.plus').click(function () {
        var $input = $(this).parent().find('input');
        var count = parseInt($input.val()) + 1;
        // $input.val(parseInt($input.val()) + 1);
        count = 5 < count ? 5 : count;
        $input.val(count);
        $input.change();
        return false;
    });
});



// 슬라이드 코드
window.onload = function() {
    const kindWrap =  document.querySelector('.kind_wrap');
    const slider = kindWrap.querySelector('.slider');
    const slideLis = slider.querySelectorAll('.slide')
    const moveButton = kindWrap.querySelector('.arrow');
  
    /* ul 넓이 계산해 주기 */
    const liWidth = slideLis[0].clientWidth;
    const sliderWidth = liWidth * slideLis.length;
    slider.style.width = `${sliderWidth}px` ;
  
    /* 리스너 설치하기 */
    let currentIdx = 0; // 슬라이드 현재 번호
    let translate = 0; // 슬라이드 위치 값
    moveButton.addEventListener('click', moveSlide);
  
    function moveSlide(event) {
      event.preventDefault();
        // 다음 버튼을 눌렀을때
      if (event.target.className === 'next') {
          console.log(`${currentIdx} /  ${slideLis.length}`);
          window.scrollTo({ top: 100, behavior: "smooth" }); 
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
            window.scrollTo({ top: 100, behavior: "smooth" }); 
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
    
        $('.menu-box li a').click(function(){
            $('.menu-img img').eq(currentIdx).attr('src',$(this).attr('href'))
            // console.log($('.menu-name a'))

            // $(this).css("background","#17633D");
            // $(this).css("color","white");
            // $(this).css("font-weight","bold");
            // $(this).css("border-color","#17633D");
            
            var mName = $(this).text();
            $('.menu-title').eq(currentIdx).text(mName);
            $('.menu-detail').eq(currentIdx).text($(this).next().val())
            $('.menuNo').eq(currentIdx).val($(this).next().next().val()) // 메뉴 번호 넘기기 위해서 .val사용
            // console.log("aaaaa", $('.menu-detail').val());
            // console.log("vvvvvvv",$('.menuNo').val());
            // console.log( $('.menu-title'));

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

});



// 장바구니 담기 버튼
const menuNo = document.getElementsByClassName("menuNo");
const optionNo = document.getElementsByClassName("optionNo");
const optionCount = document.getElementsByClassName("optionCount");

function selectValidate() {
  console.log("메뉴선택확인");
  
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

