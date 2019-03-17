package com.yrkj.code;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrkj.code.dao.ICodeDao;
import com.yrkj.code.service.ICode;

@Controller
@RequestMapping("/code")
public class CodeController {
	
	@Resource
	private ICode code;
	
	/**
	 * 获取公司下拉信息用于维护
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getCompanyData", produces = "application/json; charset=utf-8")
    @ResponseBody
	public List getCompanyData(HttpServletRequest request){

		List list = code.getCompanyData(request);
		return list;
	}
	
	/**
	 * 获取oracle数据下拉框
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getOrcaleCompanyData", produces = "application/json; charset=utf-8")
    @ResponseBody
	public Map getOrcaleCompanyData(HttpServletRequest request){

		Map list = code.getOrcaleCompanyData(request);
		return list;
	}
	
	
	/**
	 * 获取oracle数据下拉框
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getMysqlCompanyData", produces = "application/json; charset=utf-8")
    @ResponseBody
	public Map getMysqlCompanyData(HttpServletRequest request){

		Map list = code.getMysqlCompanyData(request);
		return list;
	}
	
	
	@RequestMapping(value="/selCode")
    @ResponseBody
	public List selCode(HttpServletRequest request){
		return code.selCode(request);
	}
	
	@RequestMapping(value="/selPCode")
    @ResponseBody
	public List selPCode(HttpServletRequest request){
		return code.selPCode(request);
	}
	
	@RequestMapping(value="/selCodeOne")
    @ResponseBody
	public List selCodeOne(HttpServletRequest request){
		return code.selCodeOne(request);
	}
	
	
	@RequestMapping(value="/saveCode")
    @ResponseBody
	public boolean saveCode(HttpServletRequest request){
		code.saveCode(request);
		return true;
	}
	
	@RequestMapping(value="/savePCode")
    @ResponseBody
	public boolean savePCode(HttpServletRequest request){
		 code.savePCode(request);
		return true;
	}
	
	@RequestMapping(value="/updateCode")
    @ResponseBody
	public boolean updateCode(HttpServletRequest request){
		code.updateCode(request);
		return true;
	}
	
	@RequestMapping(value="/updatePCode")
    @ResponseBody
	public boolean updatePCode(HttpServletRequest request){
		code.updatePCode(request);
		return true;
	}
	
	@RequestMapping(value="/delCode")
    @ResponseBody
	public boolean delCode(HttpServletRequest request){
		code.delCode(request);
		return true;
	}
	
	@RequestMapping(value="/delPCode")
    @ResponseBody
	public boolean delPCode(HttpServletRequest request){
		code.delPCode(request);
		return true;
	}
}
