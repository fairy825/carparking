<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<div class="productDetailDiv" >
    <div class="productDetailTopPart">
        <a href="#nowhere" class="productDetailTopPartSelectedLink selected">停车场详情</a>
        <a href="#nowhere" class="productDetailTopReviewLink">累计留言 <span class="productDetailTopReviewLinkNumber">${p.reviewCount}</span> </a>
    </div>

    <div class="productDetailImagesPart">
            <c:forEach items="${p.parkingDetailImages}" var="pi">
                <img src="img/parkingDetail/${pi.id}.jpg">
            </c:forEach>
    </div>
</div>
