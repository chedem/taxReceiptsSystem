<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'budget.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="jsp/css/plugins/bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css"
          href="jsp/css/plugins/fontawe/font-awesome.css" />
    <link rel="stylesheet" href="jsp/jexce/dist/css/jquery.jexcel.css"
          type="text/css">
    <!-- <link rel="stylesheet" href="css/leading.css" type="text/css"></link> -->

    <style type="text/css">
        #uploadFile{
            height: 30px;
            line-height: 30px;
            font-size: 16px;
        }
        #sel,#type{
            width: 150px;
            height: 30px;
            line-height: 30px;
            font-size: 16px;
        }
        .row {
            margin: 20px auto;
        }
        #my {
            height: 450px;
            width: 100%;
            overflow:hidden;
            overflow: auto;
        }
    </style>
<body>
<div class="container-fluid">
    <form id="postForm" class="form-inline row" action="extract/setProfitData1.do" method="post"
          enctype="multipart/form-data">
        <div class="form-group col-sm-3">
            <label for="date">时间：</label><input class="form-control" type="text" id="date" name="date">
        </div>
        <div class="form-group col-sm-3">
            <!--<label for="type">请选择：</label>-->
            <!--<select id="type" name="type">-->
                <!--<option value ="_1">抵消表</option>-->
                <!--<option value ="-2">同期表</option>-->
                <!--<option value ="_201">预算目标表</option>-->
                <!--<option value ="_202">奋斗目标表</option>-->
                <!--&lt;!&ndash; <option value ="_3"></option> &ndash;&gt;-->
            <!--</select>-->
        </div>
        <div class="form-group col-sm-4">
            <label for="uploadFile" class="col-xs-4 text-right"> 上传execle</label>
            <input class="col-xs-8" type="file" name="uploadFile"
                   id="uploadFile" onchange="importf(this)"/>
        </div>

        <div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">预览</button>
            <input class="btn btn-primary" type="button" value="上传"
                   onclick="doUpload()" />
            <span id="messageTip" hidden="true"></span>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <label>请选择</label>
                        <select id="sel" name="">

                        </select>
                    </div>
                    <div class="modal-footer">
                        <!--<button type="button" class="btn btn-default" >Close</button>-->
                        <button id="btnOk" type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div id="my"></div>
</div>
<script type="text/javascript" src="jsp/js/plugins/jQuery/jquery.min.js"></script>
<script type="text/javascript" src="jsp/jexce/laydate/laydate.js"></script>
<script src="jsp/js/plugins/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="jsp/jexce/xlsx/xlsx.core.min.js"></script>
<script type="text/javascript" src="jsp/jexce/dist/js/jquery.jexcel.js"></script>
<script type="text/javascript" src="jsp/budget/js/budget.js"></script>
<script type="text/javascript">
    function doUpload(){
        var formData = new FormData($( "#postForm" )[0]);
        $.ajax({
            url:"<%=basePath%>file/uploadFile.do",
            type : "POST",
            data : formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success : function(data) {
           	 alert(data);
                console.log(data);
            },
            error : function(data) {
            }
        });
    }

    var myDate = new Date();//获取系统当前时间
    laydate.render({
        elem: '#date'
        //,type: 'month'
        ,format: 'yyyy-MM-dd'
        ,value: myDate
        ,btns: ['confirm']
    });
</script>

</body>
</html>