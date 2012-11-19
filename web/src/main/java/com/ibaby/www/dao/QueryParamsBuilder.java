package com.ibaby.www.dao;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-19
 * Time: PM4:58
 * To change this template use File | Settings | File Templates.
 */
public class QueryParamsBuilder {

    private final QueryParams queryParams = new QueryParams();

    public QueryParamsBuilder setLimit(Integer limit){
        queryParams.setLimit(limit);
        return this;
    }


    public QueryParamsBuilder setStart(Integer start){
        queryParams.setStart(start);
        return this;
    }


    public QueryParams build(){
        return queryParams;
    }

}
