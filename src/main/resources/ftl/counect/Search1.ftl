package ${packagePrefix}.dubboxSearch;

import ${packagePrefix}.base.BaseSearch;
import java.util.Date;
/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
public class ${entityName}Search extends BaseSearch {

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
        <#elseif (col.type="VARCHAR" || col.type="CHAR" || col.type="TEXT")>
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
			public ${col.javaType.simpleName} getGreaterEqual${col.fcCamelName}(){return this.greaterEqual${col.fcCamelName};}
			public ${col.javaType.simpleName} getGreaterThan${col.fcCamelName}(){return this.greaterThan${col.fcCamelName};}
			public ${col.javaType.simpleName} getLessEqual${col.fcCamelName}(){return this.lessEqual${col.fcCamelName};}
			public ${col.javaType.simpleName} getLessThan${col.fcCamelName}(){return this.lessThan${col.fcCamelName};}
			public ${col.javaType.simpleName} getNotEqual${col.fcCamelName}(){return this.notEqual${col.fcCamelName};}
			public ${col.javaType.simpleName}[] getIn${col.fcCamelName}s() { return this.in${col.fcCamelName}s;}
			public ${col.javaType.simpleName}[] getNotIn${col.fcCamelName}s() {return this.notIn${col.fcCamelName}s;}
			public Integer getIsNull${col.fcCamelName}(){return this.isNull${col.fcCamelName};}
			public Integer getIsNotNull${col.fcCamelName}(){return this.isNotNull${col.fcCamelName};}
		<#elseif (col.type="VARCHAR" || col.type="CHAR" || col.type="TEXT")>
			public ${col.javaType.simpleName}         getEqual${col.fcCamelName}(){return this.equal${col.fcCamelName};}
			public ${col.javaType.simpleName}         getNotEqual${col.fcCamelName}(){return this.notEqual${col.fcCamelName};}
			public ${col.javaType.simpleName}         getLike${col.fcCamelName}(){return this.like${col.fcCamelName};}
			public ${col.javaType.simpleName}         getNotLike${col.fcCamelName}(){return this.notLike${col.fcCamelName};}
			public ${col.javaType.simpleName}[] getIn${col.fcCamelName}s() { return this.in${col.fcCamelName}s;}
			public ${col.javaType.simpleName}[] getNotIn${col.fcCamelName}s() {return this.notIn${col.fcCamelName}s;}
			public Integer getIsNull${col.fcCamelName}(){return this.isNull${col.fcCamelName};}
			public Integer getIsNotNull${col.fcCamelName}(){return this.isNotNull${col.fcCamelName};}
		<#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
			public Date getEqual${col.fcCamelName}(){return this.equal${col.fcCamelName};}
			public Date getNotEqual${col.fcCamelName}(){return this.notEqual${col.fcCamelName};}
			public Date getGreaterEqual${col.fcCamelName}(){return this.greaterEqual${col.fcCamelName};}
			public Date getGreaterThan${col.fcCamelName}(){return this.greaterThan${col.fcCamelName};}
			public Date getLessEqual${col.fcCamelName}(){return this.lessEqual${col.fcCamelName};}
			public Date getLessThan${col.fcCamelName}(){return this.lessThan${col.fcCamelName};}
			public Integer getIsNull${col.fcCamelName}(){return this.isNull${col.fcCamelName};}
			public Integer getIsNotNull${col.fcCamelName}(){return this.isNotNull${col.fcCamelName};}
		</#if>
    </#list>

