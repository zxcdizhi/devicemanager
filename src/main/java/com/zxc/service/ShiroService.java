package com.zxc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zxc.domain.Permission;
import com.zxc.domain.User;
import com.zxc.mapper.ShiroMapper;

@Service
public class ShiroService {
	@Autowired
	private ShiroMapper shiroMapper;

	// 根据账号获取账号密码
	public User getUserByUid(Integer uid) {
		
		// 根据账号获取账号密码
		User userByUserUid = shiroMapper.getUserByUid(uid);
		return userByUserUid;
	}

	// 根据账号获取角色权限
	public List<Permission> getPermissionsByUser(User u) {
		List<Permission> perArrary = new ArrayList<>();
		Integer roleId = u.getRoleId();
		if (roleId != null && roleId != 0) {
			// 根据roleid获取peimission
			perArrary.addAll(shiroMapper.getPermissionsByUser(u));
		}
		return perArrary;
	}
}
