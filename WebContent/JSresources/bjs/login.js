/**
 * 
 */
$(document).ready(function(){
	
	 adminlogin =function(){
		 var adminid =$("#userid").val();
		 var pass = $("#password").val();
		$.ajax({
			url:'adminlogin',
			type:'post',
			datatype:'json',
			data:{"userid":adminid,"password":pass},
			success:function(e){
				var a = eval("("+e+")");
				if(a.admin=='11'){
					setTimeout(function(){window.location.href="adminindex"},500); 
					window.setTimeout (function(){$("#userid").focus();},0);
				}
				if(a.admin=='12'){
					toastr.error("等待管理审核通过方可进入系统");
				}
				if(a.admin=='13'){
					toastr.error("账号或者密码错误。");
				}
			}
		});
	}

})