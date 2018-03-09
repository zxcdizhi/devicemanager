package com.zxc.domain;

import java.util.Date;

/**
 * 设备记录类
 * 
 * @author admin
 *
 */
public class Devicerecord {
	public Devicerecord() {
		super();
	}

	public Devicerecord(Integer drid, String deviceId, Date drtime, String userId, String drcause) {
		super();
		this.drid = drid;
		this.deviceId = deviceId;
		this.drtime = drtime;
		this.userId = userId;
		this.drcause = drcause;
	}

	private Integer drid;
	private String deviceId; // 设备Id
	private Date drtime; // 报损时间
	private String userId; // 报损人
	private String drcause; // 报损原因

	public Integer getDrid() {
		return drid;
	}

	public void setDrid(Integer drid) {
		this.drid = drid;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public Date getDrtime() {
		return drtime;
	}

	public void setDrtime(Date drtime) {
		this.drtime = drtime;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDrcause() {
		return drcause;
	}

	public void setDrcause(String drcause) {
		this.drcause = drcause;
	}
}
