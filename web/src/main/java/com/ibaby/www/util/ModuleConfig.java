package com.ibaby.www.util;

import com.ibaby.www.domain.service.TagService;
import com.lhq.prj.bms.po.BaType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-23
 * Time: PM6:26
 * To change this template use File | Settings | File Templates.
 */
public class ModuleConfig {

    private static final Logger LOGGER = LoggerFactory.getLogger(ModuleConfig.class);

    private static Map<String, Integer> s_name2id = null;
    private static Map<Integer, String> s_id2name = new ConcurrentHashMap<Integer, String>();

    public static void load(TagService tagService) {
        if (s_name2id == null) {
            synchronized (s_id2name) {
                if (s_name2id == null) {
                    s_name2id = new ConcurrentHashMap<String, Integer>();
                    List<BaType> modules = tagService.findCatalogs("");
                    if (modules == null || modules.size() < 1) {
                        throw new IllegalStateException("Can't init the module info of your database, please check your database status.");
                    }
                    for (BaType module : modules) {
                        s_name2id.put(module.getLmName(), module.getLmId());
                        s_id2name.put(module.getLmId(), module.getLmName());
                        LOGGER.info("Load module {} => {}", module.getLmId(), module.getLmName());
                    }
                }
            }
        }
    }

    public static String moduleName(Integer id) {
        String name = s_id2name.get(id);
        if(name == null){
            return s_id2name.get(6);
        }
        return name;
    }

    public static Map<String, Integer> modules(int type){
        switch (type){
            case 1: //Leyuan
                return s_name2id;
            case 2: //Xueyuan
                return s_name2id;
            default:
                return s_name2id;
        }
    }
}
