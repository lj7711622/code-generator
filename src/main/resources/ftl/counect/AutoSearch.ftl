/*
 * Author : www.thewk.cn.vc
 * JDK Version : 1.6.0_45
 * Create Date : 2016/7/20
 */
package ${packagePrefix}.entity;

import java.util.Date;

import common.base.BaseSearch;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
public abstract class Auto${entityName}Search extends BaseSearch {

	// ------------------- 构造器 ------------------------
	public Auto${entityName}Search() {
		super(Default_Rows, Default_Page, Default_Sort, Default_Order, Default_Switch_Flag);
	}
	
	public Auto${entityName}Search(int switchFlag) {
		super(Default_Rows, Default_Page, Default_Sort, Default_Order, switchFlag);
	}

	public Auto${entityName}Search(int pageSize, int currentPage) {
		super(pageSize, currentPage, Default_Sort, Default_Order, Default_Switch_Flag);
	}
	
	public Auto${entityName}Search(int pageSize, int currentPage,int switchFlag) {
		super(pageSize, currentPage, Default_Sort, Default_Order, switchFlag);
	}

	public Auto${entityName}Search(String orderField, String orderType) {
		super(Default_Rows, Default_Page, orderField, orderType, Default_Switch_Flag);
	}

	public Auto${entityName}Search(String orderField, String orderType, int switchFlag) {
		super(Default_Rows, Default_Page, orderField, orderType, switchFlag);
	}

	public Auto${entityName}Search(int pageSize, int currentPage, String orderField, String orderType) {
		super(pageSize, currentPage, orderField, orderType,Default_Switch_Flag);
	}
	
	public Auto${entityName}Search(int pageSize, int currentPage, String orderField, String orderType, int switchFlag) {
		super(pageSize, currentPage, orderField, orderType,switchFlag);
	}
	<#list columns as col>
		<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
			private ${col.javaType.simpleName} equal${col.fcCamelName};
			private ${col.javaType.simpleName} greaterEqual${col.fcCamelName};
			private ${col.javaType.simpleName} greaterThan${col.fcCamelName};
			private ${col.javaType.simpleName} lessEqual${col.fcCamelName};
			private ${col.javaType.simpleName} lessThan${col.fcCamelName};
			private ${col.javaType.simpleName} notEqual${col.fcCamelName};
			private ${col.javaType.simpleName}[] in${col.fcCamelName}s;
			private ${col.javaType.simpleName}[] notIn${col.fcCamelName}s;
			private Integer			isNull${col.fcCamelName} = NO;
			private Integer			isNotNull${col.fcCamelName} = NO;
		<#elseif (col.type="VARCHAR")>
			private ${col.javaType.simpleName}         equal${col.fcCamelName};
			private ${col.javaType.simpleName}         notEqual${col.fcCamelName};
			private ${col.javaType.simpleName}         like${col.fcCamelName};
			private ${col.javaType.simpleName}         notLike${col.fcCamelName};
			private ${col.javaType.simpleName}[] in${col.fcCamelName}s;
			private ${col.javaType.simpleName}[] notIn${col.fcCamelName}s;
			private Integer			isNull${col.fcCamelName} = NO;
			private Integer			isNotNull${col.fcCamelName} = NO;
		<#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
			private Date           equal${col.fcCamelName};
			private Date           notEqual${col.fcCamelName};
			private Date           greaterEqual${col.fcCamelName};
			private Date           greaterThan${col.fcCamelName};
			private Date           lessEqual${col.fcCamelName};
			private Date           lessThan${col.fcCamelName};
			private Integer			isNull${col.fcCamelName} = NO;
			private Integer			isNotNull${col.fcCamelName} = NO;
		</#if>
		</#list>
		
