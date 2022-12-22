<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script
      src="https://kit.fontawesome.com/2aa49fc46f.js"
      crossorigin="anonymous"
    ></script>

    <link rel="stylesheet" href="/resources/css/main/header.css">
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/main/footer.css">

  </head>

<body>
    
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <main>

        <div class="admin-page-content">
            <jsp:include page="/WEB-INF/views/admin/sidemenu.jsp"></jsp:include>

            <div class="right-side">
                
            </div>
        </div>
    </main>    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>