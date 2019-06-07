<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
$(function(){
	$("button.orderPageCheckOrderItems").click(function(){
		var oid = $(this).attr("oid");
		$("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
	});
});

</script>

<title>订单管理</title>
<%@include file="../include/searchBooking.jsp"%>


<div class="workingArea">
	<h1 class="label label-info" >订单管理</h1>
	<br>
	<br>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover1  table-condensed">
			<thead>
				<tr class="success">
				    <th>用户</th>
                    <th>停车场</th>
                    <th>创建时间</th>
					<th>支付时间</th>
					<th>到达时间</th>
					<th>停车起始时间</th>
                    <th>停车终止时间</th>
                    <th>订单状态</th>
                    
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bs}" var="b">
					<tr>
						<td>${b.user.name}</td>
						<td>${b.parking.name}</td>
						
						<td><fmt:formatDate value="${b.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${b.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${b.arriveDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${b.timeSlot.beginTime}:00</td>
						<td>${b.timeSlot.beginTime+1}:00</td>
						<td>${b.stateDesc}</td>
							
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp" %>
	</div>
	

	
</div>

<%@include file="../include/admin/adminFooter.jsp"%>
