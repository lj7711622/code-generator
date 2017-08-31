/*
 * Author : www.thewk.cn.vc
 * JDK Version : 1.6.0_45
 * Create Date : 2016/7/20
 */
package ${autoDaoPrefix};

import java.util.List;

import ${packagePrefix}.domain.entity.${entityName}Entity;
import ${packagePrefix}.domain.search.${entityName}Search;

import common.base.BaseMybatisDao;

import org.apache.ibatis.annotations.Param;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
public interface Auto${entityName}Dao extends BaseMybatisDao {

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
}