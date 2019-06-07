<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<html>

<head>
<!-- 	<script src="../js/jquery/2.0.0/jquery.min.js"></script> -->
<!-- 	<link href="../css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet"> -->
<!-- 	<script src="../js/bootstrap/3.3.6/bootstrap.min.js"></script> -->
<!-- 	<link href="../css/fore/style.css" rel="stylesheet"> -->
<!-- 我也不知道为什么上面的样式没导进来 -->
	<script>
	function byall(){
        document.getElementById("userSearchForm").hidden = true;
        document.getElementById("priceSearchForm").hidden = true;
        document.getElementById("seatSearchForm").hidden = true;
	};
	function byname(){
        document.getElementById("userSearchForm").hidden = false;
        document.getElementById("priceSearchForm").hidden = true;
        document.getElementById("seatSearchForm").hidden = true;
	};	
	function byprice(){
        document.getElementById("priceSearchForm").hidden = false;
        document.getElementById("userSearchForm").hidden = true;
        document.getElementById("seatSearchForm").hidden = true;
	};
	function byseat(){
        document.getElementById("seatSearchForm").hidden = false;
        document.getElementById("userSearchForm").hidden = true;
        document.getElementById("priceSearchForm").hidden = true;
	};
	</script>
	</head>
<div class="dropdown">
    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
      查找方式
      <span class="caret"></span>         
    </button>
     
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
      <li>
         <a href="admin_booking_list" onclick="byall()">全部</a>            
      </li>
      <li role="presentation">
         <a href="#" onclick="byname()">用户名</a>            
      </li>
      <li role="presentation">
         <a href="#" onclick="byprice()">停车场</a>             
      </li>
 
      <li role="presentation">
         <a href="#" onclick="byseat()">状态</a>          
      </li>
    </ul>
</div>   
<div hidden id="userSearchForm">
	<form  action="admin_booking_list?search=username" method="post" >	
		<div class="searchDiv">
			<input name="keyword" type="text" placeholder="请输入用户名">
			<button  type="submit" class="searchButton">搜索</button>
		</div>
	</form>	
</div>
<div hidden id="priceSearchForm">
	<form action="admin_booking_list?search=parkingname" method="post" >	
		<div class="searchDiv">
			<input name="keyword" type="text" placeholder="请输入停车场名称">
			<button  type="submit" class="searchButton">搜索</button>
		</div>
	</form>	
</div>
 <div hidden id="seatSearchForm"> 
	<div class="dropdown">
    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
      状态
      <span class="caret"></span>         
    </button>
     
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
      <li>
         <a href="?state=waitPay">待付款</a>            
      </li>
      <li role="presentation">
         <a href="?state=waitTime">未到预约时间</a>             
      </li>
 
      <li role="presentation">
         <a href="?state=waitArrive">待到达</a>          
      </li>
      <li role="presentation">
         <a href="?state=waitFinish">进行中</a>          
      </li>
      
      <li role="presentation">
         <a href="?state=waitReview">可留言</a>          
      </li>
      <li role="presentation">
         <a href="?state=finish">已结束</a>          
      </li>
    </ul>
</div>   
</div> 