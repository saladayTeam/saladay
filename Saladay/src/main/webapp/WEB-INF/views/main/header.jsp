<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>

  $(document).ready(function(){

	$('#package').hide();

	$('#subscription').mouseover(function(){
		$('#package').slideDown();

	});
	$('#package').mouseover(function(){
		$('#package').show();

	});
	$('#package').mouseleave(function(){
		$('#package').hide();

	});
	$('#subscription').mouseleave(function(){
		$('#package').hide();
	});
});
</script>
  <header>
    <section></section>
    <section>
      <a href="/">
        <img src="/resources/images/saladay-logo.png" alt="로고 이미지" width="135px" height="84px">
      </a>
    </section>
    <div>
      <ul class="header-menu">
        <c:choose>
          <c:when test="${loginMember.authority==99}">
            <li><a id="cart-img"><img src="/resources/images/main/shopping-cart.png"
                    alt=""
                    width="25px"
                    height="25px"
                    id="cart"/>
                </a>
              </li>
            <li><a href="/admin/dashboard">관리자 메뉴</a></li>
          </c:when>
          <c:otherwise>
            <li><a id="cart-img"><img src="/resources/images/main/shopping-cart.png"
                    alt=""
                    width="25px"
                    height="25px"
                    id="cart"/>
                </a>
              </li>
          </c:otherwise>
        </c:choose>
        
        <c:choose>
          <%-- 로그인 상태라면 --%>
          <c:when test="${not empty loginMember}">
            <li><a href="/member/logout">로그아웃</a></li>
            <li><a href="/member/myPage/selectMyOrder">마이페이지</a></li>
          </c:when>
          <%-- 로그인 상태가 아니라면 --%>
          <c:otherwise>
            <li><a href="/member/login">로그인</a></li>
            <li><a href="/member/signUp">회원가입</a></li>
          </c:otherwise>
        </c:choose>  
      </ul>
    </div>

  </header>
  <nav>
    <ul>
      <li><a href="/intro" id="a-type1">BRAND</a></li>
      <li><a href="/menu/menuList"  id="a-type2">MENU</a></li>
      <li><a href="/menu/packageList" id="a-type3">STORE</a></li>
      <li><a href="/nutrition"  id="a-type4">CALORIE</a></li>
      <li><a href="/review"  id="a-type5">REVIEW</a></li>
      <li><a href="/FAQ"  id="a-type6">FAQ</a></li> 
    </ul>
  </nav>

<script>
  const loginMemberNo="${loginMember.memberNo}";
  const cartNo="${cart.cartNo}";
  const checkCart = "${checkCart}"
</script>

<script>
  const carticon = document.getElementById("cart");
  if(carticon!=null){
    carticon.addEventListener("click", () => {
      if (loginMemberNo == "") {
        alert("로그인 후 이용해주세요");
        location.href = "/member/login";
      } else {
        location.href="/cart";
      }
    });
  }
</script>

    <!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "1aee3e26-c62c-45fb-a8c0-756b3bcfb327" //please fill with your plugin key
  });
</script>
<script>

let URL = window.location.href;
let splitURL = URL.split("/");
let lastURL = splitURL[splitURL.length - 1];
let secondURL = splitURL[splitURL.length - 2];
// URL주소가 맨 뒤가 ""일 때 class 추가 
//1
if(lastURL == "intro") {
    document.getElementById("a-type1").classList.add("header-check");
    document.getElementById("a-type2").classList.remove("header-check");
    document.getElementById("a-type3").classList.remove("header-check");
    document.getElementById("a-type4").classList.remove("header-check");
    document.getElementById("a-type5").classList.remove("header-check");
    document.getElementById("a-type6").classList.remove("header-check");

}
//2
if(lastURL == "menuList" && secondURL=='menu') {
    document.getElementById("a-type1").classList.remove("header-check");
    document.getElementById("a-type2").classList.add("header-check");
    document.getElementById("a-type3").classList.remove("header-check");
    document.getElementById("a-type4").classList.remove("header-check");
    document.getElementById("a-type5").classList.remove("header-check");
    document.getElementById("a-type6").classList.remove("header-check");
}

if(lastURL == "mainTopping" && secondURL=='menu') {
    document.getElementById("a-type1").classList.remove("header-check");
    document.getElementById("a-type2").classList.add("header-check");
    document.getElementById("a-type3").classList.remove("header-check");
    document.getElementById("a-type4").classList.remove("header-check");
    document.getElementById("a-type5").classList.remove("header-check");
    document.getElementById("a-type6").classList.remove("header-check");
}

if(lastURL == "subTopping" && secondURL=='menu') {
    document.getElementById("a-type1").classList.remove("header-check");
    document.getElementById("a-type2").classList.add("header-check");
    document.getElementById("a-type3").classList.remove("header-check");
    document.getElementById("a-type4").classList.remove("header-check");
    document.getElementById("a-type5").classList.remove("header-check");
    document.getElementById("a-type6").classList.remove("header-check");
}

if(lastURL == "sourceList" && secondURL=='menu') {
    document.getElementById("a-type1").classList.remove("header-check");
    document.getElementById("a-type2").classList.add("header-check");
    document.getElementById("a-type3").classList.remove("header-check");
    document.getElementById("a-type4").classList.remove("header-check");
    document.getElementById("a-type5").classList.remove("header-check");
    document.getElementById("a-type6").classList.remove("header-check");
}

//3
if(lastURL == "packageList" && secondURL=='menu') {
    document.getElementById("a-type1").classList.remove("header-check");
    document.getElementById("a-type2").classList.remove("header-check");
    document.getElementById("a-type3").classList.add("header-check");
    document.getElementById("a-type4").classList.remove("header-check");
    document.getElementById("a-type5").classList.remove("header-check");
    document.getElementById("a-type6").classList.remove("header-check");
}

if(lastURL == "packageList2" && secondURL=='menu') {
    document.getElementById("a-type1").classList.remove("header-check");
    document.getElementById("a-type2").classList.remove("header-check");
    document.getElementById("a-type3").classList.add("header-check");
    document.getElementById("a-type4").classList.remove("header-check");
    document.getElementById("a-type5").classList.remove("header-check");
    document.getElementById("a-type6").classList.remove("header-check");
}
//4
if(lastURL == "nutrition") {
    document.getElementById("a-type1").classList.remove("header-check");
    document.getElementById("a-type2").classList.remove("header-check");
    document.getElementById("a-type3").classList.remove("header-check");
    document.getElementById("a-type4").classList.add("header-check");
    document.getElementById("a-type5").classList.remove("header-check");
    document.getElementById("a-type6").classList.remove("header-check");
}
//5
if(lastURL == "review") {
    document.getElementById("a-type1").classList.remove("header-check");
    document.getElementById("a-type2").classList.remove("header-check");
    document.getElementById("a-type3").classList.remove("header-check");
    document.getElementById("a-type4").classList.remove("header-check");
    document.getElementById("a-type5").classList.add("header-check");
    document.getElementById("a-type6").classList.remove("header-check");
}
//6
if(lastURL == "FAQ") {
    document.getElementById("a-type1").classList.remove("header-check");
    document.getElementById("a-type2").classList.remove("header-check");
    document.getElementById("a-type3").classList.remove("header-check");
    document.getElementById("a-type4").classList.remove("header-check");
    document.getElementById("a-type5").classList.remove("header-check");
    document.getElementById("a-type6").classList.add("header-check");
}


</script>

<!-- End Channel Plugin -->