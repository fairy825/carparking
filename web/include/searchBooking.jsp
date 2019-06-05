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
// 	function byname(){
//         document.getElementById("nameSearchForm").hidden = false;
//         document.getElementById("priceSearchForm").hidden = true;
//         document.getElementById("seatSearchForm").hidden = true;

// 	};	
// 	function byprice(){
//         document.getElementById("priceSearchForm").hidden = false;
//         document.getElementById("nameSearchForm").hidden = true;
//         document.getElementById("seatSearchForm").hidden = true;
// 	};
// 	function byseat(){
//         document.getElementById("seatSearchForm").hidden = false;
//         document.getElementById("nameSearchForm").hidden = true;
//         document.getElementById("priceSearchForm").hidden = true;
// 	};
	</script>
	</head>
<div class="dropdown">
    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
      查找方式
      <span class="caret"></span>         
    </button>
     
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
      <li>
         <a href="#" onclick="byname()">停车场名称</a>            
      </li>
      <li role="presentation">
         <a href="#" onclick="byprice()">租金</a>             
      </li>
 
      <li role="presentation">
         <a href="#" onclick="byseat()">容量</a>          
      </li>
    </ul>
</div>   
<div  id="userSearchForm">
	<form  action="admin_booking_search" method="post" >	
		<div class="searchDiv">
			<input name="keyword" type="text" placeholder="请输入用户名">
			
			<button  type="submit" class="searchButton">搜索</button>
		</div>
	</form>	
</div>
<!-- <div hidden id="priceSearchForm"> -->
<!-- 	<form action="admin_parking_select" method="post" >	 -->
<!-- 		<table class="categorySortBarTable"> -->
<!--         <tr> -->
<!--             <td><input name="fromCount" class="sortBarPrice beginPrice" type="text" placeholder="请输入"></td> -->
<!--             <td class="grayColumn priceMiddleColumn">-</td> -->
<!--             <td><input name="toCount" class="sortBarPrice endPrice" type="text" placeholder="请输入"></td> -->
<!--             <td>		 -->
<!-- 				<input type="hidden" name="target" value="price"> -->
<!--             	<button  type="submit" class="searchButton">搜索</button> -->
<!--             </td> -->
<!--         </tr> -->
<!--         </table> -->
<!-- 	</form>	 -->
<!-- </div> -->
<!-- <div hidden id="seatSearchForm"> -->
<!-- 	<form action="admin_parking_select" method="post" >	 -->
<!-- 		<table class="categorySortBarTable"> -->
<!--         <tr> -->
<!--             <td><input name="fromCount" class="sortBarPrice beginPrice" type="text" placeholder="请输入"></td> -->
<!--             <td class="grayColumn priceMiddleColumn">-</td> -->
<!--             <td><input name="toCount" class="sortBarPrice endPrice" type="text" placeholder="请输入"></td> -->
<!--             <td>		 -->
<!-- 				<input type="hidden" name="target" value="totalSeat"> -->
<!--             	<button  type="submit" class="searchButton">搜索</button> -->
<!--             </td> -->
<!--         </tr> -->
<!--         </table> -->
<!-- 	</form>	 -->
<!-- </div> -->