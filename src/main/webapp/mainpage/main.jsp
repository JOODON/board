<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-07-24
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="Style.css">
    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous">
    </script>
    <title>메인페이지</title>
</head>
<body>
<%
    String userID=null;
    if (session.getAttribute("userID")!= null){
        userID=(String) session.getAttribute("userID");
    }
%>
<div class="header">
    <a href="http://localhost:8080/Portfolio/mainpage/main.jsp" class="main"><i class="fa-solid fa-house-chimney"></i> Home</a>
    <a href="#" class="Search"><i class="fa-solid fa-magnifying-glass"></i> Search</a>
    <a href="Listpage/View.jsp" class="Contact"><i class="fa-regular fa-address-book"></i> Contact</a>
    <%
        if(userID == null){

    %>
    <a href="loginpage/login.jsp" class="login"><i class="fa-regular fa-user"></i> Login</a>
    <%
    }else{


    %>
    <a href="http://localhost:8080/Portfolio/mainpage/loginpage/logoutAction.jsp" class="login"><i class="fa-regular fa-user"></i> LoginOut</a>
    <%
        }
    %>
    <a href="CustomJoin/Join.jsp" class="login"> <i class="fa-regular fa-user"></i> Custom Join</a>
</div>

<div class="main-page">
    <div class="main-title">
        <h1>Hello bulletin board</h1>
    </div>
    <div class="album">
        <div class="imags">
            <img src=슬라이더1.jpg>
            <img src="슬라이더2.jpg">
            <img src="슬라이더3.jpg">
        </div>
    </div>
    <div class="bt">
        <button class="prev">PREV</button>
        <button class="next">NEXT</button>
    </div>
</div>
<script rel="script" src="main.js"></script>
</body>
</html>