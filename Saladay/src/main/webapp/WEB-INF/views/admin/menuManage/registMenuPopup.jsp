<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 등록</title>
    <link rel="stylesheet" href="/resources/css/admin/menuManage/registMenuPopup.css">
    <script src="https://kit.fontawesome.com/2aa49fc46f.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="update-menu-popup">
        <h2>메뉴 등록</h2>
        <table class="menu-table">
            <caption>
                <summary>메뉴등록 폼</summary>
            </caption>

            <colgroup>
                <col style="width: 15%">
                <col style="width: 75%"> 
            </colgroup>

            <tbody>
                <tr class="t-row">
                    <th><label for="menuName">메뉴명</label></th>
                    <td>
                        <input type="text" placeholder="메뉴명을 입력하세요." id="menuName" name="menuName">
                    </td>
                </tr>
                <tr class="t-row">
                    <th><label for="menuImage">메뉴사진</label></th>
                    <td>
                        <div class="img-box">
                            <div class="preview-area">
                                <img id="profile-image" src="/resources/images/review/reviewImg.png">
                                <span id="delete-image"><i class="fa-thin fa-delete-left"></i></span>
                            </div>
                            <div class="menu-img-area">
                                <input type="file" id="menuImage" name="menuImage" accept="image/*">
                                <button>사진선택</button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr class="t-row">
                    <th><label for="menuContent">메뉴설명</label></th>
                    <td>
                        <textarea placeholder="메뉴의 설명을 입력하세요." id="menuContent" name="menuContent"></textarea>
                    </td>
                </tr>
                <tr class="t-row">
                    <th><label for="menuPrice">메뉴가격</label></th>
                    <td>
                        <input type="text" placeholder="메뉴의 가격은 숫자만 입력하세요." id="menuPrice" name="menuPrice">
                    </td>
                </tr>
                <tr class="t-row">
                    <th><label for="calorie">칼로리</label></th>
                    <td>
                        <input type="text" placeholder="칼로리는 숫자만 입력하세요." id="calorie" name="calorie">
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="menu-btn-area">
            <button type="button" id="registBtn"><strong>메뉴등록</strong></button>
            <button type="button" id="closeBtn"><strong>취소</strong></button>
        </div> 
    </div>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/admin/menuManage/registMenuPopup.js"></script>
</body>
</html>