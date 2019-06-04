<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
$(function(){
	$("button.orderPageCheckOrderItems").click(function(){
		var pid = $(this).attr("pid");
		$("tr.orderPageOrderItemTR[pid="+pid+"]").toggle();
	});
});

	$(function() {
		$("#addForm").submit(function() {
			if (!checkEmpty("name", "产品名称"))
				return false;
// 			if (!checkEmpty("subTitle", "小标题"))
// 				return false;
			if (!checkTimeNumber("startTime", "开始营业时间"))
				return false;
			if (!checkTimeNumber("endTime", "结束营业时间"))
				return false;
			if (!checkNumber("promotePrice", "优惠价格"))
				return false;
			if (!checkInt("stock", "库存"))
				return false;
			return true;
		});
	});
</script>

<title>停车场管理</title>
<%@include file="../include/searchParking.jsp"%>


<div class="workingArea">
<ol class="breadcrumb">
      <li><a href="admin_district_list">所有区域</a></li>
      <li><a href="admin_parking_list?did=${d.id}">${d.name}</a></li>
      <li class="active">停车场管理</li>
    </ol>


	<div class="listDataTableDiv">
		<table
			class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					 <th>停车场名称</th>
					 <th>图片</th>
                     <th>区域</th>
                     <th>停车场租金</th>
                     <th>容量</th>
                     <th width="80px">图片管理</th>
                     <th width="80px">留言管理</th>
                     <th>查看详情</th>
					 <th>编辑</th>
					 <th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ps}" var="p">
					<tr>
						<td>${p.name}</td>
							<td>
						
						<c:if test="${!empty p.firstParkingImage}">
							<img width="40px" src="img/parkingSingle/${p.firstParkingImage.id}.jpg">
						</c:if>
						
						</td>
						<td>${p.district.name}</td>
						<td><fmt:formatNumber type="number" value="${p.price}" minFractionDigits="2"/></td>
						<td>${p.totalSeat}</td>
					
						<td><a href="admin_parkingImage_list?pid=${p.id}"><span
								class="glyphicon glyphicon-picture"></span></a></td>
						<td><a href="admin_message_list?pid=${p.id}"><span
								class="glyphicon glyphicon glyphicon-text-width"></span></a></td>
						<td><button pid=${p.id}  class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button></td>
						<td><a href="admin_parking_edit?id=${p.id}"><span
								class="glyphicon glyphicon-edit"></span></a></td>
						<td><a deleteLink="true"
							href="admin_parking_delete?id=${p.id}"><span
								class=" 	glyphicon glyphicon-trash"></span></a></td>

					</tr>
					<tr class="orderPageOrderItemTR"  pid=${p.id}>
						<td colspan="10" align="center">
							
							<div  class="orderPageOrderItem">
								<table width="400px" align="center" class="orderPageOrderItemTable">
										<tr>
										  <td style="font-weight: bold">营业时间：</td>
                                          <td>${p.startTime}:00 - ${p.endTime}:00</td>
                                        </tr>
										<tr>
										  <td style="font-weight: bold">联系电话：</td>
                                          <td>${p.phoneNumber}</td>
                                        </tr>
                                        <tr>
										  <td style="font-weight: bold">地址：</td>
                                          <td>${p.location}</td>
                                        </tr>
                                        <tr>
										  <td colspan="2"  style="font-weight: bold">介绍：</td>
                                          
                                        </tr>
                              			<tr><td  colspan="2">${p.introduction}</td></tr>			
								</table>
							</div>
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp"%>
	</div>

	<div class="panel panel-warning addDiv">
		<div class="panel-heading">新增停车场</div>
		<div class="panel-body">
			<form method="post" id="addForm" action="admin_parking_add">
				<table class="addTable">
					<tr>
						<td>停车场名称</td>
						<td><input name="name" id="name" class="form-control" placeholder="请输入停车场名称" required autofocus  ></input><br>
						</td>
					</tr>
					<tr>
						<td>介绍</td>
						<td><textarea name="introduction" id="introduction"  class="form-control" placeholder="请输入停车场介绍" ></textarea><br>
                        </td>
					</tr>
                    <tr>
						<td>租金</td>
						<td><input name="price" id="price"  class="form-control" placeholder="请输入停车场租金" required></input><br>
                        </td>
					</tr>   
				    <tr>
						<td>容量</td>
						<td><input name="totalSeat" id="totalSeat" class="form-control" placeholder="请输入停车场容量" required ></input><br>
                        </td>
					</tr>
					<tr>
						<td>营业时间</td>
						<td><input name="startTime" id="startTime" class="form-control" required ></input>:00 - 
						<input name="endTime" id="endTime" class="form-control" required >:00</input>
						<br>
                        </td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td><input name="phoneNumber" id="phoneNumber"  class="form-control" placeholder="请输入联系电话" required></input><br>
                        </td>
					</tr>
					<tr>
						<td>地址</td>
						<td><input name="location" id="location"  class="form-control" placeholder="请输入停车场地址" required></input><br>
				        </td>
					</tr>

					<tr class="submitTR">
						<td colspan="2" align="center">
							<input type="hidden" name="did" value="${d.id}">
							<button type="submit" class="btn btn-primary">提 交</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>
