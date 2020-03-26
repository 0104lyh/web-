<%-- Created by IntelliJ IDEA. --%>
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
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <!--
      <link rel="stylesheet" type="text/css" href="styles.css">
      -->
</head>

<body>
<%!
  //返回九九乘法表对应的HTML代码，通过表达式来调用，在页面上显示
  String printMultiTable1() {
    String s = "";
    for (int i = 0; i <= 9; i++) {
      for (int j = 1; j <= i; j++) {
        s += i + "*" + j + "=" + (i * j) + "    ";
      }
      s += "<br>";
    }
    return s;
  }

%>
<h1>九九乘法表</h1>
<!-- 表达式的方式输出 -->
<%=printMultiTable1()%>



</body>
</html>