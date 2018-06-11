$(document).ready(function(){
	
	var pass =$("#pass").val();
	var flag1=0;
	var flag2=0;
	var type=$("#type").val();
	$("#"+type+"").css("background","pink");
	
	$("#admin_pass").blur(function(){
		var admin_pass=$("#admin_pass").val();
		if(admin_pass!=pass){
			$("#tishi").text("密码输入错误")
			window.setTimeout (function(){$("#admin_pass").focus();},0);
			/*$("#admin_pass")[0].focus();*/
		}else{
			$("#tishi").text("");
			flag1=1;
		}
	});
	$("#admin_name").blur(function(){
		var name=$("#admin_name").val();
		if(name==null||name==""){
			window.setTimeout (function(){$("#admin_name").focus();},0);
			$("admin_newagin").attr("disabled",false);
			$("admin_pass").attr("disabled",false);
			$("admin_newpass").attr("disabled",false);
		}else{
			$("admin_newagin").attr("disabled",true);
			$("admin_pass").attr("disabled",true);
			$("admin_newpass").attr("disabled",true);
		}
	});
	
	
	$("#admin_newagin").blur(function(){
		var admin_newpass=$("#admin_newpass").val();
		var admin_newagin=$("#admin_newagin").val();
		if(admin_newpass!=admin_newagin){
			$("#tishi2").text("重复密码不匹配")
			window.setTimeout (function(){$("#admin_newagin").focus();},0);
			/*$("#admin_pass")[0].focus();*/
		}else{
			$("#tishi2").text("");
			flag2=1;
		}
	});
	  submits =function(){
		/* alert("flagone"+flag1+"flagtwo"+flag2);*/
		 if(flag1==1&&flag2==1){
			 toastr.success("修改成功！");
			 $.ajax({
					type:'post',
					url:'updateadminpass',
					datatype:'json',
					data:{"account":$("#admin_account").val(),"pass":$("#admin_newpass").val(),"name":$("#admin_name").val()},
					success:function(e){
						window.location.href="adminmanager";
					}
				});
		 }else{
			 alert("请仔细核对表单元素");
		 }
	 } 
	  
	  
	  tan =function(fruitid){
		  $(".lightbox").css("display","block");
		  $.ajax({
				type:'post',
				url:'updatefruitByid',
				datatype:'json',
				data:{"fruitid":fruitid},
				success:function(e){
					var html="";
					var a =eval("("+e+")");
					html ='<div class="title">水果编号'+a.fruit_id+'</div> <div class="imgs">  <a href="javascript:void(0)" onclick="closewindow()"><img src="imgs/45.png"></a></div><hr><div class="c"></div><form action ="updatefruitByidsssssss"method="post"><br>';
					html+='<label>水果名</label><input value="'+a.fruit_name+'" type="text"name="fruit_name"><input value="'+a.fruit_id+'" type="hidden"name="fruit_id"><label>上架日期</label><input value="'+a.fruit_time+'" name="fruit_time"type="text" readonly="readonly"><label>保鲜期</label><input value="'+a.fruit_date+'" type="text"name="fruit_date">天<br><label>产&nbsp;&nbsp;&nbsp;地</label><input value="'+a.fruit_place+'" type="text"name="fruit_place"><label>&nbsp;&nbsp;&nbsp;库&nbsp;&nbsp;&nbsp;存</label><input  type="text" value="'+a.fruit_amount+'"name="fruit_amount">';
					html+='<br><label>售&nbsp;&nbsp;&nbsp;价</label><input  type="text" value="'+a.fruit_sellprice+'"name="fruit_sellprice">元<label>原&nbsp;&nbsp;&nbsp;价</label><input  type="text" value="'+a.fruit_price+'"name="fruit_price">元<br>'
					html+='<label>详情描述(限制300字)</label><br><textarea cols="90"rows="4"name="fruit_info">'+a.fruit_info+'</textarea><br><div class="pics">';
					for(var i =1;i<a.fruit_imgcount;i++){
						html+='<img src="fruitImages/'+a.fruit_id+'_ ('+i+').png">';
					}
					html+='</div><input  style="width:100px;height:40px;margin-top:20px;margin-left:80% ;background: #4d5e70; color:white" type="submit" value="提交修改"></form>';
					$(".lightbox").html(html);
				}
		  });
	  }
	  
	  closewindow = function(){
		  $(".lightbox").css("display","none");
		  $(".lightbox").empty();
		  toastr.error("暂未提交任何修改！");
	  }
	  
	  //上下架
	  shangjia  =function(id,obj){
		  /*alert("id"+id);*/
		  var string = id+"#";
		  $.ajax({
				type:'post',
				url:'updateFruit_states',
				datatype:'json',
				data:{"string":string,"obj":obj},
				success:function(a){
					var e =eval("("+a+")");
					if(e.meg=='ok'){
						toastr.success("修改成功");
						setTimeout(function(){location.reload()},1000); 
					}else{
						 window.location.reload();
						toastr.error("数据错误");
					}
				},
			
			});
		 /* toastr.success("修改成功！");*/
	  }
	  
	  updateRole = function(type,role,id){
		  $.ajax({
				type:'post',
				url:'updateRole',
				datatype:'json',
				data:{"type":type,"role":role,"id":id},
				success:function(a){
					var e =eval("("+a+")");
					if(e.meg=='ok'){
						toastr.success("修改成功");
						setTimeout(function(){location.reload()},1000); 
					}else{
						 window.location.reload();
						toastr.error("数据错误");
					}
				}
			});
	  }
	  
});
	/*菜单配置管理*/
	function  MenuConfig(userid,pass){
		/*window.open("");*/
		initMenu()
		  $.ajax({
				type:'post',
				url:'getAdmin',
				data:{userid:userid,pass:pass},
				datatype:'json',
				success:function(data){
					var e =eval("("+data+")");
					$("#userid").val(e.admin_id)
					$("#username").val(e.admin_name)
					/*$("#ssave").prop("onclick",'distribution("'+e.admin_id+'")')*/
					var list = e.admin_list.split(",")
					for(var i = 0; i<list.length; i++)
						$("#i"+list[i]+"").prop("checked","checked")
				}
		  })
	}
	
	function initMenu(){
		$("#menu").css("display","block");
		//初始化菜单表格
		var _html ="<ul><li>选择<input type='checkbox' id='allselect' onclick='allSelect()'>  <span style='margin-left:35px'>菜单项</span></li>" 
		
		_html += "<li><input type='checkbox' id='i11' name='ck' style='padding-left:0px'><span style='margin-left:60px'>权限管理</span></li>"
		
		_html += "<li><input type='checkbox' id='i12' name='ck' style='padding-left:0px'><span style='margin-left:60px'>用户管理</span></li>"
		
		_html += "<li><input type='checkbox' id='i13' name='ck' style='padding-left:0px'><span style='margin-left:60px'>密码设置</span></li>"
		
		_html += "<li><input type='checkbox' id='i14'name='ck'  style='padding-left:0px'><span style='margin-left:60px'>修改信息</span></li>"
		
		_html += "<li><input type='checkbox' id='i15' name='ck' style='padding-left:0px'><span style='margin-left:60px'>增加商品</span></li>"
		
		_html += "<li><input type='checkbox' id='i16' name='ck' style='padding-left:0px'><span style='margin-left:60px'>库存管理</span></li>"
		
		_html += "<li><input type='checkbox' id='i17'name='ck'  style='padding-left:0px'><span style='margin-left:60px'>货单管理</span></li>"
		
		_html += "<li><input type='checkbox' id='i18' name='ck' style='padding-left:0px'><span style='margin-left:60px'>上下架管理</span></li>"
		
		_html += "<li><input type='checkbox' id='i24' name='ck' style='padding-left:0px'><span style='margin-left:60px'>评价审核</span></li>"
		
		_html += "<li><input type='checkbox' id='i20' name='ck' style='padding-left:0px'><span style='margin-left:60px'>催单记录</span></li>"

		_html += "<li><input type='checkbox' id='i19' name='ck' style='padding-left:0px'><span style='margin-left:60px'>聊天列表</span></li>"
				
		_html += "<li><input type='checkbox' id='i21' name='ck' style='padding-left:0px'><span style='margin-left:60px'>销售统计</span></li>"
				
		_html += "</ul><div style='clear:both;margin-left:600px'><br><button onclick='closeWindow()'>关闭窗口</button>&nbsp;&nbsp;&nbsp;<button  id='ssave'onclick='distribution()'>确认保存</button></div>"
		$(".menutable").html(_html);
		
	}

	//关闭窗口
	function closeWindow(){
		$("#menutable").empty();
		$("#menu").css("display","none");
	}
	
	//分配菜单
	function distribution(){
		//获取菜单选项
		var userid=$("#userid").val()
		var liststr=""
			$("input[name=ck]").each(function() {
				if ($(this).prop("checked")) {
					var t = $(this).prop("id").substring(1,3)
					liststr += t+","
				}
			})
			
		 $.ajax({
				type:'post',
				url:'setMenuList',
				data:{userid:userid,liststr:liststr.substring(0,liststr.lastIndexOf(","))},
				datatype:'json',
				success:function(a){
					var e =eval("("+a+")");
					if(e.meg=='ok'){
						toastr.success("修改成功");
						setTimeout(function(){location.reload()},1000); 
					}else{
						 window.location.reload();
					
					}
				}
			})
	}
	

	 function allSelect(){
		if (!$(":checkbox").prop("checked")) {
			$(":checkbox").prop("checked", true);
		} else {
			$(":checkbox").prop("checked", false);
		}
		
	}
	 function setTop(fruit_id){
		 $.ajax({
				type:'post',
				url:'SetFruitTop',
				data:{fruit_id:fruit_id},
				datatype:'json',
				success:function(a){
						toastr.success("置顶成功");
						setTimeout(function(){location.reload()},2000); 
					
				}
			})
	 }			