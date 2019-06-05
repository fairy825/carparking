<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
$(function(){
	$("button.orderPageCheckOrderItems").click(function(){
		var nid = $(this).attr("nid");
		$("tr.orderPageOrderItemTR[nid="+nid+"]").toggle();
	});
});

</script>

<title>新闻管理</title>
<%@include file="../include/searchNews.jsp"%>


<div class="workingArea">
	<h1 class="label label-info" >新闻管理</h1>
	<br>
	<br>
	
		<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			 <thead>
               <tr class="success">
                    <th>新闻标题</th>
                    <th>发布时间</th>
                     <th>查看详情</th>
                    <th>删除</th>
                </tr>
            </thead>
			
			 <tbody id="tbody-categoris">
                            <c:forEach items="${ns}" var="n">
				<tr>
					<td>${n.title}</td>
				    <td><fmt:formatDate value="${n.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					 <td><button nid=${n.id}  class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button></td>
						
					 <td><a deleteLink="true"
							href="admin_news_delete?id=${n.id}"><span
								class=" 	glyphicon glyphicon-trash"></span></a></td>
					 
				</tr>
				</tr>
					<tr class="orderPageOrderItemTR"  nid=${n.id}>
						<td colspan="10" align="center">
							
							<div  class="orderPageOrderItem">
								<table width="400px" align="center" class="orderPageOrderItemTable">
									
                              			<tr><td  colspan="2">${n.content}</td></tr>			
								</table>
							</div>
						
						</td>
					</tr>
				</c:forEach>
            </tbody>
			
			
		</table>
	</div>
	
	
	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp" %>
	</div>
	
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增新闻</div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="admin_news_add" >
	    		<table class="addTable">
	    			<tr>
	    				<td>新闻标题</td>
	    				<td><input  id="title" name="title"  type="text" class="form-control" placeholder="请输入新闻标题" required autofocus ></td>
	    			</tr>
	    			<tr>
	    				<td>新闻内容</td>
	    				<td><textarea  id="content" name="content" type="text" class="form-control" placeholder="请输入新闻内容" required></textarea></td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<button type="submit" class="btn btn-primary">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>

	
</div>

<%@include file="../include/admin/adminFooter.jsp"%>



