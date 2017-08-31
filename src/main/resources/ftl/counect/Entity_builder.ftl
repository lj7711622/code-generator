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
	</#list>

	private ${entityName}Entity(Builder builder){
<#list columns as col>
		this.${col.camelName} = builder.${col.camelName};
</#list>
	}
	public static class Builder {
	<#list columns as col>
		//${col.remarks}
		private ${col.javaType.simpleName} ${col.camelName};
	</#list>

<#list columns as col>
	<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
    	public Builder ${col.camelName}(${col.javaType.simpleName} ${col.camelName}){this.${col.camelName} = ${col.camelName};return this;}
	<#elseif (col.type="VARCHAR" || col.type="CHAR" || col.type="TEXT")>
    	public Builder         ${col.camelName}(${col.javaType.simpleName} ${col.camelName}){this.${col.camelName} = ${col.camelName};return this;}
	<#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
    	public Builder ${col.camelName}(${col.javaType.simpleName} ${col.camelName}){this.${col.camelName} = ${col.camelName};return this;}
	</#if>
</#list>

		public ${entityName}Entity build() {
			return new ${entityName}Entity(this);
		}
	}

}