		<#list columns as col>
		<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
			public ${col.javaType.simpleName} getEqual${col.fcCamelName}(){return this.equal${col.fcCamelName};}
			public void setEqual${col.fcCamelName}(${col.javaType.simpleName} equal${col.fcCamelName}){this.equal${col.fcCamelName} = equal${col.fcCamelName};}
			public ${col.javaType.simpleName} getGreaterEqual${col.fcCamelName}(){return this.greaterEqual${col.fcCamelName};}
			public void setGreaterEqual${col.fcCamelName}(${col.javaType.simpleName} greaterEqual${col.fcCamelName}){this.greaterEqual${col.fcCamelName} = greaterEqual${col.fcCamelName};}
			public ${col.javaType.simpleName} getGreaterThan${col.fcCamelName}(){return this.greaterThan${col.fcCamelName};}
			public void setGreaterThan${col.fcCamelName}(${col.javaType.simpleName} greaterThan${col.fcCamelName}){this.greaterThan${col.fcCamelName} = greaterThan${col.fcCamelName};}
			public ${col.javaType.simpleName} getLessEqual${col.fcCamelName}(){return this.lessEqual${col.fcCamelName};}
			public void setLessEqual${col.fcCamelName}(${col.javaType.simpleName} lessEqual${col.fcCamelName}){this.lessEqual${col.fcCamelName} = lessEqual${col.fcCamelName};}
			public ${col.javaType.simpleName} getLessThan${col.fcCamelName}(){return this.lessThan${col.fcCamelName};}
			public void setLessThan${col.fcCamelName}(${col.javaType.simpleName} lessThan${col.fcCamelName}){this.lessThan${col.fcCamelName} = lessThan${col.fcCamelName};}
			public ${col.javaType.simpleName} getNotEqual${col.fcCamelName}(){return this.notEqual${col.fcCamelName};}
			public void setNotEqual${col.fcCamelName}(${col.javaType.simpleName} notEqual${col.fcCamelName}){this.notEqual${col.fcCamelName} = notEqual${col.fcCamelName};}
			public ${col.javaType.simpleName}[] getIn${col.fcCamelName}s() { return this.in${col.fcCamelName}s;};
			public void setIn${col.fcCamelName}s(${col.javaType.simpleName}[] in${col.fcCamelName}s) { this.in${col.fcCamelName}s = in${col.fcCamelName}s;}
			public ${col.javaType.simpleName}[] getNotIn${col.fcCamelName}s() {return this.notIn${col.fcCamelName}s;};
			public void setNotIn${col.fcCamelName}s(${col.javaType.simpleName}[] notIn${col.fcCamelName}s) { this.notIn${col.fcCamelName}s = notIn${col.fcCamelName}s; };
			public Integer getIsNull${col.fcCamelName}(){return this.isNull${col.fcCamelName};}
			public void setIsNull${col.fcCamelName}(Integer isNull${col.fcCamelName}){this.isNull${col.fcCamelName} = isNull${col.fcCamelName};}
			public Integer getIsNotNull${col.fcCamelName}(){return this.isNotNull${col.fcCamelName};}
			public void setIsNotNull${col.fcCamelName}(Integer isNotNull${col.fcCamelName}){this.isNotNull${col.fcCamelName} = isNotNull${col.fcCamelName};}
		<#elseif (col.type="VARCHAR")>
			public ${col.javaType.simpleName}         getEqual${col.fcCamelName}(){return this.equal${col.fcCamelName};}
			public void			setEqual${col.fcCamelName}(${col.javaType.simpleName} equal${col.fcCamelName}){this.equal${col.fcCamelName} = equal${col.fcCamelName};}
			public ${col.javaType.simpleName}         getNotEqual${col.fcCamelName}(){return this.notEqual${col.fcCamelName};}
			public void         setNotEqual${col.fcCamelName}(${col.javaType.simpleName} notEqual${col.fcCamelName}){this.notEqual${col.fcCamelName} = notEqual${col.fcCamelName};}
			public ${col.javaType.simpleName}         getLike${col.fcCamelName}(){return this.like${col.fcCamelName};}
			public void         setLike${col.fcCamelName}(${col.javaType.simpleName} like${col.fcCamelName}){this.like${col.fcCamelName} = like${col.fcCamelName};}
			public ${col.javaType.simpleName}         getNotLike${col.fcCamelName}(){return this.notLike${col.fcCamelName};}
			public void         setNotLike${col.fcCamelName}(${col.javaType.simpleName} notLike${col.fcCamelName}){this.notLike${col.fcCamelName} = notLike${col.fcCamelName};}
			public ${col.javaType.simpleName}[] getIn${col.fcCamelName}s() { return this.in${col.fcCamelName}s;};
			public void setIn${col.fcCamelName}s(${col.javaType.simpleName}[] in${col.fcCamelName}s) { this.in${col.fcCamelName}s = in${col.fcCamelName}s;}
			public ${col.javaType.simpleName}[] getNotIn${col.fcCamelName}s() {return this.notIn${col.fcCamelName}s;};
			public void setNotIn${col.fcCamelName}s(${col.javaType.simpleName}[] notIn${col.fcCamelName}s) { this.notIn${col.fcCamelName}s = notIn${col.fcCamelName}s; };
			public Integer getIsNull${col.fcCamelName}(){return this.isNull${col.fcCamelName};}
			public void setIsNull${col.fcCamelName}(Integer isNull${col.fcCamelName}){this.isNull${col.fcCamelName} = isNull${col.fcCamelName};}
			public Integer getIsNotNull${col.fcCamelName}(){return this.isNotNull${col.fcCamelName};}
			public void setIsNotNull${col.fcCamelName}(Integer isNotNull${col.fcCamelName}){this.isNotNull${col.fcCamelName} = isNotNull${col.fcCamelName};}
		<#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
			public Date getEqual${col.fcCamelName}(){return this.equal${col.fcCamelName};}
			public void setEqual${col.fcCamelName}(Date equal${col.fcCamelName}){this.equal${col.fcCamelName} = equal${col.fcCamelName};}
			public Date getNotEqual${col.fcCamelName}(){return this.notEqual${col.fcCamelName};}
			public void setNotEqual${col.fcCamelName}(Date notEqual${col.fcCamelName}){this.notEqual${col.fcCamelName} = notEqual${col.fcCamelName};}
			public Date getGreaterEqual${col.fcCamelName}(){return this.greaterEqual${col.fcCamelName};}
			public void setGreaterEqual${col.fcCamelName}(Date greaterEqual${col.fcCamelName}){this.greaterEqual${col.fcCamelName} = greaterEqual${col.fcCamelName};}
			public Date getGreaterThan${col.fcCamelName}(){return this.greaterThan${col.fcCamelName};}
			public void setGreaterThan${col.fcCamelName}(Date greaterThan${col.fcCamelName}){this.greaterThan${col.fcCamelName} = greaterThan${col.fcCamelName};}
			public Date getLessEqual${col.fcCamelName}(){return this.lessEqual${col.fcCamelName};}
			public void setLessEqual${col.fcCamelName}(Date lessEqual${col.fcCamelName}){this.lessEqual${col.fcCamelName} = lessEqual${col.fcCamelName};}
			public Date getLessThan${col.fcCamelName}(){return this.lessThan${col.fcCamelName};}
			public void setLessThan${col.fcCamelName}(Date lessThan${col.fcCamelName}){this.lessThan${col.fcCamelName} = lessThan${col.fcCamelName};}
			public Integer getIsNull${col.fcCamelName}(){return this.isNull${col.fcCamelName};}
			public void setIsNull${col.fcCamelName}(Integer isNull${col.fcCamelName}){this.isNull${col.fcCamelName} = isNull${col.fcCamelName};}
			public Integer getIsNotNull${col.fcCamelName}(){return this.isNotNull${col.fcCamelName};}
			public void setIsNotNull${col.fcCamelName}(Integer isNotNull${col.fcCamelName}){this.isNotNull${col.fcCamelName} = isNotNull${col.fcCamelName};}
		</#if>
		</#list>
}
