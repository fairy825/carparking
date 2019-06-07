<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>


<title>编辑停车场</title>

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
		<div class="panel-heading">编辑停车场</div>
		<div class="panel-body">
			<form method="post" id="editForm" action="admin_parking_update">
				<table class="editTable">
				    <tr>
						<td>停车场名称</td>
						<td><input name="name" id="name" value="${p.name}" class="form-control" placeholder="请输入停车场名称" required autofocus  ></input><br>
						</td>
					</tr>
					<tr>
						<td>介绍</td>
						<td><textarea name="introduction" id="introduction"  class="form-control" >${p.introduction}</textarea><br>
                        </td>
					</tr>
                    <tr>
						<td>租金</td>
						<td><input name="price" id="price" value="${p.price}" class="form-control" placeholder="请输入停车场租金" required></input><br>
                        </td>
					</tr>   
				    <tr>
						<td>容量</td>
						<td><input name="totalSeat" id="totalSeat" value="${p.totalSeat}" class="form-control" placeholder="请输入停车场容量" required ></input><br>
                        </td>
					</tr>
					<tr>
						<td>营业时间</td>
						<td><input name="startTime" id="startTime" value="${p.startTime}" class="form-control" required ></input>:00 - 
						<input name="endTime" id="endTime" class="form-control" value="${p.endTime}" required >:00</input>
						<br>
                        </td>
					</tr>
					
					<tr>
						<td>联系电话</td>
						<td><input name="phoneNumber" id="phoneNumber" value="${p.phoneNumber}"  class="form-control" placeholder="请输入联系电话" required></input><br>
                        </td>
					</tr>
					<tr>
						<td>地址</td>
						<td><input name="location" id="location" value="${p.location}" class="form-control" placeholder="请输入停车场地址" required></input><br>
				        </td>
					</tr>
				
				
					<tr class="submitTR">
						<td colspan="2" align="center">
						<input type="hidden" name="id" value="${p.id}">
						<input type="hidden" name="did" value="${p.district.id}">
						<button type="submit" class="btn btn-success">提 交</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>