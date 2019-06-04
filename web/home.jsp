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
<%@include file="include/header.jsp" %>
<div class="slate_gray">
    <div class="container">
        <div class="row header_news_panel">
            <!-- Tab panes -->
            <div class="col-sm-8 tab-content tab-content_mob-p0">
                <div role="tabpanel" class="tab-pane fade in active" id="home">
                    <img src="../static/img/停车场1.jpg" alt="main img" class="tab-pane__img" th:src="@{~/img/swmming.jpg}">
                    <div class="header_news_text tab-pane__block">
                        <p class="tab-pane__category yel_line">Here</p>
                        <a class="tab-pane__title">中山公园地下停车场</a>
                        <p class="tab-pane__text">12月31日营业时间延长至02:00</p>
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
