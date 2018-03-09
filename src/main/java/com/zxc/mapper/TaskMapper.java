package com.zxc.mapper;

import java.util.List;

import com.zxc.domain.Task;
/**
 * 任务类mapper的接口
 * @author admin
 *
 */
public interface TaskMapper {
	public List<Task> taskList(Task t);
	
	public Task selectTask(Task t);

	public int insertTask(Task t);

	public int deleteTaskById(Integer t);

	public int updateTaskById(Task t);
}
