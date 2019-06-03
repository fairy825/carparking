<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     
<div class="reviewDiv">

    <div class="reviewStasticsDiv">
        <div class="reviewStasticsLeft">
                <div class="reviewStasticsLeftTop"></div>
                <div class="reviewStasticsLeftContent">累计评价 <span class="reviewStasticsNumber"> ${p.reviewCount}</span></div>
                <div class="reviewStasticsLeftFoot"></div>
        </div>
        <div class="reviewStasticsRight">
            <div class="reviewStasticsRightEmpty"></div>
            <div class="reviewStasticsFoot"></div>
        </div>
    </div>       
     
    <c:if test="${param.showonly==true}">
    <div class="reviewDivlistReviews">
        <c:forEach items="${ms}" var="m">
            <div class="reviewDivlistReviewsEach">
                <div class="reviewDate"><fmt:formatDate value="${m.createDate}" pattern="yyyy-MM-dd"/></div>
                <div class="reviewContent">${m.content}</div>
                <div class="reviewUserInfo pull-right">${m.user.name}</div>
            </div>
        </c:forEach>
    </div>
    
    	<div class="pageDiv">
		<%@include file="include/admin/adminPage.jsp" %>
	</div>
	
    </c:if>
     
    <c:if test="${param.showonly!=true}">
        <div class="makeReviewDiv">
        <form method="post" action="foredoreview">
            <table class="makeReviewTable">
                <tr>
                    <td class="makeReviewTableFirstTD">留言</td>
                    <td><textarea name="content"></textarea></td>
                </tr>
            </table>
            <div class="makeReviewButtonDiv">
                <input type="hidden" name="bid" value="${b.id}">
                <button type="submit">提交评价</button>
            </div>
        </form>
        </div>   
    </c:if>
 
</div>