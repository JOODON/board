<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-07-25
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Titan+One&display=swap" rel="stylesheet">
    <link href="Style.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="header">
    <a href="#" class="main"><i class="fa-solid fa-house-chimney"></i> Home</a>
    <a href="#" class="Search"><i class="fa-solid fa-magnifying-glass"></i> Search</a>
    <a href="#" class="Contact"><i class="fa-regular fa-address-book"></i> Contact</a>
    <a href="#" class="login"><i class="fa-regular fa-user"></i> login</a>
    <a href="#" class="login"> <i class="fa-regular fa-user"></i> Custom Join</a>
</div>

<h1>게시판 글 목록</h1>
<div class="container">
    <div class="row">
        <table border="1px">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>안녕하세요</td>
                <td>주동호</td>
                <td>2022.07.25</td>
            </tr>
            </tbody>
        </table>
        <div class="write_bt">
            <button><a href="#"class="btn">글쓰기</a></button>
        </div>
    </div>
</div>

</body>
</html>