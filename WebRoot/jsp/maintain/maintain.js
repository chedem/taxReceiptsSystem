/**
 * Created by Administrator on 2018/6/19.
 */

$(function(){
    // selData();
    selectRow ();
    //菜单树
    addMenuTree();
    var id,code,name,typeOf,pCode,remark;
    var sjsonData={};
    //点击新增管理员，把新增管理员信息传递给后台
    $("#add-data").on("click",function(){
        code=$("#addMainCode").val();
        name=$("#addMainName").val();
        typeOf=$("#typeOf").val();
        pCode=$("#pCode").val();
//        takeEffect=$("input[name=addTake]:checked").val();
        remark=$("#remark").val();
//        console.log(code,name,typeOf,takeEffect,remark);
        if(code!=""&&name!=""){
            sjsonData = {
                "code":code,
                "name":name,
                "type":typeOf,
                "pCode":pCode,
//                "isValid":takeEffect,
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
    //点击修改管理员,把修改的信息传递给后台
    $("#up-data").click(function(){
    	id=$("#upId").val();
        code=$("#upMainCode").val();
        name=$("#upMainName").val();
        typeOf=$("#upTypeOf").val();
        pCode=$("#upCode").val();
//        takeEffect=$("input[name=upTake]:checked").val();
        remark=$("#uremark").val();
        //console.log(id);
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
//                    "isValid":takeEffect,
                    "remark":remark
                };
                var updateUrl="code/updateCode.do";
                sendData(sjsonData,updateUrl);
                layer.closeAll();
            });

    });
    upMenuTree();
    delBtn();

});
//获取类型的信息
//function getTypeInfo(){
//	$.ajax({
//        type:"post",
//        url:"code/getCompanyData.do",
//        async:true,
//        dataType:"json",
//        success:function(result){
//        	console.log(result);
//        }
//      });
//}
function addMenuTree(){
	//菜单树
	$('#treeV').jstree({
        'core' : {
            'data' : {
                "url":"jsp/data/taxType",
                "dataType":"json"
            }

        },
        "types" : {
            "default" : {
                "icon" : "glyphicon glyphicon-folder-open"
            }
        },
        "plugins" : ["types"]

    });
    $('#treeV').on("changed.jstree",function (e,data) {
      var treeValue=data.instance.get_selected(true)[0];
//      console.log(treeValue);
//      console.log(treeValue.text);
      $("#pCode").val(treeValue.id);
      $('#treeView').modal('hide');
  });
}
function upMenuTree(){
	$('#uptreeV').jstree({
        'core' : {
            'data' : {
                "url":"jsp/data/taxType",
                "dataType":"json"
            }

        },
        "types" : {
            "default" : {
                "icon" : "glyphicon glyphicon-folder-open"
            }
        },
        "plugins" : ["types"]

    });
    $('#uptreeV').on("changed.jstree",function (e,data) {
      var treeValue=data.instance.get_selected(true)[0];
      $("#upCode").val(treeValue.id);
      $('#uptreeView').modal('hide');
  });
}
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
                        selectRow();
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
            selectRow();
        }
    });
}

//选择一行，获取当前行的数据，并展示在右边
function selectRow () {
    $.ajax({
        type: "get",
        url: "code/selCode.do",
        dataType: "json",
        error: function (e) {
            console.log(e);
        },
        success: function (data) {
            var jsonD = data;
//            for (var i = 0; i < jsonD.length; i++) {
//            	if(jsonD[i].is_valid=='1'){
//                	jsonD[i]["valid"]="是";
//                }
//            	if(jsonD[i].is_valid=='0'){
//            		jsonD[i]["valid"]="否";
//            	}
////                var arr = jsonD[i].id.split("_");
////                for (var j = 0; j < arr.length; j++) {
////                    jsonD[i]["code" + [j]] = arr[j];
////                }
//            }
            showTable(jsonD);
        }
    });
    function showTable(data) {
        $('#detailtable').bootstrapTable({
            toolbar: '#toolbar',//工具按钮用哪个容器
            striped:true,//隔行变色
            pagination:true,//设置为 true 会在表格底部显示分页条。
            smartDisplay:true,//设置为 true 是程序自动判断显示分页信息和 card 视图。
            search:true,//是否启用搜索框。
            showColumns:true,//是否显示内容列下拉框。
            showRefresh:true,//是否显示刷新按钮。
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
//            ,{
//                field:'is_valid',
//                title:'是否生效',
//                visible:false
//            },{
//                field:'valid',
//                title:'是否生效'
//            }
            data:data,
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
    }
     function updateSave(id,code,name,typeOf,upCode,remark){
         $("#btn_edit").click(function(){
             $("form")[1].reset();
             $("#upId").val(id);
             $("#upMainCode").val(code);
             $("#upMainName").val(name);
             
             $("#upTypeOf").val(typeOf);
             $("#upCode").val(upCode);
//             if(takeEffect==1){
//            	 $("input[name=upTake]")[0].checked; 
//             }
//             if(takeEffect==0){
//            	 $("input[name=upTake]")[1].checked; 
//             }
//             
             $("#uremark").val(remark);
         });
     }
}
//查询所有数据
// function selData(){
//     $.ajax({
//         type:"post",
//         url:"welcome/selUserInfo.do",
//         async:true,
//         dataType:"json",
//         error: erryFunction,  //错误执行方法
//         success: succFunction //成功执行方法
//     })
// }
//function erryFunction(e) {
//    console.log(e);
//}
//function succFunction(result) {
//
//    // selectRow ();
//}