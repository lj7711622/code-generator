<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${daoPrefix}.${entityName}Dao">
	<!--
	<cache-ref namespace="OSCache"/>
	-->
	
	<!-- 默认的ResultMap,只需要加Case -->
	<resultMap type="${entityName}Entity" id="RM_${entityName}_Auto">
		<discriminator javaType="int" column="_switch_flag">
			<case value="0" resultMap="RM_${entityName}_Default"/>
            <case value="1" resultMap="RM_${entityName}_EnableStatusAndLockStatus"/>
		</discriminator>
	</resultMap>
    
    <resultMap type="${entityName}Entity" id="RM_${entityName}_EnableStatusAndLockStatus">
		<id column="${entityName}_id" property="id"/>
		<result column="${entityName}_lockStatus" property="lockStatus"/>
		<result column="${entityName}_enableStatus" property="enableStatus"/>
	</resultMap>
	
	<!-- //////////////////////////////////////////////////////////////////////////////////-->
    
	<!-- //////////////////////////////////////////////////////////////////////////////////-->
	
	<!-- AdminList -->
	<resultMap type="${entityName}Entity" id="RM_${entityName}_Admin_List">
	<#list columns as col>
	<#if col.isId>
		<id column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	<#else>
		<result column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	</#if>
	</#list>
	</resultMap>
	
	<select id="queryCount_Search_Admin_List" resultType="Long">
		Select Count(<if test="@common.mybatis.MybatisValidater@isEqual(${entityName}Search.isDistinct,1)"> distinct </if> ${tableName}.${pkName})
		From	${tableName}	As	${tableName}
		<trim prefix="Where" prefixOverrides="And | Or">
			<include refid="${entityName}_WhereSql_Auto"/>
		</trim>
	</select>
	
	<select id="queryList_Search_Admin_List" resultMap="RM_${entityName}_Admin_List">
		Select
		<if test="@common.mybatis.MybatisValidater@isEqual(${entityName}Search.isDistinct,1)">
		distinct 
		</if>
		<include refid="${entityName}_SelectColumns_Auto"/>
		${r'#'}{${entityName}Search.switchFlag}	As	_switch_flag 
		From	${tableName}	As	${tableName}
		<trim prefix="Where" prefixOverrides="And | Or">
			<include refid="${entityName}_WhereSql_Auto"/>
		</trim>
		<include refid="${entityName}_OrderSql_Auto"/>
		Limit ${r'#'}{${entityName}Search.begin},${r'#'}{${entityName}Search.rows}
	</select>
	
	<!-- JsonList -->
	<resultMap type="${entityName}Entity" id="RM_${entityName}_Json_List">
	<#list columns as col>
	<#if col.isId>
		<id column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	<#else>
		<result column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	</#if>
	</#list>
	</resultMap>
	
	<select id="queryCount_Search_Json_List" resultType="Long">
		Select Count(<if test="@common.mybatis.MybatisValidater@isEqual(${entityName}Search.isDistinct,1)"> distinct </if> ${tableName}.${pkName})
		From	${tableName}	As	${tableName}
		<trim prefix="Where" prefixOverrides="And | Or">
			<include refid="${entityName}_WhereSql_Auto"/>
		</trim>
	</select>
	
	<select id="queryList_Search_Json_List" resultMap="RM_${entityName}_Json_List">
		Select
		<if test="@common.mybatis.MybatisValidater@isEqual(${entityName}Search.isDistinct,1)">
		distinct 
		</if>
		<include refid="${entityName}_SelectColumns_Auto"/>
		${r'#'}{${entityName}Search.switchFlag}	As	_switch_flag 
		From	${tableName}	As	${tableName}
		<trim prefix="Where" prefixOverrides="And | Or">
			<include refid="${entityName}_WhereSql_Auto"/>
		</trim>
		<include refid="${entityName}_OrderSql_Auto"/>
		Limit ${r'#'}{${entityName}Search.begin},${r'#'}{${entityName}Search.rows}
	</select>
	
	<!-- Admin View-->
	<resultMap type="${entityName}Entity" id="RM_${entityName}_Admin_View">
	<#list columns as col>
	<#if col.isId>
		<id column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	<#else>
		<result column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	</#if>
	</#list>
	</resultMap>
	
	<select id="getEntity_Admin_View" resultMap="RM_${entityName}_Admin_View">
		Select
		<include refid="${entityName}_SelectColumns_Auto" />
		${r'#'}{switchFlag} As _switch_flag
		From	${tableName}	As	${tableName}
		Where
		${tableName}.${pkName} = ${r'#'}{id}
	</select>
	
	<!-- Json View -->
	<resultMap type="${entityName}Entity" id="RM_${entityName}_Json_View">
	<#list columns as col>
	<#if col.isId>
		<id column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	<#else>
		<result column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	</#if>
	</#list>
	</resultMap>
	
	<select id="getEntity_Json_View" resultMap="RM_${entityName}_Json_View">
		Select
		<include refid="${entityName}_SelectColumns_Auto" />
		${r'#'}{switchFlag} As _switch_flag
		From	${tableName}	As	${tableName}
		Where
		${tableName}.${pkName} = ${r'#'}{id}
	</select>
	
	<!-- Admin Edit-->
	<resultMap type="${entityName}Entity" id="RM_${entityName}_Admin_Edit">
	<#list columns as col>
	<#if col.isId>
		<id column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	<#else>
		<result column="${entityName}_${col.camelName}" property="${col.camelName}"/>
	</#if>
	</#list>
	</resultMap>
	
	<select id="getEntity_Admin_Edit" resultMap="RM_${entityName}_Admin_Edit">
		Select
		<include refid="${entityName}_SelectColumns_Auto" />
		${r'#'}{switchFlag} As _switch_flag
		From	${tableName}	As	${tableName}
		Where
		${tableName}.${pkName} = ${r'#'}{id}
	</select>
	
	<sql id="${entityName}_WhereSql_Expand">
	
	</sql>
</mapper>