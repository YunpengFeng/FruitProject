
 //var  t = window.setInterval("requestcontent()",15000); 
	   

	  // 实现ajax进行轮询
requestcontent = function() {
	$.ajax({
		type : 'post',
		url : 'indexInfoList',
		datatype : 'json',
		data : {
			"isread" : "11",
			"type" : "19"
		},
		success : function(a) {
			var e = eval("(" + a + ")");
			
			
			
		}
	});
}
