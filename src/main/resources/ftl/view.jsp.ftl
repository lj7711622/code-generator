﻿<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@ include file="/resources/includes/tags.jsp"%>
<script type="text/javascript">
	function admin_base_systemmanage_${entityName?lower_case}_view_initValue() {
	}
$(function(){
	window.setTimeout(function() {
		<c:if test="${r'$'}{!empty message}">
			$.messager.show({title : '<fmt:message key="default_message_title" />',msg : '${r'$'}{message}', timeout : <fmt:message key="default_message_timeout"/>});
			$('#admin_base_systemmanage_${entityName?lower_case}_index_viewDialog').dialog('close');
			return;
		</c:if>
		admin_base_systemmanage_${entityName?lower_case}_view_initValue();
	},0);
});
</script>
<table class="table_content"  width="100%">
	<tbody>
		<#list columns as col>
		<#if !col.isId>
		<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
		<tr>
			<td style="width: 15%;"  nowrap="" class="tal">
				<fmt:message key="${entityName}.${col.camelName}"/>：
			</td>
			<td style="width: 34%;"  nowrap="" class="tal">
                   <div class="pl_2">
   					<select id="admin_base_systemmanage_${entityName?lower_case}_view_${col.camelName}" name="${col.camelName}" readonly="readonly"  style="min-width: 150px;width:150px;" class="easyui-combobox select_150_20" data-options="
   					viewable : false,
   					panelHeight : 200
   					<%--
   					,data : $.Sys_Enabled_CU,
   					valueField : 'value',  
           			textField : 'text',
           			url : 'get_data1.php',
   					onSelect : function(rec) {  
   						var url = 'get_data2.php?id='+rec.id;  
   						$('#cc2').combobox('reload', url);  
   					},
					onLoadSuccess : function(node, data){
						$(this).tree('remove',$(this).tree('find','${r'$'}{${entityName}Entity.${pkName}').target);
					}
           			--%>
   					">
   						<option value="">--请选择--</option>
   						<option value="1">1</option>
   						<option value="2">2</option>
   						<option value="3">3</option>
   						<option value="4">4</option>
   					</select>
                   </div>
				<%--<input id="admin_base_systemmanage_${entityName?lower_case}_view_${col.camelName}" maxlength="10" name="${col.camelName}" readonly="readonly"  value="${r'$'}{${entityName}Entity.${col.camelName}}" class="easyui-validatebox text_150_18" />--%>
				<%--<input id="admin_base_systemmanage_${entityName?lower_case}_view_${col.camelName}" maxlength="5" name="${col.camelName}" readonly="readonly"  class="easyui-numberspinner text_150_18" data-options="value:${r'$'}{${entityName}Entity.${col.camelName}},min:1,max:99999"/>--%>
			</td>
		</tr>
		<#elseif (col.type="VARCHAR")>
		<tr>
			<td style="width: 15%;"  nowrap="" class="tal">
				<fmt:message key="${entityName}.${col.camelName}"/>：
			</td>
			<td style="width: 34%;"  nowrap="" class="tal">
				<input id="admin_base_systemmanage_${entityName?lower_case}_view_${col.camelName}" maxlength="50" readonly="readonly"  name="${col.camelName}" value="${r'$'}{${entityName}Entity.${col.camelName}}" class="easyui-validatebox text_150_18" />
				<%--
				<textarea style="overflow-y:auto;" id="admin_base_systemmanage_${entityName?lower_case}_view_${col.camelName}" rows="5" cols="30" readonly="readonly" maxlength="50" name="${col.camelName}" class="easyui-validatebox area_80_40" validType="maxLength[50]">${r'$'}{${entityName}Entity.${col.camelName}}</textarea>
				--%>
			</td>
		</tr>
		<#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
		<tr>
			<td style="width: 15%;"  nowrap="" class="tal">
				<fmt:message key="${entityName}.${col.camelName}"/>：
			</td>
			<td style="width: 34%;"  nowrap="" class="tal">
				<input id="admin_base_systemmanage_${entityName?lower_case}_view_${col.camelName}" name="${col.camelName}" readonly="readonly" value="<fmt:formatDate value="${r'$'}{${entityName}Entity.${col.camelName}}" pattern="yyyy-MM-dd"/>" class="easyui-validatebox text_150_18" />
			</td>
		</tr>
		</#if>
		</#if>
		</#list>
		
    <tbody>
</table>