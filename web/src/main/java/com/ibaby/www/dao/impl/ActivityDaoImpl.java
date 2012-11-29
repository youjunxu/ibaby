package com.ibaby.www.dao.impl;

import com.ibaby.www.dao.ActivityDao;
import com.ibaby.www.dao.QueryParams;
import com.ibaby.www.domain.valuetypes.Activity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-28
 * Time: PM9:30
 * To change this template use File | Settings | File Templates.
 */
public class ActivityDaoImpl extends SqlMapClientDaoSupport implements ActivityDao {

    private final static Logger LOGGER = LoggerFactory.getLogger(ActivityDaoImpl.class);

    public List<Activity> all() {
        return (List<Activity>)getSqlMapClientTemplate().queryForList("Activity.all");
    }

    public Integer count() {
        return (Integer)getSqlMapClientTemplate().queryForObject("Activity.count");
    }

    //CREATE
    public int save(Activity activity){
        return (Integer)getSqlMapClientTemplate().insert("Activity.save", activity);
    }

    //DELETE
    public int delete(int id){
        return getSqlMapClientTemplate().delete("Activity.delete", id);
    }

    //UPDATE
    public int update(Activity activity){
        return getSqlMapClientTemplate().update("Activity.update", activity);
    }

    //QUERY
    public Activity find(int id){
        return (Activity)getSqlMapClientTemplate().queryForObject("Activity.find", id);
    }

    public List<Activity> availableActivities(QueryParams queryParams) {
        return (List<Activity>)getSqlMapClientTemplate().queryForList("Activity.availableActivities", queryParams);
    }


    public int availableActivityCount() {
        return (Integer)getSqlMapClientTemplate().queryForObject("Activity.availableActivityCount");
    }

    public List<Activity> completeActivities(QueryParams queryParams) {
        return (List<Activity>)getSqlMapClientTemplate().queryForList("Activity.completeActivities", queryParams);
    }


    public int completeActivityCount() {
        return (Integer)getSqlMapClientTemplate().queryForObject("Activity.completeActivityCount");
    }

}
