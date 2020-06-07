<%@ page import="java.util.List" %>
<%@ page import="com.vo.Message" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.impl.MessageDAOImpl" %><%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/5/31
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有留言</title>
</head>
<body>
<%
    if(session.getAttribute("check")!=null){
%>

<table border="2" align="center" align="70">
    <caption>留言</caption>
    <tr>
        <th>id</th>
        <th>title</th>
        <th>content</th>
        <th>writer</th>
        <th>writeDate</th>
        <th>count</th>
        <%--<th>É¾³ý</th>--%>
    </tr>
    <%
        List<Message> all = new ArrayList<Message>();
        MessageDAOImpl MesDAO = new MessageDAOImpl();
        all = MesDAO.getAllMessage();
        if (all.size()!=0){
            for(int i=0;i<all.size();i++){
                Message mes=all.get(i);
                %>
    <tr>
        <td><%=mes.getMessageID()%></td>
        <td><%=mes.getTitle()%></td>
        <td><%=mes.getContent()%></td>
        <td><%=mes.getWriter()%></td>
        <td><%=mes.getWriteDate().toString()%></td>
        <td><%=mes.getCount()%></td>
    </tr>
            <%}%>
        <%}%>
<%}
    else{
        response.setHeader("refresh","2;URL=login.jsp") ;
%>
    <h1>您还未登陆，请先登陆！！！</h1>
    <p>两秒后跳转到登录界面</p>
    <%}%>
</body>
</html>
