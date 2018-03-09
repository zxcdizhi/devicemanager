package com.zxc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zxc.domain.Devicesuit;
import com.zxc.mapper.DevicesuitMapper;

@Service
public class DevicesuitService {
	@Autowired
	private DevicesuitMapper devicesuitMapper;

	public PageInfo<Devicesuit> devicesuitList(int currentPage,int pageSize){
		PageHelper.startPage(currentPage, pageSize);
		devicesuitMapper.devicesuitList();
		List<Devicesuit> devicesuits=devicesuitMapper.devicesuitList();
		PageInfo<Devicesuit> pageInfo=new PageInfo<>(devicesuits);
		return pageInfo;
	}

	public Devicesuit getDevicesuit(Devicesuit ds) {
		return devicesuitMapper.selectDevicesuit(ds);
	}

	public int addDevicesuitById(Devicesuit ds) {
		return devicesuitMapper.insertDevicesuit(ds);
	}

	public int deleteDevicesuitById(Integer id) {
		return devicesuitMapper.deleteDevicesuitById(id);
	}

	public int changeDevicesuitById(Devicesuit ds) {
		return devicesuitMapper.updateDevicesuitById(ds);
	}
}
