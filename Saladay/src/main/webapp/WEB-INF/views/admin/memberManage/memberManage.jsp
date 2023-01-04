<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="memberList" value="${map.memberList}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원관리</title>
    <link rel="stylesheet" href="/resources/css/admin/memberManage/memberManage.css">
    
  </head>

<body>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    
    <main>
      <div class="mem-m-tit">
          <span><h1>회원관리</h1></span>
          <div class="mem">
            <span>가입된 회원 내역입니다.</span>
            <div class="m-btn-area">
              <button type="button" id="memDel" onclick="secessionValue();">탈퇴처리</button>
            </div>
          </div>
      </div>


      <table>
        <caption style="display:none">
            <summary>회원관리</summary>
        </caption>

        <colgroup>
          <col width="2%">
          <col width="5%">
          <col width="17%">
          <col width="18%">
          <col width="20%">
          <col width="20%">
          <col width="18%">
        </colgroup>

        <thead>
          <tr>
            <th scope="col"><input type="checkbox" name="allCheck" id="allCheck"></th>
            <th scope="col"><span>번호</span></th>
            <th scope="col"><span>회원명</span></th>
            <th scope="col"><span>닉네임</span></th>
            <th scope="col"><span>전화번호</span></th>
            <th scope="col"><span>가입일</span></th>
            <th scope="col"><span>탈퇴여부</span></th>
          </tr>
        </thead>

        <tbody>
          <c:forEach items="${memberList}" var="member">
            <tr>
              <td scope="col"><input type="checkbox" name="rowCheck" value="${member.memberNo}"></td>
              <td scope="col"><span>${member.memberNo}</span></td>
              <td scope="col"><span>${member.memberName}</span></td>
              <td scope="col"><span>${member.memberNickname}</span></td>
              <td scope="col"><span>${fn:substring(member.memberTel,0,3)} - ${fn:substring(member.memberTel,3,7)} - ${fn:substring(member.memberTel,7,11)} </span></td>
              <td scope="col"><span>${member.enrollDate}</span></td>
              <c:choose>
                <c:when test="${member.memberDeleteFlag eq 'Y'}">
                  <td scope="col"><span>탈퇴</span></td>
                </c:when>
                <c:otherwise>
                  <td scope="col"><span></span></td>
                </c:otherwise>
              </c:choose>
            </tr>
          </c:forEach>
        </tbody>
      
      </table>

      <div class="pagination-area">
            <c:if test="${not empty memberList}">
                <ul class="pagination">
                    <!-- 이전 목록 마지막 번호로 이동 --> 
                    <li><a href="?cp=${pagination.prevPage}">&lt;</a></li>
                        <c:forEach var="i" begin="${pagination.startPage}" 
                        end="${pagination.endPage}" step="1">
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="?cp=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="?cp=${pagination.nextPage}">&gt;</a></li>
                </ul>
            </c:if>
        </div>
      
    </main>  
    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script src="/resources/js/admin/memberManage/memberManage.js"></script>
</body>
</html>

