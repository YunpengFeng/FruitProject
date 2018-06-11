<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@page import="com.nchu.fruit.pojo.*"%>
    <script type="text/javascript" src="js/easyui/jquery.min.js"></script>
    <script src="js/toastr/toastr.js"></script>
	<link href="js/toastr/toastr.css" rel="stylesheet" type="text/css" />
	<script src="JSresources/bjs/login.js"></script>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>登入</title>
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
<div class="inner">
    <div class="head">
        <img class="img1" src="imgs/1.png" style="width:300px"alt="未知错误"/>
        <div class="text1">网上水果销售管理系统</div>
        <div class="text2" style="margin-left:80px">没有账号?<span><a href="adminRegister">请注册</a></span></div>
        <div class="back" style="padding-left:60px"><img src="imgs/in_02.jpg"> <a href="index">&nbsp;<strong class="em1">水果首页</strong></a></div>

    </div>

    <div class="c"></div>
    <div class="d"></div>
    <div class="meddile">
        <form action="#" method="post">
            <div class="ll">
              	<div class="cell" style="width:350px"><label for="userid">管理员账号</label><input class="cell2" type="text" name="userid"id="userid" value="1"placeholder="你的手机号、邮箱、账号"><span class="s"id="checkuserid"></span></div>
                <div class="cell" style="width:350px ;"><label for="password">&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;&nbsp;&nbsp;</label><input class="cell2" type="password"id="password" name="password"placeholder="输入密码" value="1"><span class="s"id="checkpass"></span></div>
                <div class="cell1"><input class="cell3" type="button"value="立即登入" onclick="adminlogin()"/></div>
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
</html>