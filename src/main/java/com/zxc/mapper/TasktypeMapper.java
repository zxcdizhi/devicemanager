package com.zxc.mapper;

import java.util.List;

import com.zxc.domain.Tasktype;
/**
 * 任务种类类mapper的接口
 * @author admin
 *
 */
public interface TasktypeMapper {
	public List<Tasktype> tasktypeList();

	public Tasktype selectTasktype(Tasktype t);

}
