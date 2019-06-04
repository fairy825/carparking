<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="static/css/main.css" rel="stylesheet" type="text/css"  th:href="@{~/css/main.css}"/>
    <!-- END custom CSS -->

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js" th:href="@{https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js}"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js" th:href="@{https://oss.maxcdn.com/respond/1.4.2/respond.min.js}"></script>
    <![endif]-->
    <title>订单查看</title>
</head>
<%@include file="include/header.jsp" %>
<script>
var deleteOrder = false;
var deleteOrderid = 0;
$(function(){
$("button.deleteOrderLink").click(function(){
    deleteOrderid = $(this).attr("bid");
    deleteOrder = false;
    $("#deleteConfirmModal").modal("show");
});

$("button.deleteConfirmButton").click(function(){
    deleteOrder = true;
    $("#deleteConfirmModal").modal('hide');

});

$('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
    if(deleteOrder){
        var page="foredeleteBooking";
        $.post(
                page,
                {"bid":deleteOrderid},
                function(result){
                    if("success"==result){
                        $("table.orderListItemTable[bid="+deleteOrderid+"]").remove();
                        location.href="forebought";
                    }
                    else{
                        location.href="login.jsp";
                    }
                }
            );

    }
});


$("button.orderListItemArrive").click(function(){
	    var bid = $(this).attr("bid");
        var page="forebookingArrive";
        $.post(
                page,
                {"bid":bid},
                function(result){
                    if("success"==result){
                        location.href="forebought";
                    }
                    else{
                        location.href="login.jsp";
                    }
                }
            );
})
})
</script>
<body>
<!-- Header -->
<%@include file="include/header.jsp" %>
<!-- END header -->
<!-- header slider -->



<style>
    #register_div{
        /* 居中*/
        float: left;
        /*position: absolute;
        left: 50%; top: 100%;
        width: 500px; height: 330px;
        /* 透明遮罩层 */
        height: 120%;
        background:rgba(255,255,255,0.6)
    }

    #left{
        line-height:30px;

        height:500px;
        width:200px;
        float:left;
        padding:5px;
        font-size: 20px;
    }
    #section {
        position: relative;
        width:800px;
        float: left;
        padding:10px;
        margin-left: 2.5cm;
    }
    #bottom {
        position: relative;

        float: bottom;
        padding:10px;
        margin-left: -11cm;
        margin-right: 4cm;
        margin-top: -2cm;
        margin-bottom: 8cm;

    }
    #right {
        /*width:500px;
        float:right;
        float: top;
        padding:0px;*/
        position: relative;
        line-height:30px;
        height:500px;
        width:300px;
        float:left;
        padding:0px;
        font-size: 5px;

    }

    #content{
        width:800px;
        float:right;
        padding:15px;
    }
    #footer {
        background-color:cornflowerblue;
        color:white;
        clear:both;
        text-align:center;
        padding:5px;
    }
</style>
<div id="register_div" class="col-md-2" style="background-color:#7B7B7B">
    <div id="left">
        <%--<h class="form-signin-heading" style="color: mintcream">个人中心</h>--%>


    </div>
</div>
<h5 style="color: black;margin-bottom: 30px;margin-left: 310px;margin-top: 25px;">您的位置：个人中心>>我的订单</h5>
<div id="section">



        <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="panel panel-default text-left no-boder">
                                        <div class="panel-heading">
                                            订单列表
                                        </div>
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-categoris">
                                                    <thead>
                                                    <tr>
                                                        <th style="text-align: center">预约停车场</th>
                                                        <th style="text-align: center">预约日期</th>
                                                        <th style="text-align: center">预约起始时间</th>
                                                        <th style="text-align: center">预约终止时间</th>
                                                        <th style="text-align: center">订单创建时间</th>
                                                        <th style="text-align: center">状态</th>
                                                        <th style="text-align: center">操作</th>
                                                        <th style="text-align: center">删除</th>

                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbody-categoris">
                                                    <c:forEach items="${bs}" var="b">
                                                    <tr>
                                                        <td style="text-align: center">${b.parking.name}</td>
<%--                                                         <td>${b.id}</td> --%>
                                                   		<td style="text-align: center"><fmt:formatDate value="${b.timeSlot.bookingDate}" pattern="yyyy-MM-dd"/></td>

                                                        <td style="text-align: center">${b.timeSlot.beginTime}:00</td>
                                                        <td style="text-align: center">${b.timeSlot.beginTime+1}:00</td>
				                                        <td style="text-align: center"><fmt:formatDate value="${b.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                        <td style="text-align: center">${b.stateDesc}</td>
                             <td valign="top" class="orderListItemButtonTD orderItemOrderInfoPartTD" width="100px">
                                <c:if test="${b.state=='waitArrive'}">
<%--                                     <a href="forebookingArrive?bid=${b.id}"> --%>
                                        <button bid="${b.id}" class="btn btn-primary orderListItemArrive">我已到达</button>
<!--                                     </a> -->
                                </c:if>
                                <c:if test="${b.state=='waitPay'}">
                                    <a href="forepay?bid=${b.id}&total=${b.parking.price}">
                                        <button class="orderListItemConfirm">付款</button>
                                    </a>
                                </c:if>

                                <c:if test="${b.state=='waitReview' }">
                                    <a href="forereview?bid=${b.id}">
                                        <button  class=" btn btn-primary orderListItemReview">留言</button>
                                    </a>
                                </c:if>
                            </td>
                                                        <td class="orderItemDeleteTD">
                                                        <button class="deleteOrderLink" bid="${b.id}" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                                            <span  class="orderListItemDelete glyphicon glyphicon-trash"></span></button>
<%--                                                           <a class="deleteOrderLink" bid="${b.id}" href="#nowhere"> --%>
<!--                                                            <span  class="orderListItemDelete glyphicon glyphicon-trash"></span> -->
<!--                                                           </a> -->
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




<script language="javascript">
    function agree(){
        if(document.getElementById('cb').checked)
            document.getElementById('tj').disabled=false;
        else
            document.getElementById('tj').disabled='disabled';
    }
</script>

<script src="http://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="http://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="http://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>

<div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-body">
            <p>确认删除？</p>
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
            <button class="btn btn-primary deleteConfirmButton" type="button">确认</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div>

<div style="height:200px"></div>

<%@include file="include/footer.jsp" %>

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
<script src="static/js/jquery.min.js" th:src="@{~/js/jquery.min.js}"></script>
<script src="static/js/bootstrap.min.js" th:src="@{~/js/bootstrap.min.js}"></script>
<!-- Custom JavaScript -->
<script src="static/js/main.js" th:src="@{~/js/main.js}"></script>
</body>
</html>
