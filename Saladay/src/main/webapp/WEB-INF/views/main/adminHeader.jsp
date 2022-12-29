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
            <li><a href="/member/myPage/info">마이페이지</a></li>
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
      <li><a href="/admin/dashboard">대시보드</a></li>
      <li><a href="/admin/orderManage">주문관리</a></li>
      <li><a href="/admin/delivery">배송관리</a></li>
      <li><a href="/admin/menuManage">메뉴관리</a></li>
      <li><a href="/admin/optionManage">옵션관리</a></li>
      <li><a href="/admin/memberManage">회원관리</a></li> 
    </ul>
  </nav>

<script>
  const loginMemberNo="${loginMember.memberNo}";
  const cartNo="${cart.cartNo}";
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
