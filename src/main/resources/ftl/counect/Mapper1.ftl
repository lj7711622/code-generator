﻿<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
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

    <!-- 默认的ResultMap -->
    <resultMap type="${entityName}Entity" id="RM_${entityName}_Default">
	<#list columns as col>
		<#if col.isId>
            <id column="${entityName}_${col.camelName}" property="${col.camelName}"/>
		<#else>
            <result column="${entityName}_${col.camelName}" property="${col.camelName}"/>
		</#if>
	</#list>
    </resultMap>
    <!-- //////////////////////////////////////////////////////////////////////////////////-->

    <!-- //////////////////////////////////////////////////////////////////////////////////-->

    <!-- 增 -->
    <insert id="save" useGeneratedKeys="true" >
        Insert Into ${tableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
		<#list columns as col><#if !col.isAutoincrement>${col.name},</#if></#list>
        </trim>
        <trim prefix="Values (" suffix=")" suffixOverrides=",">
		<#list columns as col><#if !col.isAutoincrement>${r'#'}{${entityName}Entity.${col.camelName}},</#if></#list>
        </trim>
    </insert>

    <!-- 精确的增 -->
    <insert id="saveSelective" useGeneratedKeys="true" >
        Insert Into ${tableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
		<#list columns as col>
			<#if !col.isAutoincrement>
                <if test="${entityName}Entity.${col.camelName} != null">${col.name},</if>
			</#if>
		</#list>
        </trim>
        <trim prefix="Values (" suffix=")" suffixOverrides=",">
		<#list columns as col>
			<#if !col.isAutoincrement>
                <if test="${entityName}Entity.${col.camelName} != null">${r'#'}{${entityName}Entity.${col.camelName}},</if>
			</#if>
		</#list>
        </trim>
    </insert>

    <!-- 根据主键删除-->
    <delete id="delete">
        Delete From ${tableName}
        Where id = ${r'#'}{id}
    </delete>

    <!-- 更新 -->
    <update id="update">
        Update ${tableName}
        <trim prefix="Set" suffixOverrides=",">
		<#list columns as col>
			<#if !col.isAutoincrement || !col.isId>
			${col.name} = ${r'#'}{${entityName}Entity.${col.camelName}},
			</#if>
		</#list>
        </trim>
        Where ${tableName}.${pkName} = ${r'#'}{${entityName}Entity.${pkCameName}}
    </update>

    <!-- 精确的更新 -->
    <update id="updateSelective">
        Update ${tableName}
        <trim prefix="Set" suffixOverrides=",">
		<#list columns as col>
			<#if !col.isId || !col.isAutoincrement>
                <if test="${entityName}Entity.${col.camelName} != null">${col.name} = ${r'#'}{${entityName}Entity.${col.camelName}},</if>
			</#if>
		</#list>
        </trim>
        Where ${tableName}.${pkName} = ${r'#'}{${entityName}Entity.${pkCameName}}
    </update>

    <select id="getEntity_Pk_Auto" resultMap="RM_${entityName}_Auto">
        Select
        <include refid="${entityName}_SelectColumns_Auto" />
	${r'#'}{switchFlag} As _switch_flag
        From	${tableName}	As	${tableName}
        Where
	${tableName}.${pkName} = ${r'#'}{id}
    </select>

    <!-- 查询数量 -->
    <select id="queryCount_Search_Auto" resultType="Long">
        Select Count(<if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isDistinct,1)"> distinct </if> ${tableName}.${pkName})
        From	${tableName}	As	${tableName}
        <trim prefix="Where" prefixOverrides="And | Or">
            <include refid="${entityName}_WhereSql_Auto"/>
        </trim>
    </select>

    <!-- 默认的查询列表 -->
    <select id="queryList_Search_Auto" resultMap="RM_${entityName}_Auto">
        Select
        <if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isDistinct,1)">
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

    <sql id="${entityName}_SelectColumns_Auto">
	<#list columns as col>
	${tableName}.${col.name} As ${entityName}_${col.camelName},
	</#list>
    </sql>

    <sql id="${entityName}_WhereSql_Auto">
        <include refid="${daoPrefix}.${entityName}Dao.${entityName}_WhereSql_Expand"/>
        <if test="${entityName}Search != null">
		<#list columns as col>
			<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
                <if test="${entityName}Search.equal${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} = ${r'#'}{${entityName}Search.equal${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.notEqual${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} != ${r'#'}{${entityName}Search.notEqual${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.greaterEqual${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} >= ${r'#'}{${entityName}Search.greaterEqual${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.greaterThan${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} > ${r'#'}{${entityName}Search.greaterThan${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.lessEqual${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} <= ${r'#'}{${entityName}Search.lessEqual${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.lessThan${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} < ${r'#'}{${entityName}Search.lessThan${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.in${col.fcCamelName}s != null">
                    <![CDATA[ And ${tableName}.${col.name} In ]]>
                    <foreach item="item" collection="${entityName}Search.in${col.fcCamelName}s" open="(" separator="," close=")">
					${r'#'}{item}
                    </foreach>
                </if>
                <if test="${entityName}Search.notIn${col.fcCamelName}s != null">
                    <![CDATA[ And ${tableName}.${col.name} Not In ]]>
                    <foreach item="item" collection="${entityName}Search.notIn${col.fcCamelName}s" open="(" separator="," close=")">
					${r'#'}{item}
                    </foreach>
                </if>
                <if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isNull${col.fcCamelName},1)">
                    <![CDATA[ And ${tableName}.${col.name} Is Null ]]>
                </if>
                <if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isNotNull${col.fcCamelName},1)">
                    <![CDATA[ And ${tableName}.${col.name} Is Not Null ]]>
                </if>
			<#elseif (col.type="VARCHAR" || col.type="CHAR" || col.type="TEXT")>
                <if test="@${packagePrefix}.validator.MybatisValidator@isNotBlank(${entityName}Search.equal${col.fcCamelName})">
                    <![CDATA[ And ${tableName}.${col.name} = ${r'#'}{${entityName}Search.equal${col.fcCamelName}} ]]>
                </if>
                <if test="@${packagePrefix}.validator.MybatisValidator@isNotBlank(${entityName}Search.notEqual${col.fcCamelName})">
                    <![CDATA[ And ${tableName}.${col.name} != ${r'#'}{${entityName}Search.notEqual${col.fcCamelName}} ]]>
                </if>
                <if test="@${packagePrefix}.validator.MybatisValidator@isNotBlank(${entityName}Search.like${col.fcCamelName})">
                    <![CDATA[ And ${tableName}.${col.name} Like '%${r'$'}{${entityName}Search.like${col.fcCamelName}}%' ]]>
                </if>
                <if test="@${packagePrefix}.validator.MybatisValidator@isNotBlank(${entityName}Search.notLike${col.fcCamelName})">
                    <![CDATA[ And ${tableName}.${col.name} Not Like '%${r'$'}{${entityName}Search.notLike${col.fcCamelName}}%' ]]>
                </if>
                <if test="${entityName}Search.in${col.fcCamelName}s != null">
                    <![CDATA[ And ${tableName}.${col.name} In ]]>
                    <foreach item="item" collection="${entityName}Search.in${col.fcCamelName}s" open="(" separator="," close=")">
					${r'#'}{item}
                    </foreach>
                </if>
                <if test="${entityName}Search.notIn${col.fcCamelName}s != null">
                    <![CDATA[ And ${tableName}.${col.name} Not In ]]>
                    <foreach item="item" collection="${entityName}Search.notIn${col.fcCamelName}s" open="(" separator="," close=")">
					${r'#'}{item}
                    </foreach>
                </if>
                <if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isNull${col.fcCamelName},1)">
                    <![CDATA[ And ${tableName}.${col.name} Is Null ]]>
                </if>
                <if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isNotNull${col.fcCamelName},1)">
                    <![CDATA[ And ${tableName}.${col.name} Is Not Null ]]>
                </if>
			<#elseif (col.type="DATETIME")>
                <if test="${entityName}Search.greaterEqual${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} >= ${r'#'}{${entityName}Search.greaterEqual${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.greaterThan${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} > ${r'#'}{${entityName}Search.greaterThan${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.lessEqual${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} <= ${r'#'}{${entityName}Search.lessEqual${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.lessThan${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} < ${r'#'}{${entityName}Search.lessThan${col.fcCamelName}} ]]>
                </if>
			<#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
                <if test="${entityName}Search.equal${col.fcCamelName} != null">
                    <![CDATA[ And date_format(${tableName}.${col.name},'%Y-%m-%d') = date_format(${r'#'}{${entityName}Search.equal${col.fcCamelName}},'%Y-%m-%d') ]]>
                </if>
                <if test="${entityName}Search.notEqual${col.fcCamelName} != null">
                    <![CDATA[ And date_format(${tableName}.${col.name},'%Y-%m-%d') != date_format(${r'#'}{${entityName}Search.notEqual${col.fcCamelName}},'%Y-%m-%d') ]]>
                </if>
                <if test="${entityName}Search.greaterEqual${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} >= ${r'#'}{${entityName}Search.greaterEqual${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.greaterThan${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} > ${r'#'}{${entityName}Search.greaterThan${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.lessEqual${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} <= ${r'#'}{${entityName}Search.lessEqual${col.fcCamelName}} ]]>
                </if>
                <if test="${entityName}Search.lessThan${col.fcCamelName} != null">
                    <![CDATA[ And ${tableName}.${col.name} < ${r'#'}{${entityName}Search.lessThan${col.fcCamelName}} ]]>
                </if>
                <if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isNull${col.fcCamelName},1)">
                    <![CDATA[ And ${tableName}.${col.name} Is Null ]]>
                </if>
                <if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isNotNull${col.fcCamelName},1)">
                    <![CDATA[ And ${tableName}.${col.name} Is Not Null ]]>
                </if>
			</#if>
		</#list>
        </if>
    </sql>

    <sql id="${entityName}_OrderSql_Auto">
        <trim prefix="Order By ">
            <choose>
                <when test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isRandomOrder,1)">rand()</when>
                <otherwise>
                    <choose>
                        <when test="@${packagePrefix}.validator.MybatisValidator@isNotBlank(${entityName}Search.sort)">
						${entityName}_${r'$'}{${entityName}Search.sort}
                            <if test="@${packagePrefix}.validator.MybatisValidator@isNotBlank(${entityName}Search.order)">
							${r'$'}{${entityName}Search.order}
                            </if>
                        </when>
                        <otherwise>
						${tableName}.${pkName} Desc
                        </otherwise>
                    </choose>
                </otherwise>
            </choose>
        </trim>
    </sql>

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
        Select Count(<if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isDistinct,1)"> distinct </if> ${tableName}.${pkName})
        From	${tableName}	As	${tableName}
        <trim prefix="Where" prefixOverrides="And | Or">
            <include refid="${entityName}_WhereSql_Auto"/>
        </trim>
    </select>

    <select id="queryList_Search_Admin_List" resultMap="RM_${entityName}_Admin_List">
        Select
        <if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isDistinct,1)">
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
        Select Count(<if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isDistinct,1)"> distinct </if> ${tableName}.${pkName})
        From	${tableName}	As	${tableName}
        <trim prefix="Where" prefixOverrides="And | Or">
            <include refid="${entityName}_WhereSql_Auto"/>
        </trim>
    </select>

    <select id="queryList_Search_Json_List" resultMap="RM_${entityName}_Json_List">
        Select
        <if test="@${packagePrefix}.validator.MybatisValidator@isEqual(${entityName}Search.isDistinct,1)">
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