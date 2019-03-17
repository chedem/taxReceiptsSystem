/**
 * Created by Administrator on 2018/6/12.
 */
$(function(){
    // selData();
    selectRow ();
    $("#addUserName").blur(function(){
        $(this).next("span").text("");
        if($(this).val()==""){
            $(this).next("span").text("用户名不能为空!").addClass("errorConfirm");
        }
    });
    $("#addUserPwd").blur(function(){
        $(this).next("span").text("");
        if($(this).val()==""){
            $(this).next("span").text("密码不能为空!").addClass("errorConfirm");
        }
    });
    //var code,name,pwd,section,phone,email,remark;
    var id,name,pwd,section,sex,phone,email;
    let sjsonData={};
    //点击新增管理员，把新增管理员信息传递给后台
    $("#add-data").on("click",function(){
        name=$("#addUserName").val();
        pwd=$("#addUserPwd").val();
        section=$("#addUserSection").val();
        sex=$('#sex input[name="sex"]:checked ').val();
		phone=$("#addUserPhone").val();
		email=$("#addUserEmail").val();
        if(name!=""&&pwd!=""){
            sjsonData = {
                "name":name,
                "passWord":pwd,
                "department":section,
                "gender":sex,
				"phone":phone,
				"email":email,
            };
            var addurl="test/saveUserInfo.do";
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
        name=$("#upUserName").val();
        pwd=$("#upUserPwd").val();
        section=$("#upUserSection").val();
        sex=$('#usex input[name="usex"]:checked ').val();
        phone=$("#upUserPhone").val();
        email=$("#upUserEmail").val();
        layer.confirm('是否要修改',
            {
                title:'提示'
                ,offset: '100px'
            },function(){
                sjsonData={
                	"id":id,
                    "name":name,
                    "passWord":pwd,
                    "department":section,
                    "gender":sex,
                    "phone":phone,
                    "email":email,
                };
                
                console.log(sjsonData);
                var updateUrl="test/updateUserInfo.do";
                sendData(sjsonData,updateUrl);
                layer.closeAll();
            });
        $("form")[1].reset();
    });
    delBtn();
   /* $.post('test/selUserInfo.do',function(d){
    	console.log(d);
    });*/
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
                    url:"test/deleteUserInfo.do",
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
                        //$('#detailtable').bootstrapTable('refresh',{url:'test/selUserInfo.do'});
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
            //$("form")[1].reset();
        },
        success:function(){
            layer.open({
                title: '提示'
                ,content: '保存成功！'
                ,offset: '100px'
            });
            //$("form")[1].reset();
            $('#add_user').modal('hide');
            $('#update_user').modal('hide');
            selectRow();
        }
    });
    
}

//选择一行，获取当前行的数据，并展示在右边
function selectRow () {
	$('#detailtable').bootstrapTable('refresh');
    $('#detailtable').bootstrapTable({
        url:"test/selUserInfo.do",
        toolbar: '#toolbar',//工具按钮用哪个容器
        striped:true,//隔行变色
        pagination:true,//设置为 true 会在表格底部显示分页条。
        cache:false,
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
            title:'用户ID'
        },{
            field:'name',
            title:'用户名'
        },{
        	field:"passWord",
        	title:"密码",
        	visible:false
        },{
            field:'department',
            title:'制单编号'
        },{
            field:'gender',
            title:'性别',
            formatter:function(value,row,index){ 
            	if(value==1){
            		return '男';
            	}
            	if(value==0){
            		return '女';
            	}
            	/*console.log(value);
            	console.log(row);
            	console.log(index);*/
            }
        },{
            field:'phone',
            title:'手机号'
        },{
            field:'email',
            title:'邮箱'
        }],
      //  data:data,
        onCheck:function (row,$element) {
        	var uid=row.id;
            var uname=row.name;
            var upwd=row.passWord;
            var usection=row.department;
            var usex=row.gender;
            var uphone=row.phone;
            var uemail=row.email;
            updateSave(uid,uname,upwd,usection,usex,uphone,uemail);
        }
    });
    function updateSave(id,name,pwd,section,sex,phone,email){
        $("#btn_edit").click(function(){
            $("form")[1].reset();
            $("#upId").val(id);
            $("#upUserName").val(name);
            $("#upUserPwd").val(pwd);
            $("#upUserSection").val(section);
            if(sex=="男"){
				$("#usex [name=updateState]:eq(0)").attr("checked","checked");
			}
			if(sex=="女"){
				$("#usex [name=updateState]:eq(1)").attr("checked","checked");
			}
            $("#upUserPhone").val(phone);
            $("#upUserEmail").val(email);
        });
    }
}