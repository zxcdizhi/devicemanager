package com.zxc.domain;

/**
 * 任务类型表
 * 
 * @author admin
 *
 */
public class Tasktype {

	public Tasktype() {
		super();
	}

	public Tasktype(Integer ttid, String ttname) {
		super();
		this.ttid = ttid;
		this.ttname = ttname;
	}

	private Integer ttid;
	private String ttname;

	public Integer getTtid() {
		return ttid;
	}

	public void setTtid(Integer ttid) {
		this.ttid = ttid;
	}

	public String getTtname() {
		return ttname;
	}

	public void setTtname(String ttname) {
		this.ttname = ttname;
	}

}
