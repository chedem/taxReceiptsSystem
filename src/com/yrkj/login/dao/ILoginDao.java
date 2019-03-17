package com.yrkj.login.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yrkj.login.bean.User;

public interface ILoginDao {

	List selUser();
	int insert(User user);
	int update(User user);
	int updateRecord(@Param("user")User user);
	int delete(@Param("ids")String[] ids);
	public List login(@Param("user")String user,@Param("pass")String pass);
	public List selUserInfor(@Param("id")String id);

}
