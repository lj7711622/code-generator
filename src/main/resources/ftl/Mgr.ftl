/*
 * Author : www.thewk.cn.vc
 * JDK Version : 1.6.0_45
 * Create Date : 2015/4/21
 */
package ${packagePrefix}.mgr;

import java.util.List;

import cn.com.sdic.miacsp.base.automgr.AutoI${entityName}Mgr;
import cn.com.sdic.miacsp.base.domain.entity.${entityName}Entity;
import cn.com.sdic.miacsp.base.domain.search.${entityName}Search;
import common.exception.ProjectException;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
public interface I${entityName}Mgr extends AutoI${entityName}Mgr {

	// 扩展方法写到这里
	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    Long add(${entityName}Entity entity)  throws ProjectException;

	Long delete(Long id) throws ProjectException;

	Long edit(${entityName}Entity entity)  throws ProjectException;

	public Long queryCount_Search_Admin_List(${entityName}Search search)  throws ProjectException;

	public List<${entityName}Entity> queryList_Search_Admin_List(${entityName}Search search)  throws ProjectException;

	public Long queryCount_Search_Json_List(${entityName}Search search)  throws ProjectException;

	public List<${entityName}Entity> queryList_Search_Json_List(${entityName}Search search)  throws ProjectException;

	public ${entityName}Entity getEntity_Admin_View(Long id)  throws ProjectException;
	
	public ${entityName}Entity getEntity_Admin_View(Long id,int switchFlag)  throws ProjectException;

	public ${entityName}Entity getEntity_Json_View(Long id)  throws ProjectException;
	
	public ${entityName}Entity getEntity_Json_View(Long id,int switchFlag)  throws ProjectException;
	
	public ${entityName}Entity getEntity_Admin_Edit(Long id)  throws ProjectException;

	public ${entityName}Entity getEntity_Admin_Edit(Long id,int switchFlag)  throws ProjectException;
    
    public Long editEnable(${entityName}Entity entity,int enableStatus) throws ProjectException;

	public Long editLock(${entityName}Entity entity,int lockStatus) throws ProjectException;
}