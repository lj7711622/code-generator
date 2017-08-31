#中文的类名
${entityName}.Object.Name = ${entityName}

<#list columns as col>
${r'#'}${col.fcCamelName}
${entityName}.${col.camelName} = ${col.remarks}

</#list>