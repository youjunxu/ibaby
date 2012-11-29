package com.ibaby.www.domain.service;

import com.ibaby.www.dao.ActivityDao;
import com.ibaby.www.dao.QueryParams;
import com.ibaby.www.domain.valuetypes.Activity;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-28
 * Time: PM12:46
 * To change this template use File | Settings | File Templates.
 */
public class ActivityService {

    private ActivityDao activityDao;


     public List<Activity> all() {
        return activityDao.all();
    }

    public Integer count() {
        return activityDao.count();
    }

    //CREATE
    public int save(Activity activity){
        return activityDao.save(activity);
    }

    //DELETE
    public int delete(int id){
        return activityDao.delete(id);
    }

    //UPDATE
    public int update(Activity activity){
        return activityDao.update(activity);
    }

    //QUERY
    public Activity find(int id){
        return activityDao.find(id);
    }

    public List<Activity> availableActivities(QueryParams queryParams) {
        return activityDao.availableActivities(queryParams);
    }


    public int availableActivityCount() {
        return activityDao.availableActivityCount();
    }

    public List<Activity> completeActivities(QueryParams queryParams) {
        return activityDao.completeActivities(queryParams);
    }


    public int completeActivityCount() {
        return activityDao.completeActivityCount();
    }


    public ActivityDao getActivityDao() {
        return activityDao;
    }

    public void setActivityDao(ActivityDao activityDao) {
        this.activityDao = activityDao;
    }
}
