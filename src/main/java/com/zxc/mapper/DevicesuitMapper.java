package com.zxc.mapper;

import java.util.List;

import com.zxc.domain.Devicesuit;
/**
 * 设备套装类mapper的接口
 * @author admin
 *
 */
public interface DevicesuitMapper {
	public List<Devicesuit> devicesuitList();
	
	public Devicesuit selectDevicesuit(Devicesuit ds);
	
	public int insertDevicesuit(Devicesuit ds);
	
	public int deleteDevicesuitById(Integer id);
	
	public int updateDevicesuitById(Devicesuit ds);
	
}
