<%@ page import="java.util.List" %>
<%@ page import="com.vo.Message" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.impl.MessageDAOImpl" %><%--
  Created by IntelliJ IDEA.
  User: 74430
  Date: 2020/5/31
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>自适应评论列表</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="../lib/OwlCarousel/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="../lib/OwlCarousel/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="../lib//OwlCarousel/assets/owl.theme.default.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'mont serral', sans-serif;
            box-sizing: border-box;
        }
        .testimonia-section {
            background-color: #3498db;
            padding: 40px 0;
            height: 100vh;
        }
        .inner-width {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        .testimonia-section h1 {
            text-align: center;
            color: #333;
            font-size: 24px;
        }
        .border {
            width: 100px;
            height: 3px;
            background-color: #333;
            margin: 40px auto;
        }
        .testimonial {
            background-color: #f1f1f1;
            padding: 40px;
            overflow: hidden;
            border-radius: 8px;
            cursor: pointer;
        }
        .test-info {
            display: flex;
            height: 60px;
            align-items: center;
        }
        .test-pic {
            width: 50px !important;
            border-radius: 50%;
            margin-right: 15px;
        }
        .test-name {
            font-size: 12px;
            color: #333;
        }
        .test-name span {
            display: block;
            font-size: 14px;
            font-weight: 700;
            color: #3498db;
        }
        .testimonial p {
            font-size: 12px;
            line-height: 22px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="testimonia-section">
    <div class="inner-width">
        <h1>messageborad</h1>
        <div class="border"></div>
        <div class="sliders owl-carousel">
            <%
                if(session.getAttribute("check")!=null){
                    List<Message> all = new ArrayList<Message>();
                    MessageDAOImpl MesDAO = new MessageDAOImpl();
                    all = MesDAO.getAllMessage();
                    if (all.size()!=0) {
                        for (int i = 0; i < all.size(); i++) {
                            Message mes = all.get(i);
                            %>
            <div class="testimonial">
                <div class="test-info">
                    <img class="test-pic" src="image/pic.jpg" alt="" />
                    <div class="test-name">
                        <span><%=mes.getWriter()%></span>
                        <%--@Client1--%>
                        <%="id:"+mes.getMessageID()%>
                        <%="   发表时间:"+mes.getWriteDate().toString()%>
                    </div>
                </div>
                <p>
                    <%=mes.getContent()%>
                </p>
            </div>
                        <%}%>
                    <%}%>
                <%}%>



        </div>
    </div>
</div>
<script>
    $('.owl-carousel').owlCarousel({
        margin: 10,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            680: {
                items: 2
            },
            960: {
                items: 3
            }
        }
    })
</script>
</body>
</html>