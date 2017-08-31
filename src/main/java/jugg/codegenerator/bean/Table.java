package jugg.codegenerator.bean;

import jugg.codegenerator.util.Camel_UnderlineConverter;

import java.util.List;

public class Table {

	private String name;//表名
	
	private String camelName;//驼峰名
	
	private String fcCamelName;//首字母大写驼峰名
	
	private String remarks;//备注
	
	private String pkName;//主键 列名

	private String pkCameName;//主键驼峰名

	private String autoincrementName;//自增列明
	
	private List<SqlColumn> columns;//列

	public String getPkName() {
		return pkName;
	}

	public void setPkName(String pkName) {
		this.pkName = pkName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
		this.camelName = Camel_UnderlineConverter.underline2camel(name);
		this.fcCamelName = Camel_UnderlineConverter.captureName(this.camelName);
	}

	public String getCamelName() {
		return camelName;
	}

	public void setCamelName(String camelName) {
		this.camelName = camelName;
	}

	public String getFcCamelName() {
		return fcCamelName;
	}

	public void setFcCamelName(String fcCamelName) {
		this.fcCamelName = fcCamelName;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public List<SqlColumn> getColumns() {
		return columns;
	}

	public void setColumns(List<SqlColumn> columns) {
		this.columns = columns;
	}

	public String getAutoincrementName() {
		return autoincrementName;
	}

	public void setAutoincrementName(String autoincrementName) {
		this.autoincrementName = autoincrementName;
	}

	public String getPkCameName() {
		return pkCameName;
	}

	public void setPkCameName(String pkCameName) {
		this.pkCameName = pkCameName;
	}
}
