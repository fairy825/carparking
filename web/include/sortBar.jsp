<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<script>
$(function(){
    $("input.sortBarPrice").keyup(function(){
        var num= $(this).val();
        if(num.length==0){
            $("div.productUnit").show();
            return;
        }
             
        num = parseInt(num);
        if(isNaN(num))
            num= 1;
        if(num<=0)
            num = 1;
        $(this).val(num);      
         
        var begin = $("input.beginPrice").val();
        var end = $("input.endPrice").val();
        if(!isNaN(begin) && !isNaN(end)){
            console.log(begin);
            console.log(end);
            $("div.productUnit").hide();
            $("div.productUnit").each(function(){
                var price = $(this).attr("price");
                price = new Number(price);
                 
                if(price<=end && price>=begin)
                    $(this).show();
            });
        }
         
    });
});
</script>
<div class="categorySortBar">
 
    <table class="categorySortBarTable categorySortTable">
        <tr>
            <td <c:if test="${'all'==param.sort||empty param.sort}">class="grayColumn"</c:if> ><a href="?did=${d.id}&sort=all">综合<span class="glyphicon glyphicon-arrow-down"></span></a></td>
            <td <c:if test="${'review'==param.sort}">class="grayColumn"</c:if> ><a href="?did=${d.id}&sort=review">人气<span class="glyphicon glyphicon-arrow-down"></span></a></td>
            <td <c:if test="${'seat'==param.sort}">class="grayColumn"</c:if>><a href="?did=${d.id}&sort=seat">容量<span class="glyphicon glyphicon-arrow-down"></span></a></td>
            <td <c:if test="${'price'==param.sort}">class="grayColumn"</c:if>><a href="?did=${d.id}&sort=price">价格<span class="glyphicon glyphicon-arrow-up"></span></a></td>
        </tr>
    </table>
     
    <table class="categorySortBarTable">
        <tr>
            <td><input class="sortBarPrice beginPrice" type="text" placeholder="请输入最低价格"></td>
            <td class="grayColumn priceMiddleColumn">-</td>
            <td><input class="sortBarPrice endPrice" type="text" placeholder="请输入最高价格"></td>
        </tr>

    </table>
 <form action="foreparkingSearch" method="post" >	
		      <div class="searchDiv">
			    <input name="keyword" type="text" placeholder="请输入停车场名称">
			    <button  type="submit" class="searchButton">搜索</button>
		      </div>
	        </form>	
</div>