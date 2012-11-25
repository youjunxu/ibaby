package com.ibaby.www.dao.impl;

import com.ibaby.www.dao.QueryParams;
import com.ibaby.www.dao.TagDao;
import com.ibaby.www.domain.valuetypes.Article;
import com.ibaby.www.domain.valuetypes.Tag;
import com.ibatis.sqlmap.client.SqlMapExecutor;
import com.lhq.prj.bms.po.BaType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentMap;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-19
 * Time: AM11:04
 * To change this template use File | Settings | File Templates.
 */
public class TagDaoImpl extends SqlMapClientDaoSupport implements TagDao {

    private final static Logger LOGGER = LoggerFactory.getLogger(TagDaoImpl.class);

    public List<Tag> where(QueryParams queryParams) {
        return (List<Tag>)getSqlMapClientTemplate().queryForList("Tag.where", queryParams);
    }

    public List<Tag> all() {
        return (List<Tag>)getSqlMapClientTemplate().queryForList("Tag.all");
    }

    public Integer count() {
        return (Integer)getSqlMapClientTemplate().queryForObject("Tag.count");
    }

    //CREATE
    public int save(Map<String, Object> tag){
        return (Integer)getSqlMapClientTemplate().insert("Tag.save", tag);
    }

    //DELETE
    public int delete(int id){
        return getSqlMapClientTemplate().delete("Tag.delete", id);
    }

    //UPDATE
    public int update(Map<String, Object> tag){
        return getSqlMapClientTemplate().update("Tag.update", tag);
    }

    //QUERY
    public Tag find(int id){
        return (Tag)getSqlMapClientTemplate().queryForObject("Tag.find", id);
    }


    public List<BaType> findCatalogs(QueryParams queryParams) {
        return (List<BaType>)getSqlMapClientTemplate().queryForList("Tag.findCatalogs", queryParams);
    }

    public int articleCount(ConcurrentMap<String, Object> params) {
        params.putIfAbsent("table_name", "tb_lmbaxy");
        return count(params, Article.class);
    }

    public List<Article> findArticles(ConcurrentMap<String, Object> params) {
        params.putIfAbsent("table_name", "tb_lmbaxy");
        return find(params, Article.class);
    }

    public <T> List<T> find(ConcurrentMap<String, Object> params, Class<T> clazz){
        String taggableType = clazz.getSimpleName();
        params.putIfAbsent("taggable_type", taggableType);
        params.putIfAbsent("table_name", "tb_" + taggableType);
        LOGGER.debug("Query tagging for {} with params : {}", taggableType, params);
        return (List<T>)getSqlMapClientTemplate().queryForList(taggableType + ".where_with_tag", params);
    }

    public <T> int count(ConcurrentMap<String, Object> params, Class<T> clazz){
        String taggableType = clazz.getSimpleName();
        params.putIfAbsent("taggable_type", taggableType);
        params.putIfAbsent("table_name", "tb_" + taggableType);
        LOGGER.debug("Query tagging count for {} with params : {}", taggableType, params);
        return (Integer)getSqlMapClientTemplate().queryForObject(taggableType + ".count_with_tag", params);
    }

    public void tagging(int taggableId, String taggableType, List<Integer> tags){
        for(Integer tag : tags){
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("taggable_id", taggableId);
            map.put("taggable_type", taggableType);
            map.put("tag_id", tag);
            getSqlMapClientTemplate().insert("Tag.tagging", map);
        }
    }

}
