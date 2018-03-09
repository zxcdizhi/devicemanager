package com.zxc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zxc.domain.Task;
import com.zxc.mapper.TaskMapper;

@Service
public class TaskService {
	
	@Autowired
	private TaskMapper taskMapper;
	
	public PageInfo<Task> tasksList(int currentPage , int pageSize,Task t){
		PageHelper.startPage(currentPage, pageSize);
		List<Task> tasks=taskMapper.taskList(t);
		PageInfo<Task> pageInfo=new PageInfo<>(tasks);
		return pageInfo;
	}
	
	public Task getTask(Task t) {
		return taskMapper.selectTask(t);
	}
	
	public int addTaskById(Task t) {
		return taskMapper.insertTask(t);
	}
	
	public int deleteTaskById(Integer id) {
		return taskMapper.deleteTaskById(id);
	}
	
	public int changeTaskById(Task t) {
		return taskMapper.updateTaskById(t);
	}
}
