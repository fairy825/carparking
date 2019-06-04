<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="HandheldFriendly" content="true">
    <meta content="telephone=no" name="format-detection">
    <!-- favicon -->
    <link rel="shortcut icon" type="image/png" href="favicon.png" />
    <!--[if (gt IE 9)|!(IE)]><!-->
    <!-- custom CSS -->
    <link href="static/css/main.css" rel="stylesheet" type="text/css"  th:href="@{~/css/main.css}"/>
    <!-- END custom CSS -->
    <!--<![endif]-->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <![endif]-->
    <title>Parking</title>
</head>
<script>
  
$(function(){
	
	 $("button.loginSubmitButton").click(function(){
	        var name = $("#name").val();
	        var password = $("#password").val();
	         
	        if(0==name.length||0==password.length){
	            $("span.errorMessage").html("请输入账号密码");
	            $("div.loginErrorMessageDiv").show();          
	            return false;
	        }
	         
	        var page = "foreloginAjax";
	        $.get(
	                page,
	                {"name":name,"password":password},
	                function(result){
	                    if("success"==result){
	                        location.reload();
	                    }
	                    else{
	                        $("span.errorMessage").html("账号密码错误");
	                        $("div.loginErrorMessageDiv").show();                      
	                    }
	                }
	        );         
	         
	        return true;
	    });
	
    $("button.booklink").click(function(){
    	alert("1");
    	
        var page = "forecheckLogin";
        $.get(
                page,
                function(result){
                    if("success"==result){
                        
                        location.href= $(".booklink").attr("link");
                    }
                    else{
                        $("#loginModal").modal('show');                    
                    }
                }
        );     
        return false;
    })
})
</script>
<body>
<!-- Header -->
    <%@include file="include/header.jsp" %>

<header id="header" class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="wrap-logo">
                        <a class="tab-pane__title">Booking</a>
                    </div>
                </div>
                <div class="col-sm-offset-2 col-md-offset-5 col-sm-6 col-md-4 hidden-xs">
                    <div class="col-xs-4 col-sm-5">
                        <div class="weather">
                            <div class="weather__temperature">

                                <em class="active"></em>
                                <em></em>
                                <em></em>
                            </div>
                            <div class="weather__city">
                                <em>Swimming Pool</em>
                                <div class="weather__city__list">
                                    <ul>
                                        <li class="active">
                                            <a href="#">Indoor Climbing</a>
                                        </li>
                                        <li>
                                            <a href="#">Yoga</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
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
                                    <a href="404.html">场馆介绍</a>
                                </li>
                                <li>
                                    <a href="category.html">场馆预约</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="http://localhost:8080/news">新闻</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="category.html">留言</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="">个人中心
                                <span class="arrow"></span>
                            </a>
                            <ul class="wsmenu-submenu">
                                                    <li >
                            <a href="forelogout" style="color: #0d6aad;font-family: 'Courier New', Courier, monospace;font-size: medium">注销</a>
                        </li>
                                <li>
                                    <a href="404.html">订单查看</a>
                                </li>
                                <li>
                                    <a href="category.html">修改信息</a>
                                </li>

                            </ul>
                        </li>
                        
                        <li class="navbar-right hidden-xs">
                            <form class="navbar-form " role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search">
                                </div>
                                <button type="submit" class="btn btn-search">
                                    <i class="icon-search"></i>
                                    <br>Search
                                </button>
                            </form>
                        </li>
                        <li>
                            <div class="visible-xs col-sm-offset-5 col-sm-4">
                                <div class="col-sm-5">
                                    <div class="weather">
                                        <div class="weather__temperature">

                                            <em></em>
                                        </div>
                                        <div class="weather__city">
                                            <em>Swimming Pool</em>
                                            <div class="weather__city__list">
                                                <ul>
                                                    <li class="active">
                                                        <a href="#">Indoor Climbing</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">Yoga</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
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
<section>
    <!-- top news -->
    <div class="wrap wrap_white">
        <div class="container title">
            <h2 class="title__h1 underscore">Booking</h2>
        </div>
    </div>

    <!-- /container-->
</section>

<!-- /top news -->
<section class="wrap wrap_gray">
    <div class="container">
        <div class="row">
            <div class="productPageDiv">
 
    <%@include file="imgAndInfo.jsp" %>

    <%@include file="parkingMessage.jsp" %>
     
    <%@include file="parkingDetail.jsp" %>
</div>
        </div>
    </div>
</section>
<section>
    <div class="wrap wrap_gray pt20" >
        <div class="container">
            <div class="row">
                <div class="col-sm-6" style="position: relative;margin-bottom: 5cm;width: 860px" >
                    <div class="block-title">
                        <h2 class="block-title__h2">开始预约</h2>
                    </div>
                    <div class="thumbnail thumbnail_big">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="panel panel-default text-left no-boder">
                                    <div class="panel-heading">
                                        可预约列表
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-categoris">
                                                <thead>
                                                <tr>
<!--                                                     <th>预约日期</th> -->
                                                    <th>起始时间</th>
                                                    <th>结束时间</th>
                                                    <th>剩余车位</th>
                                                    
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody id="tbody-categoris">
                                                 <c:forEach items="${p.timeSlots}" var="t">
                                                <tr>
<%--                                                     <td th:text="${v.date}"></td> --%>
                                                    <td>${t.beginTime}:00</td>
                                                    <td>${t.beginTime+1}:00</td>
                                                    <td>${t.seat}</td>
                                                    
                                                    <td>
                                                            <a class="btn btn-primary booklink" href="forecreateBooking?tid=${t.id}">
                                                            <i class="fa fa-minus-square" style="color: red"></i> 预约
                                                            </a>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>
</section>
<!-- END Footer -->

<!-- Footer -->
<footer class="footer slate_gray">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <p class="copyright"><a href="http://www.cssmoban.com/" target="_blank" title="模板之家">Made By FB&XYW</a><a href="http://www.cssmoban.com/" title="网页模板" target="_blank"></a></p>
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
<%@include file="include/footer.jsp" %>

<!-- All JavaScript libraries -->
<script src="static/js/jquery.min.js" th:src="@{~/js/jquery.min.js}"></script>
<script src="static/js/bootstrap.min.js" th:src="@{~/js/bootstrap.min.js}"></script>
<!-- Custom JavaScript -->
<script src="static/js/main.js" th:src="@{~/js/main.js}"></script>
</body>
</html>

