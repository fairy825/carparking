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
    <!-- custom CSS -->
    <link href="static/css/main.css" rel="stylesheet" type="text/css"  />
    <!-- END custom CSS -->

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js" ></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js" ></script>
    <![endif]-->
    <title>Home</title>
</head>
<body>
<!-- Header -->
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
                            <a href="forehome">首页</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="foredistrict">场馆</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="forenews">新闻</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                                <a href="#nowhere">个人中心
                                    <span class="arrow"></span>
                                </a>

                            <ul class="wsmenu-submenu">
                                <li>
                                    <a href="forebought">订单查看</a>

                                </li>
                                <li>
                                    <a href="foreuser">修改信息</a>
                                </li>

                            </ul>
                        </li>
                        <li >
                            <div align="right" style="position: relative;margin-left: 19cm;margin-right: -9cm">
                            <span class="wsmenu-click"></span>
                            <a href="forelogout" style="color: #0d6aad;font-family: 'Courier New', Courier, monospace;font-size: medium">注销</a>
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
<div class="slate_gray">
    <div class="container">
        <div class="row header_news_panel">
            <!-- Tab panes -->
            <div class="col-sm-8 tab-content tab-content_mob-p0">
                <div role="tabpanel" class="tab-pane fade in active" id="home">
                    <img src="../static/img/swmming.jpg" alt="main img" class="tab-pane__img" th:src="@{~/img/swmming.jpg}">
                    <div class="header_news_text tab-pane__block">
                        <p class="tab-pane__category yel_line">Here</p>
                        <a class="tab-pane__title">The Swimming Pool</a>
                        <p class="tab-pane__text">It's an awesome place for you to have fun alone or with your family.</p>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile">
                    <img src="../static/img/climbing.jpg" alt="main img" class="tab-pane__img" th:src="@{~/img/climbing.jpg}">
                    <div class="header_news_text tab-pane__block">
                        <p class="tab-pane__category yel_line">Here</p>
                        <a class="tab-pane__title">The Indoor Climbing</a>
                        <p class="tab-pane__text">It's an awesome place for you to have fun alone or with your family.</p>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="messages">
                    <img src="../static/img/yoga1.jpg" alt="main img" class="tab-pane__img" th:src="@{~/img/yoga1.jpg}">
                    <div class="header_news_text tab-pane__block">
                        <p class="tab-pane__category yel_line">Here</p>
                        <a class="tab-pane__title">The Yoga Club</a>
                        <p class="tab-pane__text">It's an awesome place for you to have fun alone or with your family.</p>
                    </div>
                </div>

            </div>
            <!-- END Tab panes -->
            <!-- Nav tabs -->
            <div class="col-sm-4 news-tabs">
                <p class="news-tabs__title h2"><a style="text-decoration:none; color:white" href="forenews">最新新闻</a></p>
                <ul class="news-tabs__nav nav nav-tabs shadow_text" role="tablist">
                <c:forEach items="${ns}" var="n">
                    <li role="presentation">
                        <a href="forenews?id=${n.id}" role="tab" >
                            <span class="time">${n.createDate}</span>
                            ${n.title}
                        </a>
                    </li>
                </c:forEach>
                </ul>
            </div>
            <!-- END Nav tabs -->
        </div>
    </div>
</div>

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
<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<!-- Custom JavaScript -->
<script src="static/js/main.js" ></script>
</body>
</html>
