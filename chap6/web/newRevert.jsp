<%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/6/4
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加回复</title>
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
<div style="width:800px;margin:10px auto">
    <h2>提交留言</h2>
    <%--<input type="hidden" name="writeDate" value=<%=writeDate%>/>--%>
    <%
        String messageId=request.getParameter("messageId");
        session.setAttribute("RevMessageId",messageId);
    %>
    <form action="saveRevert.jsp">
        <table>
            <%--<tr><td>回复人：</td><td><textarea style="width:500px;height:200px" name="writer"></textarea></td></tr>--%>
            <tr><td>内容：</td><td><textarea style="width:500px;height:200px" name="content"></textarea></td></tr>
            <tr><td></td>
                <td><input type="submit" value="提交" /></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
