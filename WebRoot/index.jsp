<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  
  <body>
            <input type="button" value="xiazai" onclick="downd()"/>
            <a href="<%=basePath%>file/downloadFile.do" >gffg</a>
            
       <form id="111" action="file/downloadFile.do" method="post" enctype="multipart/form-data">
          <input type="submit" value="下载"/>
     	</form>
     
  <form id="postForm" action="file/uploadFile.do" method="post" 
        enctype="multipart/form-data">
     <span>   上传execle:</span><input type="file" name="uploadFile" id="uploadFile"/>
          <input type="button" value="上传" onclick="doUpload()"/>
     </form>
  </body>
  
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script></head>
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
                 },  
                 error : function(data) { 
                    alert("上传失败！");
                 }  
            }); 
        } 
        
        
        function downd(){
         $.ajax({  
                 url:"<%=basePath%>file/downloadFile.do",
                 type : "POST",  
                 data : null,  
                 async: false,  
	             cache: false,  
	             contentType: false,  
	             processData: false,
                 success : function(data) {  
                 	alert("成功！");
                 },  
                 error : function(data) { 
                    alert("上传失败！");
                 }  
            }); 
        }
  </script>
</html>
