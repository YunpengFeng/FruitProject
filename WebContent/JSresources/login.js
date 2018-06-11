//$(function(){
$(document).ready(function(){
	
//发送账号验证
	$("#userid").blur(function(){
		var param = $("#userid").val();
		$.ajax({
			url:'yanzhen',
			type:'post',
			datatype:'json',
			data:{"param":param,"type":"11" },
			success:function(e){
				var a = eval("("+e+")");
				if(a.meg=='ok'){
					$("#suserid").html("账号正确");
				}else{
					window.setTimeout (function(){$("#userid").focus();},0);
					$("#suserid").html("没有此账号，重新输入");
				}
			}
		});
	});
	
	$("#password").blur(function(){
		var userid = $("#userid").val();
		var pass =  $("#password").val();
		var pa =userid+"#"+pass;
		$.ajax({
			url:'yanzhen',
			type:'post',
			datatype:'json',
			data:{"param":pa,"type":"13" },
			success:function(e){
				var a = eval("("+e+")");
				if(a.meg=='ok'){
					$("#checkpass").html("密码正确");
				}else{
					window.setTimeout (function(){$("#password").focus();},0);
					$("#checkpass").html("密码错误，重新输入");
				}
			}
		});
	});
	
})


	function login(){
		$.ajax({
			url:'login',
			type:'post',
			datatype:'json',
			data:{"userid":$("#userid").val(),"password":$("#password").val()},
			success:function(e){
				var a  = eval("("+e+")");
				if(a.meg == 'ok'){
					window.location.href="index";
				}
				if(a.meg == 'error'){
					toastr.error("账号或者密码错误");
				}
				if(a.meg == 'ban'){
					toastr.error("你的账号已经被禁，请联系管理员");
				}
			}
		});
		
	}