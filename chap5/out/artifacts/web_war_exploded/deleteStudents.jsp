<%@ page import="com.db.StudentsDB6" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除学生页面</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");
    if(request.getParameter("studentId")!=null){
        String studentId = request.getParameter("studentId");
        String studentName = request.getParameter("studentName");
        StudentsDB6 sdb = new StudentsDB6();
        if(sdb.deleteStudents(studentId)>0){%>
<h3>成功删除<%=studentName%>同学的信息</h3>
<%}else{ %>
<h3>删除失败!</h3>
<%} %>
<%};%>
</body>
</html>
