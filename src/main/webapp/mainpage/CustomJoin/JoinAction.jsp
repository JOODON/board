<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="USER.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="USER" class="USER.user" scope="page"/>
<jsp:setProperty name="USER" property="userID"/>
<jsp:setProperty name="USER" property="userPassword"/>
<jsp:setProperty name="USER" property="userName"/>
<jsp:setProperty name="USER" property="userGender"/>
<jsp:setProperty name="USER" property="userEmail"/>

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
    if(USER.getUserID()==null || USER.getUserPassword() ==null || USER.getUserName() == null || USER.getUserGender()==null||USER.getUserEmail()==null ){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력하지 않으신 부분이 있습니다')");
        script.println("history.back()");
        script.println("</script>");
    }
    else {
        userDAO userDAO = new userDAO();
        int result = userDAO.join(USER);
        if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미존재하는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            session.setAttribute("userID",USER.getUserID());//회원가입한 인원들에 한에서 세션을 부여함
            PrintWriter script=response.getWriter();
            script.println("<script>");
            script.println("location.href='http://localhost:8080/Portfolio/mainpage/main.jsp'");
            script.println("</script>");
        }
    }
%>

</body>
</html>
