package com.zxc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zxc.domain.Device;
import com.zxc.domain.Tasktype;
import com.zxc.service.DeviceService;
import com.zxc.service.TasktypeService;


@Controller
@RequestMapping("/taskType")
public class TaskTypeController {
	
	@Autowired
	private TasktypeService taskTypeService;
	
	//返回全部list
	@RequestMapping("/taskTypeList")
	public @ResponseBody List<Tasktype> taskTypeList() {
		List<Tasktype> taskTypeList  = taskTypeService.tasktypeList();
		System.out.println(taskTypeList.size());
		return taskTypeList;// 返回jqGrid
	}
	
	@RequestMapping("toTaskTypeList")
	public String toTasktypeList() {
		return "taskTypeList";
	}
}