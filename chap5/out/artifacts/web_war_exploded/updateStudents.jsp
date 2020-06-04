<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gbk"%>
<%@ page import="java.util.*,com.vo.*,com.db.StudentsDB6,com.db.ClassesDB" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息修改页</title>
</head>
<body>
<%
  String studentId=request.getParameter("studentId");
  StudentsDB6 db6=new StudentsDB6();
  Students stu=db6.getStuById(studentId);
 %>
<form action="doUpdateStu.jsp" method="post">
<table border="2" width="70%" algin="center">
<caption>学生信息修改页</caption>
<tr>
      <th>学号：</th>
      <td><%=stu.getStudentId() %>
      <input type="hidden" name="studentId" value="<%=stu.getStudentId() %>"/></td>
    </tr>
    
    <tr>
      <th>姓名：</th><td><input type="text" name="studentName" value="<%=stu.getStudentName() %>"/></td>
    </tr>
    <tr>
      <th>密码：</th><td><input type="password" name="studentPwd" value="<%=stu.getStudentPwd()%>"/></td>
    </tr>
    <tr>
      <th>性别:</th>
      <td>
         <input type="radio" name="sex" value="男"/>男
         <input type="radio" name="sex" value="女"/>女        
      </td>
    </tr>
    <tr>
      <th>班级:</th>
      <td>

         <select name="classId">
         <option>=请选择=</option>
         <%
		  ClassesDB cdb=new ClassesDB();
		  List<Classes> all=cdb.getAllClasses();
		  for(int i=0;i<all.size();i++){
		     Classes cla=(Classes)all.get(i);
         
        %>
         <option value="<%=cla.getClassId()%>"><%=cla.getClassName()%></option>
         <%} %>
         </select>
      </td>
    </tr>
    <tr>
    <td></td>
    <td><input type="submit" value="确认修改"/></td>
    </tr>
</table>
</form>
</body>
</html>