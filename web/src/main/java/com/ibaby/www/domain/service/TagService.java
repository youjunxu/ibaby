package com.ibaby.www.domain.service;

import com.ibaby.www.dao.QueryParams;
import com.ibaby.www.dao.QueryParamsBuilder;
import com.ibaby.www.dao.TagDao;
import com.ibaby.www.domain.valuetypes.Article;
import com.ibaby.www.domain.valuetypes.Tag;
import com.ibaby.www.util.ModuleConfig;
import com.lhq.prj.bms.po.BaType;
import com.lhq.prj.bms.po.LmBaxy;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;


/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-19
 * Time: PM5:32
 * To change this template use File | Settings | File Templates.
 */
public class TagService implements InitializingBean{

    private static ModuleConfig s_moduleConfig;

    private TagDao tagDao;

    public void setTagDao(TagDao dao) {
        this.tagDao = dao;
    }


    public List<Tag> tagsByParentId(int parentId) {
        return tagDao.where(new QueryParamsBuilder()
                .where("parent_id = " + parentId)
                .build());
    }

    public Integer count(){
        return tagDao.count();
    }

    public List<Tag> all() {
        return tagDao.all();
    }


    public int save(Map<String, Object> tag){
        return tagDao.save(tag);
    }


    public boolean delete(int id){
        return tagDao.delete(id) > 0;
    }

    public int update(Map<String, Object> tag){
        return tagDao.update(tag);
    }


    public Tag find(int id){
        return tagDao.find(id);
    }


    public List<Tag> search(String search, Integer moduleId) {
        QueryParamsBuilder builder = new QueryParamsBuilder();
        builder.where("name like '%" + (search == null ? "" : search) + "%'");
        if(moduleId > 0){
             builder.and("catalog_id = " + moduleId);
        }
        return where(builder.build());
    }

    public List<Tag> where(QueryParams queryParams) {
        return tagDao.where(queryParams);
    }

    public List<BaType> findCatalogs(String search){
        return tagDao.findCatalogs(new QueryParamsBuilder()
                .where("lmname like '%" + (search == null ? "" : search) + "%'")
                .build());
    }

    public List<Tag> findTagsByGroup(int id){
        return where(new QueryParamsBuilder().where("catalog_id in (" + id + ")").build());
    }

    public List<Article> findArticles(int tagId, int start, int limit){
        ConcurrentMap<String, Object> map = new ConcurrentHashMap<String, Object>();
        map.put("tag_id", tagId);
        map.put("start", start);
        map.put("limit", limit);
        return tagDao.findArticles(map);
    }

    public List<Article> findArticles(int tagId){
        ConcurrentMap<String, Object> map = new ConcurrentHashMap<String, Object>();
        map.put("tag_id", tagId);
        return tagDao.findArticles(map);
    }

    public int articleCount(int tagId){
        ConcurrentMap<String, Object> map = new ConcurrentHashMap<String, Object>();
        map.put("tag_id", tagId);
        return tagDao.articleCount(map);
    }

    public void tagging(int taggableId, String taggableType, List<Integer> tags){
        tagDao.tagging(taggableId, taggableType, tags);
    }

    public void afterPropertiesSet(){
        ModuleConfig.load(this);
    }

}
