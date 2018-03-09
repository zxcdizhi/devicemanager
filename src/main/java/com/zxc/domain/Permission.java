package com.zxc.domain;

/**
 * shiro 权限表
 * 
 * @author admin
 *
 */
public class Permission {

	public Permission() {
		super();
	}

	public Permission(Integer pid, String purl, Integer roleId, String pdescription) {
		super();
		this.pid = pid;
		this.purl = purl;
		this.roleId = roleId;
		this.pdescription = pdescription;
	}

	private Integer pid;
	private String purl; // 权限地址
	private Integer roleId; // 角色Id
	private String pdescription; // 权限描述

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPurl() {
		return purl;
	}

	public void setPurl(String purl) {
		this.purl = purl;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getPdescription() {
		return pdescription;
	}

	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}

}