    private ${entityName}Search(Builder builder) {
<#list columns as col>
    <#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
        this.equal${col.fcCamelName} = builder.equal${col.fcCamelName};
        this.greaterEqual${col.fcCamelName} = builder.greaterEqual${col.fcCamelName};
        this.greaterThan${col.fcCamelName} = builder.greaterThan${col.fcCamelName};
        this.lessEqual${col.fcCamelName} = builder.lessEqual${col.fcCamelName};
        this.lessThan${col.fcCamelName} = builder.lessThan${col.fcCamelName};
        this.notEqual${col.fcCamelName} = builder.notEqual${col.fcCamelName};
        this.in${col.fcCamelName}s = builder.in${col.fcCamelName}s;
        this.notIn${col.fcCamelName}s = builder.in${col.fcCamelName}s;
        this.isNull${col.fcCamelName} = builder.isNull${col.fcCamelName};
        this.isNotNull${col.fcCamelName} = builder.isNull${col.fcCamelName};
    <#elseif (col.type="VARCHAR" || col.type="CHAR" || col.type="TEXT")>
        this.equal${col.fcCamelName} = builder.equal${col.fcCamelName};
        this.notEqual${col.fcCamelName} = builder.notEqual${col.fcCamelName};
        this.like${col.fcCamelName} = builder.like${col.fcCamelName};
        this.notLike${col.fcCamelName} = builder.notLike${col.fcCamelName};
        this.in${col.fcCamelName}s = builder.in${col.fcCamelName}s;
        this.notIn${col.fcCamelName}s = builder.notIn${col.fcCamelName}s;
        this.isNull${col.fcCamelName} = builder.isNull${col.fcCamelName};
        this.isNotNull${col.fcCamelName} = builder.isNotNull${col.fcCamelName};
    <#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
        this.equal${col.fcCamelName} = builder.equal${col.fcCamelName};
        this.notEqual${col.fcCamelName} = builder.notEqual${col.fcCamelName};
        this.greaterEqual${col.fcCamelName} = builder.greaterEqual${col.fcCamelName};
        this.greaterThan${col.fcCamelName} = builder.greaterThan${col.fcCamelName};
        this.lessEqual${col.fcCamelName} = builder.lessEqual${col.fcCamelName};
        this.lessThan${col.fcCamelName} = builder.lessThan${col.fcCamelName};
        this.isNull${col.fcCamelName} = builder.isNull${col.fcCamelName};
        this.isNotNull${col.fcCamelName} = builder.isNotNull${col.fcCamelName};
    </#if>
</#list>
        this.rows = builder.rows;
        this.order = builder.order;
        this.page = builder.page;
        this.sort = builder.sort;
    }

    public static class Builder {
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
    <#elseif (col.type="VARCHAR" || col.type="CHAR" || col.type="TEXT")>
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
        // 每页条数
        private int rows = Default_Rows;
        // 当前页码
        private int page = Default_Page;
        // 排序字段
        private String sort = Default_Sort;
        // 排序类型
        private String order = Default_Order;

        public Builder rows(int rows) {
            this.rows = rows;
            return this;
        }

        public Builder page(int page) {
            this.page = page;
            return this;
        }

        public Builder sort(String sort) {
            this.sort = sort;
            return this;
        }

