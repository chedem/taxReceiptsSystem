package com.yrkj.file;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yrkj.file.bean.InvoiceInof;
import com.yrkj.file.service.IFile;

@Controller
@RequestMapping(value="/file")
public class FileController {

	@Resource
	private IFile fileImpl;
	 /**
	  * 文件上传
	  * @param uploadFile文件
	  * @param date时间
	  * @param type类型
	  * @param request
	  * @param response
	  * @return
	  */
	 	@RequestMapping(value="/uploadFile")
	 	@ResponseBody
	    public String getParamFromFile(@RequestParam("uploadFile") MultipartFile uploadFile,HttpServletRequest request, HttpServletResponse response) {
		 	return fileImpl.fileInsert(uploadFile, request, response);
	 	}
	 	
		@RequestMapping(value="/downloadFile")
	 	@ResponseBody
	    public void downloadFile(HttpServletRequest request, HttpServletResponse response) {
			response.setHeader("Content-disposition","attachment;filename=Voucher.Dat");  
		    response.setContentType("application/octet-stream");  
		 	fileImpl.downloadFile( request, response);
	 	}
		
		
		@RequestMapping(value="/selInVoiceInof", produces = "application/json; charset=utf-8")
	    @ResponseBody
		public List<InvoiceInof> selInVoiceInof(HttpServletRequest request){

			List<InvoiceInof> list = fileImpl.selInVoiceInof(request);
			return list;
		}
}
