<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
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
    <![endif]-->
    <title>News</title>
</head>
<body>
<%@include file="include/header.jsp" %>
<!-- END header -->
<!-- header slider -->
<div class="wrapper">
    <article class="container articles">
        <div class="row">
            <div class="col-sm-4 col-md-3 right_sidebar hidden-xs hidden-sm" data-spy="affix" data-offset-top="112" data-offset-bottom="80">
                <div class="news-tabs">
                    <p class="news-tabs__title h2">最新新闻</p>
                    <ul class="news-tabs__nav nav nav-tabs shadow_text" role="tablist">
                        <c:forEach items="${ns}" var="n">
                    <li role="presentation" <c:if test="${n.id==nn.id}">class="active"</c:if>>
                        <a href="forenews?id=${n.id}" role="tab" >
                            <span class="time">${n.createDate}</span>
                            ${n.title}
                        </a>
                    </li>
                </c:forEach>
                    </ul>
                </div>



            </div>


            <div class="col-sm-12 col-md-9 article_text">
                <div class="current">
                    <h1 class="text-center yel_line current__title">${nn.title}</h1>
                    <p class="current__text">${nn.content}</p>
              </div>
            </div>


        </div>
    </article>
</div>
<!-- Footer -->
<footer class="footer slate_gray">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <p class="copyright"><a href="http://www.cssmoban.com/" target="_blank" title="模板之家" style="color: mintcream">Made By FB&XYW</a><a href="http://www.cssmoban.com/" title="网页模板" target="_blank"></a></p>
            </div>
        </div>
    </div>
</footer>
<!-- END Footer -->
<!-- All JavaScript libraries -->
<script src="static/js/jquery.min.js" th:src="@{~/js/jquery.min.js}"></script>
<script src="static/js/bootstrap.min.js" th:src="@{~/js/bootstrap.min.js}" ></script>
<!-- Custom JavaScript -->
<script src="static/js/main.js" th:src="@{~/js/main.js}"></script>
</body>
</html>
