<%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/3/21
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%--软件1811 林彦豪 201821122008--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #060c21;
            font-family: 'Poppins', sans-serif;
        }
        .box {
            position: relative;
            width: 300px;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #060c21;
        }
        /* 用box的伪元素添加一个面积比box略大的矩形,并通过改变层叠次序,置于box的下层,达到给box设置边框的效果 */
        .box::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: #fff;
            z-index: -1;
        }
        /* 于上面类似,做一个面积比box略大的矩形,并通过改变层叠次序,置于box的下层,达到给box设置边框的效果 */
        .box::after {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: #fff;
            z-index: -2;
            /* 滤镜属性  给图像设置高斯模糊。"radius"一值设定高斯函数的标准差，或者是屏幕上以多少像素融在一起，所以值越大越模糊；如果没有设定值，则默认是0；这个参数可设置css长度值，但不接受百分比值。 */
            filter: blur(40px);
        }
        .box::before,
        .box::after {
            /* linear-gradient() 函数用于创建一个线性渐变的 "图像"。 参数1:用角度值指定渐变的方向（或角度）  12点钟方向为0deg*/
            background: linear-gradient(235deg, #89ff00, #060c21, #00bcd4);
        }
        .content {
            padding: 20px;
            box-sizing: border-box;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="box">
    <div class="content">
        <%
            if(session.getAttribute("check")!=null)
            {
                // session被设置过，正常登陆过
        %>
        <h1>欢迎<font><%=session.getAttribute("yhm")%></font>使用</h1>
        <%
            int i=0;
            synchronized(application){
                if(application.getAttribute("times")==null){
                    i=1;
                }
                else{
                    i=Integer.parseInt((String)application.getAttribute("times"));
                    i++;
                }
                application.setAttribute("times", Integer.toString(i));
            }%>
        <P>你是第<%=i%>个访问这个网站的人</P>
        <p style="text-align: center"><a href="logout.jsp">注销</a></p>

        <%--<a href="logout.jsp">注销</a>--%>
        <%
        }
        else
        {
            // 两秒后跳转到login.jsp页面之中
            response.setHeader("refresh","2;URL=login.jsp") ;
        %>
        <h1>您还未登陆，请先登陆！！！</h1>
        <p>两秒后跳转到登录界面</p>
        <%=2+"4"%>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
