package com.zxc.controller;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zxc.domain.Device;
import com.zxc.domain.Tasktype;
import com.zxc.service.DeviceService;
import com.zxc.service.TasktypeService;

@Controller
@RequestMapping("/device")
public class DeviceController {
	
	@Autowired
	private DeviceService deviceService;
	
	//返回全部list
	@RequestMapping("/deviceList")
	public @ResponseBody PageInfo<Device> deviceList(@RequestParam(defaultValue = "1") int currentPage,@RequestParam(defaultValue = "10") int pageSize,Device device) {
		PageInfo<Device> deviceList  = deviceService.deviceList(currentPage,pageSize,device);
		System.out.println(deviceList.getList());
		return deviceList;// 返回jqGrid
	}
	
	@RequestMapping("/deviceEdit")
	public String deviceEdit(Device d,HttpServletRequest request) {
		//获取是哪种操作
		String oper = request.getParameter("oper");
		String id = request.getParameter("id");
		if(oper.equals("add")) {
			this.deviceService.addDeviceById(d);//添加
		}if(oper.equals("del")) {
			this.deviceService.deleteDeviceById(id);//删除
		}if(oper.equals("edit")) {
			this.deviceService.changeDeviceById(d);//修改
		}
		return "redirect:deviceList";//重定向到列表
	}
	
	
	@RequestMapping("toDeviceList")
	public String toDeviceList() {
		return "deviceList";
	}
	
	/**
	 * 添加前判断id是否存在
	 * @return
	 */
	@RequestMapping("checkExit")
	@ResponseBody
	public void checkExit(@RequestParam("did")String did,HttpServletResponse response,HttpServletRequest request,Model model) {
		try {
			PrintWriter out = response.getWriter();
			Device d = new Device();
			d.setDid(did);
			 Device listd = deviceService.getDevice(d);
			if(listd==null) {
				out.print("shebeiID已存在,请检查后重新填写!");
				out.print("success");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
}
