/*
 * Author : www.thewk.cn.vc
 * JDK Version : 1.6.0_45
 * Create Date : 2016/7/20
 */
package ${daoPrefix};

import cn.com.sdic.miacsp.base.domain.entity.${entityName}Entity;
import cn.com.sdic.miacsp.base.domain.search.${entityName}Search;
import cn.com.sdic.miacsp.base.autodao.Auto${entityName}Dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
public interface ${entityName}Dao extends Auto${entityName}Dao {

	// 扩展方法写到这里

	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	Long queryCount_Search_Admin_List(@Param("${entityName}Search") ${entityName}Search search);

	List<${entityName}Entity> queryList_Search_Admin_List(@Param("${entityName}Search") ${entityName}Search search);

	Long queryCount_Search_Json_List(@Param("${entityName}Search") ${entityName}Search search);

	List<${entityName}Entity> queryList_Search_Json_List(@Param("${entityName}Search") ${entityName}Search search);

	${entityName}Entity getEntity_Admin_View(@Param("id") Long id,@Param("switchFlag") int switchFlag);

	${entityName}Entity getEntity_Json_View(@Param("id") Long id,@Param("switchFlag") int switchFlag);

	${entityName}Entity getEntity_Admin_Edit(@Param("id") Long id,@Param("switchFlag") int switchFlag);
}