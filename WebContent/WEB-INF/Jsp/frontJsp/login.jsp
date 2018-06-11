<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@page import="com.nchu.fruit.pojo.*"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果销售网站</title>
    <link rel="stylesheet" href="css/register.css">
    <script src="js/toastr/toastr.js"></script>
    <link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="JSresources/login.js"></script>
     <script src="js/toastr/toastr.js"></script>
    	<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
<div class="inner">
    <div class="head">
        <img class="img1" src="imgs/1.png" alt="未知错误"/>
        <div class="text1">欢迎登入</div>
        <div class="text2">没有账号?<a href="toRegister"><span>请注册</span></a></div>
        <div class="back"><img src="imgs/in_02.jpg"> <a href="index">&nbsp;<strong class="em1">水果首页</strong></a></div>

    </div>

    <div class="c"></div>
    <div class="d"></div>
    <div class="meddile">
        <form action="#" method="post">
            <div class="ll">
                <div class="cell"><label for="userid">用户账号</label><input class="cell2" type="text" name="userid" id="userid" value="5237353"placeholder="你的手机号、邮箱、账号"><span class="s"id="suserid"></span></div>
                <div class="cell"><label for="password">&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码</label><input class="cell2" value="123" type="password"id="password"name="password"placeholder="输入密码"><span class="s"id="checkpass"></span></div>
                <div class="cell1"><input class="cell3" type="button" onclick="login()"value="立即登入"/></div>
            </div>
        </form>

        <div class="right"></div>

        <div class="lastright">
            <div class="rcell"><img style="width:100px;height: 100px"src="imgs/3.jpg"><a href="#" class="t">About You Ideas</a></div>
            <div class="rcell"><img style="width:100px;height: 100px"src="imgs/2.png"><a
                    href="https://baike.baidu.com/item/%E9%98%BF%E5%B0%94%E4%BC%AF%E7%89%B9%C2%B7%E7%88%B1%E5%9B%A0%E6%96%AF%E5%9D%A6/127535?fr=aladdin&fromid=122624&fromtitle=%E7%88%B1%E5%9B%A0%E6%96%AF%E5%9D%A6" class="t">Albert.Einstein</a></div>
        </div>
    </div>
	<div class="c"></div>
	<jsp:include page="/WEB-INF/Jsp/frontJsp/foot.jsp" flush="false"/>
	
</div>
</body>
<script>
$(document).ready(function(){
	var ban =$("#ban").val();
	/* if(ban!=null||ban!=""){
		alert("账号被锁定，请联系管理员！");
	} */
});
	
</script>
</html>