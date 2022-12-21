<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 선택</title>

    <link rel="stylesheet" href="/resources/css/menu/selectMenu.css">

    <style>
        @font-face {
            font-family: 'twayair';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'SUIT-Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'NanumSquareNeo-Variable';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
    </style>
</head>
<%-- <div class="salad-type">
    <div class="salad-text">
        <div class="salad-title" id="salad-type-name">추가된 메인토핑</div>
        <div class="salad-detail" id="salad-type-topping">닭가슴살, 스테이크</div>
    </div>
    <div class="salad-text">
        <div class="salad-title" id="salad-type-name">추가된 토핑</div>
        <div class="salad-detail" id="salad-type-topping">옥수수, 토마토2</div>
    </div>
    <div class="salad-text">
        <div class="salad-title" id="salad-type-name">추가된 소스</div>
        <div class="salad-detail" id="salad-type-topping">스윗칠리, 데리야끼</div>
    </div>
</div> --%>
<body>

		<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
		
    <div class="top" id="top-img">
        <div class="img-text">언제 어디서든 부담되지않게<br>건강하고 신선한 샐러데이</div>
    </div>
    <main>
        <section class="content">
            <div class="product-day"><div class="day-text">1주 골라담기 3팩 패키지</div></div>
            <%-- 슬라이드 만들어보기 --%>
            <div class="kind_wrap">
                <div class="kind_slider">
                    <ul class="slider">
                        <li class="slide">
                            <ul class="menu-box">
                                <c:forEach items="${menuList}" var="menu">
                                    <li class="menu-name" >
                                        <a href="${menu.menuImage}" >${menu.menuName}</a>
                                        <input type="hidden" value="${menu.menuContent}">
                                        <input type="hidden" name="menuNo" value="${menu.menuNo}">
                                    </li>
                                </c:forEach>
                            </ul>
                            <%-- onclick="이벤트명(매개변수)" --%>

                            <div class="menu-list">
                                <div class="detail">
                                    <h3 class="menu-title">치킨 샐러데이</h3>
                                    <p class="menu-detail">촉촉한 닭다리살을 이용해 부드러운 맛과 신선한 양상추에 매콤함을 더한 샐러데이의  클래식 메뉴</p>
                                </div>
                                <div class="menu-content">
                                    <div class="menu-img">
                                        <img src="" width="500">
                                    </div>
                                </div>
                                <div class="menu-costom">
                                    <div class="add-menu" id="add-main">
                                        <div class="costom-detail">
                                            메인토핑 <img src="/resources/images/menu/icon/meat.png" class="add-icon">
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${mainTopping}" var="mainT">
                                                    <li class="topping">
                                                        <div class="img-box">
                                                            <img src="${mainT.optionImage}" class="topping-img">
                                                        </div>
                                                        <div class="topping-name">
                                                            ${mainT.optionName}
                                                        </div>
                                                        <div class="topping-price">
                                                            + ${mainT.optionPrice}
                                                        </div>
                                                        <div class="add-number">
                                                            <span class="minus">-</span>
                                                            <input type="text" value="0" readonly/>
                                                            <span class="plus">+</span>
                                                        </div>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    <div class="add-menu" id="add-sub">
                                        <div class="costom-detail">
                                            서브토핑 <img src="/resources/images/menu/icon/broccoli.png" class="add-icon">
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${subTopping}" var="subT">
                                                    <li class="topping">
                                                        <div class="img-box">
                                                            <img src="${subT.optionImage}" class="topping-img">
                                                        </div>
                                                        <div class="topping-name">
                                                            ${subT.optionName}
                                                        </div>
                                                        <div class="topping-price">
                                                            + ${subT.optionPrice}
                                                        </div>
                                                        <div class="add-number">
                                                            <span class="minus">-</span>
                                                            <input type="text" value="0" readonly/>
                                                            <span class="plus">+</span>
                                                        </div>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div id="add-topping">
                                        <div class="add-menu" id="add-sauce">
                                            <div class="costom-detail">
                                                소스 <img src="/resources/images/menu/icon/chili-sauce.png" class="add-icon">
                                            </div>
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${sourceList}" var="source">
                                                    <li class="topping">
                                                        <div class="img-box">
                                                            <img src="${source.optionImage}" class="topping-img">
                                                        </div>
                                                        <div class="topping-name">
                                                            ${source.optionName}
                                                        </div>
                                                        <div class="topping-price">
                                                            + ${source.optionPrice}
                                                        </div>
                                                        <div class="add-number">
                                                            <span class="minus">-</span>
                                                            <input type="text" value="0" readonly/>
                                                            <span class="plus">+</span>
                                                        </div>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>  <!-- 메뉴 선택 1 끝 -->
                        </li>
                        <li class="slide">
                            <ul class="menu-box">
                                <c:forEach items="${menuList}" var="menu">
                                    <li class="menu-name" >
                                        <a href="${menu.menuImage}" >${menu.menuName}</a>
                                        <input type="hidden" value="${menu.menuContent}">
                                        <input type="hidden" name="menuNo" value="${menu.menuNo}">
                                    </li>
                                </c:forEach>
                            </ul>
                            <%-- onclick="이벤트명(매개변수)" --%>

                            <div class="menu-list">
                                <div class="detail">
                                    <h3 class="menu-title">치킨 샐러데이</h3>
                                    <p class="menu-detail">촉촉한 닭다리살을 이용해 부드러운 맛과 신선한 양상추에 매콤함을 더한 샐러데이의  클래식 메뉴</p>
                                </div>
                                <div class="menu-content">
                                    <div class="menu-img">
                                        <img src="" width="500">
                                    </div>
                                </div>
                                <div class="menu-costom">
                                    <div class="add-menu" id="add-main">
                                        <div class="costom-detail">
                                            메인토핑 <img src="/resources/images/menu/icon/meat.png" class="add-icon">
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${mainTopping}" var="mainT">
                                                    <li class="topping">
                                                        <div class="img-box">
                                                            <img src="${mainT.optionImage}" class="topping-img">
                                                        </div>
                                                        <div class="topping-name">
                                                            ${mainT.optionName}
                                                        </div>
                                                        <div class="topping-price">
                                                            + ${mainT.optionPrice}
                                                        </div>
                                                        <div class="add-number">
                                                            <span class="minus">-</span>
                                                            <input type="text" value="0" readonly/>
                                                            <span class="plus">+</span>
                                                        </div>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    <div class="add-menu" id="add-sub">
                                        <div class="costom-detail">
                                            서브토핑 <img src="/resources/images/menu/icon/broccoli.png" class="add-icon">
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${subTopping}" var="subT">
                                                    <li class="topping">
                                                        <div class="img-box">
                                                            <img src="${subT.optionImage}" class="topping-img">
                                                        </div>
                                                        <div class="topping-name">
                                                            ${subT.optionName}
                                                        </div>
                                                        <div class="topping-price">
                                                            + ${subT.optionPrice}
                                                        </div>
                                                        <div class="add-number">
                                                            <span class="minus">-</span>
                                                            <input type="text" value="0" readonly/>
                                                            <span class="plus">+</span>
                                                        </div>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div id="add-topping">
                                        <div class="add-menu" id="add-sauce">
                                            <div class="costom-detail">
                                                소스 <img src="/resources/images/menu/icon/chili-sauce.png" class="add-icon">
                                            </div>
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${sourceList}" var="source">
                                                    <li class="topping">
                                                        <div class="img-box">
                                                            <img src="${source.optionImage}" class="topping-img">
                                                        </div>
                                                        <div class="topping-name">
                                                            ${source.optionName}
                                                        </div>
                                                        <div class="topping-price">
                                                            + ${source.optionPrice}
                                                        </div>
                                                        <div class="add-number">
                                                            <span class="minus">-</span>
                                                            <input type="text" value="0" readonly/>
                                                            <span class="plus">+</span>
                                                        </div>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>  <!-- 메뉴 선택 1 끝 -->
                        </li>
                        <li class="slide">
                            <ul class="menu-box">
                                <c:forEach items="${menuList}" var="menu">
                                    <li class="menu-name" >
                                        <a href="${menu.menuImage}" >${menu.menuName}</a>
                                        <input type="hidden" value="${menu.menuContent}">
                                        <input type="hidden" name="menuNo" value="${menu.menuNo}">
                                    </li>
                                </c:forEach>
                            </ul>
                            <%-- onclick="이벤트명(매개변수)" --%>

                            <div class="menu-list">
                                <div class="detail">
                                    <h3 class="menu-title">치킨 샐러데이</h3>
                                    <p class="menu-detail">촉촉한 닭다리살을 이용해 부드러운 맛과 신선한 양상추에 매콤함을 더한 샐러데이의  클래식 메뉴</p>
                                </div>
                                <div class="menu-content">
                                    <div class="menu-img">
                                        <img src="" width="500">
                                    </div>
                                </div>
                                <div class="menu-costom">
                                    <div class="add-menu" id="add-main">
                                        <div class="costom-detail">
                                            메인토핑 <img src="/resources/images/menu/icon/meat.png" class="add-icon">
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${mainTopping}" var="mainT">
                                                    <li class="topping">
                                                        <div class="img-box">
                                                            <img src="${mainT.optionImage}" class="topping-img">
                                                        </div>
                                                        <div class="topping-name">
                                                            ${mainT.optionName}
                                                        </div>
                                                        <div class="topping-price">
                                                            + ${mainT.optionPrice}
                                                        </div>
                                                        <div class="add-number">
                                                            <span class="minus">-</span>
                                                            <input type="text" value="0" readonly/>
                                                            <span class="plus">+</span>
                                                        </div>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    <div class="add-menu" id="add-sub">
                                        <div class="costom-detail">
                                            서브토핑 <img src="/resources/images/menu/icon/broccoli.png" class="add-icon">
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${subTopping}" var="subT">
                                                    <li class="topping">
                                                        <div class="img-box">
                                                            <img src="${subT.optionImage}" class="topping-img">
                                                        </div>
                                                        <div class="topping-name">
                                                            ${subT.optionName}
                                                        </div>
                                                        <div class="topping-price">
                                                            + ${subT.optionPrice}
                                                        </div>
                                                        <div class="add-number">
                                                            <span class="minus">-</span>
                                                            <input type="text" value="0" readonly/>
                                                            <span class="plus">+</span>
                                                        </div>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div id="add-topping">
                                        <div class="add-menu" id="add-sauce">
                                            <div class="costom-detail">
                                                소스 <img src="/resources/images/menu/icon/chili-sauce.png" class="add-icon">
                                            </div>
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${sourceList}" var="source">
                                                    <li class="topping">
                                                        <div class="img-box">
                                                            <img src="${source.optionImage}" class="topping-img">
                                                        </div>
                                                        <div class="topping-name">
                                                            ${source.optionName}
                                                        </div>
                                                        <div class="topping-price">
                                                            + ${source.optionPrice}
                                                        </div>
                                                        <div class="add-number">
                                                            <span class="minus">-</span>
                                                            <input type="text" value="0" readonly/>
                                                            <span class="plus">+</span>
                                                        </div>
                                                    </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>  <!-- 메뉴 선택 1 끝 -->
                        </li>
                    </ul>
                </div>
                <div class="arrow">
                    <a href="" class="prev">이전</a>
                    <a href="" class="next">다음</a>
                </div>
            </div>
        </section>
        
        <div class="bottom-box">
            <!-- <div>상품이미지</div> -->
            <button class="cartin-btn">장바구니 담기</button>
            <button class="order-btn">주문하기</button>
        </div>

    </main>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script src="/resources/js/menu/selectMenu.js"></script>
</body>
</html>