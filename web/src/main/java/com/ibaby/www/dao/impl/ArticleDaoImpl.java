package com.ibaby.www.dao.impl;

import com.ibaby.www.dao.ArticleDao;
import com.ibaby.www.dao.QueryParams;
import com.ibaby.www.domain.valuetypes.Article;
import com.ibaby.www.domain.valuetypes.Tag;
import com.lhq.prj.bms.po.Spgg;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-24
 * Time: PM3:12
 * To change this template use File | Settings | File Templates.
 */
public class ArticleDaoImpl extends SqlMapClientDaoSupport implements ArticleDao {

    public List<Article> where(QueryParams queryParams){
        return (List<Article>)getSqlMapClientTemplate().queryForList("Article.where", queryParams);
    }

    public int count(QueryParams queryParams){
        return (Integer)getSqlMapClientTemplate().queryForObject("Article.count", queryParams);
    }

    //TODO what is this?
    public List<Spgg> findSpgg(){
        return (List)getSqlMapClientTemplate().queryForList("Spgg.findSpggByBaxy");
    }


}
