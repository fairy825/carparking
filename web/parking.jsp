<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<%
   Date date = new Date();
int h = date.getHours();
request.setAttribute("h",h);
%>
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
                                                 <c:if test="${t.beginTime>h}">
                                                <tr>
                                                    <td>${t.beginTime}:00</td>
                                                    <td>${t.beginTime+1}:00</td>
                                                    <td>${t.seat}</td>

                                                    <td>
                                                            <a <c:if test="${t.seat==0}">disabled</c:if> class="btn btn-primary booklink" href="forecreateBooking?tid=${t.id}">
                                                            <i class="fa fa-minus-square" style="color: red"></i> 预约
                                                            </a>
                                                    </td>
                                                </tr>
                                                </c:if>
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

