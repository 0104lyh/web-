<%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/5/25
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.db.ClassesDB,com.vo.Classes,java.util.*" %>
<html>
<head>
    <title>查询学生页面</title>
</head>
<body>
<form action="doQuery.jsp" method="post">
<table border="2" align="center" align="70">
    <caption>查询学生信息</caption>
    <tr>
        <th>学号</th><td><input type="text" name="studentId"/></td>
    </tr>
    <tr>
        <th>姓名</th><td><input type="text" name="studentName"/></td>
    </tr>

    <tr>
        <th>班级:</th>
        <td>
            <input type="text" name="classId"/>
            <%--<select name="classId">--%>
                <%--<option></option>--%>
                <%--<%--%>
                    <%--ClassesDB cdb=new ClassesDB();--%>
                    <%--List<Classes> all=cdb.getAllClasses();--%>
                    <%--for(int i=0;i<all.size();i++){--%>
                        <%--Classes cla=(Classes)all.get(i);--%>

                <%--%>--%>
                <%--<option value="<%=cla.getClassId()%>"><%=cla.getClassName()%></option>--%>
                <%--<%} %>--%>
            <%--</select>--%>

        </td>
    </tr>

    <tr>
        <td><input type="submit" value="查询"/></td>
        <td><input type="reset" value="重置"/></td>
    </tr>
</body>
</html>
