package jugg.codegenerator.config;

import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: jun.lei@counect.com
 * Date: 2017-08-14
 * Time: 13:19
 */
public class GeneratorConfig {
//    packagePrefix=com.counect.hita.ts
//    daoPrefix=com.counect.hita.ts.dubboxEntity
//    entityPrefix=com.counect.hita.ts.dubboxEntity
//    projectPath=H:\\sts workspace\\ts3interface
//    pathPrefix=\\src\\main\\java
//    genModules=entity,search
//    daoTemplate=/counect/Dao.ftl
//    mapperTemplate=/counect/Mapper1.ftl
//    entityTemplate=/counect/Entity1.ftl
//    searchTemplate=/counect/Search1.ftl
    public static String DB_NAME;
    public static String PACKAGE_PREFIX;
    public static String DAO_PREFIX;
    public static String ENTITY_PREFIX;
    public static String SEARCH_PREFIX;
    public static String PROJECT_PATH;
    public static String JAVA_CODE_PATH_PREFIX;
    public static Set<String> GEN_MODULES;
    public static String DAO_TEMPLATE;
    public static String MAPPER_TEMPLATE;
    public static String ENTITY_TEMPLATE;
    public static String SEARCH_TEMPLATE;
}
