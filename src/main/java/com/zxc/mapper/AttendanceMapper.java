package com.zxc.mapper;

import java.util.List;

import com.zxc.domain.Attendance;
/**
 * 考勤类mapper的接口
 * @author admin
 *
 */
public interface AttendanceMapper {
	
	public List<Attendance> attendanceList();
	
	public Attendance selectAttendance(Attendance a);
	
	public int insertAttendance(Attendance a);
	
	public int deleteAttendanceById(Integer id);
	
	public int updateAttendanceById(Attendance a);
}
