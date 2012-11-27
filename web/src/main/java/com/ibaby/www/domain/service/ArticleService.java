package com.ibaby.www.domain.service;

import com.ibaby.www.dao.ArticleDao;
import com.ibaby.www.dao.QueryParams;
import com.ibaby.www.dao.QueryParamsBuilder;
import com.ibaby.www.domain.valuetypes.Article;
import com.lhq.prj.bms.po.Spgg;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-25
 * Time: AM1:47
 * To change this template use File | Settings | File Templates.
 */
public class ArticleService {

    private ArticleDao articleDao;

    public List<Article> findWithModule(int moduleId, int start, int limit){
        QueryParams queryParams = new QueryParamsBuilder().setStart(start).setLimit(limit)
                .where("lmcode = " + moduleId).build();
        return articleDao.where(queryParams);
    }

    public int countByModule(int moduleId){
        QueryParams queryParams = new QueryParamsBuilder().where("lmcode = " + moduleId).build();
        return articleDao.count(queryParams);
    }

    public List<Spgg> findSpgg(){
        return articleDao.findSpgg();
    }

    public ArticleDao getArticleDao() {
        return articleDao;
    }

    public void setArticleDao(ArticleDao articleDao) {
        this.articleDao = articleDao;
    }



}
