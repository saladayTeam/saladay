<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모달</title>
</head>
<body>
        <div class="modal" id="modal">

            <div class="main-title">
                <div class="modalName">
                    <div>배송일정</div>
                </div>
            </div>

            <div class="textBox" id="textBox-first">
                <div class="title">배송상태 : </div>
                    <div id="deliveryStatus">
                        <div class="selectBox">
                            <select class="select" id="selectbox">
                                <option value="A" >&nbsp; 결제완료</option>
                                <option value="B" >&nbsp; 배송준비중</option>
                                <option value="C" >&nbsp; 배송중</option>
                                <option value="D" >&nbsp; 배송완료</option>
                            </select>
                        </div>
                        <div class="changeBtn">
                            <button id="changeBtn">수정</button>
                        </div>
                    </div>
                </div>

            <div class="textBox" >
                <div class="title">배송번호 : </div>
                <div id="deliveryNo"></div>
            </div>

            <div class="textBox">
                <div class="title">주문번호 : </div>
                <a id="orderNo"></a>
            </div>

            <div class="textBox">
                <div class="title">배송날짜 : </div>
                <div id="deliveryDate"></div>
                <%-- <button id="changeBtn" type="button"></button> --%>
            </div>

            <div class="textBox">
                <div class="title">수령인 : </div>
                <div id="deliveryName"></div>
            </div>

            <div class="textBox">
                <div class="title" id="addressBox">배송지 주소 : </div>
                <div id="deliveryAddress"></div>
            </div>

            <div class="textBox">
                <div class="title">배송지 전화번호 : </div>
                <div id="deliveryPhone"></div>
            </div>

            <div class="textBox">
                <div class="title">패키지 이름 : </div>
                <div id="packageName"></div>
            </div>

            <div class="textBox" id="saladBox">
                <div id="first-salad">
                    <div class="title">상품 : </div><div class="salad" id="deliverySalad1"></div>
                </div>
                <div class="salad" id="deliverySalad2"></div>
                <div class="salad" id="deliverySalad3"></div>
                <div class="salad" id="deliverySalad4"></div>
                <div class="salad" id="deliverySalad5"></div>
                <div class="salad" id="deliverySalad6"></div>
                <div class="salad" id="deliverySalad7"></div>
            </div>

            

            ${delivery}
        </div>
        
    
    

</body>
</html>