$(function () {
            //subjectTable();
            getTree();
		    //菜单树
		    var id,code,name,typeOf,pCode,remark;
		    var sjsonData={};
		    //点击新增管理员，把新增管理员信息传递给后台
		    $("#add-data").on("click",function(){
		        code=$("#addMainCode").val();
		        name=$("#addMainName").val();
		        typeOf=$("#typeOf").val();
		        pCode=$("#pCode").val();
		        remark=$("#remark").val();
		        if(code!=""&&name!=""){
		            sjsonData = {
		                "code":code,
		                "name":name,
		                "type":typeOf,
		                "pCode":pCode,
		                "remark":remark
		            };
		            var addurl="code/saveCode.do";
		            sendData(sjsonData,addurl);
		        }else{
		            layer.open({
		                title: '错误提示'
		                ,content: '保存失败！'
		                ,offset: '100px'
		            });
		        }
		        $("form")[0].reset();
		
		    });
		    //点击修改,把修改的信息传递给后台
		    $("#up-data").click(function(){
		    	id=$("#upId").val();
		        code=$("#upMainCode").val();
		        name=$("#upMainName").val();
		        typeOf=$("#upTypeOf").val();
		        pCode=$("#upCode").val();
		        remark=$("#uremark").val();
		        layer.confirm('是否要修改',
		            {
		                title:'提示'
		                ,offset: '100px'
		            },function(){
		                sjsonData={
		                	"id":id,
		                    "code":code,
		                    "name":name,
		                    "pCode":pCode,
		                    "type":typeOf,
		                    "remark":remark
		                };
		                var updateUrl="code/updateCode.do";
		                sendData(sjsonData,updateUrl);
		                layer.closeAll();
		            });
					 $("form")[1].reset();
			    });
			    delBtn();
        });
		function delBtn(){
		    //点击删除按钮，根据id
		    $("#btn_delete").click(function(){
		    	 var ids="";
		    	    var getSelection= $("#detailtable").bootstrapTable('getAllSelections');
		
		    	    if(getSelection.length>=1){
		    	        for(var i =0;i<getSelection.length;i++){
		    	            ids=ids+"'"+getSelection[i].id+"',";
		    	        }
		    	    }else{
		    	        alert("请在表格中选中一行");
		    	    }
		    	    ids = ids.substring(0, ids.length - 1);
		    	    console.log(ids);
		        layer.confirm('是否要删除',
		            {
		                title:'提示'
		                ,offset: '100px'
		            },function(){
		                $.ajax({
		                    type:"post",
		                    url:"code/delCode.do",
		                    async:true,
		                    dataType:"json",
		                    data:{
		                        userId:ids
		                    },
		                    error:function(e){
		                        layer.open({
		                            title: '提示'
		                            ,content: '删除失败！'
		                            ,offset: '100px'
		                        });
		                    },
		                    success:function(){
		                        layer.open({
		                            title: '提示'
		                            ,content: '删除成功！'
		                            ,offset: '100px'
		                        });
		                    }
		                });
		                layer.closeAll();
		            });
		
		    });
		}
		//将新增或修改的数据发送到后台
		function sendData(jdata,url){
		    $.ajax({
		        type:"post",
		        url:url,
		        async:true,
		        dataType:"json",
		        data:jdata,
		        error:function(e){
		            console.log(e);
		            layer.open({
		                title: '错误提示'
		                ,content: '保存失败！'
		                ,offset: '100px'
		            });
		        },
		        success:function(){
		            layer.open({
		                title: '提示'
		                ,content: '保存成功！'
		                ,offset: '100px'
		            });
		            $('#add_maintain').modal('hide');
		            $('#update_maintain').modal('hide');
		        }
		    });
		}
       	//function showTable(data) {
		        $('#detailtable').bootstrapTable({
		            toolbar: '#toolbar',//工具按钮用哪个容器
		            striped:true,//隔行变色
		            pagination:true,//设置为 true 会在表格底部显示分页条。
		            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		            smartDisplay:true,//设置为 true 是程序自动判断显示分页信息和 card 视图。
		            search:true,//是否启用搜索框。
		            showColumns:true,//是否显示内容列下拉框。
		            showRefresh:true,//是否显示刷新按钮。
		            refresh:true,
		            showToggle:true,//是否显示切换视图（table/card）按钮
		            uniqueId:'id',//对每一行指定唯一标识符。
		            sortOrder:'asc',//定义排序方式，'asc' 或者 'desc'
		            sortStable:true,//设置为 true 将获得稳定的排序，我们会添加\_position属性到 row 数据中
		            checkboxHeader:false,
		            columns:[{
		                checkbox:true,
		            },{
		                field:'id',
		                title:'摘要ID',
		                visible:false
		            },{
		                field:'code',
		                title:'编码'
		            },{
		                field:'name',
		                title:'名称'
		            },{
		                field:'type',
		                title:'类型'
		            },{
		            	field:'pCode',
		                title:'父级编码'
		            },{
		                field:'remark1',
		                title:'备注'
		            }],
		            onCheck:function (row,$element) {
		            	var id=row.id;
		                var ucode=row.code;
		                var uname=row.name;
		                var typeOf=row.type;
		                var upCode=row.pCode;
		//                var take=row.is_valid;
		                var remark=row.remark1;
		//                updateSave(id,ucode,uname,typeOf,take,remark);
		                updateSave(id,ucode,uname,typeOf,upCode,remark);
		            }
		        });
		   // }
		     function updateSave(id,code,name,typeOf,upCode,remark){
		         $("#btn_edit").click(function(){
		             $("form")[1].reset();
		             $("#upId").val(id);
		             $("#upMainCode").val(code);
		             $("#upMainName").val(name);
		             $("#upTypeOf").val(typeOf);
		             $("#upCode").val(upCode);
		             $("#uremark").val(remark);
		         });
		     }
        function getTree() {
        	
			 $.ajax({
		        type:"post",
		        url:"code/getCompanyData.do",
		        async:true,
		        dataType:"json",
		        success:function(result){
		        	var jsonse=[];
		        	jsonse.push("全部");
		    		for(var i=0;i<result.length;i++){
		    			
		    			$.each(result[i],function(_key){
					    var key = _key;
					    var value = result[i][_key];
					   /*  if(_key=="parent")
					    {  //删除
					       delete result[i][_key];
					    } */
					    /*  if(_key=="type")
					    {
					    	delete result[i][_key];
					    } */
						}); 
						jsonse.push(result[i]);
		    		}
		        	//console.log(jsonse);
		        	ddd(jsonse);
		        }	
		      });
			
		    function ddd(jsond){
		    	  
				$('#container').jstree({
			        'core' : {
			           'data' : jsond,
			
			        },
			        "types" : {
			            "default" : {
			                "icon" : "glyphicon glyphicon-folder-open"
			            }
			        },
			        "plugins" : ["types"]
			
			    });
		    }
		 //每次点击树形菜单，table中数据会随之改变
		$('#container').on("changed.jstree",function (e,data) {
	      var treeValue=data.instance.get_selected(true)[0];
	        console.log(treeValue);
	//      console.log(treeValue.text);
			var pCode,text,code;
			if(treeValue.text=="全部"){
				pCode=1;
				code=1;
				text=null;
			}else{
				pCode=treeValue.original.parent;
				text=treeValue.original.type;
				code=treeValue.original.icon;
			}
			//console.log(pCode,text);
			$("#detail").bootstrapTable('refresh', {
			url: 'code/selCodeOne.do?pCode='+code+'&type='+text+'',
			}); 
			btnAdd(code,text);
	  	});
	  	function btnAdd(parent,type){
	  		$("#btn_add").click(function(){
	  			typeOf=$("#typeOf").val(type);
		        pCode=$("#pCode").val(parent);
	  		});
	  	}
	}