package jugg.codegenerator;

import jugg.codegenerator.bean.Table;
import jugg.codegenerator.config.GeneratorConfig;
import jugg.codegenerator.enums.ModuleEnum;
import jugg.codegenerator.util.FreemarkerUtil;
import jugg.codegenerator.util.JdbcUtil;
import jugg.codegenerator.util.PropertiesUtils;

import java.io.File;
import java.util.HashMap;
import java.util.logging.Logger;

/**
 * Hello world!
 */
public class App {

    private static Logger logger = Logger.getLogger(App.class.getName());
    /**
     * @param args
     */
    public static void main(String[] args) {
        //config_ts3interface
        //config_ts3
        PropertiesUtils.init("/config_ts3interface.properties");
        //hita_nest
        //ht_fund_change
        //ht_exchange_rate
        //ht_merchant_order
        //hn_counter
        //hn_coupon
        String[] tNames = new String[]{"hn_coupon"};
        //,"ht_fund_change","ht_fund_liq","ht_fund_settle"};
        for (String tName : tNames) {
            generateForTable(tName);
        }
    }

    public static void generateForTable(String tName) {
        Table table = JdbcUtil.getTablesInfo(GeneratorConfig.DB_NAME, null, tName);
        HashMap map = new HashMap();
        map.put("packagePrefix", GeneratorConfig.PACKAGE_PREFIX);
        map.put("daoPrefix", GeneratorConfig.DAO_PREFIX);
        map.put("entityPrefix", GeneratorConfig.ENTITY_PREFIX);
        map.put("searchPrefix", GeneratorConfig.ENTITY_PREFIX);
        map.put("entityName", table.getFcCamelName());
        map.put("columns", table.getColumns());
        map.put("tableName", table.getName());
        map.put("pkName", table.getPkName());
        map.put("pkCameName", table.getPkCameName());

        for (String module : GeneratorConfig.GEN_MODULES) {
            switch (ModuleEnum.valueOf(module.toUpperCase())) {
                case DAO:
                    genDao(table, map);
                    break;
                case ENTITY:
                    genEntity(table, map);
                    break;
                case MAPPER:
                    genMapper(table, map);
                    break;
                case SEARCH:
                    genSearch(table, map);
                    break;
            }
        }
    }

    private static void genDao(Table table, HashMap map) {
        logger.info("genDao");
        FreemarkerUtil.createFile(GeneratorConfig.DAO_TEMPLATE,map,GeneratorConfig.PROJECT_PATH + GeneratorConfig.JAVA_CODE_PATH_PREFIX + File.separator + GeneratorConfig.DAO_PREFIX.replaceAll("\\.", "/") + File.separator + table.getFcCamelName() + "Dao.java");
    }

    private static void genMapper(Table table, HashMap map) {
        logger.info("genMapper");
        FreemarkerUtil.createFile(GeneratorConfig.MAPPER_TEMPLATE, map, GeneratorConfig.PROJECT_PATH + GeneratorConfig.JAVA_CODE_PATH_PREFIX + File.separator + GeneratorConfig.DAO_PREFIX.replaceAll("\\.", "/") + File.separator + table.getFcCamelName() + ".xml");
    }

    private static void genEntity(Table table, HashMap map) {
        logger.info("genEntity");
        FreemarkerUtil.createFile(GeneratorConfig.ENTITY_TEMPLATE, map, GeneratorConfig.PROJECT_PATH + GeneratorConfig.JAVA_CODE_PATH_PREFIX + File.separator + GeneratorConfig.ENTITY_PREFIX.replaceAll("\\.", "/") + File.separator + table.getFcCamelName() + "Entity.java");
    }

    private static void genSearch(Table table, HashMap map) {
        logger.info("genSearch");
        FreemarkerUtil.createFile(GeneratorConfig.SEARCH_TEMPLATE, map, GeneratorConfig.PROJECT_PATH + GeneratorConfig.JAVA_CODE_PATH_PREFIX + File.separator + GeneratorConfig.SEARCH_PREFIX.replaceAll("\\.", "/") + File.separator + table.getFcCamelName() + "Search.java");
    }
}
