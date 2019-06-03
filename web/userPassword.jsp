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
    <title>修改密码</title>
</head>
<%@include file="include/header.jsp" %>

<body>
<!-- Header -->
<script>
$(function(){
     
    <c:if test="${!empty msg}">
    $("span.errorMessage").html("${msg}");
    $("div.registerErrorMessageDiv").css("visibility","visible");      
    </c:if>
     
    $("#passForm").submit(function(){
      
        if(0==$("#formerPassword").val().length){
            $("span.errorMessage").html("请输入原密码");
            $("div.registerErrorMessageDiv").css("visibility","visible");          
            return false;
        }      
        if(0==$("#laterPassword").val().length){
            $("span.errorMessage").html("请输入新密码");
            $("div.registerErrorMessageDiv").css("visibility","visible");          
            return false;
        }      
        return true;
    });
})
</script>
<header id="header" class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-sm-offset-2 col-md-offset-5 col-sm-6 col-md-4 hidden-xs">
                    <div class="col-xs-4 col-sm-5">
                        <div class="weather">


                            <div class="weather__city__list">
                                <ul>
                                    <li class="active">
                                        <a href="#">Swimming Pool</a>
                                    </li>
                                    <li>
                                        <a href="#">Climbing</a>
                                    </li>
                                    <li>
                                        <a href="#">Yoga</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-7">
                    <div class="exchange" style="text-align: left">
                        <a class="tab-pane__title"  style="overflow: hidden">Welcome To Venue Management:</a>
                        <a class="tab-pane__title" href="./" th:each="u:${user}" th:text="${u.name}" ></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="wsmenucontent overlapblackbg"></div>
    <div class="wsmenuexpandermain slideRight">
        <a id="navToggle" class="animated-arrow slideLeft">
            <span></span>
        </a>
    </div>
    <div class="header_down">
        <div class="container">
            <div class="wrapper clearfix bigmegamenu">
                <!--Main Menu HTML Code-->
                <nav class="wsmenu slideLeft clearfix">
                    <ul class="mobile-sub wsmenu-list">
                        <li class="visible-xs">
                            <form class="navbar-form mob_search" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search">
                                </div>
                                <button type="submit" class="btn btn-search">
                                    <i class="icon-search"></i>
                                </button>
                            </form>
                        </li>

                        <li class="active">
                            <span class="wsmenu-click"></span>
                            <a href="http://localhost:8080/user/signIn?name=fbo&password=fb701701">首页</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="">场馆
                                <span class="arrow"></span>
                            </a>
                            <ul class="wsmenu-submenu">
                                <li>
                                    <a href="http://localhost:63342/venue_management/templates/venueIntroduction.html?_ijt=4evhh60p8p0htck9hjb86bqlsgl">场馆介绍</a>
                                </li>
                                <li>
                                    <a href="http://localhost:8080/venue/venueList">场馆预约</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="http://localhost:8080/news">新闻</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="http://localhost:8080/message/messageList">留言</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a  th:each="u: ${user}" th:href="@{/user/look(id=${u.id})}">个人中心
                                <span class="arrow"></span>
                            </a>

                            <ul class="wsmenu-submenu">
                                <li>
                                    <a  th:each="u: ${user}" th:href="@{/booking/look(id=${u.id})}"  >订单查看</a>

                                </li>
                                <li>
                                    <a th:each="u: ${user}" th:href="@{/user/look(id=${u.id})}">修改信息</a>
                                </li>

                            </ul>
                        </li>

                    </ul>
                </nav>
                <!--Menu HTML Code-->
            </div>
        </div>
    </div>
</header>
<!-- END header -->
<!-- header slider -->



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
        <h class="form-signin-heading" style="color: mintcream">个人中心</h>
    </div>
</div>


<div id="content">
<div class="registerErrorMessageDiv">
        <div class="alert alert-danger" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
            <span class="errorMessage"></span>
        </div>       
    </div>
    <form id="passForm" class="form-signin" action="forechangePassword" name="reg" >
        <lable  style="color: mintcream">输入原密码</lable>
        <input id="formerPass" class="formerPass" type="password" name="originalPassword" id="successfulInput" class="form-control">
        <br><br>
        <lable  style="color: mintcream">输入新密码</lable>
        <input id="laterPass" class="laterPass" type="password" name="newPassword" id="successfulInput"  class="form-control">
        <br><br>
        <input type="hidden" name="id" value="${user.id}">
        <button type="submit" class="btn btn-primary passwordSubmit" id="btn-reg">提交</button>
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