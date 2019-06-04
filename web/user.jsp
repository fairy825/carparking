<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="HandheldFriendly" content="true">
    <meta content="telephone=no" name="format-detection">
    <!-- favicon -->
    <!-- custom CSS -->
    <link href="static/css/main.css" rel="stylesheet" type="text/css"  th:href="@{~/css/main.css}"/>
    <!-- END custom CSS -->

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js" th:href="@{https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js}"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js" th:href="@{https://oss.maxcdn.com/respond/1.4.2/respond.min.js}"></script>
    <![endif]-->
    <title>修改个人信息</title>
</head>
<body>
<!-- Header -->
<%@include file="include/header.jsp" %>
<style>
    #register_div{
        /* 居中*/
        float: left;
        /*position: absolute;
        left: 50%; top: 100%;
        width: 500px; height: 330px;
        /* 透明遮罩层 */
        height: 120%;
        background:rgba(255,255,255,0.6)
    }

    #left{
        line-height:30px;

        height:500px;
        width:300px;
        float:left;
        padding:5px;
        font-size: 20px;
    }
    #section {
        position: relative;
        width:600px;
        float: left;
        padding:10px;
        margin-left: 2cm;
    }
    #bottom {
        position: relative;

        float: bottom;
        padding:10px;
        margin-left: -11cm;
        margin-right: 4cm;
        margin-top: -2cm;
        margin-bottom: 8cm;

    }
    #right {
        /*width:500px;
        float:right;
        float: top;
        padding:0px;*/
        position: relative;
        line-height:30px;
        height:500px;
        width:300px;
        float:left;
        padding:0px;
        font-size: 5px;

    }

    #content{
        width:800px;
        float:right;
        padding:15px;
        position:relative;
        margin-bottom: 11cm;
        margin-left: -10cm;
        margin-right: 4cm;
    }
    #footer {
        background-color:cornflowerblue;
        color:white;
        clear:both;
        text-align:center;
        padding:5px;
    }
</style>
<div id="register_div" class="col-md-2" style="background-color:#7B7B7B">
    <div id="left">
        <%--<h class="form-signin-heading" style="color: mintcream">个人中心</h><p></p>--%>
            <%--<a style="color: mintcream" href="forepassword?id=${user.id}"> 修改密码--%>
            <%--</a>--%>
    </div>
</div>




<div id="content">
    <h5 style="color: white;margin-bottom: 30px;">您的位置：个人中心>>修改信息</h5>
    <form class="form-signin" action="forechangeInfo" name="reg" >
        <lable for="successfulInput" style="color: mintcream">用户名</lable>
        <input type="text" name="name" value="${user.name}" id="successfulInput" class="form-control">
        <br><br>
        <lable for="successfulInput" style="color: mintcream">电话</lable>
        <input type="text" name="phoneNumber" value="${user.phoneNumber}" id="successfulInput" class="form-control">
        <br><br>
        <input type="hidden" name="id" value="${user.id}">
        <button type="submit" class="btn btn-primary" id="btn-reg">提交</button>
    </form>
</div>





<script language="javascript">
    function agree(){
        if(document.getElementById('cb').checked)
            document.getElementById('tj').disabled=false;
        else
            document.getElementById('tj').disabled='disabled';
    }
</script>



<!-- Footer -->
<footer class="footer slate_gray">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <p class="copyright"> <a href="http://www.cssmoban.com/" target="_blank" title="模板之家"></a>Made By<a href="http://www.cssmoban.com/" title="网页模板" target="_blank">FB&XYW</a></p>
            </div>
            <div class="col-sm-6">
                <div class="social navbar-right">
                    <p class="social__text">Available in social networks</p>
                    <ul class="social__list">
                        <li class="social__item">
                            <a class="facebook" href="#">
                                <i class="icon-facebook"></i>
                            </a>
                        </li>
                        <li class="social__item">
                            <a class="twitter" href="#">
                                <i class="icon-twitter"></i>
                            </a>
                        </li>
                        <li class="social__item">
                            <a class="gplus" href="#">
                                <i class="icon-gplus"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- END Footer -->
<!-- All JavaScript libraries -->
<script src="static/js/jquery.min.js" th:src="@{~/js/jquery.min.js}"></script>
<script src="static/js/bootstrap.min.js" th:src="@{~/js/bootstrap.min.js}"></script>
<!-- Custom JavaScript -->
<script src="static/js/main.js" th:src="@{~/js/main.js}"></script>
</body>
</html>
