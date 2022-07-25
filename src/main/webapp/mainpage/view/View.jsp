<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-07-25
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BBS" %>
<%@ page import="bbs.BBSDAO" %>

<html>
<head>
    <title>게시판 글보기</title>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width",initial-scale="1">
    <link rel="stylesheet" href="Style.css">
    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
</head>
<body>
<%
    String userID=null;
    if(session.getAttribute("userID") != null ){
        userID=(String) session.getAttribute("userID");
    }
    int bbsID=0;
    if (request.getParameter("bbsID") != null) {
        bbsID= Integer.parseInt(request.getParameter("bbsID"));
    }
    if(bbsID == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글 입니다.')");
        script.println("location.href=maim.jsp()");
        script.println("</script>");
    }
    BBS bbs = new BBSDAO().getBBS(bbsID);
%>

<div class="header">
    <a href="#" class="main"><i class="fa-solid fa-house-chimney"></i> Home</a>
    <a href="#" class="Search"><i class="fa-solid fa-magnifying-glass"></i> Search</a>
    <a href="#" class="Contact"><i class="fa-regular fa-address-book"></i> Contact</a>
    <%
        if(userID == null){

    %>
    <a href="#" class="login"><i class="fa-regular fa-user"></i> login</a>
    <%
    }else{


    %>
    <a href="http://localhost:8080/Portfolio/mainpage/loginpage/logoutAction.jsp" class="login"><i class="fa-regular fa-user"></i> LoginOut</a>
    <%
        }
    %>
    <a href="#" class="login"> <i class="fa-regular fa-user"></i> Custom Join</a>
</div>
<header>
    <h1>게시판 글보기</h1>
</header>
<div class="container">
    <table border="1px">
        <thead class="thead1">
        <th>글 제목</th>
        <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", " &nbsp").replaceAll("<", " &lt;").replaceAll("<", " &gt;").replaceAll("\n", "</br>") %></td>
        </thead>
        <thead>
        <th>작성자</th>
        <td colspan="2"><%=bbs.getUserID()%></td>
        </thead>
        <thead>
        <th>작성 일자</th>
        <td><%=bbs.getBbsDate().substring(0,11)+ bbs.getBbsDate().substring(11,13)+"시" + bbs.getBbsDate().substring(14,16)+ "분"%></td>
        </thead>
        <thead>
        <th>내용</th>
        <td class="last"><%=bbs.getBbsContent().replaceAll(" ", " &nbsp").replaceAll("<", " &lt;").replaceAll("<", " &gt;").replaceAll("\n", "</br>")%></td>
        </thead>
    </table>
    <div class="bt">
        <button class="bt1"> <a style="text-decoration: none; color: white "href="http://localhost:8080/Portfolio/mainpage/Listpage/View.jsp">목록</a></button>
        <%
            if( userID !=null && userID.equals(bbs.getUserID())){
        %>
        <button class="bt2"><a style="text-decoration: none; color: white" href="update.jsp?bbsID=<%= bbsID %>" >수정</a></button>
        <button class="bt3">삭제</button>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
