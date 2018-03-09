package com.zxc.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
/**
 * 任务表
 * @author admin
 *
 */
public class Task {
	
	public Task() {
		super();
	}
	
	public Task(Integer tid, String ttitle, Date tdate, String taddress, User tmanager, String tcar, Integer ttypeId,
			String tdevice, String tpeople, String tremark) {
		super();
		this.tid = tid;
		this.ttitle = ttitle;
		this.tdate = tdate;
		this.taddress = taddress;
		this.tmanager = tmanager;
		this.tcar = tcar;
		this.ttypeId = ttypeId;
		this.tdevice = tdevice;
		this.tpeople = tpeople;
		this.tremark = tremark;
	}

	private Integer tid;
	private String ttitle;	//任务标题
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")//将前端字符串类型转为date
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")//输出时yyyy-MM-dd格式
	private Date tdate;	//任务时间
	private String taddress;	//任务地址
	private User tmanager;	//任务组长
	private String tcar;	//任务车辆
	private Integer ttypeId;	//任务类型
	private String tdevice;	//任务设备（json类型）
	private String tpeople;	//任务人员
	private String tremark;	//任务备注
	
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}
	public Date getTdate() {
		return tdate;
	}
	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}
	public String getTaddress() {
		return taddress;
	}
	public void setTaddress(String taddress) {
		this.taddress = taddress;
	}
	public User getTmanager() {
		return tmanager;
	}
	public void setTmanager(User tmanager) {
		this.tmanager = tmanager;
	}
	public String getTcar() {
		return tcar;
	}
	public void setTcar(String tcar) {
		this.tcar = tcar;
	}
	public Integer getTtypeId() {
		return ttypeId;
	}
	public void setTtypeId(Integer ttypeId) {
		this.ttypeId = ttypeId;
	}
	public String getTdevice() {
		return tdevice;
	}
	public void setTdevice(String tdevice) {
		this.tdevice = tdevice;
	}
	public String getTpeople() {
		return tpeople;
	}
	public void setTpeople(String tpeople) {
		this.tpeople = tpeople;
	}
	public String getTremark() {
		return tremark;
	}
	public void setTremark(String tremark) {
		this.tremark = tremark;
	}
	
}
