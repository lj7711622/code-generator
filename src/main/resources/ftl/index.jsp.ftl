<body><%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@ include file="/resources/includes/tags.jsp"%>
    <script type="text/javascript">
	function admin_base_systemmanage_${entityName?lower_case}_index_initGrid() {
		$('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid( {
			url : '${r'$'}{ctx}/admin/base/systemmanage/${entityName?lower_case}/list.json',
			queryParams : {
			},
            //queryParams : serializeObject($('#admin_base_systemmanage_${entityName?lower_case}_index_searchForm')),
			border : false,
			fit : true,
			fitColumns : false,
            idField : 'id',
		    // treeField:'configCode',
            // parentField : 'parentId',
			// resizeHandle : 'right',
			autoRowHeight : true,
			striped : true,
			// method : 'post',
			// nowrap : true,
			rownumbers : true,
			singleSelect : true,
			checkOnSelect : false,
			selectOnCheck : false,
			// pagePosition : 'bottom',
			sortName : 'id',
			sortOrder : 'desc',
			// remoteSort:true,
			// showHeader:true,
			// showFooter:true,
			// scrollbarSize:18,
			pagination : true,
			pageNumber : 1,
			pageSize : <fmt:message key="default_page_size"/>,
			pageList : [ 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 ],
			resizable : true,
			toolbar : '#admin_base_systemmanage_${entityName?lower_case}_index_toolBar',
			// rowStyler:function(index,row){
			// if(row.price>10){
			// return 'background-color:#6293BB;color:#fff;';
			// }
			// },
			frozenColumns : [[
			{
				field : '${pkName}',title : '<fmt:message key="${entityName}.id"/>',width : 100,checkbox : false,hidden : true
			}
			]],
			columns : [[
			
			<#list columns as col>
			<#if !col.isId>
			<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
			{
				field : '${col.camelName}',title : '<fmt:message key="${entityName}.${col.camelName}"/>',width : 100,sortable : false,align : 'center',halign : 'center',fixed : true,resizable : true//,formatter : function(value, row, index) {return $.Sys_Locked_CU.getText(value);}
			},
			<#elseif (col.type="VARCHAR")>
			{
				field : '${col.camelName}',title : '<fmt:message key="${entityName}.${col.camelName}"/>',width : 100,sortable : false,align : 'left',halign : 'center',fixed : true,resizable : true,formatter : function(value, row, index) {return '<span title=' + value + '>' + $.subString(value,0,10) + '</span>';}
			},
			<#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
			{
				field : '${col.camelName}',title : '<fmt:message key="${entityName}.${col.camelName}"/>',width : 100,sortable : false,align : 'center',halign : 'center',fixed : true,resizable : true,formatter : function(value, row, index) {return new Date(value).format('<fmt:message key="date_default" />');}
			}, 
			</#if>
			</#if>
			</#list>
            {field : 'action',title : '操作',resizable:false,halign:'center',formatter : function(value, row, index) {
				var rowString;
				if(row.lockStatus == 1) {
					rowString = $.formatString("<a href='###' class='easyui-linkbutton l-btn l-btn-plain' onclick='admin_base_systemmanage_${entityName?lower_case}_index_view({0})'><span class='l-btn-left'><span class='l-btn-text icon-woocons-bookmarks l-btn-icon-left'><fmt:message key='detail' /></span></span></a>",row.id) + 
					$.formatString("<a href='###' class='easyui-linkbutton l-btn l-btn-plain' onclick='admin_base_systemmanage_${entityName?lower_case}_index_lock({0})'><span class='l-btn-left'><span class='l-btn-text icon-woocons-lock-open l-btn-icon-left'><fmt:message key="unlock" /></span></span></a>",row.id);
					return rowString;
				}
				rowString =  $.formatString("<a href='###' class='easyui-linkbutton l-btn l-btn-plain' onclick='admin_base_systemmanage_${entityName?lower_case}_index_preEdit({0})'><span class='l-btn-left'><span class='l-btn-text icon-woocons-pencil l-btn-icon-left'><fmt:message key='edit' /></span></span></a>",row.id) + 
				$.formatString("<a href='###' class='easyui-linkbutton l-btn l-btn-plain' onclick='admin_base_systemmanage_${entityName?lower_case}_index_doDelete({0})'><span class='l-btn-left'><span class='l-btn-text icon-woocons-button-remove l-btn-icon-left'><fmt:message key='delete' /></span></span></a>",row.id) + 
				$.formatString("<a href='###' class='easyui-linkbutton l-btn l-btn-plain' onclick='admin_base_systemmanage_${entityName?lower_case}_index_view({0})'><span class='l-btn-left'><span class='l-btn-text icon-woocons-bookmarks l-btn-icon-left'><fmt:message key='detail' /></span></span></a>",row.id) +
				$.formatString("<a href='###' class='easyui-linkbutton l-btn l-btn-plain' onclick='admin_base_systemmanage_${entityName?lower_case}_index_lock({0})'><span class='l-btn-left'><span class='l-btn-text icon-woocons-lock-closed l-btn-icon-left'><fmt:message key="lock" /></span></span></a>",row.id);
				if(row.enableStatus == 1) {
					rowString += $.formatString("<a href='###' class='easyui-linkbutton l-btn l-btn-plain' onclick='admin_base_systemmanage_${entityName?lower_case}_index_enable({0})'><span class='l-btn-left'><span class='l-btn-text icon-woocons-star-on l-btn-icon-left'><fmt:message key="disable" /></span></span></a>",row.id);
				} else {
					rowString += $.formatString("<a href='###' class='easyui-linkbutton l-btn l-btn-plain' onclick='admin_base_systemmanage_${entityName?lower_case}_index_enable({0})'><span class='l-btn-left'><span class='l-btn-text icon-woocons-star-off l-btn-icon-left'><fmt:message key="enable" /></span></span></a>",row.id);
				}
				return rowString;
			}}
			]],
			onBeforeLoad : function(params) {
				//$(this).datagrid('unselectAll');$(this).datagrid('uncheckAll');
			},
            onSelect : function(rowIndex,rowData) {
                //$('#admin_base_systemmanage_${entityName?lower_case}_index_btnEdit').css('display','inline');
                
            	//$('#admin_base_systemmanage_${entityName?lower_case}_index_btnDelete').css('display','inline');
                
            	//$('#admin_base_systemmanage_${entityName?lower_case}_index_btnView').css('display','inline');
                
            	//$('#admin_base_systemmanage_${entityName?lower_case}_index_btnEnable').css('display','inline');
                //if(rowData.enableStatus == 1) $('#admin_base_systemmanage_${entityName?lower_case}_index_btnEnable span:last').html('禁用');
            	//else $('#admin_base_systemmanage_${entityName?lower_case}_index_btnEnable span:last').html('启用');
                
            	//$('#admin_base_systemmanage_${entityName?lower_case}_index_btnLock').css('display','inline');
                //if(rowData.lockStatus == 1) $('#admin_base_systemmanage_${entityName?lower_case}_index_btnLock span:last').html('解锁');
            	//else $('#admin_base_systemmanage_${entityName?lower_case}_index_btnLock span:last').html('锁定');
			},
			onUnselect : function(rowIndex,rowData) {
                //$('#admin_base_systemmanage_${entityName?lower_case}_index_btnEdit').css('display','none');
            	//$('#admin_base_systemmanage_${entityName?lower_case}_index_btnDelete').css('display','none');
            	//$('#admin_base_systemmanage_${entityName?lower_case}_index_btnView').css('display','none');
            	//$('#admin_base_systemmanage_${entityName?lower_case}_index_btnEnable').css('display','none');
            	//$('#admin_base_systemmanage_${entityName?lower_case}_index_btnLock').css('display','none');
			},
			onLoadSuccess : function(result) {
				if(result) {
                    if(result.status == <fmt:message key="default_status_success" />) {
    					if(result.message)
    						$.messager.show({title : '<fmt:message key="default_message_title" />',msg : result.message, timeout : <fmt:message key="default_message_timeout"/>});
    				} else if (result.status == <fmt:message key="default_status_error" />) {
    					$.messager.alert('<fmt:message key="default_message_title" />',result.message);
    				} else if (result.status == <fmt:message key="default_status_timeout" />) {
    					__timeOut();
    				}
                }
			},
			onLoadError : function() {
				$.messager.alert('<fmt:message key="default_message_title" />','<fmt:message key="default_message_grid_load_error" />');
			},
			onRowContextMenu : function(e,row) {
				e.preventDefault();
			}
			// 扩展
			// ,view:detailview,
			// detailFormatter:function(index,row){
			// },
			// onExpandRow: function(index,row){
			// }
		});
	}

	function admin_base_systemmanage_${entityName?lower_case}_index_preAdd(){
		var url = '${r'$'}{ctx}/admin/base/systemmanage/${entityName?lower_case}/add.html';
		var d = $('<div id="admin_base_systemmanage_${entityName?lower_case}_index_addDialog"/>').dialog({
			href : url,  
			title : '<fmt:message key="add" /> | <fmt:message key="${entityName}.Object.Name" />',
			width : <fmt:message key="default_dialog_width" />,
			height : <fmt:message key="default_dialog_height" />,
			closed : false,  
			cache : false,  
			modal : true,
			border : false,
			buttons:[
				{text : '<fmt:message key="submit" />',iconCls : 'icon-woocons-button-check',plain : true,handler : function() {
					$('#admin_base_systemmanage_${entityName?lower_case}_add_form').form('submit',{
						url : url,
						onSubmit : function () {
							var validateResult = $(this).form('validate');
							if (validateResult) {
								$.messager.progress({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="default_message_progress" />'});
							}
							return validateResult;
						},
						success : function(data) {
							$.messager.progress('close');
							var result = $.parseJSON(data);
							if(result.status == <fmt:message key="default_status_success" />) {
								d.dialog('close');
								$('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('load');
								$.messager.show({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="add_success_01"><fmt:param><fmt:message key="${entityName}.Object.Name" /></fmt:param></fmt:message>', timeout : <fmt:message key="default_message_timeout"/>});
							} else if (result.status == <fmt:message key="default_status_error" />) {
								$.messager.alert('<fmt:message key="default_message_title" />',result.message);
							} else if (result.status == <fmt:message key="default_status_timeout" />) {
								__timeOut();
							}
						},
						onLoadError: function () {
							$.messager.progress('close');
							$.messager.alert('<fmt:message key="default_message_title" />','<fmt:message key="default_message_form_load_error" />');
						}
					});
				}},
				{text : '<fmt:message key="close" />',iconCls : 'icon-woocons-button-stop',plain : true,handler : function(){ d.dialog('close'); }}
			],
			onClose : function() { d.dialog('destroy'); }
		});
	}

	function admin_base_systemmanage_${entityName?lower_case}_index_preEdit(editId) {
		var id;
		if(editId) {
			id = editId;
		} else {
			var selected  = $('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('getSelected');
			if(selected)
				id = selected.id;
		}
		if(id) {
			var url = '${r'$'}{ctx}/admin/base/systemmanage/${entityName?lower_case}/edit/' + id;
			var d = $('<div id="admin_base_systemmanage_${entityName?lower_case}_index_editDialog"/>').dialog({
				href : url,
				title : '<fmt:message key="edit" /> | <fmt:message key="${entityName}.Object.Name" />',
				width : <fmt:message key="default_dialog_width" />,
				height : <fmt:message key="default_dialog_height" />,
				closed : false,  
				cache : false,  
				modal : true,
				border : false,
				buttons : [
					{text : '<fmt:message key="submit" />',iconCls : 'icon-woocons-button-check',plain : true,handler : function() {
						$('#admin_base_systemmanage_${entityName?lower_case}_edit_form').form('submit',{
							url : url,
							onSubmit : function () {
								var validateResult = $(this).form('validate');
								if (validateResult) {
									$.messager.progress({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="default_message_progress" />'});
								}
								return validateResult;
							},
							success : function(data) {
								$.messager.progress('close');
								var result = $.parseJSON(data);
								if(result.status == <fmt:message key="default_status_success" />) {
									d.dialog('close');
									$('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('load');
									$.messager.show({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="edit_success_01"><fmt:param><fmt:message key="${entityName}.Object.Name" /></fmt:param></fmt:message>', timeout : <fmt:message key="default_message_timeout"/>});
								} else if (result.status == <fmt:message key="default_status_error" />) {
									$.messager.alert('<fmt:message key="default_message_title" />',result.message);
								} else if (result.status == <fmt:message key="default_status_timeout" />) {
									__timeOut();
								}
							},
							onLoadError: function () {
								$.messager.progress('close');
								$.messager.alert('<fmt:message key="default_message_title" />','<fmt:message key="default_message_form_load_error" />');
							}
						});
					}},
					{text : '<fmt:message key="close" />',iconCls : 'icon-woocons-button-stop',plain : true,handler : function() { d.dialog('close'); }}
				],
				onClose : function() { d.dialog('destroy'); }
			});
		}
	}

	function admin_base_systemmanage_${entityName?lower_case}_index_doDelete(deleteId) {
		var id;
		if(deleteId) {
			id = deleteId;
		} else {
			var selected  = $('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('getSelected');
			if(selected)
				id = selected.id;
		}
		if(id) {
			var url = '${r'$'}{ctx}/admin/base/systemmanage/${entityName?lower_case}/delete/' + id;
			$.messager.confirm('<fmt:message key="default_message_title" />','<fmt:message key="delete_prop" />',function(r){
				if(r) {
					$.messager.progress({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="default_message_progress" />'});
					$.ajax({
						url : url,
						type : 'post',
						dataType : 'json',
						success : function(result) {
							if(result.status == <fmt:message key="default_status_success" />) {
								$('#admin_base_systemmanage_${entityName?lower_case}_index__grid').datagrid('load');
								$.messager.show({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="delete_success_01"><fmt:param><fmt:message key="${entityName}.Object.Name" /></fmt:param></fmt:message>', timeout : <fmt:message key="default_message_timeout"/>});
							} else if (result.status == <fmt:message key="default_status_error" />) {
								$.messager.alert('<fmt:message key="default_message_title" />',result.message);
							} else if (result.status == <fmt:message key="default_status_timeout" />) {
								__timeOut();
							}
						},
						error : function() {
							$.messager.alert('<fmt:message key="default_message_title" />','<fmt:message key="delete_error_01"><fmt:param><fmt:message key="${entityName}.Object.Name" /></fmt:param></fmt:message>');
						},
						complete : function() {
							$.messager.progress('close');
						}
					});
				}
			});
		}
	}

	function admin_base_systemmanage_${entityName?lower_case}_index_enable(enableId) {
		var id;
		if(enableId) {
			id = enableId;
		} else {
			var selected  = $('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('getSelected');
			if(selected)
				id = selected.id;
		}
		if(id) {
			var url = '${r'$'}{ctx}/admin/base/systemmanage/${entityName?lower_case}/enable/' + id;
			$.messager.confirm('<fmt:message key="default_message_title" />','<fmt:message key="enable_prop" />',function(r){
				if(r) {
					$.messager.progress({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="default_message_progress" />'});
					$.ajax({
						url : url,
						type : 'post',
						dataType : 'json',
						success : function(result) {
							if(result.status == <fmt:message key="default_status_success" />) {
								$('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('load');
								$.messager.show({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="enable_success_01"><fmt:param><fmt:message key="${entityName}.Object.Name" /></fmt:param></fmt:message>', timeout : <fmt:message key="default_message_timeout"/>});
							} else if (result.status == <fmt:message key="default_status_error" />) {
								$.messager.alert('<fmt:message key="default_message_title" />',result.message);
							} else if (result.status == <fmt:message key="default_status_timeout" />) {
								__timeOut();
							}
						},
						error : function() {
							$.messager.alert('<fmt:message key="default_message_title" />','<fmt:message key="enable_error_01"><fmt:param><fmt:message key="${entityName}.Object.Name" /></fmt:param></fmt:message>');
						},
						complete : function() {
							$.messager.progress('close');
						}
					});
				}
			});
		}
	}
    
    function admin_base_systemmanage_${entityName?lower_case}_index_lock(lockId) {
        var id;
		if(lockId) {
			id = lockId;
		} else {
			var selected  = $('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('getSelected');
			if(selected)
				id = selected.id;
		}
		if(id) {
			var url = '${r'$'}{ctx}/admin/base/systemmanage/${entityName?lower_case}/lock/' + id;
			$.messager.confirm('<fmt:message key="default_message_title" />','<fmt:message key="lock_prop" />',function(r){
				if(r) {
					$.messager.progress({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="default_message_progress" />'});
					$.ajax({
						url : url,
						type : 'post',
						dataType : 'json',
						success : function(result) {
							if(result.status == <fmt:message key="default_status_success" />) {
								$('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('load');
								$.messager.show({title : '<fmt:message key="default_message_title" />',msg : '<fmt:message key="lock_success_01"><fmt:param><fmt:message key="${entityName}.Object.Name" /></fmt:param></fmt:message>', timeout : <fmt:message key="default_message_timeout"/>});
							} else if (result.status == <fmt:message key="default_status_error" />) {
								$.messager.alert('<fmt:message key="default_message_title" />',result.message);
							} else if (result.status == <fmt:message key="default_status_timeout" />) {
								__timeOut();
							}
						},
						error : function() {
							$.messager.alert('<fmt:message key="default_message_title" />','<fmt:message key="lock_error_01"><fmt:param><fmt:message key="${entityName}.Object.Name" /></fmt:param></fmt:message>');
						},
						complete : function() {
							$.messager.progress('close');
						}
					});
				}
			});
		}
	}

	function admin_base_systemmanage_${entityName?lower_case}_index_view(viewId) {
		var id;
		if(viewId) {
			id = viewId;
		} else {
			var selected  = $('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('getSelected');
			if(selected)
				id = selected.id;
		}
		if(id) {
			var d = $('<div id="admin_base_systemmanage_${entityName?lower_case}_index_viewDialog"/>').dialog({
				href : '${r'$'}{ctx}/admin/base/systemmanage/${entityName?lower_case}/view/' + id,  
				title : '<fmt:message key="detail" /> | <fmt:message key="${entityName}.Object.Name" />',
				width : <fmt:message key="default_dialog_width" />,
				height : <fmt:message key="default_dialog_height" />,
				closed : false,  
				cache : false,  
				modal : true,
				buttons:[
					{text : '<fmt:message key="close" />',iconCls : 'icon-woocons-button-stop',plain : true,handler : function() {d.dialog('close');}}
				],
				onClose:function(){
					d.dialog('destroy');
				}
			});
		}
	}

	function admin_base_systemmanage_${entityName?lower_case}_index_doSearch() {
        //var options = $("#admin_base_systemmanage_${entityName?lower_case}_index_grid").treegrid("options");
		//var params = serializeObject($('#admin_base_systemmanage_${entityName?lower_case}_index_searchForm'));
		//params['sort'] = options.sortName;
		//params['order'] = options.sortOrder;
		//$.post(options.url,params,function(data){
		//	$("#admin_base_systemmanage_${entityName?lower_case}_index__grid").treegrid('loadData',data);
		//},'json');
		$('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('load', serializeObject($('#admin_base_systemmanage_${entityName?lower_case}_index_searchForm')));
	}

	function admin_base_systemmanage_${entityName?lower_case}_index_doReset() {
		$('#admin_base_systemmanage_${entityName?lower_case}_index_searchForm').form('reset');
		$('#admin_base_systemmanage_${entityName?lower_case}_index_grid').datagrid('load',{});
        //doSearch();
	}
    
    function admin_base_systemmanage_${entityName?lower_case}_index_initGridSelColumns() {
        var grid = $('#admin_base_systemmanage_${entityName?lower_case}_index_grid');
    	var selColumns = $('#admin_base_systemmanage_${entityName?lower_case}_index_columns');
    	var gridFields = grid.datagrid('getColumnFields');
    	var gridFieldLength = gridFields.length;
    	var arrays = [];
    	for (var i = 0;i < gridFieldLength; i++) {
			var fieldOption = grid.datagrid('getColumnOption', gridFields[i]);
			if (!fieldOption.hidden) {
				arrays[i] = {value:fieldOption.field,text:fieldOption.title,selected:true};
			} else {
				arrays[i] = {value:fieldOption.field,text:fieldOption.title};
			}
		}
    	selColumns.combobox({
    		editable : false,
			panelHeight : 200,
			valueField : 'value',  
    		textField : 'text',
    		separator : ' ',
    		multiple : true,
    		data : arrays,
    		onSelect : function(rec){
    			grid.datagrid('showColumn', rec.value);
    		},
    		onUnselect : function(rec){
    			grid.datagrid('hideColumn', rec.value);
    		}
    	});
    }
$(function() {
	window.setTimeout(function(){
		admin_base_systemmanage_${entityName?lower_case}_index_initGrid();
        admin_base_systemmanage_${entityName?lower_case}_index_initGridSelColumns();
	},0);
});
</script>
    
    <table id="admin_base_systemmanage_${entityName?lower_case}_index_grid"></table>
    <div id="admin_base_systemmanage_${entityName?lower_case}_index_toolBar" style="height: auto; display: none;">
        <div>
        	<form id="admin_base_systemmanage_${entityName?lower_case}_index_searchForm" method="post">
        		<table class="table_content" width="100%">
                    <tbody>
            			<tr>
            			
            				<#list columns as col>
							<#if !col.isId>
							<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
							<td style="width: 10%;" nowrap="" class="tar"><fmt:message key="${entityName}.${col.camelName}"/>：</td>
            				<td style="width: 23%;" nowrap="" class="tal"><div class="pl_2"><select name="equal${col.fcCamelName}" class="easyui-combobox select_150_20" style="min-width: 150px;width:150px;" data-options="
            					editable : false,
            					panelHeight : 100
            					<%--
            					,data : $.Sys_Enabled_CU,
            					valueField : 'value',  
            					textField : 'text',
            					url:'${r'$'}{ctx}/ajax/diccity/list?equalProvinceCode=340000&enabled=1',
            					onSelect : function(rec) {
            						var url = '${r'$'}{ctx}/ajax/diccounty/list?equalProvinceCode=340000&enabled=1&equalCityCode=' + rec.cityCode;  
            						$('#admin_base_systemmanage_${entityName?lower_case}_index_equalCountyCode').combobox('clear');
            						$('#admin_base_systemmanage_${entityName?lower_case}_index_equalCountyCode').combobox('reload', url);  
            					}
            					--%>
            					">
            					<option value="">--请选择--</option>
            					<option value="1">1</option>
            					<option value="2">2</option>
            					<option value="3">3</option>
            					<option value="4">4</option>
            				</select></div></td>
            				<%--<td  style="width: 23%;" nowrap="" class="tal"><input name="equal${col.fcCamelName}" class="text_150_18" maxlength="10"/></td>--%>
							<#elseif (col.type="VARCHAR")>
							<td style="width: 10%;" nowrap="" class="tar"><fmt:message key="${entityName}.${col.camelName}"/>：</td>
            				<td style="width: 23%;" nowrap="" class="tal">Equal:<input maxlength="50" class="text_150_18" name="equal${col.fcCamelName}"/></td>
            				<td style="width: 23%;" nowrap="" class="tal">Like:<input maxlength="50" class="text_150_18" name="like${col.fcCamelName}"/></td>
							<#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
							<td style="width: 10%;" nowrap="" class="tar"><fmt:message key="${entityName}.${col.camelName}"/>：</td>
            				<td style="width: 23%;" nowrap="" class="tal">Begin:<input name="greaterEqual${col.fcCamelName}" class="text_150_18" readonly="readonly" onclick="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd'})"/>-</td>
            				<td style="width: 23%;" nowrap="" class="tal">Equal:<input name="equal${col.fcCamelName}" class="text_150_18" readonly="readonly" onclick="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd'})"/></td>
            				<td style="width: 23%;" nowrap="" class="tal">-End:<input name="lessEqual${col.fcCamelName}" class="text_150_18" readonly="readonly" onclick="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd'})"/></td>
							</#if>
							</#if>
							</#list>	
            			</tr>
                    </tbody>
        		</table>
            </form>
        </div>
        <div>
        	<div style="float: left">
        		<a id="admin_base_systemmanage_${entityName?lower_case}_index_btnAdd" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-woocons-button-add',plain:true" onclick="admin_base_systemmanage_${entityName?lower_case}_index_preAdd()"><fmt:message key="add" /></a>
        		<%--
        		<a id="admin_base_systemmanage_${entityName?lower_case}_index_btnEdit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-woocons-pencil',plain:true" onclick="admin_base_systemmanage_${entityName?lower_case}_index_preEdit()"><fmt:message key="edit" /></a>
        		<a id="admin_base_systemmanage_${entityName?lower_case}_index_btnDelete" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-woocons-button-remove',plain:true" onclick="admin_base_systemmanage_${entityName?lower_case}_index_doDelete()"><fmt:message key="delete" /></a>
        		<a id="admin_base_systemmanage_${entityName?lower_case}_index_btnView" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-woocons-search',plain:true" onclick="admin_base_systemmanage_${entityName?lower_case}_index_view()"><fmt:message key="detail" /></a>
        		<a id="admin_base_systemmanage_${entityName?lower_case}_index_btnEnable" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-woocons-star-on',plain:true" onclick="admin_base_systemmanage_${entityName?lower_case}_index_enable()"><fmt:message key="enabledisable" /></a>
                <a id="admin_base_systemmanage_${entityName?lower_case}_index_btnLock" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-woocons-lock-closed',plain:true" onclick="admin_base_systemmanage_${entityName?lower_case}_index_lock()"><fmt:message key="lockunlock" /></a>
        		 --%>
        	</div>
        	<div style="float: right;">
                <select id="admin_base_systemmanage_${entityName?lower_case}_index_grid_columns" style="min-width: 150px;width:150px;" class="select_150_20"></select>
        		<a id="admin_base_systemmanage_${entityName?lower_case}_index_btnReset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-woocons-button-load',plain:true" onclick="admin_base_systemmanage_${entityName?lower_case}_index_doReset()"><fmt:message key="reset" /></a>
        		<a id="admin_base_systemmanage_${entityName?lower_case}_index_btnSearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-woocons-search',plain:true" onclick="admin_base_systemmanage_${entityName?lower_case}_index_doSearch()"><fmt:message key="query" /></a>
        	</div>
        	<div style="clear: both;"></div>
        </div>
    </div>
</body>
