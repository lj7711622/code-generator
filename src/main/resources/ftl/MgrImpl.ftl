/*
 * Author : www.thewk.cn.vc
 * JDK Version : 1.6.0_45
 * Create Date : 2015/4/21
 */
package ${packagePrefix}.mgr.impl;

import cn.com.sdic.miacsp.base.mgr.I${entityName}Mgr;
import cn.com.sdic.miacsp.base.automgr.impl.Auto${entityName}MgrImpl;
import cn.com.sdic.miacsp.base.domain.entity.${entityName}Entity;
import cn.com.sdic.miacsp.base.domain.search.${entityName}Search;
import org.springframework.stereotype.Service;
import java.util.List;
import common.exception.ProjectException;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
@Service("Thewk_${entityName}Mgr")
public class ${entityName}MgrImpl extends Auto${entityName}MgrImpl implements I${entityName}Mgr {

	// 扩展方法写到这里

	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public Long add(${entityName}Entity entity)  throws ProjectException {
		try {
			Long result = this.dao.saveSelective(entity);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Save_Error);
		}
	}

	public Long delete(Long id)  throws ProjectException {
		try {
			Long result = this.dao.delete(id);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Delete_Error);
		}
	}

	public Long edit(${entityName}Entity entity)  throws ProjectException {
		try {
			Long result = this.dao.updateSelective(entity);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Update_Error);
		}
	}
    
	public Long queryCount_Search_Admin_List(${entityName}Search search)  throws ProjectException {
		try {
			Long result = this.dao.queryCount_Search_Admin_List(search);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_QueryCount_Error);
		}
	}
	
	public List<${entityName}Entity> queryList_Search_Admin_List(${entityName}Search search) {
		try {
			List<${entityName}Entity> result = this.dao.queryList_Search_Admin_List(search);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Query_Error);
		}
	}
	
	public Long queryCount_Search_Json_List(${entityName}Search search)  throws ProjectException {
		try {
			Long result = this.dao.queryCount_Search_Json_List(search);
		
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_QueryCount_Error);
		}
	}

	public List<${entityName}Entity> queryList_Search_Json_List(${entityName}Search search) {
		try {
			List<${entityName}Entity> result = this.dao.queryList_Search_Json_List(search);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Query_Error);
		}
	}
	
	public ${entityName}Entity getEntity_Admin_View(Long id) {
		return this.getEntity_Admin_View(id,0);
	}

	public ${entityName}Entity getEntity_Admin_View(Long id,int switchFlag) {
		try {
			${entityName}Entity result = this.dao.getEntity_Admin_View(id,switchFlag);
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Query_Error);
		}
	}
	
	public ${entityName}Entity getEntity_Json_View(Long id) {
		return this.getEntity_Json_View(id,0);
	}

	public ${entityName}Entity getEntity_Json_View(Long id,int switchFlag) {
		try {
			${entityName}Entity result = this.dao.getEntity_Json_View(id,switchFlag);
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Query_Error);
		}
	}
	
	public ${entityName}Entity getEntity_Admin_Edit(Long id){
		return getEntity_Admin_Edit(id,0);
	}

	public ${entityName}Entity getEntity_Admin_Edit(Long id,int switchFlag) {
		try {
			${entityName}Entity result = this.dao.getEntity_Admin_Edit(id,switchFlag);
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Query_Error);
		}
	}
    
    public Long editEnable(${entityName}Entity entity,int enableStatus) throws ProjectException {
        try {
            entity.setEnableStatus(enableStatus);
			Long result = this.dao.updateSelective(entity);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Update_Error);
		}
    }

	public Long editLock(${entityName}Entity entity,int lockStatus) throws ProjectException {
        try {
            entity.setLockStatus(lockStatus);
			Long result = this.dao.updateSelective(entity);
			
			return result;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new ProjectException(ex.getMessage(), ex, ProjectException.Flag_Update_Error);
		}
    }
}