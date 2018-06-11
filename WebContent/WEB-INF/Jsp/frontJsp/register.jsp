<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果销售网站</title>
    <link rel="stylesheet" href="css/register.css">
     <script type="text/javascript" src="js/jquery.min.js"></script>
     <script type="text/javascript" src="JSresources/register.js"></script>

</head>
<body>
<div class="inner">

    <div class="head">
        <img class="img1" src="imgs/1.png" alt="未知错误"/>
        <div class="text1">欢迎注册</div>
        <div class="text2">已有账号?<a href="toLogin"><span>请登入</span></a></div>
        <div class="back"><img src="imgs/in_02.jpg"> &nbsp;<strong class="em1"><a href="index">水果首页</a></strong></div>

    </div>

    <div class="c"></div>
        <div class="d"></div>
        <div class="meddile">
            <form action="DoRegister" method="post" onsubmit="return check(this)">
          <div class="ll">
          		 <div class="cell"><label for="userid">用&nbsp;户账号</label>
                  <input class="cell2" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"type="text"id="userid"name="userid"placeholder="你的账户或者登入账号"><span class="s"id="suserid"></span></div>
              <div class="cell"><label for="username">用&nbsp;户&nbsp;名</label>
                  <input class="cell2" type="text" id="username"name="username"placeholder="你的账户名或者登入名"><span class="s"id="susername"></span></div>
              <div class="cell"><label for="password">设置密码</label><input  class="cell2" type="password" id="password"name="password"placeholder="建议两种字符组合"/></div>
              <div class="cell"><label for="password1">确认密码</label><input class="cell2" type="password"id="password1"name="password1"placeholder="再次输入密码"><span class="s"id="pass"></span></div>
              <div class="cell"><label for="tel">手机号码</label><input  onkeyup="value=value.replace(/[^\d]/g,'')" class="cell2" type="tel"name="tel"id="tel"placeholder="输入手机号码"/></div>
              <div class="cell"><label for="address">收件地址</label><input class="cell2" type="text"name="address"id="address"placeholder="默认收件地址"/></div>
               <div class="cell"><label for="address">&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;箱&nbsp;</label><input class="cell2" type="email"name="myemail"id="myemail"placeholder="邮箱"/></div>
            
              <div class="cell" style=""><label for="yanzheng">验&nbsp;证&nbsp;码</label>
              		<input style="margin-left:27px;margin-top:-29px;width:100px" class="cell2" type="text"id="yanzheng"name="yanzheng"placeholder="邮箱验证码"/>
              		<input style="margin-left:202px;margin-top:-29px;width:74px;background-color:#666" class="cell2" type="button"id="bemail"name="bemail"value="发送验证码" onclick="sendEmail()"/></div>
              <div class="cell1"><input class="cell3" type="submit"value="立即注册"style="text-align: center;"/></div>
          </div>
            </form>

            <div class="right"></div>

            <div class="lastright">
                <div class="rcell"><img style="width:100px;height: 100px"src="imgs/3.jpg"><a href="#" class="t">About You Ideas</a></div>
                <div class="rcell"><img style="width:100px;height: 100px"src="imgs/2.png"><a
                        href="https://baike.baidu.com/item/%E9%98%BF%E5%B0%94%E4%BC%AF%E7%89%B9%C2%B7%E7%88%B1%E5%9B%A0%E6%96%AF%E5%9D%A6/127535?fr=aladdin&fromid=122624&fromtitle=%E7%88%B1%E5%9B%A0%E6%96%AF%E5%9D%A6" class="t">Albert.Einstein</a></div>
            </div>
            </div>
        </div>
    <div class="c"></div>
<div class="footer">
    <div class = "nav">
        <ul>
            <li><a href="#">关于我们</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">人才招聘</a></li>
            <li><a href="#">商家入驻</a></li>
            <li><a href="#">广告服务</a></li>
            <li><a href="#">手机京东</a></li>
            <li><a href="#">友情链接</a></li>
            <li><a href="#">销售联盟</a></li>
            <li><a href="#">京东社区</a></li>
            <li><a href="#">京东公益</a></li>
            <li ><a href="#">English Site</a></li>
        </ul>
        <p>Copyright&copy2004-2006&nbsp京东JD.com

            版权所有</p>
    </div>
</div>

</div>
</body>
</html>