/**
 * 
 */
$(document).ready(function(){
	
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
				$("#suserid").html("已有此账号，重新输入");
				window.setTimeout (function(){$("#userid").focus();},0);
			}else{
				$("#suserid").html("");
			}
		}
	});
});

$("#username").blur(function(){
	var param =$("#username").val();
	$.ajax({
		url:'yanzhen',
		type:'post',
		datatype:'json',
		data:{"param":param ,"type":"12"},
		success:function(e){
			var a = eval("("+e+")");
			if(a.meg=='ok'){
				$("#susername").html("已有此用户名，重新输入");
				window.setTimeout (function(){$("#username").focus();},0);
			}else{
				$("#susername").html("");
			}
		}
	});
	
});

$("#password").blur(function(){
	var p =   $("#password").val();
	if(p==null||p==""){
		window.setTimeout (function(){$("#password").focus();},0);
	}
});

//验证密码
$("#password1").blur(function(){
	var p1 = $("#password1").val();
	var p =   $("#password").val();
	if(p1 != p){
		$("#pass").html("确认密码错误");
		window.setTimeout (function(){$("#password1").focus();},0);
	}else{
		$("#pass").html("");
	}
});

check =function(){
	var userid = $("#userid").val();
	if(userid==null || userid ==""){
		window.setTimeout (function(){$("#userid").focus();},0);
		return false;
	}
	
	var p1 = $("#password1").val();
	if(p1==null || p1 ==""){
		window.setTimeout (function(){$("#password1").focus();},0);
		return false;
	}
	var p  =$("#password").val();
	if(p==null || p ==""){
		window.setTimeout (function(){$("#password").focus();},0);
		return false;
	}
	var name = $("#username").val();
	if(username==null || username ==""){
		window.setTimeout (function(){$("#username").focus();},0);
		return false;
	}
	var phone =$("#tel").val();
	if(phone==null || phone ==""){
		window.setTimeout (function(){$("#tel").focus();},0);
		return false;
	}
	
	var addre= $("#address").val();
	if(addre==null || addre ==""){
		window.setTimeout (function(){$("#address").focus();},0);
		return false;
	}
	return true;
	
	}

})

function sendEmail(){
	var email =$("#myemail").val();
	$.ajax({
		url:'sendEmail',
		type:'post',
		datatype:'json',
		data:{"email":email},
		success:function(e){
			$("#bemail").prop("onlick","")
			$("#bemail").prop("value","已发送邮箱")
			$("#bemail").css("background-color","green")
		}
	});
}