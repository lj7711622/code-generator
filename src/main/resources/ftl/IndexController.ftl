/*
 * Author : www.thewk.cn.vc
 * JDK Version : 1.6.0_45
 * Create Date : 2016/7/20
 */
package cn.com.sdic.miacsp.web.admin.base.systemmanage.${entityName?lower_case};

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.sdic.miacsp.base.domain.entity.${entityName}Entity;
import cn.com.sdic.miacsp.base.domain.search.${entityName}Search;
import cn.com.sdic.miacsp.base.mgr.I${entityName}Mgr;
import common.base.BaseController;
import common.constants.I18NConstant;
import common.constants.MyConstants;
import common.domain.model.CrudModel;
import common.domain.model.DataGridModel;
import common.exception.ProjectException;
import common.tostringstyle.MyToStringStyle;

/**
 * Table Name : ${tableName}<br/>
 * Description : ${entityName}
 * <hr/>
 */
@Controller(IndexController.Location + "/IndexController")
@RequestMapping(IndexController.Location)
// TODO Auto Create
public class IndexController extends BaseController {

	public static final String       Location                   = "admin/base/systemmanage/${entityName?lower_case}";
	// 模块
	public static final String  Module           = "admin:${entityName?lower_case}";
	private static final String Index_Page = Location + "/index";
	private static final String View_Page = Location + "/view";
	private static final String Add_Page  = Location + "/add";
	private static final String Edit_Page = Location + "/edit";
	
	@Autowired
	private I${entityName}Mgr mgr;
	
    //@RequiresPermissions(value = Module + ":index")
	@RequestMapping("index")
	// TODO Auto Create
	public String index() {
		return Index_Page;
	}

