package jugg.codegenerator.util;

import jugg.codegenerator.config.GeneratorConfig;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Properties;

public class PropertiesUtils {

    private static Properties prop = new Properties();

    public static void init(String propFilePath){
        //"/config_ts3.properties"
        InputStream in = Object.class.getResourceAsStream(propFilePath);
        try {
            prop.load(in);
            GeneratorConfig.DB_NAME =prop.getProperty("dbName","");
            GeneratorConfig.PACKAGE_PREFIX = prop.getProperty("packagePrefix","");
            GeneratorConfig.DAO_PREFIX = prop.getProperty("daoPrefix","");
            GeneratorConfig.ENTITY_PREFIX = prop.getProperty("entityPrefix","");
            GeneratorConfig.SEARCH_PREFIX = prop.getProperty("searchPrefix","");
            GeneratorConfig.PROJECT_PATH = prop.getProperty("projectPath","");
            GeneratorConfig.JAVA_CODE_PATH_PREFIX = prop.getProperty("pathPrefix","");
            GeneratorConfig.GEN_MODULES = new HashSet<String>(){};
            for(String module : prop.getProperty("genModules","").split(",")){
                GeneratorConfig.GEN_MODULES.add(module);
            }
            GeneratorConfig.DAO_TEMPLATE = prop.getProperty("daoTemplate","");
            GeneratorConfig.MAPPER_TEMPLATE = prop.getProperty("mapperTemplate","");
            GeneratorConfig.ENTITY_TEMPLATE = prop.getProperty("entityTemplate","");
            GeneratorConfig.SEARCH_TEMPLATE = prop.getProperty("searchTemplate","");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getProp(String key) {
        return prop.getProperty(key).trim();
    }

    private PropertiesUtils() {
    }

}
