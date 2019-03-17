$(function() {
			
			getData();
			getTreeData();
			//getPzOrZt();	
			$.post('code/getOrcaleCompanyData.do',function(result){
				$.each(result,function(key,value){
					switch(key){
						case 'bumen':
							searchBox($('#section_num'),value);
						break;
						case 'danwei':
							searchBox($('#danWei_num'),value);
						break;
						case 'xiangmu':
							searchBox($('#subject_num'),value);
						break;
						case 'zhiyuan':
							searchBox($('#jober_num'),value);
						break;
						case 'kemu':
							searchBox($('#subject'),value);
						break;
					}
				
				});
			
			});
			 /*模糊查询 */
			function searchBox($abj,data){
				 $abj.combobox({
		            valueField: 'code',
		            textField: 'name',
		            //url: '../data/taxType',
		            data:data,
		            mode: 'remote',
		            hasDownArrow: true,
		            onBeforeLoad: function (parm) {
		                var value = $(this).combobox('getValue');
		                if (value) {
		                    parm.test = value;
		                    return true;
		                }
		                return false;
		            }
		        })
			}
		});
		
				
		function getTreeData(){
			/* var type="tongji,pingzhengmoban,zhaiyao,zhangtaolaiyuan"; */
			//统计下拉
		 	$('#account_num').combotree({
				url:"code/getMysqlCompanyData.do?type=tongji",
	            // lines: true,
				loadFilter:function(data){
					//var result=data["tongji"];
					return data["tongji"];
				}
			});
		 	
			//凭证模板下拉
			$('#voucher_model').combotree({
				url:"code/getMysqlCompanyData.do?type=pingzhengmoban",
				loadFilter:function(data){
					//var result=data["tongji"];
					//console.log(data["pingzhengmoban"]);
					var vourInfo=data["pingzhengmoban"];
					var $vour=$('#voucher_model');
					var v='voucher';
					canvars(vourInfo,$vour,v);
					return vourInfo;
					
				}
			});
			function canvars(d,$abj,el){
				$.post('test/selUserRecord.do',function(result){
					$("#vou").val(result[0]['voucher']);
					$("#acc").val(result[0]['account']);
					for(var k in d[0]){
						if(d[0]['icon']==result[0][el]){
							$abj.combotree("setValue",d['text']);
						}
						if(k=="children"){
							for(var i=0;i<d[0][k].length;i++){
								if(d[0][k][i]['icon']==result[0][el]){
									$abj.combotree("setValue",d[0][k][i]['text']);
								}
							}
						}
					}
				});
			}
			//摘要下拉
			$('#abstract').combotree({
				url:"code/getMysqlCompanyData.do?type=zhaiyao",
				loadFilter:function(data){
					//var result=data["tongji"];
					return data["zhaiyao"];
				}
			});
			//帐套来源下拉
			$('#account_source').combotree({
				url:"code/getMysqlCompanyData.do?type=zhangtaolaiyuan",
				loadFilter:function(data){
					var accountInfo = data["zhangtaolaiyuan"];
					var $arrount = $('#account_source');
					var acc = 'account';
					canvars(accountInfo,$arrount,acc);
					return accountInfo;
				}
			});
		}
		/* 获取后台数据，并在表格中展示 */
		function getData() {
			$("#queryData").click(
				 function() {
					//alert("fjsfjl");
					var date1 = $("#startDate").val();
					var date2 = $("#endDate").val();
					$('#queryTab').bootstrapTable('refresh',{
						url:'file/selInVoiceInof.do?startDate='+date1+'&endDate='+date2+'',
					});
					$('#queryTab').bootstrapTable({
						height : 400,
						striped : true,//隔行变色
						pagination : true,//设置为 true 会在表格底部显示分页条。
						cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
						smartDisplay : true,//设置为 true 是程序自动判断显示分页信息和 card 视图。
						uniqueId : 'id',//对每一行指定唯一标识符。
			            refresh:true,
						sortOrder : 'asc',//定义排序方式，'asc' 或者 'desc'
						sortStable : true,//设置为 true 将获得稳定的排序，我们会添加\_position属性到 row 数据中
						checkboxHeader : false,
						responseHandler: handler,
						columns : [ {
							checkbox : true,
						}, {
							field : 'id',
							title : 'id',
							visible:false
						}, {
							field : 'code0',
							title : '发票代号'
						}, {
							field : 'code1',
							title : '发票编码'
						}, {
							field : 'duty_price',
							title : '项目'
						}, {
							field : 'subject_code',
							title : '价税合计'
						}, {
							field : 'date',
							title : '日期'
						} ],
					});
					function handler(d){
						var jsonD = d;
						for ( var i = 0; i < jsonD.length; i++) {
							var arr = jsonD[i].id.split("_");
							for ( var j = 0; j < arr.length; j++) {
								jsonD[i]["code" + [ j ]] = arr[j];
							}
						}
						return jsonD;
					}
			});
		}
		var today = new Date();//获取系统当前时间
		laydate.render({
			elem : '#startDate',
			format : 'yyyy-MM-dd',
			value : today,
			btns : [ 'confirm' ]
		});
		function tomorrow(toDate){
			var day=toDate.getDate()+1;
			if (day >= 0 && day <= 9) {  
	        	day = "0" + day;  
	    	}  
			var month=toDate.getMonth()+1;
			if (month >= 1 && month <= 9) {  
	        	month = "0" + month;  
	    	} 
			var year=toDate.getFullYear();
			var allDate=year+'-'+month+'-'+day;
			return allDate;
		}
		//console.log(day,month,year,tomorrow);
		laydate.render({
			elem : '#endDate',
			format : 'yyyy-MM-dd',
			value : tomorrow(today),
			btns : [ 'confirm' ]
		});

		