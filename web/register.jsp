<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<html lang="zh-CN">
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<script>

function checkname(){
	var name = document.getElementById("usernameregister").value;
    var page = "forecheckRegister";
    $.post(
            page,
            {"name":name},
            function(result){
                if("success"!=result){
                	  document.getElementById("tishi").innerHTML="<font color='green'>用户名已被使用</font>";
                      document.getElementById("submit").disabled = false;
                }
            }
        );     
};


</script>
<style>

    .parentDiv{
        position:relative;
    }
    .div1{
        position:absolute;
        z-index:1;
    }
    .div2{
        position:absolute;
        z-index:2;
    }
    #register_div{
        /* 居中*/
        align:center;
        right: 220px;
        /*position: absolute;
        left: 50%; top: 100%;
        width: 500px; height: 330px;
        /* 透明遮罩层 */
        background:rgba(255,255,255,0.6)
    }
</style>
<body>
<div class="parentDiv">
    <div class="div1">
        <img src="static/img/gym.jpg" style="height: 100%;width: 100%" th:src="@{~/img/gym.jpg}">
    </div>
    <div class="div2" style="margin: auto">
        <nav class="navbar navbar-default">
            <div class="container-fluid"  style="background-color: #a7b5ce;width: 131%">
                <div class="navbar-header">
                    <a class="navbar-brand" href="WEB-INF" style="font-family: 'Arial Black'">场馆预约</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp" class="navbar-brand" style="font-family: 'Arial Black'">登录</a></li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="container" >
            <div class="row">
                <div class="col-md-4" >
                </div>
                <div class="col-md-4">
                </div>
<!--               <center> -->
                <div id="register_div" class="col-md-4" style="text-align: left">
                    <form class="form-signin" id="#registerform" action="foreregister"  name="reg" >
                        <h2 class="form-signin-heading" align="center">注册</h2>
                        <div id="info">
                        </div>
                        <label >用户名</label><span>
                        <input type="text" name="name" id="usernameregister" class="form-control userregister" placeholder="请输入用户名" required autofocus onkeyup="checkname()"><br>
                        </span><label >手机号码</label>
                        <input type="text" name="phoneNumber" id="phone-number" class="form-control" placeholder="请输入手机号码"
                               required autofocus onkeyup="validatephone()" ><br>
                       
                        <label >密码</label>
                        <input type="password" name="password" id="pw1"  class="form-control" placeholder="请输入密码" required><br>
                        <label >重复密码</label>
                        <input type="password" name="password2" id="pw2" class="form-control" placeholder="请再次输入密码" required maxLength="16" onkeyup
                                ="validate()"><br><span id="tishi"></span> <br>   <br>

                        <button type="submit" id="submit" class="btn btn-primary" id="btn-reg" onclick="submit()">注册</button>

                        <a href="login.jsp" class="btn btn-default" id="btn-reg1">返回登录</a>
                    </form>
                </div>
<!--               </center> -->
            </div>
            <div class="col-md-4">
            </div>
        </div>

    </div>
</div>
<script>
function validatephone() {
var ph = document.getElementById("phone-number").value;
    if(isNaN(ph)){
    	  document.getElementById("tishi").innerHTML="<font color='red' class='alert alert-danger' role='alert'>手机号必须是数字</font>";
          document.getElementById("submit").disabled = true;
	}
    else if(ph.length!=11) {
        document.getElementById("tishi").innerHTML="<font color='red' class='alert alert-danger' role='alert'>手机号必须是11位</font>";
        document.getElementById("submit").disabled = true;
    }
};
function validate() {
    var pw1 = document.getElementById("pw1").value;
    var pw2 = document.getElementById("pw2").value;
    if(pw1 == pw2) {
        document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
        document.getElementById("submit").disabled = false;
    }
    else {
        document.getElementById("tishi").innerHTML="<font color='red' class='alert alert-danger' role='alert'>两次密码不相同</font>";
        document.getElementById("submit").disabled = true;
    }
};
</script>


</body>
</html>
