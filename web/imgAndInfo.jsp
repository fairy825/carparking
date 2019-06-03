<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 
<script>
 
$(function(){

});
 
</script>
 
<div class="imgAndInfo">
 
    <div class="imgInimgAndInfo">
        <img src="img/parkingSingle/${p.firstParkingImage.id}.jpg" class="bigImg">
        <div class="img4load hidden" ></div>
    </div>
     
    <div class="infoInimgAndInfo">
         
        <div class="productTitle">
            ${p.name}
        </div>
        <div class="productSubTitle">
            ${p.introduction}
        </div>
         
        <div class="productPrice">
            
            <div class="productPriceDiv">
               
                <div class="originalDiv">
                    <span class="originalPriceDesc">价格</span>
                    <span class="originalPrice">
                     <span class="originalPriceYuan">¥</span>
                        <fmt:formatNumber type="number" value="${p.price}" minFractionDigits="2"/>                
                    </span>
                </div>
                <div class="originalDiv">
                    <span class="originalPriceDesc">营业时间</span>
                    <span class="originalPrice">
                      ${p.startTime}:00 - ${p.endTime}:00
                    </span>
                </div>
                <div class="originalDiv">
                    <span class="originalPriceDesc">联系电话</span>
                    <span class="originalPrice">
                      ${p.phoneNumber}
                    </span>
                </div>
                <div class="originalDiv">
                    <span class="originalPriceDesc">地址</span>
                    <span class="originalPrice">
                    ${p.location}
                    </span>
                </div>
                <div class="originalDiv">
                    <span class="originalPriceDesc">容量</span>
                    <span class="originalPrice">
                    ${p.totalSeat}
                    </span>
                </div>
            </div>
        </div>

        
         
        <div class="buyDiv">
            <a class="buyLink" href="forebuyone?pid=${p.id}"><button class="buyButton">立即购买</button></a>
        </div>
    </div>
     
    <div style="clear:both"></div>
     
</div>