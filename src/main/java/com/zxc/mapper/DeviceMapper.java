package com.zxc.mapper;

import java.util.List;

import com.zxc.domain.Device;
/**
 * 设备类mapper的接口
 * @author admin
 *
 */
public interface DeviceMapper {
	public List<Device> deviceList(Device devices);
	
	public Device selectDevice(Device d);
	
	public int insertDevice(Device d);
	
	public int deleteDeviceById(String id);
	
	public int updateDeviceById(Device d);
	
	
}
