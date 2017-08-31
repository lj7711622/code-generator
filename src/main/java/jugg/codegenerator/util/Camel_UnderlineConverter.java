package jugg.codegenerator.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Camel_UnderlineConverter {
	public static String captureName(String name) {
		   //     name = name.substring(0, 1).toUpperCase() + name.substring(1);
//		        return  name;
		        char[] cs=name.toCharArray();
		        cs[0]-=32;
		        return String.valueOf(cs);
		        
		    }
	public static String camel4underline(String param) {
		Pattern p = Pattern.compile("[A-Z]");
		if (param == null || param.equals("")) {
			return "";
		}
		StringBuilder builder = new StringBuilder(param);
		Matcher mc = p.matcher(param);
		int i = 0;
		while (mc.find()) {
			builder.replace(mc.start() + i, mc.end() + i,
					"_" + mc.group().toLowerCase());
			i++;
		}

		if ('_' == builder.charAt(0)) {
			builder.deleteCharAt(0);
		}
		return builder.toString();
	}
	public static String underline2camel(String param) {
		Pattern p = Pattern.compile("_[a-z]|_[0-9]");
		if (param == null || param.equals("")) {
			return "";
		}
		StringBuilder builder = new StringBuilder(param);
		Matcher mc = p.matcher(param.toLowerCase());
		int i = 0;
		while (mc.find()) {
			builder.replace(mc.start() - i, mc.end() - i,
					mc.group(0).substring(1).toUpperCase());
			i++;
		}

		return builder.toString();
	}
	public static void main(String[] args) {
		System.out.println(underline2camel("SAY_HELLO_WORLD".toLowerCase()));
	}
}
