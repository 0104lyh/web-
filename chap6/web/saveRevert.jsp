<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.dao.impl.RevertDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.vo.Revert" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/6/4
  Time: 10:31
  To change this template use File | Settings | File Templates.
  软件1811林彦豪 201821122008
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>保存留言</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id = (String)session.getAttribute("RevMessageId");
    int messageId=0;
    messageId=Integer.parseInt(id);
    Timestamp writeDate = new Timestamp(System.currentTimeMillis());
    List<Revert> reverts = new ArrayList<Revert>();
    RevertDAOImpl revertDAO = new RevertDAOImpl();
    reverts=revertDAO.getAllRevert();
    int count=reverts.size()+1;
    String content = request.getParameter("content");
    //String writer = request.getParameter("yhm");
    String writer=(String)session.getAttribute("yhm");
    Revert newRevert = new Revert(count,messageId,content,writer,writeDate);
    revertDAO.addRevert(newRevert);
    response.sendRedirect("messageBoard.jsp");
%>
</body>
</html>
