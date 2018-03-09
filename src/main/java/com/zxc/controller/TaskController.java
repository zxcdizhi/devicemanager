package com.zxc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zxc.domain.Device;
import com.zxc.domain.Task;
import com.zxc.service.TaskService;

@Controller
@RequestMapping("/task")
public class TaskController {
	
	@Autowired
	private TaskService TaskService;
	
	//返回全部list
	@RequestMapping("/taskList")
	public @ResponseBody PageInfo<Task> taskList(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "10") int pageSize,Task task) {
		PageInfo<Task> taskList  = TaskService.tasksList(currentPage, pageSize, task);
		System.out.println(taskList.getList());
		return taskList;// 返回jqGrid
	}
	
	//跳转到列表
	@RequestMapping("toDaskList")
	public String toDeviceList() {
		return "taskList";
	}
}
