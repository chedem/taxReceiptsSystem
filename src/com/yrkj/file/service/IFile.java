package com.yrkj.file.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yrkj.file.bean.InvoiceInof;

public interface IFile {

	String fileInsert(MultipartFile uploadFile,HttpServletRequest request, HttpServletResponse response);

	void downloadFile(HttpServletRequest request, HttpServletResponse response);
	
	List<InvoiceInof> selInVoiceInof(HttpServletRequest request);
}
