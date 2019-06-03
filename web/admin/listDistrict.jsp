<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
$(function(){
	
	$("#addForm").submit(function(){
		if(!checkEmpty("name","分类名称"))
			return false;
		
		return true;
	});
});

</script>

<title>区域管理</title>


<div class="workingArea">
	<h1 class="label label-info" >区域管理</h1>
	<br>
	<br>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>区域名称</th>
					<th>停车场管理</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ds}" var="d">
				
				<tr>
					<td>${d.name}</td>
					<td><a href="admin_parking_list?did=${d.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>					
					<td><a href="admin_district_edit?id=${d.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true" href="admin_district_delete?id=${d.id}"><span class=" 	glyphicon glyphicon-trash"></span></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp" %>
	</div>
	
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增区域</div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="admin_district_add" >
	    		<table class="addTable">
	    			<tr>
	    				<td>区域名称</td>
	    				<td><input  id="name" name="name" type="text"  class="form-control" placeholder="请输入区域名称" required autofocus></td>
	    			</tr>
	    			
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<button type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
	
	
</div>

<%@include file="../include/admin/adminFooter.jsp"%>