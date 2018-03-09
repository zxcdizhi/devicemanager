package com.zxc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zxc.domain.Device;
import com.zxc.mapper.DeviceMapper;
 

@Service
public class DeviceService {
	
	@Autowired
	private DeviceMapper deviceMapper;
	
	public PageInfo<Device> deviceList(int currentPage,int pageSize,Device d){
		PageHelper.startPage(currentPage, pageSize);
		List<Device> devices=deviceMapper.deviceList(d);
		PageInfo<Device> pageInfo = new PageInfo<>(devices);
		return pageInfo;
	}
	
	public Device getDevice(Device d) {
		return deviceMapper.selectDevice(d);
	}
	
	public int addDeviceById(Device d) {
		return deviceMapper.insertDevice(d);
	}
	
	public int deleteDeviceById(String id) {
		return deviceMapper.deleteDeviceById(id);
	}
	
	public int changeDeviceById(Device d) {
		return deviceMapper.updateDeviceById(d);
	}
}
