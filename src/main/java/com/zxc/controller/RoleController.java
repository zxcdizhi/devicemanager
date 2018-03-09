package com.zxc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zxc.domain.Role;
import com.zxc.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	//返回全部list
	@RequestMapping("/roleList")
	public @ResponseBody List<Role> roleList(){
		List<Role> roleList  = roleService.roleList();
		System.out.println(roleList.size());
		return roleList;// 返回jqGrid
	}
}
