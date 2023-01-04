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
        
        <form action="/cart" method="post" id="addCartForm" onsubmit ="return selectValidate()">
        
        <section class="content">
                
                <div class="product-day"><div class="day-text"> ${packageList[packageNo-1].packageName}</div></div>
                <input type="hidden" name="packageNo" value="${packageNo}">
                
            <%-- 슬라이드 화면 --%>
            <c:choose>
                <c:when test="${packageNo eq 1 || packageNo eq 4}">
                    <c:set var="end" value="2" />
                </c:when>
                
                <c:when test="${packageNo eq 2 || packageNo eq 5}">
                    <c:set var="end" value="4" />
                </c:when>
                
                <c:when test="${packageNo eq 3 || packageNo eq 6}">
                    <c:set var="end" value="6" />
                </c:when>
            </c:choose>

            <div class="kind_wrap">
                <div class="kind_slider">
                    <ul class="slider">
                    <c:forEach var="i" begin="0" end="${end}">
                        <li class="slide">
                            <ul class="menu-box">
                                <c:forEach items="${menuList}" var="menu">
                                    <li class="menu-name">
                                        <a href="${menu.menuImage}">${menu.menuName}</a>
                                        <input type="hidden" value="${menu.menuContent}">
                                        <input type="hidden" value="${menu.menuNo}">
                                        <input type="hidden" value="${menu.menuPrice}">
                                    </li>
                                </c:forEach>
                            </ul>


                            <div class="menu-list"> 
                                <div class="detail">
                                    <p class="idx-tit">[${i+1}번째 샐러드]</p>
                                    <h3 class="menu-title">위 메뉴에서 샐러드를 선택하세요.</h3>
                                    <p class="menu-detail"><strong>토핑은 추가 선택이 가능합니다. 메뉴와 어울리는 기본 소스는 제공됩니다.</strong></p>
                                    <p class="menu-price"></p>
                                </div>
                                <input type="hidden" class="menuNo" name="menuList[${i}].menuNo" value="">
                                <div class="menu-content">
                                    <div class="menu-img">
                                        <img src="" width="500">
                                    </div>
                                </div>
                                <div class="menu-costom">
                                    <c:set var="idx" value="0"/>

                                    <div class="add-menu" id="add-main">
                                        <div class="costom-detail">
                                            메인토핑 <img src="/resources/images/menu/icon/meat.png" class="add-icon">
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${optionList}" var="mainT">
                                            <c:if test="${mainT.optionType eq 'M'}">
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
                                                        <input type="text" value="0" name="menuList[${i}].optionList[${idx}].optionCount" id="mainOptionCount" class="optionCount" readonly/>
                                                        <span class="plus">+</span>
                                                    </div>
                                                    <input type="hidden" value="${mainT.optionNo}" name="menuList[${i}].optionList[${idx}].optionNo" class="optionNo"/> 
                                                </li>
                                                <c:set var="idx" value="${idx + 1}"/>
                                            </c:if>
                                            </c:forEach>
                                        </ul>
                                    <div class="add-menu" id="add-sub">
                                        <div class="costom-detail">
                                            서브토핑 <img src="/resources/images/menu/icon/broccoli.png" class="add-icon">
                                        </div>
                                        <ul class="topping-list">
                                            <c:forEach items="${optionList}" var="subT">
                                            <c:if test="${subT.optionType eq 'T'}">
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
                                                        <input type="text" value="0" name="menuList[${i}].optionList[${idx}].optionCount" class="optionCount" readonly/>
                                                        <span class="plus">+</span>
                                                    </div>
                                                    <input type="hidden" value="${subT.optionNo}" name="menuList[${i}].optionList[${idx}].optionNo" class="optionNo"/>
                                                </li>

                                                <c:set var="idx" value="${idx + 1}"/>
                                            </c:if>
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
                                            <c:forEach items="${optionList}" var="source">
                                            <c:if test="${source.optionType eq 'S'}">
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
                                                        <input type="text" value="0" name="menuList[${i}].optionList[${idx}].optionCount" class="optionCount" readonly/>
                                                        <span class="plus">+</span>
                                                    </div>
                                                    <input type="hidden" value="${source.optionNo}" name="menuList[${i}].optionList[${idx}].optionNo" class="optionNo"/>
                                                </li>

                                                <c:set var="idx" value="${idx + 1}"/>
                                            </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div> <%-- 메뉴 옵션 선택 --%>
                            </div>  <!-- 메뉴 선택 1 끝 -->
                        </li>
                    </c:forEach>    
                    </ul>

                </div>
                <div class="arrow">
                    <a href="" class="prev">이전</a>
                    <a href="" class="next">다음</a>
                </div>
            </div>
        </section>

        <%-- <div class="bottom-box">
            <button id="cartin-btn">장바구니 담기</button>
            <button type="button" id="order-btn">주문하기</button>
        </div> --%>
        <div class="bottom-wrapper">
            <div class="total">
                    Total
                    <strong class="strong" id="totalPrice">
                    0
                    </strong>
                    <strong class="strong">원</strong>
            </div>
            
            <div class="bottom-box">
                <button id="cartin-btn">장바구니 담기</button>
                <button type="button" id="order-btn">주문하기</button>
            </div>
        </div>
    </main>
    </form> 
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script src="/resources/js/menu/selectMenu.js"></script>

</body>
</html>