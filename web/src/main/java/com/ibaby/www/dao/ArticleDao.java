package com.ibaby.www.dao;

import com.ibaby.www.domain.valuetypes.Article;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-24
 * Time: PM3:12
 * To change this template use File | Settings | File Templates.
 */
public interface ArticleDao {

    List<Article> where(QueryParams queryParams);

    int count(QueryParams queryParams);

}
