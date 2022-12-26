<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자-메뉴관리</title>
    <link rel="stylesheet" href="/resources/css/admin/menuManage/updateMenu.css">
  </head>

<body>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    
    <section class="menu-wrapper">
    
      <div class="menu-m-tit">
        <div>
          <span>메뉴 관리</span>
        </div>
        <div class="m-btn-area">
          <button type="button" id="addBtn">추가</button>
          <button type="button" id="delBtn">삭제</button>
        </div>
      </div>

      <table>
        <colgroup>
          <col width="2%">
          <col width="20%">
          <col width="58%">
          <col width="10%">
          <col width="10%">
        </colgroup>
        <thead>
          <tr>
            <th scope="col"><input type="checkbox" class=""></th>
            <th scope="col"><span>메뉴명</span></th>
            <th scope="col"><span>메뉴설명</span></th>
            <th scope="col"><span>메뉴가격</span></th>
            <th scope="col"><span>메뉴칼로리</span></th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${menuList}" var="menu">
            <tr>
              <td scope="col"><input type="checkbox"></td>
              <td scope="col"><span class="menu-n">${menu.menuName}</span></td>
              <td scope="col"><span class="menu-i">${menu.menuContent}</span></td>
              <td scope="col"><span class="menu-p">${menu.menuPrice}</span></td>
              <td scope="col"><span class="menu-c">${menu.menuCalorie} Kcal</span></td>
            </tr>
          </c:forEach>
        </tbody>
      
      </table>

   
    </section>  
    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>

