<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/common/errorPage/error-page.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" >
</head>
<body>
        <div class="page-404">
            <div class="outer">
                <div class="middle">
                    <div class="inner">
                        <!--BEGIN CONTENT-->
                        <div class="inner-circle">
                            <a href="/">
                                <i class="fa fa-home"></i>
                                <span>500</span>
                            </a>
                        </div>
                        <span class="inner-status server-error">500 server error has occurred &nbsp;</span>
                        <span class="inner-detail">
                            <a href="/" class="btn btn-info mtl" id="return-home">
                                <i class="fa fa-home"></i>&nbsp;
                                 Return home
                            </a> 
                        </span>
                    </div>
                </div>
            </div>
        </div>

</body>
</html>