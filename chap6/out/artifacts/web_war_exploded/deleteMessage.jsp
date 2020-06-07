<%@ page import="com.dao.impl.MessageDAOImpl" %><%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/6/2
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除消息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    MessageDAOImpl messageDAO = new MessageDAOImpl();
    if(request.getParameter("messageId")!=null){
        String messageId=request.getParameter("messageId");
        int id = Integer.parseInt(messageId);
        System.out.println(id);
        messageDAO.deleteMessage(id);
        response.sendRedirect("messageBoard.jsp");
        %>
        <%--if(messageDAO.deleteMessage(id)==true){--%>
            <%--%>--%>
<%--<h1>删除成功</h1>--%>
        <%--<%--%>
            <%--response.sendRedirect("messageboard.jsp");--%>
        <%--}else{%>--%>
<%--<h1>删除失败</h1>--%>
        <%--<%}%>--%>
        <%--<%}%>--%>
</body>
</html>
