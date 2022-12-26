<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="left-side">
    <div class="left-side-header">관리자 메뉴</div>
    <ul class="admin-page-list">
        <li>
            <input type="radio" name="adminPageType" value="1" id="adminPageType1" checked >
            <label for="adminPageType1"><a class="myPageType1">주문 관리</a></label>
        </li>
        <li>
            <input type="radio" name="adminPageType" value="2" id="adminPageType2" >
            <label for="adminPageType2"><a href="/admin/delivery" class="adminPageType2">배송 관리</a></label>
        </li>
        <li>
            <input type="radio" name="adminPageType" value="3" id="adminPageType3" >
            <label for="adminPageType3"><a class="adminPageType3">매출 관리</a></label>
        </li>
        <li>
            <input type="radio" name="adminPageType" value="4" id="adminPageType4" >
            <label for="adminPageType4"><a class="adminPageType4">메뉴 관리</a></label>
        </li>
        <li>
            <input type="radio" name="adminPageType" value="5" id="adminPageType5" >
            <label for="adminPageType5"><a class="adminPageType5">옵션 관리</a></label>
        </li>
        <li>
            <input type="radio" name="adminPageType" value="6" id="adminPageType6" >
            <label for="adminPageType6"><a class="adminPageType6">회원 관리</a></label>
        </li>
    </ul>
</div>