package com.zxc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zxc.domain.Attendance;
import com.zxc.mapper.AttendanceMapper;
@Service
public class AttendanceService {
	/*
	 * Autowired注解自动引入
	 */
	@Autowired
	private AttendanceMapper attendanceMapper;
	/*
	 * 使用PageHelper插件实现分页功能
	 * currentPage是页数
	 * pageSize是每页个数
	 */
	public PageInfo<Attendance> AttendanceList(int currentPage,int pageSize){
		PageHelper.startPage(currentPage, pageSize);
		List<Attendance> attendances=attendanceMapper.attendanceList();
		PageInfo<Attendance> pageInfo=new PageInfo<>(attendances);
		
		return pageInfo;
		
	}

	public Attendance getAttendance(Attendance a) {
		return attendanceMapper.selectAttendance(a);
	}

	public int deleteAttendanceById(Integer id) {
		return attendanceMapper.deleteAttendanceById(id);
	}

	public int changeAttendanceById(Attendance a) {
		return attendanceMapper.updateAttendanceById(a);
	}
}
