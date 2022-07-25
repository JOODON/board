<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-07-25
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BBSDAO" %>
<%@ page import="bbs.BBS"%>
<%@ page import="java.util.ArrayList"%>
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
<%
    String userID=null;
    if (session.getAttribute("userID")!= null){
        userID=(String) session.getAttribute("userID");
    }
    int pageNumber=1;
    if(request.getParameter("pageNumber") != null ){
        pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
    }
%>
<div class="header">
    <a href="http://localhost:8080/Portfolio/mainpage/main.jsp" class="main"><i class="fa-solid fa-house-chimney"></i> Home</a>
    <a href="#" class="Search"><i class="fa-solid fa-magnifying-glass"></i> Search</a>
    <a href="http://localhost:8080/Portfolio/mainpage/Listpage/View.jsp" class="Contact"><i class="fa-regular fa-address-book"></i> Contact</a>
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
    <a href="http://localhost:8080/Portfolio/mainpage/CustomJoin/Join.jsp" class="login"> <i class="fa-regular fa-user"></i> Custom Join</a>
</div>

<h1>게시판 글 목록</h1>
<div class="container">
    <div class="row">
        <table border="1px">
            <thead>
            <tr style="height:50px">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <%
                BBSDAO bbsdao=new BBSDAO();
                ArrayList<BBS> list =bbsdao.getList(pageNumber);
                for (int i=0; i< list.size(); i++){

            %>
            <tr style="height:50px">
                <td><%= list.get(i).getBbsID() %></td>
                <td><a style="color: #000000; text-decoration: none;" href="http://localhost:8080/Portfolio/mainpage/view/View.jsp?bbsID=<%= list.get(i).getBbsID()%>" > <%= list.get(i).getBbsTitle().replaceAll(" ", " &nbsp").replaceAll("<", " &lt;").replaceAll("<", " &gt;").replaceAll("\n", "</br>")%> </td>
                <td><%=list.get(i).getUserID()%></td>
                <td><%= list.get(i).getBbsDate().substring(0,11)+ list.get(i).getBbsDate().substring(11,13)+"시" + list.get(i).getBbsDate().substring(14,16)+ "분" %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <div class="page-bt">
        <%
            if (pageNumber !=1){

        %>
        <a style="color: #000000; text-decoration: none;" href="View.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn-left"> <p> 이전 </p></a>
        <%
            }if (bbsdao.nextPage(pageNumber+1)){
        %>
        <a style="color: #000000; text-decoration: none;" href="View.jsp?pageNumber=<%= pageNumber + 1 %>"class="btn-right"> <p> 다음 </p> </a>
        <%
            }if(userID != null){

        %>
        </div>
        <div class="write_bt">
            <button><a href="http://localhost:8080/Portfolio/mainpage/Write/Write.jsp"class="btn">글쓰기</a></button>
        </div>
    </div>
</div>
<%
    }
%>
</body>
</html>