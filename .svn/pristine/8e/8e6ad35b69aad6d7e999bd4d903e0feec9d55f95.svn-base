<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'maintain.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="jsp/css/plugins/jsTree/style.min.css">
    <link rel="stylesheet" href="jsp/css/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="jsp/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <script src="jsp/js/plugins/jQuery/jquery.min.js"></script>
    <script src="jsp/js/plugins/jsTree/jstree.min.js"></script>
    <script src="jsp/js/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="jsp/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="jsp/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="jsp/layer/layer.min.js"></script>
    <script type="text/javascript" src="jsp/maintain/maintain.js"></script>
	<style>
		 .modal-sm{
            width:350px !important;
        }
        .glyphicon-folder-open:before {
            color: #FFCC00;
        }
	</style>
</head>
<body>
<div class="container">
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
                                <input id="pCode" name="pCode" class="form-control" type="text" disabled="disabled"><button id="bth_tree" type="button" class="btn btn-primary" data-toggle="modal" data-target="#treeView"><i class="glyphicon glyphicon-list-alt"></i></button>
                            </div>
                        </div>
                        <!-- <div class="form-group">
                            <label class="col-sm-3 control-label">是否生效：</label>
                            <div class="col-sm-8">
                                <input type="radio" name="addTake" value="1" checked>是
                                <input type="radio" name="addTake" value="0">否
                            </div>
                        </div> -->
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
                                <input id="upCode" name="upCode" class="form-control" type="text" disabled="disabled"><button id="bth_tree" type="button" class="btn btn-primary" data-toggle="modal" data-target="#uptreeView"><i class="glyphicon glyphicon-list-alt"></i></button>
                            </div>
                        </div>
                        <!-- <div class="form-group">
                            <label class="col-sm-3 control-label">是否生效：</label>
                            <div class="col-sm-8">
                                <input type="radio" name="upTake" value="1" checked>是
                                <input type="radio" name="upTake" value="0">否
                            </div>
                        </div> -->
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
                    <div id="uptreeView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                        <div class="modal-dialog modal-sm" role="document">
                            <div class="modal-content">
                                <div id="uptreeV"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
</body>
</html>

