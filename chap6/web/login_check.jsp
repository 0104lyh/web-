<%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/3/21
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>登录检查</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    //String username = null;
    String yonghuming = null;
    boolean flag = false;//登录成功变量
%>
<%--检查是否匹配--%>
<%
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); //加载驱动
    String DBURL="jdbc:mysql://127.0.0.1:3308/message? characterEncoding=utf8 & useSSL=false & serverTimezone=UTC & rewriteBatchedStatements=true";
    String DBUSER="root"; //数据库名字
    String DBPASSWORD="123456"; //数据库密码
    Connection conn= DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
    String sql="select name from person where id=? and password=? ";
    PreparedStatement pstmt = conn.prepareStatement(sql); //语句总管
    pstmt.setString(1,userid);
    pstmt.setString(2,password);
    ResultSet rs = pstmt.executeQuery();
    if(rs.next()){
        yonghuming=rs.getString("name");
        flag=true;
    }
    rs.close();
    pstmt.close();
    conn.close();
%>
<%--若匹配，得到username,跳转登录成功页面--%>
<% if (flag){
    session.setAttribute("yhm",yonghuming);
    session.setAttribute("userid",userid);
    session.setAttribute("check","ok") ;
    response.sendRedirect("messageBoard.jsp") ;
%>
<%--<jsp:forward page="login_success.jsp">--%>
<%--<jsp:param name="yhm" value="<%=yonghuming%>"/>--%>
<%--</jsp:forward>--%>
<%}else{%>
    <jsp:forward page="login_failure.html"/>
<%}%>
    </body>
</html>
