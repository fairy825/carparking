<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<div class="aliPayPageDiv">

    <div>
        <span class="confirmMoneyText">扫一扫付款（元）</span>
        <span class="confirmMoney">
        ￥<fmt:formatNumber type="number" value="${param.total}" minFractionDigits="2"/></span>

    </div>
    <div>
        <img class="aliPayImg" src="../img/二维码.jpg">
    </div>

    <div>
        <a href="forepayed?bid=${b.id}"><button class="confirmPay">确认支付</button></a>
    </div>

</div>
