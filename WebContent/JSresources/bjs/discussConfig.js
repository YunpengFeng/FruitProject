 
  $(function(){
           var type =$("#type").val();
        	$("#"+type+"").css("background","pink");
        		
            $('#tt').datagrid({
                title:'脏词记录表',
                iconCls:'icon-edit',
                width:700,
                height:680,
                url:'dirtyPool',
		        fitColumns:true,
		         scrollbarSize:0,
                singleSelect:false,
		        rownumbers:true,
		        pagination:true,
		        pageSize: 10,  
                pageNumber: 1,  
                pageList: [10, 20, 30, 40, 50], 
		        striped:true,
                columns:[[
                    {field:'id',title:'编号',width:50,editor:'numberbox'},
                    {field:'content',title:'脏词内容',width:60,editor:'text'},
                   /* {field:'addr',title:'地址',width:100,editor:'text'},
                    {field:'email',title:'电子邮件',width:100,
                        editor:{
                            type:'validatebox',
                            options:{
                                validType:'email'
                            }
                        }
                    },*/
                    {field:'action',title:'操作',width:70,align:'center',
                        formatter:function(value,row,index){//单元格的格式化函数，需要三个参数：value:字段的值; rowData:行的记录数据; rowIndex:行的索引。
                            if (row.editing){
                                var s = '<a href="#" onclick="saverow('+index+')">保存</a> ';
                                var c = '<a href="#" onclick="cancelrow('+index+')">取消</a>';
                                return s+c;
                            } else {
                                var e = '<a href="#" onclick="editrow('+index+')">编辑</a> ';
                                var d = '<a href="#" onclick="deleterow('+index+','+row.id +')">删除</a>';
                                return e+d;
                            }
                    }
                   }
                ]],
                toolbar:[{
                    text:'增加',
                    iconCls:'icon-add',
                    handler:addrow
                },{
                    text:'保存',
                    iconCls:'icon-save',
                    handler:saveall
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:cancelall
                },{
                    text:'刷新',
                    iconCls:'icon-reload',
                    handler:reloads
                }],
                onBeforeEdit:function(index,row){
                    row.editing = true;
                    $('#tt').datagrid('refreshRow', index);//刷新一行
                    editcount++;
                },
                onAfterEdit:function(index,row){
                    row.editing = false;
                    $('#tt').datagrid('refreshRow', index);
                    editcount--;
                },
                onCancelEdit:function(index,row){
                    row.editing = false;
                    $('#tt').datagrid('refreshRow', index);
                    editcount--;
                }
            }).datagrid('loadData',user).datagrid('acceptChanges');
        });
        var editcount = 0;
        function editrow(index){
            $('#tt').datagrid('beginEdit', index);//开始对一行进行编辑
        }
        function deleterow(index,id){
        	
            $.messager.confirm('确认','是否真的删除?',function(r){
                if (r){
                	dirtyPoolOpration("11" ,id, "") 
                    $('#tt').datagrid('deleteRow', index);//删除一行
                }
            });
        }
        function saverow(index){
        	$('#tt').datagrid('endEdit', index);//结束对一行进行编辑
        	 var rows = $('#tt').datagrid('getRows');
        	  var row = rows[index];
        	  var id = row.id;
        	  var content = row.content; 
        	  //增加
        	  if(id ==null || id ==""){
        		  dirtyPoolOpration("12" ,"", content) 
        		  $("#tt").datagrid("reload")
        	  }
        	 //修改
        	 else
        		 dirtyPoolOpration("13" ,id, content)
            
        }
        function cancelrow(index){
            $('#tt').datagrid('cancelEdit', index);//取消对一行进行编辑
        }
        function addrow(){
            if (editcount > 0){
                $.messager.alert('警告','当前还有'+editcount+'记录正在编辑，不能增加记录。');
                return;
            }
            $('#tt').datagrid('appendRow',{
                id:'',
                content:''
            });
        }
        function saveall(){
            $('#tt').datagrid('acceptChanges');//提交自从被加载以来或最后一次调用acceptChanges以来所有更改的数据
        }
        function cancelall(){
            $('#tt').datagrid('rejectChanges');//回滚自从创建以来或最后一次调用acceptChanges以来所有更改的数据
        }
        function reloads(){
            $('#tt').datagrid('reload');//刷新
        }
        
        function dirtyPoolOpration(type ,id, content) {
        	$.ajax({
	    		type:'post',
	    		data:{"type":type,"id":id ,"content":content},
	    		url:"dirtyPoolOpration",
	    		success:function(){
	    			$.messager.show({
	    				title:'提示信息',
	    				msg:'设置成功',
	    				timeout:1000,
	    				showType:'slide'
	    			});

	    		}
    		
    	})
 }

      $('#btn').click(function(){
    	  $('#tt').datagrid('load',{
   		      scontent: $('#search').val(),
    	  });
      })
      
       $('#configbutton').switchbutton({  
        checked: false,  
        onChange: function(checked){  
            if (checked == true){  
            	dirtyPoolOpration(14 ,1, "")
                return;  
            }  
            if (checked == false){  
            	dirtyPoolOpration(14 ,2, "")   
            }}  
        })  
      