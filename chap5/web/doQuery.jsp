<%@ page import="com.db.StudentsDB6" %>
<%@ page import="com.vo.Students" %>
<%@ page import="com.db.ClassesDB" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/5/25
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询结果</title>
</head>
<body>
<%
    StudentsDB6 sdb = new StudentsDB6();
    request.setCharacterEncoding("utf-8");
    String stuId = request.getParameter("studentId");
    String stuName = request.getParameter("studentName");
    String classId =request.getParameter("classId");

    //int classId=Integer.parseInt(request.getParameter("classId"));

    //String className = request.getParameter("className");
    if(stuId==null) stuId="";
    if(stuName==null) stuName="";
    if(classId==null) classId="";
    List<Students> students = sdb.getStuByLike(stuId,stuName,classId);
%>
<table border="2" align="center" align="70">
    <caption>显示所有学生信息</caption>
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <%--<th>密码</th>--%>
        <th>性别</th>
        <th>班级号</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <%
        if(students.size()!=0){
            for(int i=0;i<students.size();i++){
                Students stu=(Students)students.get(i);
    %>
    <tr>
        <td><%=stu.getStudentId() %></td>
        <td><%=stu.getStudentName() %></td>
        <%--<td><%=stu.getStudentPwd() %></td>--%>
        <td><%=stu.getSex() %></td>
        <td><%=stu.getClassId() %></td>
        <td><a href="updateStudents.jsp?studentId=<%=stu.getStudentId() %>">修改</a></td>
        <td><a href="deleteStudents.jsp?studentId=<%=stu.getStudentId() %>&studentName=<%=stu.getStudentName()%>">删除</a></td>
    </tr>
    <%
            } //end for
        }//end if
    %>
</table>


</body>
</html>
