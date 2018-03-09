package com.zxc.service;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zxc.domain.User;
import com.zxc.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public PageInfo<User> list(int currentPage,int pageSize,User user){
		PageHelper.startPage(currentPage, pageSize);
		List<User> users = userMapper.userList(user);
		PageInfo<User> pageInfo=new PageInfo<>(users);
		return pageInfo;
		
	};
	
	public User getuserUser(User u) {
		return userMapper.selectUser(u);
	};
	
	public int addUser(User u) {
		return userMapper.insertUser(u);
	};
	
	public int updateUserById(User u) {
		return userMapper.updateUserById(u);
	};
	
	public int deleteUserById(Integer id) {
		return userMapper.deleteUserById(id);
	};
	
}
