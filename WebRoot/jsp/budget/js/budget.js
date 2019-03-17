/**
 * Created by Administrator on 2018/6/12.
 */
var wb;//读取完成的数据
var rABS = false; //是否将文件读取为二进制字符串

function importf(obj) {//导入
    if(!obj.files) {
        return;
    }
    var f = obj.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
        var data = e.target.result;
        if(rABS) {
            wb = XLSX.read(btoa(fixdata(data)), {//手动转化
                type: 'base64'
            });
        } else {
            wb = XLSX.read(data, {
                type: 'binary'
            });
        }

        var snames = wb.SheetNames;
        for(var i=0;i<snames.length;i++){
            $("#sel").append('<option value="'+i+'">'+snames[i]+'</option>');
        }
        var excelData = [];
        var seltext;
        $("#btnOk").click(function(){
            seltext=$('#sel option:selected').text();
            //wb.SheetNames[0]是获取Sheets中第一个Sheet的名字
            //wb.Sheets[Sheet名]获取第一个Sheet的数据
            excelData= JSON.stringify( XLSX.utils.sheet_to_json(wb.Sheets[seltext]) );
            dataShow (excelData,seltext);
        });
        function dataShow (persons,selname) {
            console.log(persons);
            var allRow=[],
                allCol=[],
                arr=[],
                objData=eval(persons);
            var num2;
            for(var i=1,j=0;i<objData.length;i++,j++){
                if(objData[i][selname]!=null){
                    if((objData[i][selname]).replace(/\s/ig,'')=="项目"){//去除所有空格，然后进行判断
                        arr[j] ={};
                        allCol.push(objData[i][selname]);
                        for(var key in objData[i]){
                            if(key!=selname){
                                arr[j]['text']=objData[i][key];
                            }
                            if(arr[j]['text']!=undefined){
                                allCol.push(arr[j]['text']);
                            }
                        }
                        num2=i;
                    }
                }
                if(i>=num2){
                    allRow[j]=[];
                    arr={}; //js中二维数组必须进行重复的声明，否则会undefind
                    allRow[j].push(objData[i][selname]);
                    for(var key in objData[i]){
                        if(key!=selname){
                            arr['text'+[j]]=objData[i][key];
                        }
                        if(arr['text'+[j]]!=undefined){
                            allRow[j].push(arr['text'+[j]]);
                        }
                    }
                }
            }
            $('#my').jexcel({
                data:allRow,
                colHeaders:allCol,
                csvHeaders :true ,
                tableOverflow :true ,
                tableHeight:'450px',
                colWidths:colW(),
            });
            function colW(){
                var col=[];
                for(var m=0;m<allRow.length;m++){
                    col.push(60);
                }
                return col;
            }
        }
    };
    if(rABS) {
        reader.readAsArrayBuffer(f);
    } else {
        reader.readAsBinaryString(f);
    }
}
