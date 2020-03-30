<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.vo.Students,com.db.StudentsDB6" %>
<!DOCTYPE HTML>
<html>
  <head>  
    <title>doInsertStu.jsp</title>
  </head>
  
  <body>
    <%
    request.setCharacterEncoding("gbk");
    String studentId=request.getParameter("studentId");
    String studentName=request.getParameter("studentName");
    String studentPwd=request.getParameter("studentPwd");
    String sex=request.getParameter("sex");
    int classId=Integer.parseInt(request.getParameter("classId"));
    Students stu=new Students(studentId,studentName,studentPwd,sex,classId);
   // System.out.println(stu);
     int flag=0;
     StudentsDB6 db6=new StudentsDB6();
     flag=db6.insertStudents(stu);
     if(flag==1){
     %>
     <h2>成功插入姓名为：<%=stu.getStudentName()%>的学生记录</h2>
     <%}else{ %>
     <h2>插入操作不成功！<a href="insertStudents.jsp">返回 </a></h2>
     <%} %>
  </body>
</html>
