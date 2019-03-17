package com.yrkj.login;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yrkj.login.bean.User;
import com.yrkj.login.service.ILogin;

@Controller
@RequestMapping(value="/test")
public class LoginController {

	@Resource
	private ILogin login;
	@RequestMapping(value="/login2.do",method = RequestMethod.POST)
    @ResponseBody
	public List login2( @RequestParam String logname,@RequestParam String logpass){
		try {
			return login.test();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping(value="/login")
	public ModelAndView login3( HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		try {
			request.setCharacterEncoding("utf-8");
			User user = (User)request.getSession().getAttribute("user");  
			if(user!=null){
				mav.setViewName("forward:/jsp/index/index.jsp");
				 return mav;  
			}
			String logname  =request.getParameter("logname");
			String logpass  =request.getParameter("logpass");
			List list = login.login(logname, logpass);
			
			if(list.size()>0){
				User ui =(User) list.get(0);
				request.getSession().setAttribute("user",ui);
				request.getSession().setAttribute("userId",ui.getId());
				mav.setViewName("forward:/jsp/index/index.jsp");
			}else{
				mav.setViewName("forward:/jsp/login/login.jsp");
				mav.addObject("errorInfo", "账号或密码错误");
			}
			
		} catch (Exception e) {
			mav.setViewName("forward:/jsp/login/login.jsp");
			mav.addObject("errorInfo", "账号或密码错误");
			return mav;  
		}
		return mav;  
	}
	
	
	@RequestMapping(value="/saveUserInfo")
    @ResponseBody
	public boolean saveUserInfo(HttpServletRequest request){
		try {
			return login.save(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	@RequestMapping(value="/deleteUserInfo")
    @ResponseBody
	public boolean deleteUserInfo(HttpServletRequest request){
		try {
			return login.delete(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	@RequestMapping(value="/updateUserInfo")
    @ResponseBody
	public boolean updateUserInfo(HttpServletRequest request){
		try {
			
			return login.update(request);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	@RequestMapping(value="/selUserInfo")
    @ResponseBody
	public List selUserInfo(HttpServletRequest request){
		try {
			return login.selUserInfor(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/updateRecord")
    @ResponseBody
	public boolean updateRecord(HttpServletRequest request){
		try {
			
			return login.updateRecord(request);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@RequestMapping(value="/selUserRecord")
    @ResponseBody
	public List selUserRecord(HttpServletRequest request){
		try {
			return login.selUserRecord(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
