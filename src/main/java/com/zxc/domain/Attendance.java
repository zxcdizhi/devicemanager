package com.zxc.domain;

import java.util.Date;


/**
 * 考勤类
 * @author admin
 *
 */
public class Attendance {
	

	public Attendance() {
		super();
	}
	public Attendance(Integer userId, Date signin, Integer late) {
		super();
		this.userId = userId;
		this.signin = signin;
		this.late = late;
	}
	private Integer userId;
	private Date signin;//这个是签到时间
	private Integer late;//是否迟到
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Date getSignin() {
		return signin;
	}
	public void setSignin(Date signin) {
		this.signin = signin;
	}
	public Integer getLate() {
		return late;
	}
	public void setLate(Integer late) {
		this.late = late;
	}
	
}
