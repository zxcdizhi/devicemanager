package com.zxc.domain;

/**
 * 设备套装表
 * 
 * @author admin
 *
 */
public class Devicesuit {

	public Devicesuit() {
		super();
	}

	public Devicesuit(Integer dsid, String dsname, String deviceId, Integer typeId) {
		super();
		this.dsid = dsid;
		this.dsname = dsname;
		this.deviceId = deviceId;
		this.typeId = typeId;
	}

	private Integer dsid;
	private String dsname;
	private String deviceId;
	private Integer typeId;

	public Integer getDsid() {
		return dsid;
	}

	public void setDsid(Integer dsid) {
		this.dsid = dsid;
	}

	public String getDsname() {
		return dsname;
	}

	public void setDsname(String dsname) {
		this.dsname = dsname;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

}
