<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<html xmlns:th="http://www.thymeleaf.org">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>管理员登录</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="static/img/apple-touch-icon.png" >

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" >
    <link rel="stylesheet" href="static/css/bootstrap-theme.min.css" th:href="@{~/css/bootstrap-theme.min.css}">
    <link rel="stylesheet" href="static/css/fontAwesome.css" th:href="@{~/css/fontAwesome.css}">
    <link rel="stylesheet" href="static/css/light-box.css" th:href="@{~/css/light-box.css}">
    <link rel="stylesheet" href="static/css/templatemo-style.css" th:href="@{~/css/templatemo-style.css}">

    <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet" >

    <script src="static/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js" th:src="@{~/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js}"></script>
</head>

<body>

<nav>
    <div class="logo">
        <a href="first-page.jsp">场馆<em>预约</em></a>
    </div>
    <div class="menu-icon">
        <span></span>
    </div>
</nav>

<div id="video-container">
    <div class="video-overlay"></div>
    <div class="video-content">
        <div class="inner">
            <center>
                <div  style="text-align: left" class="col-md-16">
                    <form class="form-signin" method="get" action="foreadminlogin">
                        <br><br><br>
                        <label style="color: mintcream">管理名</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="请输入管理员名" required autofocus><br>
                        <label style="color: mintcream">密码</label>
                        <input type="password" name="password" id="password" class="form-control" placeholder="请输入密码" required autofocus><br>



                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="remember-me" checked="checked" > </label>
                            <a style="color: mintcream;font-family: 'Courier New', Courier, monospace">记住密码
                            </a>
                        </div>
                        <button type="submit" class="btn btn-primary" id="btn-login">登录</button>
                    </form>
                </div>
            </center>
        </div>
    </div>
    <video autoplay loop muted>
        <source src="static/img/highway-loop.mp4" type="video/mp4"  th:src="@{~/img/highway-loop.mp4}"/>
    </video>
</div>


<div class="full-screen-portfolio" id="portfolio">
    <div class="container-fluid">
        <div class="col-md-4 col-sm-6">
            <div class="portfolio-item">
                <a href="static/img/big_portfolio_item_4.png" data-lightbox="image-1" th:href="@{~/img/big_portfolio_item_4.png}"><div class="thumb">
                    <div class="hover-effect">
                        <div class="hover-content">
                            <h1>Swimming<em>  pool</em></h1>
                            <p>Awesome Place Goes Here</p>
                        </div>
                    </div>
                    <div class="image">
                        <img src="static/img/portfolio_item_5.png" th:src="@{~/img/portfolio_item_5.png}">
                    </div>
                </div></a>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="portfolio-item">
                <a href="static/img/big_portfolio_item_2.png" data-lightbox="image-1" th:href="@{~/img/big_portfolio_item_2.png}"><div class="thumb">
                    <div class="hover-effect">
                        <div class="hover-content">
                            <h1>Indoor<em>  climbing</em></h1>
                            <p>Awesome Place Goes Here</p>
                        </div>
                    </div>
                    <div class="image">
                        <img src="static/img/portfolio_item_1.png" th:src="@{~/img/portfolio_item_1.png}">
                    </div>
                </div></a>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="portfolio-item">
                <a href="static/img/big_portfolio_item_3.png" data-lightbox="image-1" th:href="@{~/img/big_portfolio_item_3.png}"><div class="thumb">
                    <div class="hover-effect">
                        <div class="hover-content">
                            <h1>Yoga<em>  club</em></h1>
                            <p>Awesome Place Goes Here</p>
                        </div>
                    </div>
                    <div class="image">
                        <img src="static/img/portfolio_item_7.png" th:src="@{~/img/portfolio_item_7.png}">
                    </div>
                </div></a>
            </div>
        </div>
    </div>
</div>


<footer>
    <div class="container-fluid">
        <div class="col-md-12">
            <p>Made By FB&XYW
            </p>
        </div>
    </div>
</footer>


<!-- Modal button -->
<div class="popup-icon">
    <button id="modBtn" class="modal-btn"><img src="static/img/contact-icon.png" alt="" th:src="@{~/img/contact-icon.png}">登陆</button>
</div>



<section class="overlay-menu">
    <div class="container">
        <div class="row">
            <div class="main-menu">
                <ul>
                    <li>
                        <a href="login.jsp">用户</a>
                    </li>
                    <li>
                        <a href="adminLogin.jsp">管理员</a>
                    </li>

                </ul>
                <p>We create awesome places for you.</p>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.bootcss.com/jquery/1.11.2/jquery.min.js" ></script>
<script>window.jQuery || document.write('<script src="static/js/vendor/jquery-1.11.2.min.js" th:src="@{~/js/vendor/jquery-1.11.2.min.js}"><\/script>')</script>

<script src="static/js/vendor/bootstrap.min.js" th:src="@{~/js/vendor/bootstrap.min.js}"></script>

<script src="static/js/plugins.js" th:src="@{~/js/plugins.js}"></script>
<script src="static/js/main.js" th:src="@{~/js/main.js}"></script>


</body>
</html>