    //@RequiresPermissions(value = Module + ":list")
	@RequestMapping("list")
    @ResponseBody
	// TODO Auto Create
	public DataGridModel<${entityName}Entity> list(${entityName}Search pageSearch, BindingResult errors) {
		DataGridModel<${entityName}Entity> result;
		String message = null;
		if (errors.hasErrors()) {
			message = this.getMessage(I18NConstant.query_error_01, this.getMessage("${entityName}.Object.Name"));
			result = new DataGridModel<${entityName}Entity>(message);
			return result;
		}
		if (this.log.isDebugEnabled()) {
			this.log.debug("list() PageSearch:" + MyToStringStyle.toString(pageSearch));
		}
        ${entityName}Search dbSearch = this.getDbSearchByPageSearch(pageSearch);
		if (this.log.isDebugEnabled()) {
			this.log.debug("List() DbSearch:" + MyToStringStyle.toString(dbSearch));
		}
		try {
			Long countNum = this.mgr.queryCount_Search_Admin_List(dbSearch);
			if (countNum.longValue() == 0) {
				message = this.getMessage(I18NConstant.query_empty_01, this.getMessage("${entityName}.Object.Name"));
				result = new DataGridModel<${entityName}Entity>(message,true);
			}
			else {
				List<${entityName}Entity> entities = this.mgr.queryList_Search_Admin_List(dbSearch);
				result = new DataGridModel<${entityName}Entity>(entities, countNum);
			}
			
			return result;
		}
		catch (ProjectException pe) {
			pe.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		message = this.getMessage(I18NConstant.query_error_01, this.getMessage("${entityName}.Object.Name"));
		result = new DataGridModel<${entityName}Entity>(message);
		return result;
	}
	
	/**
	 * 从页面的查询对象中,生成一个用于进行数据库查询的对象
	 *
	 * @param pageSearch
	 *        页面显示对象
	 */
	// TODO Auto Create
	private ${entityName}Search getDbSearchByPageSearch(${entityName}Search pageSearch) {
		${entityName}Search dbSearch = new ${entityName}Search();
		<#list columns as col>
		//${col.fcCamelName}
		<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
		//dbSearch.setEqual${col.fcCamelName}(pageSearch.getEqual${col.fcCamelName}());
		//dbSearch.setGreaterEqual${col.fcCamelName}(pageSearch.getGreaterEqual${col.fcCamelName}());
		//dbSearch.setGreaterThan${col.fcCamelName}(pageSearch.getGreaterThan${col.fcCamelName}());
		//dbSearch.setLessEqual${col.fcCamelName}(pageSearch.getLessEqual${col.fcCamelName}());
		//dbSearch.setLessThan${col.fcCamelName}(pageSearch.getLessThan${col.fcCamelName}());
		//dbSearch.setNotEqual${col.fcCamelName}(pageSearch.getNotEqual${col.fcCamelName}());
		//dbSearch.setIn${col.fcCamelName}s(pageSearch.getIn${col.fcCamelName}s());
		//dbSearch.setNotIn${col.fcCamelName}s(pageSearch.getNotIn${col.fcCamelName}s());
		//dbSearch.setIsNull${col.fcCamelName}(pageSearch.getIsNull${col.fcCamelName}());
		//dbSearch.setIsNotNull${col.fcCamelName}(pageSearch.getIsNotNull${col.fcCamelName}());
		<#elseif (col.type="VARCHAR")>
		//dbSearch.setEqual${col.fcCamelName}(pageSearch.getEqual${col.fcCamelName}());
		//dbSearch.setNotEqual${col.fcCamelName}(pageSearch.getNotEqual${col.fcCamelName}());
		//dbSearch.setLike${col.fcCamelName}(pageSearch.getLike${col.fcCamelName}());
		//dbSearch.setNotLike${col.fcCamelName}(pageSearch.getNotLike${col.fcCamelName}());
		//dbSearch.setIn${col.fcCamelName}s(pageSearch.getIn${col.fcCamelName}s());
		//dbSearch.setNotIn${col.fcCamelName}s(pageSearch.getNotIn${col.fcCamelName}s());
		//dbSearch.setIsNull${col.fcCamelName}(pageSearch.getIsNull${col.fcCamelName}());
		//dbSearch.setIsNotNull${col.fcCamelName}(pageSearch.getIsNotNull${col.fcCamelName}());
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
		//dbSearch.setEqual${col.fcCamelName}(pageSearch.getEqual${col.fcCamelName}());
		//dbSearch.setGreaterEqual${col.fcCamelName}(pageSearch.getGreaterEqual${col.fcCamelName}());
		//dbSearch.setGreaterThan${col.fcCamelName}(pageSearch.getGreaterThan${col.fcCamelName}());
		// 如果要包含当天,则需要在pageSearch.getLessEqual${col.fcCamelName}()的基础上加86399秒.因为传过来的都是0点0时0分的时间.
		//dbSearch.setLessEqual${col.fcCamelName}(pageSearch.getLessEqual${col.fcCamelName}());
		//if (pageSearch.getLessEqual${col.fcCamelName}() != null) {
			//dbSearch.setLessEqual${col.fcCamelName}(DateUtils.addSeconds(pageSearch.getLessEqual${col.fcCamelName}(), 86399));
		//}
		//dbSearch.setLessThan${col.fcCamelName}(pageSearch.getLessThan${col.fcCamelName}());
		//dbSearch.setNotEqual${col.fcCamelName}(pageSearch.getNotEqual${col.fcCamelName}());
		//dbSearch.setIsNull${col.fcCamelName}(pageSearch.getIsNull${col.fcCamelName}());
		//dbSearch.setIsNotNull${col.fcCamelName}(pageSearch.getIsNotNull${col.fcCamelName}());
		</#if>
		</#list>
		dbSearch.setRows(pageSearch.getRows());
		dbSearch.setPage(pageSearch.getPage());
		dbSearch.setSort(pageSearch.getSort());
		dbSearch.setOrder(pageSearch.getOrder());
		// dbSearch.setIsRandomOrder(pageSearch.getIsRandomOrder());
		// dbSearch.setIsDistinct(pageSearch.getIsDistinct());
		return dbSearch;
	}

    //@RequiresPermissions(value = Module + ":view")
	@RequestMapping(value = "view/{id}")
	// TODO Auto Create
	public String view(@PathVariable("id") Long id, ModelMap model) {
		if (this.log.isDebugEnabled()) {
			this.log.debug("view() id:" + id);
		}
		try {
			${entityName}Entity entity = this.mgr.getEntity_Admin_View(id);
			if (entity == null) {
				model.put(MESSAGE, this.getMessage(I18NConstant.get_error_01, this.getMessage("${entityName}.Object.Name")));
				return View_Page;
			}
			model.put("${entityName}Entity", entity);
			if (this.log.isDebugEnabled()) {
				this.log.debug("view() 返回的实体:" + MyToStringStyle.toString(entity));
			}
			// 这里是成功的返回
			return View_Page;
		}
		catch (ProjectException ex) {
			ex.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		model.put(MESSAGE, this.getMessage(I18NConstant.get_error_01, this.getMessage("${entityName}.Object.Name")));
		return View_Page;
	}

    //@RequiresPermissions(value = Module + ":add")
	@RequestMapping(method = RequestMethod.GET, value = "add")
	// TODO Auto Create
	public String preAdd() {
    
		return Add_Page;
	}

    //@RequiresPermissions(value = Module + ":add")
	@RequestMapping(method = RequestMethod.POST, value = "add")
    @ResponseBody
	// TODO Auto Create
	public CrudModel<${entityName}Entity> doAdd(${entityName}Entity pageEntity, BindingResult errors) {
		CrudModel<${entityName}Entity> result = null;
		String message = null;
		if (errors.hasErrors()) {
			for (ObjectError objectError : errors.getAllErrors()) {
				message = this.getMessage(objectError.getCode(), objectError.getArguments());
				result = new CrudModel<${entityName}Entity>(message);
				return result;
			}
		}
		if (this.log.isDebugEnabled()) {
			this.log.debug("doAdd() pageEntity:" + MyToStringStyle.toString(pageEntity));
		}
		message = this.validateAddEntity(pageEntity);
		if (StringUtils.isNotBlank(message)) {
			result = new CrudModel<${entityName}Entity>(message);
			return result;
		}
		try {
			${entityName}Entity addEntity = this.getAddEntityByPageEntity(pageEntity);
			addEntity.setCreatorId(this.getSessionAdmin().getId());
			Long addResult = this.mgr.add(addEntity);
			
			if (addResult <= Long.valueOf(0)) {
				if(addResult == Long.valueOf(-1)){
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				} 
				else if (addResult == Long.valueOf(-2)){
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				}
                else if (addResult == Long.valueOf(-3)){
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				}
				result = new CrudModel<${entityName}Entity>(message);
				return result;
			}
            
			result = new CrudModel<${entityName}Entity>(addEntity);
			return result;
		}
		catch (ProjectException pe) {
			pe.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		message = this.getMessage(I18NConstant.add_error_01,this.getMessage("${entityName}.Object.Name"));
		result = new CrudModel<${entityName}Entity>(message);
		return result;
	}
	
	private ${entityName}Entity getAddEntityByPageEntity(${entityName}Entity pageEntity) {
		${entityName}Entity addEntity = new ${entityName}Entity();
		<#list columns as col>
		addEntity.set${col.fcCamelName}(pageEntity.get${col.fcCamelName}());//${col.fcCamelName}
		</#list>
		return addEntity;
	}
	
	/**
	 * 验证新增页面的逻辑
	 */
	// TODO Auto Create
	private String validateAddEntity(${entityName}Entity entity) {
		<#list columns as col>
		<#if !col.isId>
		<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
		if (entity.get${col.fcCamelName}() == null) {
			return this.getMessage(I18NConstant.blank_01, this.getMessage("${entityName}.${col.camelName}"));
		}
		<#elseif (col.type="VARCHAR")>
		if (StringUtils.isBlank(entity.get${col.fcCamelName}())) {
			return this.getMessage(I18NConstant.blank_01, this.getMessage("${entityName}.${col.camelName}"));
		}
		<#elseif (col.type="TIMESTAMP" || col.type="DATETIME" || col.type="DATE")>
		if (entity.get${col.fcCamelName}() == null) {
			return this.getMessage(I18NConstant.blank_01, this.getMessage("${entityName}.${col.camelName}"));
		}
		</#if>
		</#if>
		</#list>
		return null;
	}

    //@RequiresPermissions(value = Module + ":edit")
	@RequestMapping(method = RequestMethod.GET, value = "edit/{id}")
	// TODO Auto Create
	public String preEdit(@PathVariable("id") Long id, ModelMap model) {
		if (this.log.isDebugEnabled()) {
			this.log.debug("preEdit() id:" + id);
		}
		try {
			${entityName}Entity entity = this.mgr.getEntity_Admin_Edit(id);
			if (entity == null) {
				model.put(MESSAGE, this.getMessage(I18NConstant.get_error_01, this.getMessage("${entityName}.Object.Name")));
				return Edit_Page;
			}
			model.put("${entityName}Entity", entity);
			if (this.log.isDebugEnabled()) {
				this.log.debug("preEdit() 返回的实体:" + MyToStringStyle.toString(entity));
			}
			// 这里是成功的返回
			return Edit_Page;
		}
		catch (ProjectException ex) {
			ex.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		model.put(MESSAGE, this.getMessage(I18NConstant.get_error_01, this.getMessage("${entityName}.Object.Name")));
		return Edit_Page;
	}

    //@RequiresPermissions(value = Module + ":edit")
	@RequestMapping(method = RequestMethod.POST, value = "edit/{id}")
    @ResponseBody
	// TODO Auto Create
	public CrudModel<${entityName}Entity> doEdit(@PathVariable("id") Long id,${entityName}Entity pageEntity,BindingResult errors) {
		CrudModel<${entityName}Entity> result = null;
		String message = null;
		if (errors.hasErrors()) {
			for (ObjectError objectError : errors.getAllErrors()) {
				message = this.getMessage(objectError.getCode(), objectError.getArguments());
				result = new CrudModel<${entityName}Entity>(message);
				return result;
			}
		}
		if (this.log.isDebugEnabled()) {
			this.log.debug("doEdit() pageEntity:" + MyToStringStyle.toString(pageEntity));
		}
        ${entityName}Entity dbEntity = this.mgr.getEntity_Admin_Edit(id);
		if (dbEntity == null) {
			message = this.getMessage(I18NConstant.get_error_01, this.getMessage("${entityName}.Object.Name"));
            result = new CrudModel<${entityName}Entity>(message);
			return result;
		}
        pageEntity.setId(id);
		message = this.validateEditEntity(pageEntity, dbEntity);
		if (StringUtils.isNotBlank(message)) {
			result = new CrudModel<${entityName}Entity>(message);
			return result;
		}
		try {
			${entityName}Entity editEntity = this.getEditEntityByPageEntity(pageEntity,dbEntity);
			editEntity.setUpdaterId(this.getSessionAdmin().getId());
			Long editResult = this.mgr.edit(editEntity);
			if (editResult <= Long.valueOf(0)) {
				if(editResult == Long.valueOf(-1)){
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				} 
				else if (editResult == Long.valueOf(-2)){
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				}
                else if (editResult == Long.valueOf(-3)){
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				}
				result = new CrudModel<${entityName}Entity>(message);
				return result;
			}
			result = new CrudModel<${entityName}Entity>();
			return result;
		}
		catch (ProjectException pe) {
			pe.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		message = this.getMessage(I18NConstant.edit_error_01,this.getMessage("${entityName}.Object.Name"));
		result = new CrudModel<${entityName}Entity>(message);
		return result;
	}
	
	private ${entityName}Entity getEditEntityByPageEntity(${entityName}Entity pageEntity,${entityName}Entity dbEntity) {
	    ${entityName}Entity editEntity = new ${entityName}Entity();
	    <#list columns as col>
		editEntity.set${col.fcCamelName}(pageEntity.get${col.fcCamelName}());//${col.fcCamelName}
		</#list>
		return editEntity;
    }
	
	/**
	 * 验证编辑页面的逻辑
	 */
	// TODO Auto Create
	private String validateEditEntity(${entityName}Entity entity, ${entityName}Entity dbEntity) {
		<#list columns as col>
		<#if (col.type="BIGINT" || col.type="INT" || col.type="DOUBLE")>
		if (entity.get${col.fcCamelName}() == null) {
			return this.getMessage(I18NConstant.blank_01, this.getMessage("${entityName}.${col.camelName}"));
		}
		<#elseif (col.type="VARCHAR")>
		if (StringUtils.isBlank(entity.get${col.fcCamelName}())) {
			return this.getMessage(I18NConstant.blank_01, this.getMessage("${entityName}.${col.camelName}"));
		}
		</#if>
		</#list>
		return null;
	}

    //@RequiresPermissions(value = Module + ":delete")
	@RequestMapping(method = RequestMethod.POST, value = "delete/{id}")
     @ResponseBody
	// TODO Auto Create
	public CrudModel<${entityName}Entity> doDelete(@PathVariable("id") Long id) {
		if (this.log.isDebugEnabled()) {
			this.log.debug("delete() id:" + id);
		}
		CrudModel<${entityName}Entity> result = null;
		String message = "";
		try {
			Long deleteResult = this.mgr.delete(id);
			if (deleteResult < Long.valueOf(0)) {
				if (deleteResult == Long.valueOf(-1)) {
					message = this.getMessage(I18NConstant.delete_error_01,this.getMessage("${entityName}.Object.Name"));
				}
				else if (deleteResult == Long.valueOf(-2)) {
					message = this.getMessage(I18NConstant.delete_error_01,this.getMessage("${entityName}.Object.Name"));
				}
				else if (deleteResult == Long.valueOf(-3)) {
					message = this.getMessage(I18NConstant.delete_error_01,this.getMessage("${entityName}.Object.Name"));
				}
				result = new CrudModel<${entityName}Entity>(message);
				return result;
			}
			result = new CrudModel<${entityName}Entity>();
			return result;
		}
		catch (ProjectException pe) {
			pe.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		message = this.getMessage(I18NConstant.delete_error_01,this.getMessage("${entityName}.Object.Name"));
		result = new CrudModel<${entityName}Entity>(message);
		return result;
	}
    
    //@RequiresPermissions(value = Module + ":enable")
    @RequestMapping(method = RequestMethod.POST, value = "enable/{id}")
     @ResponseBody
	// TODO Auto Create
	public CrudModel<${entityName}Entity> changeEnableStatus(@PathVariable("id") Long id, ModelMap model, HttpSession session) {
		CrudModel<${entityName}Entity> result = null;
		String message = null;
		try {
			${entityName}Entity editEntity = this.mgr.getEntity_Pk_Auto(id,1);
			if (editEntity == null) {
				message = this.getMessage(I18NConstant.get_error_01, this.getMessage("${entityName}.Object.Name"));
				result = new CrudModel<${entityName}Entity>(message);
				return result;
			}
			editEntity.setUpdaterId(this.getSessionAdmin().getId());
            int enableStatus = editEntity.getEnableStatus().intValue() == MyConstants.Sys_Enabled.Yes ? MyConstants.Sys_Enabled.No : MyConstants.Sys_Enabled.Yes;
			Long editResult = this.mgr.editEnable(editEntity,enableStatus);
			if (editResult <= Long.valueOf(0)) {
				if (editResult == Long.valueOf(-1)) {
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				}
				else if (editResult == Long.valueOf(-2)) {
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				}
				result = new CrudModel<${entityName}Entity>(message);
				return result;
			}
			result = new CrudModel<${entityName}Entity>();
			return result;
		}
		catch (ProjectException pe) {
			pe.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		message = this.getMessage(I18NConstant.enable_error_01, this.getMessage("${entityName}.Object.Name"));
		result = new CrudModel<${entityName}Entity>(message);
		return result;
	}
    
    //@RequiresPermissions(value = Module + ":lock")
    @RequestMapping(method = RequestMethod.POST, value = "lock/{id}")
     @ResponseBody
	// TODO Auto Create
	public CrudModel<${entityName}Entity> changeLockStatus(@PathVariable("id") Long id, ModelMap model, HttpSession session) {
		CrudModel<${entityName}Entity> result = null;
		String message = null;
		try {
			${entityName}Entity editEntity = this.mgr.getEntity_Pk_Auto(id,1);
			if (editEntity == null) {
				message = this.getMessage(I18NConstant.get_error_01, this.getMessage("${entityName}.Object.Name"));
				result = new CrudModel<${entityName}Entity>(message);
				return result;
			}
			editEntity.setUpdaterId(this.getSessionAdmin().getId());
            int lockStatus = editEntity.getLockStatus().intValue() == MyConstants.Sys_Locked.Yes ? MyConstants.Sys_Locked.No : MyConstants.Sys_Locked.Yes;
			Long editResult = this.mgr.editLock(editEntity,lockStatus);
			if (editResult <= Long.valueOf(0)) {
				if (editResult == Long.valueOf(-1)) {
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				}
				else if (editResult == Long.valueOf(-2)) {
					message = this.getMessage(I18NConstant.exsit_01, this.getMessage("${entityName}."));
				}
				result = new CrudModel<${entityName}Entity>(message);
				return result;
			}
			result = new CrudModel<${entityName}Entity>();
			return result;
		}
		catch (ProjectException pe) {
			pe.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		message = this.getMessage(I18NConstant.lock_error_01, this.getMessage("${entityName}.Object.Name"));
		result = new CrudModel<${entityName}Entity>(message);
		return result;
	}
}