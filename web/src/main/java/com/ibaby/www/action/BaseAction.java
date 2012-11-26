package com.ibaby.www.action;

import com.ibaby.www.dao.QueryParams;
import com.ibaby.www.dao.QueryParamsBuilder;
import com.ibaby.www.util.ApplicationHelper;
import com.lhq.prj.bms.po.UserInfo;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.ibaby.www.util.ApplicationHelper.*;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-20
 * Time: PM3:09
 * To change this template use File | Settings | File Templates.
 */
public class BaseAction extends ActionSupport {

    protected final static Logger LOGGER = LoggerFactory.getLogger(BaseAction.class);

    protected String flushMessage;
    protected String dstJsp;
    protected String actionResult;

    public HttpServletRequest getRequest() {
        return ServletActionContext.getRequest();
    }

    public HttpServletResponse getResponse() {
        return ServletActionContext.getResponse();
    }

    public HttpSession getSession() {
        return getRequest().getSession();
    }

    public ServletContext getServletContext() {
        return ServletActionContext.getServletContext();
    }

    public String getFlushMessage() {
        return flushMessage;
    }

    public String getDstJsp() {
        return dstJsp;
    }

    public String getActionResult() {
        return actionResult;
    }

    public boolean checkUserPermission(){
        UserInfo ui=(UserInfo) getSession().getAttribute("user");
		if (ui == null)
		{
			flushMessage = "¶Ô²»Æð£¬ÇëÄúµÇÂ¼£¡";
			dstJsp = "login.jsp";
            actionResult = "input";
			return false;
		}
        return true;
    }

    protected int doPager(int pageCount, int pageSize){
        int pageCurrent = 1;
        Object page = getRequest().getParameter("page");
        if(page != null && StringUtils.hasText(page.toString())){
            pageCurrent = parseInt(page.toString(), pageCurrent);
        }
        String pager = pager(pageCount, pageSize, pageCurrent);

        HttpServletRequest request = getRequest();
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("pager", pager);

        int start = (pageCurrent - 1) * pageSize;
        return start;
    }
}
