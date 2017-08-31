/*
 * Author : www.thewk.cn.vc
 * JDK Version : 1.6.0_45
 * Create Date : 2016/7/20
 */
package ${packagePrefix}.domain.autoentity;

import common.base.BaseEntity;
import java.util.Date;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
public abstract class Auto${entityName}Entity extends BaseEntity {


	<#list columns as col>
		//${col.remarks}
		private ${col.javaType.simpleName} ${col.camelName};
	</#list>
	
	<#list columns as col>
		 /**
	     * 获取 ${col.remarks}
	     */
		public ${col.javaType.simpleName} get${col.fcCamelName}(){
			return this.${col.camelName};
		}
		/**
	     * 设置 ${col.remarks}
	     * @param ${col.camelName}
	     */
		public void set${col.fcCamelName}(${col.javaType.simpleName} ${col.camelName}){
			this.${col.camelName} = ${col.camelName};
		}
	</#list>	
}