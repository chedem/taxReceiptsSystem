package com.yrkj.file.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.yrkj.code.dao.ICodeDao;
import com.yrkj.file.bean.InvoiceInof;
import com.yrkj.file.dao.IFileDao;
import com.yrkj.login.bean.User;
import com.yrkj.login.dao.ILoginDao;
import com.yrkj.login.service.ILogin;


@Service
public class FileImpl implements IFile{
	
	@Resource
	private IFileDao iFileDao;
	
	@Resource
	private ICodeDao codeDao;
	
	@Resource 
	private ILoginDao iLoginDao;

	 /** 
     * @描述：验证excel文件 
     * @时间：2012-08-29 下午16:27:15 
     * @参数：@param filePath　文件完整路径 
     * @参数：@return 
     * @返回值：boolean 
     */  
  
    public String validateExcel(String filePath)  
    {  
    	String errorInfo="";
        /** 检查文件名是否为空或者是否是Excel格式的文件 */  
        if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath)))  
        {  
            errorInfo = "文件名不是excel格式";  
            return errorInfo;  
        }  
        /** 检查文件是否存在 */  
        File file = new File(filePath);  
  
        if (file == null || !file.exists())  
        {  
            errorInfo = "文件不存在";  
            return errorInfo;  
        }  
        return "";  
    }  
    
    
    /** 
     * @描述：是否是2003的excel，返回true是2003 
     * @参数：@param filePath　文件完整路径 
     * @参数：@return 
     * @返回值：boolean 
     */  
  
    public static boolean isExcel2003(String filePath)  
    {  
        return filePath.matches("^.+\\.(?i)(xls)$");  
    }  
  
    /** 
     * @描述：是否是2007的excel，返回true是2007 
     * @参数：@param filePath　文件完整路径 
     * @参数：@return 
     * @返回值：boolean 
     */  
  
    public static boolean isExcel2007(String filePath)  
    {  
        return filePath.matches("^.+\\.(?i)(xlsx)$");  
    }
	public String uploadFile(MultipartFile uploadFile){
		
	        InputStream inputStream = null;
	         FileOutputStream outpurStream = null;
	 		String filePath =this.getClass().getResource("/").getPath()+"/file/";
	        try{
	            String filename = uploadFile.getName();
	            String originalFilename = uploadFile.getOriginalFilename();
	            inputStream =  uploadFile.getInputStream();
	            File file = new File(filePath);
	            if(!file.exists()){
	            	file.mkdirs();
	            }
	            filePath += originalFilename;
	            file = new File(filePath);
	            outpurStream= new FileOutputStream(file);
	            int c;
	            byte buffer[]=new byte[1024];
	            while((c=inputStream.read(buffer))!=-1){
	                for(int i=0;i<c;i++)
	                	outpurStream.write(buffer[i]);        
	            }
	            return filePath;
	        } catch (Exception e1) {
	        	e1.printStackTrace();
	            return "";
	        }finally{
	        	try {
	        		if(outpurStream!=null){outpurStream.close();}
	        		if(inputStream!=null){inputStream.close();}
				} catch (Exception e) {
					e.printStackTrace();
				}
	        }
	}

	public String fileInsert(MultipartFile uploadFile,
			HttpServletRequest request, HttpServletResponse response) {
		
		String fal = "";
		String filePath=uploadFile(uploadFile);
		if(!"".equals(filePath)){
			fal= validateExcel(filePath);
			if("".equals(fal)){
				fal = read(filePath);
			}
		}else{
			fal="上传失败！";
		}
		return fal;
	}
    

    /** 
     * @描述：根据文件名读取excel文件 
     * @返回值：List 
     */  
  
    public String read(String filePath){  
    	StringBuffer fal= new StringBuffer();
        InputStream inputstream = null;  
        try {  
        	inputstream = new FileInputStream(new File(filePath));
        	Workbook tempWorkBook = null;
            if (isExcel2007(filePath))  
            {  
            	tempWorkBook = new XSSFWorkbook(inputstream);
            }  else{
            	tempWorkBook = new HSSFWorkbook(inputstream);
            }
           String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(System.currentTimeMillis());
           String dutyPrice ="";
            InvoiceInof invoiceInof= new InvoiceInof();
		  	 int sheetNum = tempWorkBook.getNumberOfSheets();
		  	fal.append("共 "+sheetNum+" 页  第 ");
		  	 Sheet tempSheet=null;
		  	 int rowNum=0;
		  	 int cellNum=0;
		  	 Row row = null;
		  	 Cell cell =null;
		  	  for (int i = 0; i < sheetNum; i++) {
		  		tempSheet = tempWorkBook.getSheetAt(i);
		  		rowNum=tempSheet.getLastRowNum();//获得总行数
		  		for (int j = 1; j < rowNum; j++) {
		  			row = tempSheet.getRow(j);
		  			if(row==null){continue;}
					cellNum = row.getPhysicalNumberOfCells();//获取总列数
					invoiceInof =new InvoiceInof();
					invoiceInof.setId(getCellValueByCell(row.getCell(1))+"_"+getCellValueByCell(row.getCell(2)));
					invoiceInof.setSubject_code(getCellValueByCell(row.getCell(7)));
					dutyPrice = getCellValueByCell(row.getCell(9));
					dutyPrice = dutyPrice.substring(dutyPrice.indexOf("\"货物或应税劳务名称\":\"*")+"\"货物或应税劳务名称\":\"*".length());
					dutyPrice = dutyPrice.substring(0,dutyPrice.indexOf("*"));
					invoiceInof.setDuty_price(dutyPrice);
					invoiceInof.setDate(date);
					try {
						iFileDao.insertOne(invoiceInof);
					} catch (Exception e) {
					  	fal.append((j+1));
					  	fal.append("/");
					  	fal.append((i+1));
					  	fal.append(" ");
					}

				}
		  	  }
            /** 调用本类提供的根据流读取的方法 */  
        } catch (Exception ex){  
            ex.printStackTrace();  
        } finally {  
        	try{  
	            if (inputstream != null) {  
	               inputstream.close();  
	            }  
        	} catch (IOException e){  
        		e.printStackTrace();  
        	}  
        }  
	  	fal.append("行出错");
        return fal.toString();  
    }  
    
    
    //获取单元格各类型值，返回字符串类型
    private  String getCellValueByCell(Cell cell) {
        //判断是否为null或空串
        if (cell==null || cell.toString().trim().equals("")) {
            return "";
        }
        String cellValue = "";
        int cellType=cell.getCellType();
         
        switch (cellType) {
        case Cell.CELL_TYPE_STRING: //字符串类型
            cellValue= cell.getStringCellValue().trim();
            cellValue=StringUtils.isEmpty(cellValue) ? "" : cellValue; 
            break;
        case Cell.CELL_TYPE_BOOLEAN:  //布尔类型
            cellValue = String.valueOf(cell.getBooleanCellValue()); 
            break; 
        case Cell.CELL_TYPE_NUMERIC: //数值类型
                cellValue = new DecimalFormat("#.######").format(cell.getNumericCellValue()); 
            break;
        default: //其它类型，取空串吧
            cellValue = "";
            break;
        }
        return cellValue;
    }


	public void downloadFile(HttpServletRequest request,
			HttpServletResponse response) {
		ServletOutputStream os = null;
		String ids = request.getParameter("ids").replace("'", "");
		String data = request.getParameter("data");
		String[] dataInfo = data.split(",");
		
		String[] id = ids.split(",");
		InvoiceInof ii = null;
		List<InvoiceInof> list1 = new ArrayList<InvoiceInof>();
		for (int i = 0; i < id.length; i++) {
			ii = new InvoiceInof();
			ii.setId(id[i]);
			list1.add(ii);
		}
		List l =  iLoginDao.selUserInfor(request.getSession().getAttribute("userId").toString());
		User user = (User) l.get(0);
		String zdbm =user.getDepartment();
		try {
			os = response.getOutputStream();
			List<InvoiceInof> list = iFileDao.selInVoice(list1);
			
			int i = 1;
			int j = 1;
			for (InvoiceInof invoiceInof : list) {
				os.write(getData(i,j,dataInfo,invoiceInof,zdbm).getBytes("utf-8"));
				os.write("\r\n".getBytes());
				j++;
				i++;
				os.write(getData(i,j,dataInfo,invoiceInof, zdbm).getBytes("utf-8"));
				os.write("\r\n".getBytes());
				j--;
				i++;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(os!=null){try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}}
		}
	}
	
	
	private String getData(int i,int j ,String dataInfo[],InvoiceInof invoiceInof,String zdbm){
		StringBuffer data = new StringBuffer();
		Date date1 = null;
		try {
			date1 = new SimpleDateFormat("yyyy-MM-dd").parse(dataInfo[0]);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();    
		calendar.setTime(date1);    
//		calendar.add(Calendar.YEAR, -1);//当前时间减去一年，即一年前的时间    
		data.append(calendar.get(Calendar.MONTH)+1);
		data.append("	");
		data.append(dataInfo[0]);//日期
		data.append("	");
		data.append("记");
		data.append("	");
		if(j==1){
			data.append(Long.valueOf(dataInfo[1])+i);//凭证编号
		}else{
			data.append(Long.valueOf(dataInfo[1])+(i-1));//凭证编号
		}
		data.append("	");
//		data.append("报销餐费");
		data.append(dataInfo[2]);//摘要
		data.append("	");
//		data.append("科目");
//		日期，凭证编号，摘要，主科目，制单编号，凭证模板，帐套来源，单位编码，部门编码，职员编码，统计编码，项目编码
		if(j==1){
			data.append(dataInfo[3]);//对方科目
		}else{
			data.append(invoiceInof.getDuty_price());//主科目
		}
//		data.append(dataInfo[3]);
		data.append("	");
		data.append("RMB	1	");
//		data.append("价税合计");
		data.append(invoiceInof.getSubject_code());//价税合计
		data.append("	");
		if(j==1){
			data.append(invoiceInof.getSubject_code()+"	0	0	0	");
		}else{
			data.append("0	"+invoiceInof.getSubject_code()+"	0	0	");
		}
//		data.append("制单编码（下拉）");
//		日期，凭证编号，摘要，主科目，凭证模板，帐套来源，单位编码，部门编码，职员编码，统计编码，项目编码
		data.append(zdbm);//制单编码
		data.append("	 	 	0	0	");
		data.append(dataInfo[4]);//凭证模板(下拉)
		data.append("	");
		data.append(j);//类别1 ， 2
		data.append("	");
		data.append(dataInfo[6]);//单位编号(下拉)
		data.append("	");
		data.append(dataInfo[7]);//部门编号(下拉)
		data.append("	");
		data.append(dataInfo[8]);//职员编号(下拉)
		data.append("	");		
		data.append(dataInfo[9]);//"统计编号(下拉)
		data.append("	");
		data.append(dataInfo[10]);//项目编号(下拉)
//		data.append("	");
//		data.append(dataInfo[7]);//部门编号(下拉)
		data.append(" 	 	0	1	 	0	0	0	00	 	");
		data.append(dataInfo[5]);//账套来源
		data.append("		");
		data.append(dataInfo[5]);//账套来源
		data.append("		 	0	 	 	 	 	0	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	");
		data.append(dataInfo[0]);//时间
		return data.toString();
	}


	public List<InvoiceInof> selInVoiceInof(HttpServletRequest request) {
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
//		PageHelper.startPage(1, 1,false);
//		PageHelper.orderBy("creat_date desc");
		return iFileDao.selInVoiceInof(startDate, endDate);
	}
	
	
}
