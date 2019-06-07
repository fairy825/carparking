<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>


<title>编辑时段</title>

<script>
$(function() {
	$("#editForm").submit(function() {
		if (!checkEmpty("name", "产品名称"))
			return false;
//			if (!checkEmpty("subTitle", "小标题"))
//				return false;
if (!checkTimeNumber("startTime", "开始营业时间"))
				return false;
			if (!checkTimeNumber("endTime", "结束营业时间"))
				return false;
		if (!checkNumber("orignalPrice", "原价格"))
			return false;
		if (!checkNumber("promotePrice", "优惠价格"))
			return false;
		if (!checkInt("stock", "库存"))
			return false;
		return true;
	});
});
</script>

<div class="workingArea">

	<div class="panel panel-warning editDiv">
		<div class="panel-heading">编辑时段</div>
		<div class="panel-body">
			<form method="post" id="editForm" action="admin_timeSlot_update">
				<table class="editTable">
				    <tr>
						<td>停车场名称</td>
						<td><input value="${ts.parking.name}" class="form-control" disabled  ></input><br>
						</td>
					</tr>
					<tr>
						<td>开始时间</td>
						<td><input value="${ts.beginTime}" class="form-control" disabled></input><span>:00</span><br>
                        </td>
					</tr>
                    <tr>
						<td>结束时间</td>
						<td><input value="${ts.beginTime+1}" class="form-control" disabled></input><span>:00</span><br>
                        </td>
					</tr>   
					<tr>
						<td>剩余车位</td>
						<td><input name="seat" id="seat" value="${ts.seat}" class="form-control" required ></input><span>/${ts.parking.totalSeat}</span><br>
                        </td>
					</tr>
				
				
				
					<tr class="submitTR">
						<td colspan="2" align="center">
						<input type="hidden" name="id" value="${ts.id}">
						<input type="hidden" name="pid" value="${ts.parking.id}">
						<input type="hidden" name="beginTime" id="beginTime" value="${ts.beginTime}" class="form-control" ></input>
						<button type="submit" class="btn btn-success">提 交</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>