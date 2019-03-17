package com.yrkj.code.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Service;

import com.comm.dbsource.DataSource;
import com.yrkj.code.bean.Code;
import com.yrkj.code.bean.Company;
import com.yrkj.code.dao.ICodeDao;

@Service
@EnableAspectJAutoProxy //启用 AspectJ 自动代理
public class CodeImpl implements ICode {

	@Resource
	private ICodeDao codeDao;
	
//	public List getCompanyData(HttpServletRequest request) {
//		String type  =request.getParameter("type");
//		String pCode  =request.getParameter("pCode");
//		type = "'duifangkemu'";
//		pCode="1";
//		List<Code> list = codeDao.getCompanyData(pCode,type);
//		List<Code> zlist = null;
//		for (Code code : list) {
//			zlist = codeDao.getCompanyData(code.getCode(),type);
//			if(zlist!=null&&zlist.size()>0){
//				getzDate(zlist, type);
//				code.setCodeList(zlist);
//			}
//		}
//		return list;
//	}
//	
//	private List<Code> getzDate(List<Code> list,String type){
//		List<Code> zlist = null;
//		for (Code code : list) {
//			zlist = codeDao.getCompanyData(code.getCode(),type);
//			if(zlist!=null&&zlist.size()>0){
//				getzDate(zlist, type);
//				code.setCodeList(zlist);
//			}
//		}
//		return zlist;
//	}


	public Map getMysqlCompanyData(HttpServletRequest request) {
		String[] type  =request.getParameter("type").split(",");
//		String pCode  =request.getParameter("pCode");
		Map map = new HashMap<String, List>();
		for (String s : type) {
			List<Company> list = codeDao.getCompanyData("1",s);
			List<Company> zlist = null;
			for (Company code : list) {
				zlist = codeDao.getCompanyData(code.getIcon(),code.getType());
				if(zlist!=null&&zlist.size()>0){
					getzDate(zlist,code.getType());
					code.setChildren(zlist);
				}
			}
			map.put(s, list);
		}
		return map;
	}

	
	public List getCompanyData(HttpServletRequest request) {
		String type  =request.getParameter("type");
		String pCode  =request.getParameter("pCode");
//		type = "duifangkemu";
//		pCode="1";
		List<Company> list = codeDao.getCompanyData1();
		List<Company> zlist = null;
		for (Company code : list) {
			zlist = codeDao.getCompanyData(code.getIcon(),code.getType());
			if(zlist!=null&&zlist.size()>0){
				getzDate(zlist,code.getType());
				code.setChildren(zlist);
			}
		}
		return list;
	}
	
	private List<Company> getzDate(List<Company> list,String type){
		List<Company> zlist = null;
		for (Company code : list) {
			zlist = codeDao.getCompanyData(code.getIcon(),code.getType());
			if(zlist!=null&&zlist.size()>0){
				getzDate(zlist, type);
				code.setChildren(zlist);
			}
		}
		return zlist;
	}
	
	public List selCode(HttpServletRequest request) {
		Code c = new Code();
		return codeDao.selCode(c);
	}
	
	public List selCodeOne(HttpServletRequest request) {
		String pCode = request.getParameter("pCode");
		String type = request.getParameter("type");
		List l = codeDao.selCodeOne(pCode,type);
		return codeDao.selCodeOne(pCode,type);
	}

	public void saveCode(HttpServletRequest request) {
        Code c = new Code();
		c.setCode(request.getParameter("code"));
		c.setName(request.getParameter("name"));
		c.setType(request.getParameter("type"));
		c.setIs_valid("1");
		c.setRemark1(request.getParameter("remaek"));
		c.setpCode(request.getParameter("pCode"));
		codeDao.saveCode(c);
		
	}

	public void delCode(HttpServletRequest request) {
		String[] ids = request.getParameter("userId").replace("'", "").split(",");
		codeDao.delCode(ids);
	}

	public void updateCode(HttpServletRequest request) {
		Code c = new Code();
		c.setId(Integer.valueOf(request.getParameter("id")));
		c.setCode(request.getParameter("code"));
		c.setName(request.getParameter("name"));
		c.setType(request.getParameter("type"));
		c.setIs_valid(request.getParameter("isValid"));
		c.setRemark1(request.getParameter("remark"));
		c.setpCode(request.getParameter("pCode"));
		codeDao.updatePCode(c);
		codeDao.updateCode(c);
	}

	public List selPCode(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	public void savePCode(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	public void delPCode(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	public void updatePCode(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@DataSource(value = "oracle")
	public Map getOrcaleCompanyData(HttpServletRequest request) {
		Map<String,List> map = new HashMap<String, List>();
		String danwei = request.getParameter("danwei");
		String zhiyuan = request.getParameter("zhiyuan");
		String bumen = request.getParameter("bumen");
		String xiangmu = request.getParameter("xiangmu");
		String kemu = request.getParameter("xiangmu");

		List danweilist = codeDao.selDanWei(danwei);
		map.put("danwei", danweilist);
		List zhiyuanilist = codeDao.selZhiYuan(zhiyuan);
		map.put("zhiyuan", zhiyuanilist);
		List bumenlist = codeDao.selBuMen(bumen);
		map.put("bumen", bumenlist);
		List xiangmulist = codeDao.selXiangMu(xiangmu);
		map.put("xiangmu", xiangmulist);
		
		List kemulist = codeDao.selKeMu(kemu);
		map.put("kemu", kemulist);
		return map;
	}



}
