package com.zxc.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zxc.domain.User;
import com.zxc.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	//返回全部list
	@RequestMapping("/userList")
	public @ResponseBody PageInfo<User> userList(@RequestParam(defaultValue = "1") int currentPage,@RequestParam(defaultValue = "10") int pageSize,User user) {
		PageInfo<User> userList  = userService.list(currentPage, pageSize,user);
		System.out.println(userList.getList());
		return userList;// 返回jqGrid
	}
	
	
	@RequestMapping("/userEdit")
	public String userEdit(User user,HttpServletRequest request) {
		//获取是哪种操作
		String oper = request.getParameter("oper");
		String id = request.getParameter("id");
		Integer iid = Integer.parseInt(id);
		if(oper.equals("add")) {
			this.userService.addUser(user);//添加
		}if(oper.equals("del")) {
			this.userService.deleteUserById(iid);//删除
		}if(oper.equals("edit")) {
			this.userService.updateUserById(user);//修改
		}
		return "redirect:userList";
	}
	
	
	@RequestMapping("toUserList")
	public String touserList() {
		return "userList";
	}
}
