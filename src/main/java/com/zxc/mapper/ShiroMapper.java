package com.zxc.mapper;

import java.util.List;

import com.zxc.domain.Permission;
import com.zxc.domain.User;

public interface ShiroMapper {
	// 根据账号获取账号密码
	public User getUserByUid(Integer uid);

	// 根据账号获取角色权限
	public List<Permission> getPermissionsByUser(User u);
}
