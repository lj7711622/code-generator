package ${entityPrefix};

import ${packagePrefix}.base.BaseEnity;

import java.util.Date;

/**
* Table Name : ${tableName}<br/>
* Description : ${entityName}
* <hr/>
*/
// TODO Auto Create
public class ${entityName}Entity extends BaseEnity {

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
	* @param ${col.camelName} ${col.remarks}
	*/
	public void set${col.fcCamelName}(${col.javaType.simpleName} ${col.camelName}){
		this.${col.camelName} = ${col.camelName};
	}
</#list>
}