<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@ page import="com.db.ClassesDB,com.vo.Classes" %>
<html>
  <head> 
    <title>插入一条学生记录</title>
  </head>
  
  <body>
    <form action="doInsertStu.jsp" method="post">
    <table border="2" align="center" width="70%">
    <caption>新增一条学生记录</caption>
    <tr>
      <th>学号：</th><td><input type="text" name="studentId"/></td>
    </tr>
    <tr>
      <th>姓名：</th><td><input type="text" name="studentName"/></td>
    </tr>
    <tr>
      <th>密码：</th><td><input type="password" name="studentPwd"/></td>
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
    <td><input type="submit" value="提交"/></td>
    </tr>
    </table>
    </form>
  </body>
</html>
