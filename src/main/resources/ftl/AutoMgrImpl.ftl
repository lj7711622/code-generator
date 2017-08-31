/*
 * Author : www.thewk.cn.vc
 * JDK Version : 1.6.0_45
 * Create Date : 2015/4/21
 */
package ${packagePrefix}.automgr.impl;

import java.util.List;

import common.base.BaseMgr;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.sdic.miacsp.base.dao.${entityName}Dao;
import cn.com.sdic.miacsp.base.domain.entity.${entityName}Entity;
import cn.com.sdic.miacsp.base.domain.search.${entityName}Search;
import cn.com.sdic.miacsp.base.automgr.AutoI${entityName}Mgr;

import common.exception.ProjectException;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
public abstract class Auto${entityName}MgrImpl extends BaseMgr implements AutoI${entityName}Mgr {

	@Autowired
	protected ${entityName}Dao dao;
	
	public ${entityName}Entity getEntity_Pk_Auto(Long id) throws ProjectException {
		return this.getEntity_Pk_Auto(id, 0);
	}
	
	public ${entityName}Entity getEntity_Pk_Auto(Long id,int switchFlag) throws ProjectException {
		try {
			return this.dao.getEntity_Pk_Auto(id, switchFlag);
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Get_Error);
		}
	}
	
	public Long queryCount_Search_Auto(${entityName}Search search)  throws ProjectException {
		try {
			Long result = this.dao.queryCount_Search_Auto(search);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_QueryCount_Error);
		}
	}

	public ${entityName}Entity queryEntity_Search_Auto(${entityName}Search search)  throws ProjectException {
		try {
			List<${entityName}Entity> results = this.dao.queryList_Search_Auto(search);
			return (results == null || results.isEmpty()) ? null : results.get(0);
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Query_Error);
		}
	}

	public List<${entityName}Entity> queryList_Search_Auto(${entityName}Search search)  throws ProjectException {
		try {
			List<${entityName}Entity> result = this.dao.queryList_Search_Auto(search);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Query_Error);
		}
	}
}