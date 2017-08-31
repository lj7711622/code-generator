
package ${packagePrefix}.entity;

import ${packagePrefix}.entity.Auto${entityName}Search;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
// TODO Auto Create
public class ${entityName}Search extends Auto${entityName}Search {

	// ------------------- 构造器 ------------------------
	public ${entityName}Search() {
		super(Default_Rows, Default_Page, Default_Sort, Default_Order, Default_Switch_Flag);
	}
	
	public ${entityName}Search(int switchFlag) {
		super(Default_Rows, Default_Page, Default_Sort, Default_Order, switchFlag);
	}

	public ${entityName}Search(int pageSize, int currentPage) {
		super(pageSize, currentPage, Default_Sort, Default_Order, Default_Switch_Flag);
	}
	
	public ${entityName}Search(int pageSize, int currentPage,int switchFlag) {
		super(pageSize, currentPage, Default_Sort, Default_Order, switchFlag);
	}

	public ${entityName}Search(String orderField, String orderType) {
		super(Default_Rows, Default_Page, orderField, orderType, Default_Switch_Flag);
	}

	public ${entityName}Search(String orderField, String orderType, int switchFlag) {
		super(Default_Rows, Default_Page, orderField, orderType, switchFlag);
	}

	public ${entityName}Search(int pageSize, int currentPage, String orderField, String orderType) {
		super(pageSize, currentPage, orderField, orderType,Default_Switch_Flag);
	}
	
	public ${entityName}Search(int pageSize, int currentPage, String orderField, String orderType, int switchFlag) {
		super(pageSize, currentPage, orderField, orderType,switchFlag);
	}
}
