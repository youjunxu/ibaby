package com.ibaby.www.dao;

import com.ibaby.www.domain.valuetypes.Article;
import com.ibaby.www.domain.valuetypes.Tag;
import com.lhq.prj.bms.po.BaType;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentMap;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-19
 * Time: AM11:05
 * To change this template use File | Settings | File Templates.
 */
public interface TagDao {

    List<Tag> where(QueryParams queryParams);

    List<Tag> all();

    Integer count();

    int save(Map<String, Object> tag);

    int delete(int id);

    int update(Map<String, Object> tag);

    Tag find(int id);

    List<BaType> findCatalogs(QueryParams queryParams);

    List<Article> findArticles(ConcurrentMap<String, Object> params);

    int articleCount(ConcurrentMap<String, Object> params);

    void tagging(int taggableId, String taggableType, List<Integer> tags);

}
