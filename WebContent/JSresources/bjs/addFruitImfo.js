/**
 * 管理水果知识界面js
 * 
 */

$(function(){
	
	var ue = UE.getEditor('myEditor',{  
		 autoClearinitialContent:false,
		 elementPathEnabled:false, 
      initialFrameHeight:400  
      //更多其他参数，请参考ueditor.config.js中的配置项  
  });  
	
	
	var type = $("#type").val()
	$("#"+type+"").css("background","pink")
	
	$("#fruittype").bind("click",function(){
		
		$.ajax({
			   url: "JSresources/fruittype.json",
			   type: "GET",
			   dataType: "json", 
			   success: function(data) {
				   var html =""
					 $.each(data, function(i, item) {
							 html +='<option value="'+item.number+'">'+item.type+'</option>';
				      });
					$("#fruittype").empty();
					$("#fruittype").append(html);
			   }
		});
	});
	//绑定下拉框选择事件
	$("#fruittype").bind("change",function(){
		  var checkText=$("#fruittype").find("option:selected").text();
          var checkNum =$("#fruittype").find("option:selected").val();
          var html="";
          html= '<option  value="'+checkNum+'">' + checkText + '</option>';
          $("#fruittype").html(html);
          $.ajax({
        	  url: "querybyName",
			   type: "post",
			   dataType: "json", 
			   data:{"num":checkNum},
          		success:function(data){
          	if(data.id >0){
	          			UE.getEditor('myEditor').setContent(data.information);
	          			$("#infoId").prop("value",data.id)
          			   html= '<option  value="'+data.season+'">' + data.season + '月</option>';
          	           $("#season").html(html);
          	           var _html =""
          	           if(data.isshow ==0 )
          	        	   _html =  '<option  value="'+data.isshow+'">否</option>';
          	           if(data.isshow ==1 )
        	        	   _html =  '<option  value="'+data.isshow+'">是</option>';
          	         
          	         $("#isshow").html(_html)
          		}
          			if(data.id == 0){
          				
          				$("#season").empty();
          				$("#infoId").prop("value","")
          				ue.setContent("");
          			}
          		
          				
          		
          		}
          })
              
              return;
		
	});

	$("#season").bind("click",function(){
		var month = ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];
	   var html =""
		for(var i = 0 ; i<month.length;i++)
				 html +='<option value="'+(i+1)+'">'+month[i]+'</option>';
	      
		$("#season").empty();
		$("#season").append(html);
	});
	//绑定下拉框选择事件
	$("#season").bind("change",function(){
		 
          var checkText=$("#season").find("option:selected").text();
          var checkNum =$("#season").find("option:selected").val();
          var html="";
          html= '<option  value="'+checkNum+'">' + checkText + '</option>';
          $("#season").html(html);
          return;
	});
	

	 subm = function(){
		var infoId =$("#infoId").val()
		var content= UE.getEditor('myEditor').getContent();
		var num = $("#fruittype").val();
		var isshow = $("#isshow").val();
		var season = $("#season").val();
		var  fruittype= $("#fruittype").find("option:selected").text();
		if(num == null||num == ""|| season== null||season == ""||content==""||content==null){
			  toastr.error("请填写完整的信息");
			return  
		}
		$.ajax({
			 url: "addfruitImfo",
			   type: "post",
			   dataType: "json", 
			   data:{
				   "content":content,
				   "fruittype":fruittype,
				   "isshow":isshow,
				   "num":num,
				  "optype":infoId,
				   "season":season},
			   success: function(data) {
				   if(data.data=='1')
					   toastr.success("修改成功");
				   else{
					   toastr.success("增加成功");
					   $("#infoId").prop("value",data.data)
				   }
				   
			   }
		})
		 
		
	}
	
})
	



