<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 수정</title>
    <link rel="stylesheet" href="/resources/css/admin/menuManage/registMenuPopup.css">
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="update-menu-popup">
        <h2>메뉴 수정</h2>
        <form action="/admin/menu/update" method="POST" enctype="multipart/form-data" id="registFrm" onsubmit="return updateValidate();">
            <table class="menu-table">
                <caption>
                    <summary>메뉴등록 폼</summary>
                </caption>

                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 80%"> 
                </colgroup>
                
                <tbody>
                    <tr class="t-row">
                        <th><label for="menuName">메뉴명</label></th>
                        <td>
                            <input type="text" placeholder="메뉴명을 입력하세요." id="menuName" name="menuName" autocomplete="off" value="${menu.menuName}" >
                            <input type="hidden" name="menuNo" value="${menu.menuNo}" >
                        </td>
                    </tr>
                    <tr class="t-row">
                        <th><label for="inputMenuImg">메뉴사진</label></th>
                        <td>
                            <div class="img-box">
                                <div class="preview-area">
                                    <label for="inputMenuImg"><img id="menu-image" src="${menu.menuImage}"></label>
                                </div>
                                <span class="confirm"> * 이미지를 수정하려면 위의 이미지를 선택하세요.</span>
                                <div class="menu-img-area">
                                    <input type="file" id="inputMenuImg" name="inputMenuImg" accept="image/*"  > 
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="t-row">
                        <th><label for="menuContent">메뉴설명</label></th>
                        <td>
                            <textarea placeholder="메뉴의 설명을 입력하세요." id="menuContent" name="menuContent">${menu.menuContent}</textarea>
                        </td>
                    </tr>
                    <tr class="t-row">
                        <th><label for="menuPrice">메뉴가격</label></th>
                        <td>
                            <input type="text" placeholder="메뉴의 가격은 숫자만 입력하세요." id="menuPrice" name="menuPrice" value="${menu.menuPrice}" autocomplete="off" >
                        </td>
                    </tr>
                    <tr class="t-row">
                        <th><label for="menuCalorie">칼로리</label></th>
                        <td>
                            <input type="text" placeholder="칼로리는 숫자만 입력하세요." id="menuCalorie" name="menuCalorie" value="${menu.menuCalorie}" autocomplete="off" >
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="menu-btn-area">
                <button id="registBtn"><strong>메뉴수정</strong></button>
                <button type="button" id="closeBtn"><strong>취소</strong></button>
            </div> 

        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/admin/menuManage/updateMenuPopup.js"></script>
</body>
</html>