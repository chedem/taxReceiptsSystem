<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="jsp/css/plugins/jsTree/style.min.css">
    <link rel="stylesheet" href="jsp/css/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="jsp/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <script src="jsp/js/plugins/jQuery/jquery.min.js"></script>
    <script src="jsp/layer/layer.min.js"></script>
    <script src="jsp/js/plugins/jsTree/jstree.min.js"></script>
    <script src="jsp/js/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="jsp/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="jsp/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
  	<style>
  		 *{
            margin: 0;
            padding: 0;
            border:0;
        }
        html,body{
            width:100%;
            height:100%;
            overflow: hidden;
        }
        .navbar{
            margin-bottom: 0px !important;
        }
        .navbar-default{
            background-color: rgb(0, 145, 208) !important;
            border:0 !important;

        }
        .navbar-default .navbar-brand {
            color: #FFFFFF !important;
        }
        .treeNav{
            border: 1px solid #ccc;
            padding:10px 0px;
            width: 20%;
            height: 100%;
            overflow-x: hidden;
        }
        .main{
            display: block;
            width: 80%;
            height: 100%;
            /*border:1px solid #ff4c42;*/
        }
         .modal-sm{
            width:350px !important;
        }
        .glyphicon-folder-open:before {
            color: #FFCC00;
        }
  	</style>
  </head>
  
  <body>
  	<div>
    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">税务凭证</a>
        </div>
    </div>
    <div class="operate">
        <div class="treeNav pull-left" id="container">

        </div>
        <div class="main pull-right">
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" data-toggle="modal" data-target="#add_maintain" class="btn btn-default">
		            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		        </button>
		        <button id="btn_edit" type="button"  data-toggle="modal" data-target="#update_maintain" class="btn btn-default">
		            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
		        </button>
		        <button id="btn_delete" type="button" class="btn btn-default">
		            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
		        </button>
            </div>

            <table id="detailtable"></table>
			<div id="add_maintain" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">新增</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addMainCode">编码：</label>
                            <div class="col-sm-8">
                                <input id="addMainCode" name="addMainCode" class="form-control" type="text" placeholder="请输入项目编码" required aria-required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addMainName">名称：</label>
                            <div class="col-sm-8">
                                <input id="addMainName" name="addMainName" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" placeholder="请输入项目名称" required aria-required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="typeOf">类型：</label>
                            <div class="col-sm-8">
                                <input id="typeOf" name="typeOf" class="form-control" type="text">
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="col-sm-3 control-label" for="pCode">父级编码：</label>
                            <div class="col-sm-8 form-inline">
                                <input id="pCode" name="pCode" class="form-control" type="text" disabled="disabled">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="remark">备注：</label>
                            <div class="col-sm-8">
                                <textarea id="remark" name="remark" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <button id="add-data" class="btn btn-primary" type="button">提交</button>
                                <button class="btn btn-danger btn-r close-link" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </form>
					<div id="treeView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                        <div class="modal-dialog modal-sm" role="document">
                            <div class="modal-content">
                                <div id="treeV"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div id="update_maintain" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">修改信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t">
                    	<div class="form-group" hidden="true">
                            <label class="col-sm-3 control-label">编码ID：</label>
                            <div class="col-sm-8">
                                <input id="upId" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="upMainCode">编码：</label>
                            <div class="col-sm-8">
                                <input id="upMainCode" name="upMainCode" class="form-control"
                                       type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="upMainName">名称：</label>
                            <div class="col-sm-8">
                                <input id="upMainName" name="upMainName" class="form-control"
                                       type="text" aria-required="true" aria-invalid="true"
                                       class="error">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="upTypeOf">类型：</label>
                            <div class="col-sm-8">
                                <input id="upTypeOf" name="upTypeOf" class="form-control"
                                       type="text" aria-required="true" aria-invalid="true"
                                       class="error">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="upCode">父级编码：</label>
                            <div class="col-sm-8 form-inline">
                                <input id="upCode" name="upCode" class="form-control" type="text" disabled="disabled">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="uremark">备注：</label>
                            <div class="col-sm-8">
                                <textarea id="uremark" name="uremark" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <button id="up-data" class="btn btn-primary" type="button">提交</button>
                                <button class="btn btn-danger btn-r close-link">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
        </div>
    </div>
	<script type="text/javascript">
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
	       // console.log(treeValue);
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
			$("#detailtable").bootstrapTable('refresh', {
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
	</script>
</div>

  </body>
</html>
