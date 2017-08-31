package jugg.codegenerator.util;

public class ClassPathFileReader {

	public java.net.URL getResource(String name) {  
		return ClassPathFileReader.class.getClassLoader().getResource(name);  
	}
}
