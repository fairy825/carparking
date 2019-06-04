<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>

<head>
	<script src="js/jquery/2.0.0/jquery.min.js"></script>
	<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
	<link href="css/fore/style.css" rel="stylesheet">
	<script src="static/js/main.js" ></script>
	<link href="static/css/main.css" rel="stylesheet" type="text/css"  />
	<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script>
function formatMoney(num){
	num = num.toString().replace(/\$|\,/g,'');
	if(isNaN(num))
	    num = "0";
	sign = (num == (num = Math.abs(num)));
	num = Math.floor(num*100+0.50000000001);
	cents = num%100;
	num = Math.floor(num/100).toString();
	if(cents<10)
	cents = "0" + cents;
	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	num = num.substring(0,num.length-(4*i+3))+','+
	num.substring(num.length-(4*i+3));
	return (((sign)?'':'-') + num + '.' + cents);
}
function checkEmpty(id, name){
	var value = $("#"+id).val();
	if(value.length==0){

		$("#"+id)[0].focus();
		return false;
	}
	return true;
}


$(function(){

	$("div.productDetailDiv").hide();
	$("a.productDetailTopReviewLink").click(function(){
		$("div.productMessageDiv").show();
		$("div.productDetailDiv").hide();
	});
	$("a.productReviewTopPartSelectedLink").click(function(){
		$("div.productMessageDiv").hide();
		$("div.productDetailDiv").show();
	});

	$("span.leaveMessageTextareaSpan").hide();
	$("img.leaveMessageImg").click(function(){

		$(this).hide();
		$("span.leaveMessageTextareaSpan").show();
		$("div.orderItemSumDiv").css("height","100px");
	});

	$("div#footer a[href$=#nowhere]").click(function(){
		alert("模仿天猫的连接，并没有跳转到实际的页面");
	});


	$("a.wangwanglink").click(function(){
		alert("模仿旺旺的图标，并不会打开旺旺");
	});
	$("a.notImplementLink").click(function(){
		alert("这个功能没做，蛤蛤~");
	});


});

</script>
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
						<a class="tab-pane__title"  style="overflow: hidden">Welcome To the Park Booking</a>
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
							<a href="index.html">首页</a>
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
</body>
