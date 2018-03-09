package com.zxc.domain;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 用户表
 * 
 * @author admin
 *
 */
//转为json格式数据
@JsonIgnoreProperties({ "handler","hibernateLazyInitializer" }) 
public class User  implements Serializable{

	public User() {
		super();
	}

	public User(Integer uid, String uname, String upassword, Integer roleId) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upassword = upassword;
		this.roleId = roleId;
	}

	private Integer uid;
	private String uname;
	private String upassword;
	private Integer roleId;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpassword() {
		return upassword;
	}

	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}
