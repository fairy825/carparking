<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<div class="productMessageDiv" >
    <div class="productReviewTopPart">
        <a  href="#nowhere" class="productReviewTopPartSelectedLink">停车场详情</a>
        <a  href="#nowhere" class="selected">累计留言 <span class="productReviewTopReviewLinkNumber">${p.reviewCount}</span> </a>
    </div>
    <div class="productReviewContentPart">
        <c:forEach items="${ms}" var="m">
        <div class="productReviewItem">
         
            <div class="productReviewItemDesc">
                <div class="productReviewItemContent">
                    ${m.content}
                </div>
                <div class="productReviewItemDate"><fmt:formatDate value="${m.createDate}" pattern="yyyy-MM-dd"/></div>
            </div>
            <div class="productReviewItemUserInfo">
             
                ${m.user.name}
            </div>
             
            <div style="clear:both"></div>
         
        </div>
        </c:forEach>
        
        <div class="pageDiv">
		<%@include file="include/admin/adminPage.jsp" %>
	</div>
    </div>
 
</div>