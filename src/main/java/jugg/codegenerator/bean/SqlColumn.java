package jugg.codegenerator.bean;

import jugg.codegenerator.util.Camel_UnderlineConverter;

public class SqlColumn {

	
	private String name;//数据库列名 login_name
	
	private String camelName;//驼峰命名法 loginName
	
	private String fcCamelName;//驼峰首字母大写 LoginName
	
	private String type;//类型 BIGINT VARCHAR DATETIME ETC
	
	private Class<?> javaType;
	
	private boolean isId = false;//是否是主键

	private boolean isAutoincrement = false;
	
	private String remarks;//注释

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean getIsId() {
		return isId;
	}

	public void setIsId(boolean isId) {
		this.isId = isId;
	}

	public Class<?> getJavaType() {
		return javaType;
	}

	public void setJavaType(Class<?> javaType) {
		this.javaType = javaType;
	}

	public boolean getIsAutoincrement() {
		return isAutoincrement;
	}

	public void setIsAutoincrement(boolean autoincrement) {
		isAutoincrement = autoincrement;
	}
}
