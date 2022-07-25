<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-07-25
  Time: 오후 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 글쓰기</title>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width",initial-scale="1">
    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="Style.css">
</head>
<style>

</style>
<body>
<%
    String userID=null;
    if (session.getAttribute("userID")!= null){
        userID=(String) session.getAttribute("userID");
    }
%>
<div class="header">
    <a href="#" class="main"><i class="fa-solid fa-house-chimney"></i> Home</a>
    <a href="#" class="Search"><i class="fa-solid fa-magnifying-glass"></i> Search</a>
    <a href="#" class="Contact"><i class="fa-regular fa-address-book"></i> Contact</a>
    <%
        if(userID == null){

    %>
    <a href="http://localhost:8080/Portfolio/mainpage/loginpage/login.jsp" class="login"><i class="fa-regular fa-user"></i> Login</a>
    <%
    }else{


    %>
    <a href="http://localhost:8080/Portfolio/mainpage/loginpage/logoutAction.jsp" class="login"><i class="fa-regular fa-user"></i> LoginOut</a>
    <%
        }
    %>
    <a href="#" class="login"> <i class="fa-regular fa-user"></i> Custom Join</a>
</div>

<div class="container">
    <header>
        <h1>게시판 글쓰기 양식</h1>
    </header>
    <form action="WriteAction.jsp">
        <div class="title">
            <input type="text" name="bbsTitle" class="texthead" placeholder="글 제목">
        </div>
        <div class="text">
            <textarea type="text" name="bbsContent" class="textbody" placeholder="글 내용"></textarea>
        </div>
        <div class="bt">
            <button class="buttom" type="submit">글쓰기</button>
        </div>
    </form>
</div>
</body>
</html>

