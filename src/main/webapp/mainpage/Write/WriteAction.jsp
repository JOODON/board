<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="bbs.BBSDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bbs" class="bbs.BBS" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String userID=null;
    if (session.getAttribute("userID")!=null){
        userID=(String) session.getAttribute("userID");
    }
    if(userID == null){
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요')");
        script.println("location.href='login.jsp'");
        script.println("</script>");
    }
    else {
        if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력하지 않으신 부분이 있습니다')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            BBSDAO bbsdao = new BBSDAO();
            int result = bbsdao.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글씨기에 실패하셨습니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href='http://localhost:8080/Portfolio/mainpage/Listpage/View.jsp#'");
                script.println("</script>");
            }
        }
    }
%>
</body>
</html>
