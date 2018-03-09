package com.zxc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zxc.domain.User;
import com.zxc.service.ShiroService;

@Controller
@RequestMapping("/user")
public class LoginController {

	@Autowired
	private ShiroService shiroService;

	/**
	 * 验证登录
	 * 
	 * @param username
	 * @param password
	 * @param session
	 * @return url
	 */
	@RequestMapping(value = "/login")
	@ResponseBody
	public Map<String, Object> login(String username, String upassword, Boolean rememberMe, HttpSession session,
			HttpServletResponse res) {
		Map<String, Object> map = new HashMap<>();

		/*
		 * 判断页面的checkbox是否勾选，如未勾选则返回false
		 */
		if (rememberMe == null) {
			rememberMe = false;
		}

		/*
		 * 前台有验证，所以此if是为了判断直接从地址栏跳转login
		 */
		if (username == null) {
			map.put("message", "账号不为空");
			try {
				res.sendRedirect("toLogin");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return map;
		}
		// 主体
				Subject subject = SecurityUtils.getSubject();
		// 登录后存放进shiro token
		UsernamePasswordToken token = new UsernamePasswordToken(username, upassword);
		token.setRememberMe(rememberMe);

		User user;
		// 登录方法（认证是否通过）
		// 使用subject调用securityManager,安全管理器调用Realm
		try {
			// 利用异常操作
			// 需要开始调用到Realm中
			System.out.println("========================================");
			System.out.println("1、进入认证方法");
			subject.login(token);
			user = (User) subject.getPrincipal();
			session.setAttribute("user", user);
			map.put("message", "登录完成");
			System.out.println("登录完成");
		} catch (UnknownAccountException e) {
			map.put("message", "账号密码不正确");
			return map;
		} catch (IncorrectCredentialsException ice) {
			// 用户名/密码错误
			map.put("message", "用户名或密码错误！");
			return map;
		} catch (ExcessiveAttemptsException eae) {
			// 登陆次数异常，账户锁定
			map.put("message", "登陆次数超过5次，账户被锁定！");
			return map;
		} catch (AuthenticationException ae) {
			// 其他异常
			map.put("message", "登陆失败！");
			return map;
		}
		return map;
	}

	@RequestMapping("/toLogin")
	public String toLogin(HttpSession session) {
		// 主体
		Subject subject = SecurityUtils.getSubject();

		/*
		 * 此if是为了判断是否是记住我的状态，如果是就自动登录
		 */
		if (subject.isRemembered() && !subject.isAuthenticated()) {
			Object principal = subject.getPrincipal();
		
			if (null != principal) {
				User user = (User)principal;
				String password = user.getUpassword();
				UsernamePasswordToken token = new UsernamePasswordToken(user.getUid().toString(), password);
				token.setRememberMe(true);
				session.setAttribute("user", user);
				subject.login(token);
				return "redirect:/user/toIndex";
			}
		}
		return "login";
	}

	@RequestMapping("/toIndex")
	public String toIndex() {
		return "index";
	}

	@RequestMapping("/logout")
	public String logout() {
		return "login";
	}
}
