<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-07-24
  Time: 오전 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="Style.css?ver=1">
    <title>로그인 페이지</title>
</head>
<body>
<section class="login-form">
    <h1>LOGO DESIGN</h1>
    <form action="loginAction.jsp">
        <div class="int-area">
            <input type="text" name="userID" id="id" autocapitalize="off" required>
            <label for="id">USER NAME</label>
        </div>
        <div class="int-area">
            <input type="password" name="userPassword"id="pw" autocapitalize="off" required>
            <label for="pw">PASSWORD</label>
        </div>
        <div class="btn-area">
            <button type="submit" id="btn">LOGIN</button>
        </div>
    </form>
    <div class="caption">
        <a href="">Forgot Password?</a>
    </div>
</section>
<script src="main.js"></script>
</body>
</html>