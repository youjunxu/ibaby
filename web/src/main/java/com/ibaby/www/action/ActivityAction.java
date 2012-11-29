package com.ibaby.www.action;

import com.ibaby.www.dao.QueryParams;
import com.ibaby.www.dao.QueryParamsBuilder;
import com.ibaby.www.domain.service.ActivityService;
import com.ibaby.www.domain.valuetypes.Activity;
import com.ibaby.www.domain.valuetypes.Tag;

import com.ibaby.www.util.ModuleConfig;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.*;


import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ibaby.www.util.ApplicationHelper.*;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-28
 * Time: PM11:28
 * To change this template use File | Settings | File Templates.
 */
public class ActivityAction extends BaseAction{

    private ActivityService activityService;

    //TODO Refactor this
    private File fActImg;

    public String save() throws Exception
	{
        if (!checkUserPermission()) {
            return actionResult;
        }

        Activity activity = activityFromParams();

        /*

		if (fActImg!=null)
		{
			strNewPath=strPrjPath+"/"+hdImgPath+"/";
			strNewName= MyUtils.upload(actImg, strNewPath, fActImg);
			strLmp=MyUtils.getSizeOfPic(fActImg);
			strLmp=strLmp.substring(1, strLmp.length()-1);
			arrSize=strLmp.split(",");
			this.photoWidth=Integer.valueOf(arrSize[0]);
			this.photoHeight=Integer.valueOf(arrSize[1]);

			ac.setPhotoHeight(photoHeight);
			ac.setPhotoWidth(photoWidth);
		}
		ac.setActImg(strNewName);
		Integer i=actXxService.saveActXx(ac);
		*/

        int id = activityService.save(activity);
        //TODO
        doTagging(id, Activity.class);

		this.tip="成功提交";
		this.dstJsp="sysmanaHd.action";

		//写日志
/*		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("GAME");
		lg.setOperatorDesc("成功发布贝爱活动");
		actXxService.addActLogInfo(lg);

		success=true;   */
		return SUCCESS;
	}


	public String index()
	{
        HttpServletRequest request = getRequest();
        String active = request.getParameter("active");
        List<Activity> activities;
        if(active != null && active.equalsIgnoreCase("no")){
            QueryParamsBuilder builder = paginate(activityService.completeActivityCount(), 4);
            activities = activityService.completeActivities(builder.build());
            request.setAttribute("active", false);
        }else{
            QueryParamsBuilder builder = paginate(activityService.availableActivityCount(), 4);
            activities = activityService.availableActivities(builder.build());
            request.setAttribute("active", true);
        }
		request.setAttribute("activities", activities);

        List<Tag> tags = tagService.findTagsByGroup(ModuleConfig.moduleId("译言堂"));
        request.setAttribute("tagList", tags);

		return SUCCESS;
	}


    //TODO need refactor this
    private Activity activityFromParams(){
        Activity activity = new Activity();
        HttpServletRequest request = getRequest();
        activity.setContent(request.getParameter("actContent"));
        activity.setReward(request.getParameter("jpJs"));
        activity.setCreatedAt(new Date());
        activity.setDescription(request.getParameter("hdJs"));
        activity.setName(request.getParameter("actName"));
        activity.setLink(request.getParameter("actLink"));
        activity.setStatus(parseInt(request.getParameter("actStatus"), 1));
        activity.setCreatedAt(parseDate(request.getParameter("sdt")));
        activity.setStartDate(parseDate(request.getParameter("dtStart")));
        activity.setEndDate(parseDate(request.getParameter("dtEnd")));
        activity.setUser((UserInfo)getSession().getAttribute("user"));

        return activity;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }
}
