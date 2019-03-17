package com.yrkj.login.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.comm.dbsource.DataSource;
import com.comm.dbsource.HandleDataSource;
import com.comm.md5.Md5;
import com.yrkj.login.bean.User;
import com.yrkj.login.dao.ILoginDao;

@Service
//@Configuration
@EnableAspectJAutoProxy //启用 AspectJ 自动代理
//@ComponentScan
public class LoginImpl implements ILogin {

	@Resource ILoginDao iLoginDao;

	public List test() {
		try {
//			System.out.println(HandleDataSource.getDataSource());
//			HandleDataSource.putDataSource("mysql");
			System.out.println("mysql");
			return iLoginDao.selUser();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@DataSource(value = "oracle")
	public List test1() {
		try {
			System.out.println("oracle:"+HandleDataSource.getDataSource());
//			HandleDataSource.putDataSource("oracle");
			return iLoginDao.selUser();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List login(String user, String pass) {
//		try {
//			pass=Md5.EncoderByMd5(pass);
//		} catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		return iLoginDao.login(user, pass);
	}

	public boolean save(HttpServletRequest request) throws Exception {
		User user = new User();
		user.setName(request.getParameter("name"));
		user.setPassWord(request.getParameter("passWord"));
		user.setIsValid("1");
		user.setGender(request.getParameter("gender"));
		user.setPhone(request.getParameter("phone"));
		user.setEmail(request.getParameter("email"));
		user.setDepartment(request.getParameter("department"));
		iLoginDao.insert(user);
		return false;
	}

	public boolean update(HttpServletRequest request) {
		User user = new User();
		user.setId(request.getParameter("id"));
		user.setName(request.getParameter("name"));
		user.setPassWord(request.getParameter("passWord"));
		user.setIsValid("1");
		user.setGender(request.getParameter("gender"));
		user.setPhone(request.getParameter("phone"));
		user.setEmail(request.getParameter("email"));
		user.setDepartment(request.getParameter("department"));
		iLoginDao.update(user);
		return false;
	}

	public boolean delete(HttpServletRequest request) {
		String[] ids = request.getParameter("userId").replace("'", "").split(",");
		iLoginDao.delete(ids);
		return false;
	}

	public List selUserInfor(HttpServletRequest request) {
		return iLoginDao.selUserInfor(null);
	}

	public boolean updateRecord(HttpServletRequest request) {
		User user = new User();
		user.setId(request.getSession().getAttribute("userId").toString());
		user.setVoucher(request.getParameter("voucher"));
		user.setAccount(request.getParameter("account"));
		iLoginDao.updateRecord(user);
		return true;
	}

	public List selUserRecord(HttpServletRequest request) {
		return iLoginDao.selUserInfor(request.getSession().getAttribute("userId").toString());
	}

}
