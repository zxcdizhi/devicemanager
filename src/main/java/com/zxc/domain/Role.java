package com.zxc.domain;

/**
 * shiro 角色表
 * 
 * @author admin
 *
 */
public class Role {

	public Role() {
		super();
	}

	public Role(Integer rid, String role, String rdescription) {
		super();
		this.rid = rid;
		this.role = role;
		this.rdescription = rdescription;
	}

	private Integer rid;
	private String role; // 角色名称
	private String rdescription; // 角色描述

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getRdescription() {
		return rdescription;
	}

	public void setRdescription(String rdescription) {
		this.rdescription = rdescription;
	}

}
