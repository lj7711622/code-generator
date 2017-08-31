package jugg.codegenerator.util;
import static java.sql.Types.*;
public class JdbcTypeConv {

	public static Class<?> jdbcType2JavaType(int dataType) {
		switch (dataType) {
			case BIGINT :
				return Long.class;
			case BINARY :
				return byte[].class;
			case BIT :
				return Boolean.class;
			case BLOB :
				return byte[].class;
			case CHAR :
				return String.class;
			case CLOB :
				return String.class;
			case DATE :
				return java.util.Date.class;
			case DECIMAL :
				return java.math.BigDecimal.class;
			case DOUBLE :
				return java.lang.Double.class;
			case FLOAT :
				return java.lang.Double.class;
			case INTEGER :
				return java.lang.Integer.class;
			case JAVA_OBJECT :
				return java.lang.Object.class;
			case LONGVARBINARY :
				return byte[].class;
			case LONGVARCHAR :
				return java.lang.String.class;
			case NUMERIC :
				return java.math.BigDecimal.class;
			case OTHER :
				return java.lang.Object.class;
			case REAL :
				return java.lang.Float.class;
			case SMALLINT :
				return java.lang.Integer.class;
			case TIME :
				return java.util.Date.class;
			case TIMESTAMP :
				return java.util.Date.class;
			case TINYINT :
				return java.lang.Byte.class;
			case VARBINARY :
				return byte[].class;
			case VARCHAR :
				return java.lang.String.class;
			default :
				break;
		}
		return null;
	}

	/*
	 * public int javaType2JdbcType(Class<?> javaType){
	 * 
	 * }
	 */
	
	public static void main(String[] args) {
		Class<?> type = jdbcType2JavaType(-5);
		System.out.println(type);
	}
}