        public Builder order(String order) {
            this.order = order;
            return this;
        }

<#list columns as col>
    <#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
        public Builder equal${col.fcCamelName}(${col.javaType.simpleName} equal${col.fcCamelName}){this.equal${col.fcCamelName} = equal${col.fcCamelName};return this;}
        public Builder greaterEqual${col.fcCamelName}(${col.javaType.simpleName} greaterEqual${col.fcCamelName}){this.greaterEqual${col.fcCamelName} = greaterEqual${col.fcCamelName};return this;}
        public Builder greaterThan${col.fcCamelName}(${col.javaType.simpleName} greaterThan${col.fcCamelName}){this.greaterThan${col.fcCamelName} = greaterThan${col.fcCamelName};return this;}
        public Builder lessEqual${col.fcCamelName}(${col.javaType.simpleName} lessEqual${col.fcCamelName}){this.lessEqual${col.fcCamelName} = lessEqual${col.fcCamelName};return this;}
        public Builder lessThan${col.fcCamelName}(${col.javaType.simpleName} lessThan${col.fcCamelName}){this.lessThan${col.fcCamelName} = lessThan${col.fcCamelName};return this;}
        public Builder notEqual${col.fcCamelName}(${col.javaType.simpleName} notEqual${col.fcCamelName}){this.notEqual${col.fcCamelName} = notEqual${col.fcCamelName};return this;}
        public Builder in${col.fcCamelName}s(${col.javaType.simpleName}[] in${col.fcCamelName}s) {this.in${col.fcCamelName}s = in${col.fcCamelName}s;return this;}
        public Builder notIn${col.fcCamelName}s(${col.javaType.simpleName}[] notIn${col.fcCamelName}s) {this.notIn${col.fcCamelName}s = notIn${col.fcCamelName}s;return this;}
        public Builder isNull${col.fcCamelName}(Integer isNull${col.fcCamelName}){this.isNull${col.fcCamelName} = isNull${col.fcCamelName};return this;}
        public Builder isNotNull${col.fcCamelName}(Integer isNotNull${col.fcCamelName}){this.isNotNull${col.fcCamelName} = isNotNull${col.fcCamelName};return this;}
    <#elseif (col.type="VARCHAR" || col.type="CHAR" || col.type="TEXT")>
        public Builder equal${col.fcCamelName}(${col.javaType.simpleName} equal${col.fcCamelName}){this.equal${col.fcCamelName} = equal${col.fcCamelName};return this;}
        public Builder notEqual${col.fcCamelName}(${col.javaType.simpleName} notEqual${col.fcCamelName}){this.notEqual${col.fcCamelName} = notEqual${col.fcCamelName};return this;}
        public Builder like${col.fcCamelName}(${col.javaType.simpleName} like${col.fcCamelName}){this.like${col.fcCamelName} = like${col.fcCamelName};return this;}
        public Builder notLike${col.fcCamelName}(${col.javaType.simpleName} notLike${col.fcCamelName}){this.notLike${col.fcCamelName} = notLike${col.fcCamelName};return this;}
        public Builder in${col.fcCamelName}s(${col.javaType.simpleName}[] in${col.fcCamelName}s) {this.in${col.fcCamelName}s = in${col.fcCamelName}s;return this;}
        public Builder notIn${col.fcCamelName}s(${col.javaType.simpleName}[] notIn${col.fcCamelName}s) {this.notIn${col.fcCamelName}s = notIn${col.fcCamelName}s;return this;}
        public Builder isNull${col.fcCamelName}(Integer isNull${col.fcCamelName}){this.isNull${col.fcCamelName} = isNull${col.fcCamelName};return this;}
        public Builder isNotNull${col.fcCamelName}(Integer isNotNull${col.fcCamelName}){this.isNotNull${col.fcCamelName} = isNotNull${col.fcCamelName};return this;}
    <#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
        public Builder equal${col.fcCamelName}(${col.javaType.simpleName} equal${col.fcCamelName}){this.equal${col.fcCamelName} = equal${col.fcCamelName};return this;}
        public Builder notEqual${col.fcCamelName}(${col.javaType.simpleName} notEqual${col.fcCamelName}){this.notEqual${col.fcCamelName} = notEqual${col.fcCamelName};return this;}
        public Builder greaterEqual${col.fcCamelName}(${col.javaType.simpleName} greaterEqual${col.fcCamelName}){this.greaterEqual${col.fcCamelName} = greaterEqual${col.fcCamelName};return this;}
        public Builder greaterThan${col.fcCamelName}(${col.javaType.simpleName} greaterThan${col.fcCamelName}){this.greaterThan${col.fcCamelName} = greaterThan${col.fcCamelName};return this;}
        public Builder lessEqual${col.fcCamelName}(${col.javaType.simpleName} lessEqual${col.fcCamelName}){this.lessEqual${col.fcCamelName} = lessEqual${col.fcCamelName};return this;}
        public Builder lessThan${col.fcCamelName}(${col.javaType.simpleName} lessThan${col.fcCamelName}){this.lessThan${col.fcCamelName} = lessThan${col.fcCamelName};return this;}
        public Builder isNull${col.fcCamelName}(Integer isNull${col.fcCamelName}){this.isNull${col.fcCamelName} = isNull${col.fcCamelName};return this;}
        public Builder isNotNull${col.fcCamelName}(Integer isNotNull${col.fcCamelName}){this.isNotNull${col.fcCamelName} = isNotNull${col.fcCamelName};return this;}
    </#if>
</#list>

        public ${entityName}Search build() {
            return new ${entityName}Search(this);
        }
    }
}
