<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     
     
<div class="categoryProducts">

    <c:forEach items="${ps}" var="p" varStatus="stc">
        <div class="productUnit" price="${p.price}">
            <div class="productUnitFrame">
                <a href="foreparking?pid=${p.id}">
                   <div class="special">
                     <img src="img/parkingSingle/${p.firstParkingImage.id}.jpg" alt="image"height="311" width="311" alt="image">
                        <div class="special__box">
                            <h5 class="special__category yel_line">
                             ${p.name}
                             </h5>
                            <a class="special__link">${p.introduction}</a>
                        </div>
                    </div>
                <span class="productPrice">¥<fmt:formatNumber type="number" value="${p.price}" minFractionDigits="2"/></span>

                 
                <div class="show1 productInfo">
                    <span class="monthDeal ">容量 <span class="productDealNumber">${p.totalSeat}</span></span>
                    <span class="productReview">评价<span class="productReviewNumber">${p.reviewCount}</span></span>
                </div>
                
                </a>
            </div>
            </div>
        </div>
    </c:forEach>
        <div style="clear:both"></div>
</div>