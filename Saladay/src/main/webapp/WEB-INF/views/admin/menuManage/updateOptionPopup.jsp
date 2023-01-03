<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>옵션 수정</title>
    <link rel="stylesheet" href="/resources/css/admin/menuManage/updateOptionPopup.css">
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="update-option-popup">
        <h2>옵션 수정</h2>
        <form action="/admin/regist/option" method="POST" enctype="multipart/form-data" id="registFrm" onsubmit="return registValidate();">
            <table class="option-table">
                <caption>
                    <summary>옵션등록 폼</summary>
                </caption>

                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 80%"> 
                </colgroup>
                
                <tbody>
                    <tr class="t-row">
                        <th><label for="optionName">옵션명</label></th>
                        <td>
                            <input type="text" placeholder="옵션명을 입력하세요." id="optionName" name="optionName" autocomplete="off">
                        </td>
                    </tr>
                    <tr class="t-row">
                        <th><label for="inputOptionImg">옵션사진</label></th>
                        <td>
                            <div class="img-box">
                                <div class="preview-area">
                                    <label for="inputOptionImg"><img id="option-image" src="/resources/images/review/reviewImg.png"></label>
                                <span id="delete-image">&times;</span>
                                </div>
                                <div class="menu-img-area">
                                    <input type="file" id="inputOptionImg" name="inputOptionImg" accept="image/*"> <%-- 이미지 파일은 vo와 다르게 보내야함 --%>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="t-row">
                        <th><label for="optionPrice">옵션가격</label></th>
                        <td>
                            <input type="text" placeholder="옵션의 가격은 숫자만 입력하세요." id="optionPrice" name="optionPrice" autocomplete="off" >
                        </td>
                    </tr>
                    <tr class="t-row">
                        <th><label for="optionCalorie">칼로리</label></th>
                        <td>
                            <input type="text" placeholder="칼로리는 숫자만 입력하세요." id="optionCalorie" name="optionCalorie" autocomplete="off" >
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="option-btn-area">
                <button id="registBtn"><strong>옵션수정</strong></button>
                <button type="button" id="closeBtn"><strong>취소</strong></button>
            </div> 
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/admin/menuManage/updateOptionPopup.js"></script>
</body>
</html>