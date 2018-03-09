package com.zxc.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 设备类
 * 
 * @author admin
 *
 */
public class Device {

	public Device() {
		super();
	}

	public Device(String did, String dname, Date dtime, Integer dtype, Integer dstate) {
		super();
		this.did = did;
		this.dname = dname;
		this.dtime = dtime;
		this.dtype = dtype;
		this.dstate = dstate;
	}

	private String did;
	private String dname;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")//将前端字符串类型转为date
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")//输出时yyyy-MM-dd格式
	private Date dtime;
	private Integer dtype;
	private Integer dstate;

	public String getDid() {
		return did;
	}

	public Date getDtime() {
		return dtime;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}


	public void setDtime(Date dtime) {
		this.dtime = dtime;
	}

	public Integer getDtype() {
		return dtype;
	}

	public void setDtype(Integer dtype) {
		this.dtype = dtype;
	}

	public Integer getDstate() {
		return dstate;
	}

	public void setDstate(Integer dstate) {
		this.dstate = dstate;
	}
}
