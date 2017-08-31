
package ${daoPrefix};

import ${entityPrefix}.${entityName}Entity;
import ${packagePrefix}.search.${entityName}Search;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
public interface ${entityName}Dao {

	// 扩展方法写到这里

	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 保存 返回受影响行数
	 */
	Long save(@Param("${entityName}Entity") ${entityName}Entity entity);

	/**
	 * 保存非空列 返回受影响行数
	 */
	Long saveSelective(@Param("${entityName}Entity") ${entityName}Entity entity);

	/**
	 * 删除 返回受影响行数
	 */
	Long delete(@Param("id") Long id);

	/**
	 * 修改 返回受影响行数
	 */
	Long update(@Param("${entityName}Entity") ${entityName}Entity entity);

	/**
	 * 修改非空列 返回受影响行数
	 */
	Long updateSelective(@Param("${entityName}Entity") ${entityName}Entity entity);
	
	/**
	 * 查询实体
	 */
	${entityName}Entity getEntity_Pk_Auto(@Param("id") Long id,@Param("switchFlag") int switchFlag);

	/**
	 * 查询数量
	 */
	Long queryCount_Search_Auto(@Param("${entityName}Search") ${entityName}Search search);

	/**
	 * 查询实体列表
	 */
	List<${entityName}Entity> queryList_Search_Auto(@Param("${entityName}Search") ${entityName}Search search);

	Long queryCount_Search_Admin_List(@Param("${entityName}Search") ${entityName}Search search);

	List<${entityName}Entity> queryList_Search_Admin_List(@Param("${entityName}Search") ${entityName}Search search);

	Long queryCount_Search_Json_List(@Param("${entityName}Search") ${entityName}Search search);

	List<${entityName}Entity> queryList_Search_Json_List(@Param("${entityName}Search") ${entityName}Search search);

	${entityName}Entity getEntity_Admin_View(@Param("id") Long id,@Param("switchFlag") int switchFlag);

	${entityName}Entity getEntity_Json_View(@Param("id") Long id,@Param("switchFlag") int switchFlag);

	${entityName}Entity getEntity_Admin_Edit(@Param("id") Long id,@Param("switchFlag") int switchFlag);
}