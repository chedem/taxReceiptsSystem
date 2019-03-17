package com.yrkj.code.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yrkj.code.bean.Code;
import com.yrkj.code.bean.Company;

public interface ICodeDao {

//	List<Code> getCompanyData(@Param("pCode")String pCode,@Param("type")String type) ;

	List<Company> getCompanyData1() ;

	List<Company> getCompanyData(@Param("pCode")String pCode,@Param("type")String type) ;
	public List selCode(Code pcb);
	public List selCodeOne(@Param("pCode")String pCode,@Param("type")String type);

	public int saveCode(Code pcb) ;

	public int delCode(@Param("ids")String[] ids) ;

	public int updatePCode(@Param("record") Code pcb) ;
	public int updateCode(@Param("record") Code pcb) ;
	
	public List selDanWei(@Param("code") String code) ;

	public List selZhiYuan(@Param("code") String code) ;

	public List selBuMen(@Param("code") String code) ;

	public List selXiangMu(@Param("code") String code) ;

	public List selKeMu(@Param("code") String code) ;

//	public List selPCode(Code pcb) ;
//
//	public void savePCode(Code pcb) ;
//
//	public void delPCode(Code pcb);
//
//	public void updatePCode(Code pcb);
}
