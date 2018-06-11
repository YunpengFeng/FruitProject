$(document).ready(function() {

	// 复选框勾选计算总价
	// 给每个复选框做点击事件
	$("input[name=ck]").click(function() {
		count();
	});

	// 计算总价和数量
	function count() {
		var conts = 0;
		var aa = 0;
		$("input[name=ck]").each(function() {
			if ($(this).prop("checked")) {
				for (var i = 0; i < $(this).length; i++) {
					var id = $(this).prop("value");
					// console.log("id"+id);
					// 根据id去获取价格，数量
					var f = parseFloat($("#c" + id + "").val());
					var a = parseInt($("#" + id + "").val());
					// console.log("f"+f+"a"+a);
					conts += f * a;
					aa++;
				}
				console.log("sdjjdf" + aa);
			}

		});
		// 保留两位小数
		var c = conts.toFixed(2);
		$("#N").html(aa);
		$("#total").html(c);
		$("#total1").html(c);
	}

	// 全选和反选，用prop，如果attr只能点一次
	allSelect = function() {
		if (!$(":checkbox").prop("checked")) {
			$(":checkbox").prop("checked", true);
		} else {
			$(":checkbox").prop("checked", false);
		}
		count();

	}

		// 加
	add = function(obj, price) {
		// *****id为动态变量，拼串记得要加“”**********
		var amount = $("#" + obj + "").val();
		// 转为数字
		var change = parseInt(amount);
		var pr = parseFloat(price);
		if (change > 9) {
			$("#" + obj + "").attr("value", change);
			$("#a" + obj + "").attr("value", (change * pr));
		} else {
			$("#" + obj + "").attr("value", change + 1);
			$("#a" + obj + "").attr("value",(change+1) * pr);
		}
		var last = $("#" + obj + "").val();
		// 异步发送
		$.ajax({
			method : 'post',
			url : 'changeAmount',
			datatype : 'json',
			data : {
				"amount" : last,
				"id" : obj
			},
			success : function(e) {
				// alert("e"+e);
			}

		});
		count();
	}

	// 减
	sub = function(obj, price) {
		var pr = parseFloat(price);
		var amount = $("#" + obj + "").val();
		// 转为数字
		var change = parseInt(amount);
		// alert("change"+change);
		if (change < 2) {
			$("#" + obj + "").attr("value", change);
			$("#a" + obj + "").attr("value", (change * pr));
		} else {
			$("#" + obj + "").attr("value", change - 1);
			$("#a" + obj + "").attr("value", (change-1) * pr);
		}
		var last = $("#" + obj + "").val();
		// 异步发送
		$.ajax({
			method : 'post',
			url : 'changeAmount',
			datatype : 'json',
			data : {
				"amount" : last,
				"id" : obj
			},
			success : function(e) {
				// ajax修改成功什么也不做 alert("e"+e);
			}

		});
		count();
	}
	//结算
	pay = function() {
		/*
		 * 一：如果什么都没有选提示返回购物车原页面·进行选择 有发送id和数量 字符串拼接。
		 */

		var string = "";
		$("input[name=ck]").each(function() {
			if ($(this).prop("checked")) {

				for (var i = 0; i < $(this).length; i++) {
					// 根据id来获取商品id和数量
					var id = $(this).prop("value");
					var amount = $("#" + id + "").val();
					string += id + "," + amount + "a";
					console.log(string);
				}
			}
		});
		console.log(string);
		if (string.length > 0) {
			var r=confirm("确认结算？");
			if(r == true)
				window.location.href="topay?info="+string;
		} else {
			alert("请选择购买的商品 ");
			window.location.reload();
		}
	}
		
	
	
	
	//删除 、移到收藏夹
	oparetion = function(type,id){
		$.ajax({
			method : 'post',
			url : 'oparetion',
			datatype : 'json',
			data : {"type":type,"id":id},
			success : function(e) {
				var a = eval("("+e+")");
				if(a.meg=='11'){
					toastr.success("已经移到收藏夹");
				}
				if(a.meg=='21'){
					toastr.error("已经在收藏夹中");
				}
				
				if(a.meg=='41'){
					$("#cc"+id+"").remove();
					toastr.success("删除成功！");
				}
			
				
			}
		});
	}
	
	

});