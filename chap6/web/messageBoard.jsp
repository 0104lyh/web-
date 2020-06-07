<%@ page import="java.util.List" %>
<%@ page import="com.vo.Message" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.impl.MessageDAOImpl" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.dao.impl.RevertDAOImpl" %>
<%@ page import="com.vo.Revert" %>
<%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/6/1
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>留言列表 -- HoverTree</title>
    <style>
        .keleyitable {
            width: 800px;
        }

        .keleyitable table, td, th {
            border: 1px solid green;margin-top:10px;
        }
        .klytd {width:100px;text-align:right
        }
        .hvttd {
            width:500px}
    </style>

</head>
<body>
<nav>
    <%
        int count=0;
        int messageid=0;
        if(session.getAttribute("check")!=null){
            %>
    <a href="logout.jsp">注销</a>
        <%}else{%>
            <a href="login.jsp">登录</a>
        <%}%>
    <a href="">消息</a>
</nav>
<div style="margin:0px auto;" class="keleyitable"><h2>留言列表</h2>
<%
    //session.setAttribute("count",count);
    String writer=(String)session.getAttribute("yhm");
    String userid = (String) session.getAttribute("userid");
        //System.out.println(writer+"  "+userid);
    if(session.getAttribute("check")!=null){

        List<Message> all = new ArrayList<Message>();
        MessageDAOImpl MesDAO = new MessageDAOImpl();
        RevertDAOImpl revertDAO = new RevertDAOImpl();
        all = MesDAO.getAllMessage();
        if (all.size()!=0) {
            for (int i = 0; i < all.size(); i++) {
                Message mes = all.get(i);
                count++;
                %>
    <table>
        <tr><td class="klytd">留言时间：</td><td class="hvttd"><%=mes.getWriteDate().toString()%></td></tr>
        <tr><td class="klytd">留言人：</td><td class ="hvttd"><%=mes.getWriter()%></td></tr>
        <tr><td class="klytd">标题：</td><td class ="hvttd"><%=mes.getTitle()%></td></tr>
        <tr><td class="klytd">内容：</td><td class ="hvttd"><%=mes.getContent()%></td></tr>
        <%
            List<Revert> reverts = revertDAO.getRevertByMessageID(mes.getMessageID());
            for(int j=0;j<reverts.size();j++){
                %>
        <tr><td class="klytd">回复:</td>
            <td class="hvttd"><%=reverts.get(j).getContent()%></td>
            <%}%>
        <tr>
            <td class="klytd"><a href="newRevert.jsp?messageId=<%=mes.getMessageID()%>">添加回复</a></td>
            <td class="klytd"><a href="deleteMessage.jsp?messageId=<%=mes.getMessageID()%>"> 删除</a> </td>
        </tr>
    </table>
            <%}%>
        <%}%>
    <%}%>
    <div style="width:800px;margin:10px auto">
        <h2>提交留言</h2>
        <%--<input type="hidden" name="writeDate" value=<%=writeDate%>/>--%>
        <form action="newMessage.jsp">
        <table><tr><td> 标题：</td><td><input type="text" style="width:500px" name="title"/></td></tr>
            <tr><td>内容：</td><td><textarea style="width:500px;height:200px" name="content"></textarea></td></tr>
            <tr><td></td>
                <td><input type="submit" value="提交" /></td>
            </tr>
        </table>
        </form>
    </div>
</div>

<div style="width:800px;margin:10px auto;font-family:Arial, Helvetica, sans-serif;text-align:center;">jmu 201821122008 林彦豪 </div>
</body>
</html>