package com.zxc.mapper;

import java.util.List;

import com.zxc.domain.Devicerecord;

/**
 * 设备记录类mapper的接口
 * 
 * @author admin
 *
 */
public interface DevicerecordMapper {
	public List<Devicerecord> devicerecordList();

	public Devicerecord selectDevicerecord(Devicerecord dr);

	public int insertDevicerecord(Devicerecord dr);

	public int deleteDevicerecordById(Integer id);

	public int updateDevicerecordById(Devicerecord dr);

}
