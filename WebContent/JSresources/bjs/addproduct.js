/**
 * 
 */
$(document).ready(function(){
	
	var type=$("#type").val();
	$("#"+type+"").css("background","pink");
	//选择的图片中带有% ？ / 空格等等具有意义的字符图片信息无效
	//限制上传图片为6张 ,bug第二次选怎的时候的时候会出现选择2的倍数图片
	$(".fileInput").bind("change",function(){
		var total=$("#picss").children("div").length;
		//alert("total"+total);
		if(total<6){
			$(".fileInput").prop("disabled",false);

			$(".fileInput").bind("change",function(){
				var  tempdata= new FormData();
				var file =$(".fileInput")[0];
				for(var i=0; i<file.files.length;i++){
					tempdata.append('file[]', file.files[i]);
				}
				$.ajax({
					processData: false,
					contentType: false,
					method:'post',
					url:'tempFiles',
					data:tempdata,
					success:function(a){
						var e=eval("("+a+")");
						var html="";
						for(var i in e){
							var name = e[i].name;
							if(name.length>10){
								var s = name.substr(0,8)+".."+name.substr(name.indexOf("."),name.length);
								html += '<div class="pic"><img src ="temp/'+name+'"><dd>'+s+'</dd></div>';
							}else{
								html += '<div class="pic"><img src ="temp/'+name+'"><dd>'+name+'</dd></div>';
							}
							if(i==eval(e).length-1){
								break;
							}
						}
						$("#picss").append(html);	
					},
					error:function(){
						alert("失败");
					}
				});
			});
			
		}else{
			$(".fileInput").prop("disabled","disabled");
			 toastr.error("超过上传图片数量！");
		}
	});
	
	//加载水果种类
	$("#fruit_type").bind("click",function(){
		$.ajax({
			method:'post',
			url:'fruittype',
			datatype:'json',
			success:function(e){
				//alert(e)
			var a = eval("("+ e + ")");
			var html="";
			for(var i in a){
				html +='<option>'+a[i].type+'</option>';
				
			}
				$("#fruit_type").html(html);
			}	
		});
		
	});
	//绑定下拉框选择事件
	$("#fruit_type").bind("change",function(){
		  var v= $(this).val();
          var checkText=$("#fruit_type").find("option:selected").text();
          var html="";
              html= '<option>' + checkText + '</option>';
              $("#fruit_type").html(html);
              return;
		
	});
	
	//查询水果最后的id
	$.ajax({
		method:'post',
		url:'lastid',
		datatype:'json',
		success:function(e){
			var a = eval("("+e+")");
			$("#fruit_id").val(a.id);
			
		}
	});
	
		//填写的信息提交到数据库
		submitForm = function(){
			var form =new FormData();
			form.append("fruit_id",$("#fruit_id").val());
			form.append("fruit_type",$("#fruit_type").val());
			form.append("fruit_name",$("#fruit_name").val());
			form.append("fruit_amount",$("#fruit_amount").val());
			form.append("fruit_price",$("#fruit_price").val());
			form.append("fruit_enterprice",$("#fruit_enterprice").val());
			form.append("fruit_sellprice",$("#fruit_sellprice").val());
			form.append("fruit_place",$("#fruit_place").val());
			form.append("fruit_place_f",$("input[name='ra']:checked").val());
			
			form.append("fruit_states",$("#fruit_states").val());
			form.append("fruit_time",$("#fruit_time").val());
			form.append("fruit_date",$("#fruit_date").val());
			form.append("fruit_info",$("#fruit_info").val());
			//得到img的图片张数
			var ping=""
			var ps =$("#picss").find("img");
				//alert(ps.length+"lengths");
				ps.each(function(i){
					var s =$(this).prop("src");
					ping +=s.substr(s.lastIndexOf("/")+1,s.length)+"/";
					
				});
			form.append("picname",ping);
			$.ajax({
				processData: false,
				contentType: false,
				method:'post',
				url:'addFruit',
				datatype:'json',
				data:form,
				success:function(e){
					 toastr.success("添加成功");
					window.location.href="addProduct?type=15";
					
				}
			});
		}
});
