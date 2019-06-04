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
    <title></title>
</head>
        <%@include file="../include/header.jsp"%>

<body>
<!-- Header -->
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
            <div class="projects">
                <div class="projects__title">
                    <h2 class="block-title__h2">概览</h2>
                </div>
                
                <%@include file="include/districtPage.jsp"%>
                   
<%--                    <div> <c:forEach items="${ps}" var="p"> --%>
<%--                     <a href="foreparking?pid=${p.id}"> --%>
<!--                     <div class="special"> -->
<%--                      <img src="img/parkingSingle/${p.firstParkingImage.id}.jpg" alt="image"height="311" width="311" alt="image"> --%>
<!-- <!--                         <img src="../static/img/yoga1.jpg" height="311" width="551" alt="image" class="special__img" th:src="@{~/img/yoga1.jpg}"> --> -->
<!--                         <div class="special__box"> -->
<%--                             <h5 class="special__category yel_line">${p.name}</h5> --%>
<%--                             <a class="special__link">${p.introduction}</a> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                     </a> -->
<%--                     </c:forEach> --%>
<!--                     </div> -->
                </div>
           
            </div>
            
        </div>
                                                	<div class="pageDiv">
		<%@include file="include/admin/adminPage.jsp" %>
	</div></section>
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
<!-- All JavaScript libraries -->
<script src="static/js/jquery.min.js" th:src="@{~/js/jquery.min.js}"></script>
<script src="static/js/bootstrap.min.js" th:src="@{~/js/bootstrap.min.js}"></script>
<!-- Custom JavaScript -->
<script src="static/js/main.js" th:src="@{~/js/main.js}"></script>
</body>
</html>

