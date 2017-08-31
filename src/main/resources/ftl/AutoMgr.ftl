/*
 * Author : www.thewk.cn.vc
 * JDK Version : 1.6.0_45
 * Create Date : 2015/4/21
 */
package ${packagePrefix}.automgr;

import java.util.List;

import cn.com.sdic.miacsp.base.domain.entity.${entityName}Entity;
import cn.com.sdic.miacsp.base.domain.search.${entityName}Search;
import common.exception.ProjectException;

/**
 * Table Name : cooe_user<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
public interface AutoI${entityName}Mgr {
	
	${entityName}Entity getEntity_Pk_Auto(Long id) throws ProjectException;
	
	${entityName}Entity getEntity_Pk_Auto(Long id,int switchFlag) throws ProjectException;

	Long queryCount_Search_Auto(${entityName}Search search)  throws ProjectException;

	${entityName}Entity queryEntity_Search_Auto(${entityName}Search search)  throws ProjectException;

	List<${entityName}Entity> queryList_Search_Auto(${entityName}Search search)  throws ProjectException;
	
}