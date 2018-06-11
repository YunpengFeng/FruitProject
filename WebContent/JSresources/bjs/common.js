/**
 * 用户菜单显示
 */
$(function(){
	$.ajax({
		url:'adminlist',
		type:'post',
		datatype:'json',
		success:function(e){
			var a = eval("("+e+")");
			var adminlist_str = a.meg;
			if(adminlist_str == 'ok'){
				window.location.href="adminmanager"
			}else{
				var list = adminlist_str.split(",")
				for(var i = 0; i<list.length; i++)
					$("#"+list[i]+"").css("display","block")
			}
			
			}
	})
	
})