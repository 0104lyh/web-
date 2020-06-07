<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.dao.impl.MessageDAOImpl" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.Message" %><%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/5/31
  Time: 15:31
  To change this template use File | Settings | File Templates.
  软件1811 林彦豪 201821122008
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新的留言</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String content=request.getParameter("content");
    String title = request.getParameter("title");
    String writer=(String)session.getAttribute("yhm");
    String userid = (String) session.getAttribute("userid");
    int id = Integer.parseInt(userid);
    //String writeDate = request.getParameter("writeDate");
    Timestamp writeDate = new Timestamp(System.currentTimeMillis());
    //String StringCount = request.getParameter("count");
    List<Message> all = new ArrayList<Message>();
    MessageDAOImpl messageDAO = new MessageDAOImpl();
    all=messageDAO.getAllMessage();
    int count=all.size()+1;
    Message message=new Message(id,title,content,writer,writeDate,count);
    System.out.println(message.toString());
    messageDAO.addMessage(message);
    response.sendRedirect("messageBoard.jsp");
%>
</body>
</html>
