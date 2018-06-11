/**
 * 统计页面js
 */
$(document).ready(function(){
 var month =new Array();/*= ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];*/
 var color =['#7cb5ec','#809085','#90ed7d','green','pink','red','black','blue','#88Ed70','#f7a35c','#ed3672','#5e6d78'];
 var type =$("#type").val();
 var now   = new Date();
 var year = now.getFullYear();
 var sum =new Array() ;
 var counts =new Array();
 var datarray =new Array();
 var pies;

	//设置颜色
	$("#"+type+"").css("background","pink");
	//初始化年份下拉框
	var html="";
	for(var i=2015 ;i<=year;i++){
		if(year==i){
			html += '<option  selected value="'+i+'">'+i+'年</option>';
		}else
			html += '<option  value="'+i+'">'+i+'年</option>';
	}
	$("#ye").html(html);
	
	 
	 
	$.ajax({
		method:'post',
		url:'CountOfMonthSell',
		datatype:'json',
		data:{"year":year},
		success:function(e){
			/*alert(e);*/
			var a =eval("("+e+")");
			for(var i in a){
				sum[i] = a[i].sum;
				counts[i] =a[i].count;
				month[i] =a[i].months;
			}
			line_count(sum ,counts,month);
		
		}
		
	});
	
//折线图
function line_count(sum ,counts,month){
	Highcharts.chart('contents', {
		colors: color,
	    chart: {
	        type: 'line'
	    },
	    title: {
	    	style:{
	    		fontSize:'30px',
	    		fontFamily:'cursive'
	    	},
	        text: '月销售统计图'
	    },
	    subtitle: {
	    	style:{
	    		fontSize:'20px',
	    		fontFamily:'cursive',
	    		marginTop:'30px'
	    	},
	        text: ' 月销售量，销售额'
	    },
	    xAxis: {
	        categories: month,
	    },
	    yAxis: [{      //设置多y轴
	    	 lineWidth: 1,
	        title: {
	            text: '计量单位 (RMB)'
	       }
	    },
	    {
	    	 lineWidth: 1,
	    	title: {
	            text: '计量单位 (件)',
	       },
	       opposite:true,
	       reversed: true
	    }
	  ],
	    plotOptions: {
	        line: {
	            dataLabels: {
	                enabled: true
	            },
	            enableMouseTracking: true //设置数据提示框
	        }
	    },
	    series: [{
	        name: '销售额',
	        data: sum,
	        marker: {
                enabled: true
            },
            dashStyle: 'shortdot',
            tooltip: {
                valueSuffix: ' 元'
            }
	    }, {
	        name: '销售数量',
	        data: counts,
	        yAxis: 1,   
	        tooltip: {
	            backgroundColor: '#FCFFC5',   // 背景颜色
	            borderColor: 'black',         // 边框颜色
	            borderRadius: 10,             // 边框圆角
	            borderWidth: 3,               // 边框宽度
	            shadow: true,                 // 是否显示阴影
	            animation: true ,              // 是否启用动画效果
	            style: {                      // 文字内容相关样式
	                color: "#ff0000",
	                fontSize: "12px",
	                fontWeight: "blod",
	                fontFamily: "Courir new"
	            },
	            valueSuffix: ' 件',
	            enabled :true
	        }
	        
	    }]
	});
}

//销售量前十
$.ajax({
	method:'post',
	url:'countTopTenByYear',
	datatype:'json',
	data:{"year":year},
	success:function(e){
		/*var data =eval("("+e+")");
		for(var i in data){
			datarray.push(data[i].key);
		}
		var s ="["+datarray+"]";
		// console.log(s);
*/		
		 var a =eval("("+e+")");
		 if(e==null||e==""){
			 $("#topten").empty();
			 $("#topten").html("暂无数据");
		 }else{
			 pies.series[0].setData(a);
		 }
	 console.log(a);
	 /*pie_top(a);*/
	 
	}
});
//饼图
/*function pie_top(datas){*/
	 pies = new  Highcharts.chart('topten', {
	    chart: {
	        type: 'pie',
	        options3d: {
	            enabled: true,
	            alpha: 10,       //深度
	            beta: 0
	        }
	    },
	    title: {
	        text: '销售排行榜top 10'
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            depth: 35,
	            dataLabels: {
	                enabled: true,
	                format: '{point.name}'
	            }
	        }
	    },
	    series: [{
	        type: 'pie',
	        name: '销售总量',
	      /* data:datas*/
	    }]
	});
/*}*/
	 
	 /*订单成交量*/
	 $.ajax({
		 method:'post',
		 url:'ordersSuccess',
		 datatype:'json',
		 data:{"year":year},
		 success:function(e){
			 var data =eval("("+e+")");
			 	counts.length = 0;
			 	month.length = 0;
				for(var i in data){
					counts[i] =data[i].count;
					month[i] =data[i].months;
				}
				columnOrder(counts,month);
		 }
	 });
	 
	 
	 /*柱状图*/
function columnOrder(counts,month){	 
	 Highcharts.chart('ordersSuccess', {
		    chart: {
		        type: 'column',
		        options3d: {
		        	   enabled: true,
			            alpha: 2,
			            beta: 10,
			            depth: 10,
			            viewDistance: 25
		        }
		    },
		    title: {
		        text: '订单成交量'
		    },
		    subtitle: {
		        text: ''
		    },
		    plotOptions: {
		        column: {
		            depth: 25
		        }
		    },
		    xAxis: {
		        categories:month, /*Highcharts.getOptions().lang.shortMonths,*/
		        labels: {
		            skew3d: true,
		            style: {
		                fontSize: '16px'
		            }
		        }
		    },
		    yAxis: {
		        title: {
		            text: null
		        }
		    },
		    series: [{
		        name: '交易量',
		        data: counts
		    }]
		});
}

	 
//选择年份触发
$("#ye").bind("change",function(){
	//获取选择的年份
	 var ye =$("#ye").val();
	 $.ajax({
			method:'post',
			url:'CountOfMonthSell',
			datatype:'json',
			data:{"year":ye},
			success:function(e){
				/*alert(e);*/
				var a =eval("("+e+")");
				for(var i in a){
					sum[i] = a[i].sum;
					counts[i] =a[i].count;
					month[i] =a[i].months;
				}
				line_count(sum ,counts,month);
			}
			
		});
	 
	 $.ajax({
		 method:'post',
		 url:'ordersSuccess',
		 datatype:'json',
		 data:{"year":ye},
		 success:function(e){
			 var data =eval("("+e+")");
			 	counts.length = 0;
			 	month.length = 0;
				for(var i in data){
					counts[i] =data[i].count;
					month[i] =data[i].months;
				}
				columnOrder(counts,month);
		 }
	});


	 $.ajax({
			method:'post',
			url:'countTopTenByYear',
			datatype:'json',
			data:{"year":ye},
			success:function(e){
				var data =eval("("+e+")");
				if(e==null||e==""){
					$("#topten").empty();
					 $("#topten").html("暂无数据");
				 }else{
					 pies.series[0].setData(data);
				 }
			}
		});
		
	});

	
	
});