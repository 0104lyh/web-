<%-- Created by IntelliJ IDEA. --%>
<%--软件1811林彦豪201821122008--%>
<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
          + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>">

  <title>九九乘法表</title>
  <%--<meta http-equiv="pragma" content="no-cache">--%>
  <%--<meta http-equiv="cache-control" content="no-cache">--%>
  <%--<meta http-equiv="expires" content="0">--%>
  <%--<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">--%>
  <%--<meta http-equiv="description" content="This is my page">--%>
  <!--
      <link rel="stylesheet" type="text/css" href="styles.css">
      -->
</head>

<body>
<H1>九九乘法表</H1>
<table border="0">
  <%
    for(int i = 1; i <=9; i++){ //行
  %>
  <tr>
    <%
      for(int j = 1; j <=i; j++){ //列
    %>
    <td style="border:2px solid black;padding:2px">
      <%=j%>✕<%=i%>=<%=i*j%>
    </td>
    <%

      }
    %>
  </tr>
  <%
    }
  %>
</table>


</body>
</html>