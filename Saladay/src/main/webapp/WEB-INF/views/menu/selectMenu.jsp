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
    </style>
</head>
<body>

		<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
		
    <div class="top" id="top-img">
        <div class="img-text">언제 어디서든 부담되지않게<br>건강하고 신선한 샐러데이</div>
    </div>
    <main>
        <section class="content">
            <div class="product-day"><div class="day-text">3 SALADAY</div></div>
            <div class="menu">
                <ul class="menu-box">
                    <li class="menu-name"><a href="" onclick="return false;">치킨 샐러데이</a></li>
                    <li class="menu-name"><a href="" onclick="return false;">베이컨 샐러데이</a></li>
                    <li class="menu-name"><a href="" onclick="return false;">스테이크 샐러데이</a></li>
                    <li class="menu-name"><a href="" onclick="return false;">터키 샐러데이</a></li>
                    <li class="menu-name"><a href="" onclick="return false;">연어 샐러데이</a></li>
                </ul>
            </div>
            
            <div class="menu-list">
                <div class="detail">
                    <h3 class="menu-title">치킨 샐러데이</h3>
                    <p class="menu-detail">촉촉한 닭다리살을 이용해 부드러운 맛과 신선한 양상추에 매콤함을 더한 샐러데이의  클래식 메뉴</p>
                </div>
                <div class="menu-content">
                    <div class="menu-img">
                        <img src="/resources/images/menu/salad/로스트 닭다리살 샐러드.jpg">
                    </div>
                    <div class="salad-type">
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
                    </div>
                </div>
                <div class="menu-costom">
                    <div class="add-menu" id="add-main">
                        <div class="costom-detail">
                            메인토핑 <img src="/resources/images/menu/icon/meat.png" class="add-icon">
                        </div>
                        <ul class="topping-list">
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/main/베이컨.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    베이컨
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/main/치킨.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    닭고기
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/main/햄.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    햄
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="add-menu" id="add-sub">
                        <div class="costom-detail">
                            서브토핑 <img src="/resources/images/menu/icon/broccoli.png" class="add-icon">
                        </div>
                        <ul class="topping-list">
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/로메인.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    로메인
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적근대.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적근대
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/양상추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    양상추
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/멀티리프.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    멀티리프
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/라디치오.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    라디치오
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div id="add-topping">
                        <div class="add-menu" id="add-sauce">
                            <div class="costom-detail">
                                소스 <img src="/resources/images/menu/icon/chili-sauce.png" class="add-icon">
                            </div>
                        </div>
                        <ul class="topping-list">
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/마요네즈.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    마요네즈
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/케찹.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    케찹
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/사워소스.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    사워소스
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/사워소스.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    사워소스
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/스위트칠리.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    스위트칠리
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/허니머스타드.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    허니 머스타드
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/홀그레인 머스타드.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    홀그레인 머스타드
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li> 
                        </ul>
                    </div>
                </div>
            </div>  <!-- 메뉴 선택 1 끝 -->
            <div class="menu-list">
                <div class="detail">
                    <h3 class="menu-title">치킨 샐러데이</h3>
                    <p class="menu-detail">촉촉한 닭다리살을 이용해 부드러운 맛과 신선한 양상추에 매콤함을 더한 샐러데이의  클래식 메뉴</p>
                </div>
                <div class="menu-content">
                    <div class="menu-img">
                        <img src="/resources/images/menu/salad/로스트 닭다리살 샐러드.jpg">
                    </div>
                    <div class="salad-type">
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
                    </div>
                </div>
                <div class="menu-costom">
                    <div class="add-menu" id="add-main">
                        <div class="costom-detail">
                            메인토핑 <img src="/resources/images/menu/icon/meat.png" class="add-icon">
                        </div>
                        <ul class="topping-list">
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/main/베이컨.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    베이컨
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/main/치킨.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    닭고기
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/main/햄.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    햄
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="add-menu" id="add-sub">
                        <div class="costom-detail">
                            서브토핑 <img src="/resources/images/menu/icon/broccoli.png" class="add-icon">
                        </div>
                        <ul class="topping-list">
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/로메인.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    로메인
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적근대.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적근대
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/양상추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    양상추
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/멀티리프.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    멀티리프
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/라디치오.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    라디치오
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div id="add-topping">
                        <div class="add-menu" id="add-sauce">
                            <div class="costom-detail">
                                소스 <img src="/resources/images/menu/icon/chili-sauce.png" class="add-icon">
                            </div>
                        </div>
                        <ul class="topping-list">
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/마요네즈.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    마요네즈
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/케찹.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    케찹
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/사워소스.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    사워소스
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/사워소스.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    사워소스
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/스위트칠리.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    스위트칠리
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/허니머스타드.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    허니 머스타드
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/홀그레인 머스타드.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    홀그레인 머스타드
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li> 
                        </ul>
                    </div>
                </div>
            </div>  <!-- 메뉴 선택 1 끝 -->
            <div class="menu-list">
                <div class="detail">
                    <h3 class="menu-title">치킨 샐러데이</h3>
                    <p class="menu-detail">촉촉한 닭다리살을 이용해 부드러운 맛과 신선한 양상추에 매콤함을 더한 샐러데이의  클래식 메뉴</p>
                </div>
                <div class="menu-content">
                    <div class="menu-img">
                        <img src="/resources/images/menu/salad/로스트 닭다리살 샐러드.jpg">
                    </div>
                    <div class="salad-type">
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
                    </div>
                </div>
                <div class="menu-costom">
                    <div class="add-menu" id="add-main">
                        <div class="costom-detail">
                            메인토핑 <img src="/resources/images/menu/icon/meat.png" class="add-icon">
                        </div>
                        <ul class="topping-list">
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/main/베이컨.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    베이컨
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/main/치킨.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    닭고기
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/main/햄.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    햄
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="add-menu" id="add-sub">
                        <div class="costom-detail">
                            서브토핑 <img src="/resources/images/menu/icon/broccoli.png" class="add-icon">
                        </div>
                        <ul class="topping-list">
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/로메인.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    로메인
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적근대.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적근대
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/양상추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    양상추
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/멀티리프.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    멀티리프
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/라디치오.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    라디치오
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="topping-price">
                                    + 500
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div id="add-topping">
                        <div class="add-menu" id="add-sauce">
                            <div class="costom-detail">
                                소스 <img src="/resources/images/menu/icon/chili-sauce.png" class="add-icon">
                            </div>
                        </div>
                        <ul class="topping-list">
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/마요네즈.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    마요네즈
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/케찹.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    케찹
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/사워소스.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    사워소스
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/사워소스.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    사워소스
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/스위트칠리.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    스위트칠리
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/허니머스타드.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    허니 머스타드
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/source-img/홀그레인 머스타드.png" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    홀그레인 머스타드
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li class="topping">
                                <div class="img-box">
                                    <img src="/resources/images/menu/topping/sub/적양배추.jpg" class="topping-img">
                                </div>
                                <div class="topping-name">
                                    적양배추
                                </div>
                                <div class="add-number">
                                    <span class="minus">-</span>
                                    <input type="text" value="0" readonly/>
                                    <span class="plus">+</span>
                                </div>
                            </li> 
                        </ul>
                    </div>
                </div>
            </div>  <!-- 메뉴 선택 1 끝 -->

        </section>
        <div class="bottom-box">
            <!-- <div>상품이미지</div> -->
            <button class="cartin-btn">장바구니 담기</button>
            <button class="order-btn">주문하기</button>
        </div>

    </main>
    
    
</body>
</html>