$(document).ready(function(){
	var t;
	var type=$("#type").val();
	 $("#"+type+"").css("background","pink");
	 
	 addTab =function(title, id){
		 //获取当前id的html代码
		  var read =$("#"+id+"").prop("outerHTML");
		  var temp=read.substr(0,read.indexOf("<span"))+"</a></li>";
		  $("#ready").append(temp);
		 
			$("#"+id+"").remove();
			$('#tt').css("display","block");
			var a = $('#tt').tabs('exists', title)
			if ($('#tt').tabs('exists', title)){
				$('#tt').tabs('select', title);
			}else{
				var content = '<iframe scrolling="" frameborder="0"  name="'+id+'" style="width:620px;height:500px;border:2px solid black;"></iframe>';
				$('#tt').tabs('add',{
					title:title,
					content:content,
					closable:true
				});
			}
		}
	 //捕捉 'onSelect' 事件。
	  /*  $('#tt').tabs({   
	        border:false,   
	        onSelect:function(title){   
	            alert(title+' is selected');   
	        },*/
	       /* onBeforeClose:function(){
		    	 alert(title+' is close');   
		    	 return true;
		    },*/
		   /* onClose:function(){
		    	 alert(title+' is close');   
		    }*/
	    

	 //增加定时器，获取来源加到列表的最前端并且附有（new字样）conversation
	    t = window.setInterval("requestcontent()",2000); 
	    
	    
	  //实现ajax进行轮询
		requestcontent = function(){
			$.ajax({
				type:'post',
				url:'serviceInfoLsit',
				datatype:'json',
				data:{"isread":"11","type":"19"},
				success	:function(a){
					var e=eval("("+a+")");
					var s = $("#infolist").find("li");
					var  array=[];
					//当未读消息的条数开始为0时
					if(s.length==0){
						for( var i in e){
							html ='<li id="'+e[i].sendid+'-'+e[i].fruit_id+'"><a  style="color:red" target="'+e[i].sendid+'-'+e[i].fruit_id+'"href="dalog?sendid='+e[i].sendid+'&fruit_id='+e[i].fruit_id+'"onclick="addTab(\''+e[i].user_name+'_'+e[i].fruit_name+'\',\''+e[i].sendid+'-'+e[i].fruit_id+'\')">'+'<img src="imgs/tou1.png">'+e[i].user_name+'<span id="'+e[i].sendid+'_'+e[i].fruit_id+'">'+e[i].c+'</span>条<b>NEW</b></a></li>';
							$("#infolist").prepend(html);
						}
					}
					s.each(function(i){
						array[i] =$(this).prop("id");
					});
					
					for( var i in e){
						var k=0;
						var string=e[i].sendid+"-"+e[i].fruit_id;
						for(var j =0 ;j<array.length;j++){
							var html="";
							if( string==array[j]){
								var string1=e[i].sendid+"_"+e[i].fruit_id;
									//span后面的条数相同覆盖
									$("#"+string1+"").html(e[i].c);
									break;
							}
							k++;
						  }
						console.log(k);
						 if((array.length)==k){
								//不同直接放在top部
								html ='<li id="'+e[i].sendid+'-'+e[i].fruit_id+'"><a  style="color:red" target="'+e[i].sendid+'-'+e[i].fruit_id+'"href="dalog?sendid='+e[i].sendid+'&fruit_id='+e[i].fruit_id+'"onclick="addTab(\''+e[i].user_name+'_'+e[i].fruit_name+'\',\''+e[i].sendid+'-'+e[i].fruit_id+'\')">'+'<img src="imgs/tou1.png">'+e[i].user_name+'<span id="'+e[i].sendid+'_'+e[i].fruit_id+'">'+e[i].c+'</span>条<b>NEW</b></a></li>';
								$("#infolist").prepend(html);
								k=0;
							}
						}
					}
				});
		}
	    
});

/*
function(){
	
}*/