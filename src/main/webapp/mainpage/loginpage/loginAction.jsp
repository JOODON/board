<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="USER.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="USER" class="USER.user" scope="page"/>
<jsp:setProperty name="USER" property="userID"/>
<jsp:setProperty name="USER" property="userPassword"/>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
</head>
<body>
<%
    String userID=null;
    if (session.getAttribute("userID")!=null){
        userID=(String) session.getAttribute("userID");
    }
    if(userID!=null){
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어있습니다.')");
        script.println("location.href='http://localhost:8080/Portfolio/mainpage/main.jsp'");
        script.println("</script>");
    }
    userDAO userDAO=new userDAO();
    int result = userDAO.login(USER.getUserID(), USER.getUserPassword());
    if(result==1){
        session.setAttribute("userID",USER.getUserID());//로그인한 인원들에 한에서 세션을 부여함
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("location.href='http://localhost:8080/Portfolio/mainpage/main.jsp'");
        script.println("</script>");
    }
    else if (result==0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if (result==-1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디입니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if (result==-2) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
%>
</body>
</html>
