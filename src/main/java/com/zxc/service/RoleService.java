package com.zxc.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zxc.domain.Role;
import com.zxc.mapper.RoleMapper;

@Service
public class RoleService {
	
	@Autowired
	private RoleMapper roleMapper;
	
	public List<Role> roleList(){
		List<Role> roles = roleMapper.roleList();
		return roles;
		
	};
	

	
}
