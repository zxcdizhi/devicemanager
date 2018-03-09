package com.zxc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zxc.domain.Tasktype;
import com.zxc.mapper.TasktypeMapper;

@Service
public class TasktypeService {
	
	@Autowired
	private TasktypeMapper tasktypeMapper;
	
	public List<Tasktype> tasktypeList(){
		return tasktypeMapper.tasktypeList();
	}
	
	public Tasktype getTasktype(Tasktype tt) {
		return tasktypeMapper.selectTasktype(tt);
	}
	
	
}
