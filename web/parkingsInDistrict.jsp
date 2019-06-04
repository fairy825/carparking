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
<%@include file="include/header.jsp" %>
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

