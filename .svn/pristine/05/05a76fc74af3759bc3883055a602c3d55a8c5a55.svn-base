package com.yrkj.file.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yrkj.file.bean.InvoiceInof;

public interface IFileDao {

	int insertAll(List<InvoiceInof> list);
	int insertOne(InvoiceInof invoiceInof);
	
	List<InvoiceInof> selInVoice(List<InvoiceInof> list);
	
	List<InvoiceInof> selInVoiceInof(@Param("startDate")String startDate,@Param("endDate")String endDate);


}
