package com.zxc.mapper;

import java.util.List;

import com.zxc.domain.User;
/**
 * 用户类mapper的接口
 * @author admin
 *
 */
public interface UserMapper {
	public List<User> userList(User user);
	
	public User selectUser(User u);
	
	public int insertUser(User u);
	
	public int updateUserById(User u);
	
	public int deleteUserById(Integer id);
}
