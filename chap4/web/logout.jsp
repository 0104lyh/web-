<%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/3/26
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%
    // 让session失效
    session.invalidate() ;
    response.sendRedirect("login.jsp");
%>
<%--<a href="login.jsp">welcome</a>--%>