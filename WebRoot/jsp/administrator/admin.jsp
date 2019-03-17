<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="jsp/css/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="jsp/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <script src="jsp/js/plugins/jQuery/jquery.min.js"></script>
    <script src="jsp/js/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="jsp/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="jsp/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="jsp/layer/layer.min.js"></script>
    <script src="jsp/administrator/admin.js"></script>
  </head>
  
  <body>
   <div class="container">
    <div id="toolbar" class="btn-group">
        <button id="btn_add" type="button" data-toggle="modal" data-target="#add_user" class="btn btn-default">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_edit" type="button"  data-toggle="modal" data-target="#update_user" class="btn btn-default">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>

    <table id="detailtable"></table>

    <div id="add_user" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">新增用户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" autocomplete='off'>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addUserName">用户名：</label>
                            <div class="col-sm-8">
                                <input id="addUserName" name="addUserName" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" placeholder="请输入用户名称" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addUserPwd">密码：</label>
                            <div class="col-sm-8">
                                <input id="addUserPwd" name="addUserPwd" class="form-control" placeholder="请输入密码" required aria-required="true"
                                       type="test">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addUserSection">制单编号：</label>
                            <div class="col-sm-8">
                                <input id="addUserSection" name="addUserSection" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid">
                            </div>
                        </div>
                        <div class="form-group">
							<label class="col-sm-3 control-label">性别：</label>
							<div id="sex" class="col-sm-8">
								<input name="sex"
									type="radio" value="1" checked>男
									<input class="jg" name="sex"
									type="radio" value="0">女							
							</div>
						</div>
                         <div class="form-group">
                            <label class="col-sm-3 control-label" for="addUserPhone">手机号：</label>
                            <div class="col-sm-8">
                                <input id="addUserPhone" name="addUserPhone" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addUserEmail">E-mail：</label>
                            <div class="col-sm-8">
                                <input id="addUserEmail" name="addUserEmail" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <button id="add-data" class="btn btn-primary" type="button">提交</button>
                                <button type="reset" class="btn btn-info">重置</button>
                                <button class="btn btn-danger btn-r close-link" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div id="update_user" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" autocomplete='off'>
                    	<div class="form-group">
                            <div class="col-sm-8" hidden="true">
                                <input id="upId" type="text" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="upUserName">用户名：</label>
                            <div class="col-sm-8">
                                <input id="upUserName" name="upUserName" class="form-control"
                                       type="text" aria-required="true" aria-invalid="true"
                                       class="error">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="upUserPwd">密码：</label>
                            <div class="col-sm-8">
                                <input id="upUserPwd" name="upUserPwd" class="form-control"
                                       type="test">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="upUserSection">制单编号：</label>
                            <div class="col-sm-8">
                                <input id="upUserSection" name="upUserSection" class="form-control"
                                       type="test">
                            </div>
                        </div>
                        <div class="form-group">
							<label class="col-sm-3 control-label">性别：</label>
							<div  id="usex"  class="col-sm-8">
								<input name="usex"
									 type="radio" value="1" checked>男
									<input class="jg" name="usex"
									 type="radio" value="0">女
							</div>
						</div>
						<div class="form-group">
                            <label class="col-sm-3 control-label" for="upUserPhone">手机号：</label>
                            <div class="col-sm-8">
                                <input id="upUserPhone" name="upUserPhone" class="form-control"
                                       type="test">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="upUserEmail">E-mail：</label>
                            <div class="col-sm-8">
                                <input id="upUserEmail" name="upUserEmail" class="form-control"
                                       type="test">
                            </div>
                        </div>                        
						<div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <button id="up-data" class="btn btn-primary"type="button">提交</button>
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
</body>
</html>
