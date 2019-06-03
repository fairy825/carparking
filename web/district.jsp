<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>场馆介绍</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <link href="static/css/main.css" rel="stylesheet" type="text/css"  th:href="@{~/css/main.css}"/>

    <link rel="stylesheet" href="static/css/bootstrap.min.css" th:href="@{~/css/bootstrap.min.css}">
    <link rel="stylesheet" href="static/css/bootstrap-theme.min.css" th:href="@{~/css/bootstrap-theme.min.css}">
    <link rel="stylesheet" href="static/css/fontAwesome.css" th:href="@{~/css/fontAwesome.css}">
    <link rel="stylesheet" href="static/css/light-box.css" th:href="@{~/css/light-box.css}">
    <link rel="stylesheet" href="static/css/templatemo-style.css" th:href="@{~/css/templatemo-style.css}">

    <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <script src="static/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js" th:src="@{~/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js}"></script>
</head>

<body>

<header id="header" class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="wrap-logo">
                        <a class="tab-pane__title"></a>
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
                            <a href="http://localhost:8080/user/signIn?name=fbo&password=fb701701" style="color: mintcream;font-family: 'Courier New', Courier, monospace">首页</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="" style="color: mintcream;font-family: 'Courier New', Courier, monospace">场馆
                                <span class="arrow"></span>
                            </a>
                            <ul class="wsmenu-submenu">
                                <li>
                                    <a href="404.html">场馆介绍</a>
                                </li>
                                <li>
                                    <a href="http://localhost:8080/venue/venueList">场馆预约</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="category.html" style="color: mintcream;font-family: 'Courier New', Courier, monospace">新闻</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="category.html" style="color: mintcream;font-family: 'Courier New', Courier, monospace">留言</a>
                        </li>
                        <li>
                            <span class="wsmenu-click"></span>
                            <a href="" style="color: mintcream;font-family: 'Courier New', Courier, monospace">个人中心
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

                    </ul>
                </nav>
                <!--Menu HTML Code-->
            </div>
        </div>
    </div>
</header>

<div class="page-heading">
    <div class="container">
        <div class="heading-content">
            <h1>快速预览<em></em></h1>
        </div>
    </div>
</div>


<div class="services">
    <div class="container">
        <div class="col-md-4 col-sm-6">
         <c:forEach items="${ds}" var="d">
           <div class="portfolio-item">
                <a href="foreparkinglist?did=${d.id}"><div class="thumb">
                    <div class="hover-effect">
                        <div class="hover-content">
                            <h1 style="color: mintcream"><em>${d.name}</em></h1>
                        </div>
                    </div>
                    <div class="image">
                        <img src="static/img/兴业太古汇.jpg" th:src="@{~/img/兴业太古汇.jpg}">
                    </div>
                </div></a>
            </div>
          </c:forEach>
        </div>
<!--         <div class="col-md-4 col-sm-6"> -->
<!--             <div class="portfolio-item"> -->
<!--                 <a href="static/img/big_portfolio_item_2.png" data-lightbox="image-1" th:src="@{~/img/big_portfolio_item_2.png}"><div class="thumb"> -->
<!--                     <div class="hover-effect"> -->
<!--                         <div class="hover-content"> -->
<!--                             <h1 style="color: mintcream"><em>爱琴海购物中心</em></h1> -->
<!--                             <p style="color: mintcream">剩余停车位：60</p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="image"> -->
<!--                         <img src="static/img/爱琴海.jpg" th:src="@{~/img/爱琴海.jpg}"> -->
<!--                     </div> -->
<!--                 </div></a> -->
<!--             </div> -->
<!--         </div> -->
<!--         <div class="col-md-4 col-sm-6"> -->
<!--             <div class="portfolio-item"> -->
<!--                 <a href="static/img/big_portfolio_item_3.png" data-lightbox="image-1" th:src="@{~/img/big_portfolio_item_3.png}"><div class="thumb"> -->
<!--                     <div class="hover-effect"> -->
<!--                         <div class="hover-content"> -->
<!--                             <h1 style="color: mintcream"><em>静安大悦城</em></h1> -->
<!--                             <p style="color: mintcream">剩余停车位：98</p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="image"> -->
<!--                         <img src="../static/img/静安大悦城.jpg" th:src="@{~/img/静安大悦城.jpg}"> -->
<!--                     </div> -->
<!--                 </div></a> -->
<!--             </div> -->
<!--         </div> -->
    </div>
</div>

<div class="pricing-tables">
    <div class="container">
        <div class="col-md-4 col-sm-6">
            <div class="table-item">
                <h4>中山公园</h4>
                <span>附近停车场：3</span>
                <ul>
                    <li>手机买单</li>
                    <li>会员优惠</li>
                </ul>
                <div class="simple-btn">
                    <a href="#">Booking</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="table-item premium-item">
                <h4>兴业太古汇</h4>
                <span>附近停车场：4</span>
                <ul>
                    <li>凭小票免费停车</li>
                    <li>手机买单</li>
                </ul>
                <div class="simple-btn">
                    <a href="#">Booking</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="table-item">
                <h4>爱琴海购物公园</h4>
                <span>附近停车场：3</span>
                <<ul>
                <li>消费积分抵扣</li>
                <li>扫码停车</li>
            </ul>
                <div class="simple-btn">
                    <a href="#">Booking</a>
                </div>
            </div>
        </div>
    </div>
</div>


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


<!-- Modal button -->


<script src="https://cdn.bootcss.com/jquery/1.11.2/jquery.min.js" ></script>
<script>window.jQuery || document.write('<script src="../static/js/vendor/jquery-1.11.2.min.js" th:src="@{~/js/vendor/jquery-1.11.2.min.js}"><\/script>')</script>

<script src="../static/js/vendor/bootstrap.min.js" th:src="@{~/js/vendor/bootstrap.min.js}"></script>

<script src="../static/js/plugins.js" th:src="@{~/js/plugins.js}"></script>
<script src="../static/js/main.js" th:src="@{~/js/main.js}"></script>

</body>
</html>
