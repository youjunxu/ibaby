package com.ibaby.www.dao;

import com.ibaby.www.domain.valuetypes.Activity;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-28
 * Time: PM11:21
 * To change this template use File | Settings | File Templates.
 */
public interface ActivityDao {

    List<Activity> all();

    Integer count();

    //CREATE
    int save(Activity activity);

    //DELETE
    int delete(int id);

    //UPDATE
    int update(Activity activity);

    //QUERY
    Activity find(int id);

    List<Activity> availableActivities(QueryParams queryParams);

    int availableActivityCount();

    List<Activity> completeActivities(QueryParams queryParams);

    int completeActivityCount();
}
