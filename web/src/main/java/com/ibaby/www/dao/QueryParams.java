package com.ibaby.www.dao;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-19
 * Time: PM7:20
 * To change this template use File | Settings | File Templates.
 */
public interface QueryParams {

    Integer getLimit();

    Integer getStart();

    String getOrderBy();

    String getConditions();

}
