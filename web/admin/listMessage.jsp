<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
	$(function() {
		$("#addForm").submit(function() {
			if (!checkEmpty("name", "产品名称"))
				return false;
// 			if (!checkEmpty("subTitle", "小标题"))
// 				return false;
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

<title>留言管理</title>


<div class="workingArea">

<ol class="breadcrumb">
      <li><a href="admin_district_list">所有区域</a></li>
      <li><a href="admin_parking_list?did=${p.district.id}">${p.district.name}</a></li>
      <li class="active">${p.name}</li>
      <li class="active">留言管理</li>
    </ol>

	<div class="listDataTableDiv">
		<table
			class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					
					<th>内容</th>
					<th>停车场</th>
					<th>发布者</th>
					<th>发布日期</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ms}" var="m">
					<tr>
						<td>${m.content}</td>
						<td>${m.parking.name}</td>
						<td>${m.user.name}</td>	
	   				    <td><fmt:formatDate value="${m.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					    <td><a deleteLink="true" href="admin_message_delete?id=${m.id}&pid=${p.id}"><span class=" 	glyphicon glyphicon-trash"></span></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp"%>
	</div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>
