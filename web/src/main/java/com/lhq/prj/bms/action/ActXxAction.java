package com.lhq.prj.bms.action;

import java.util.ArrayList;
import java.util.List;
import java.io.File;

import com.ibaby.www.domain.service.TagService;
import com.ibaby.www.domain.valuetypes.Tag;
import com.ibaby.www.util.ApplicationHelper;
import com.ibaby.www.util.ModuleConfig;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.po.BaDocSh;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.ActXx;
import com.lhq.prj.bms.po.ActLy;
import com.lhq.prj.bms.service.IActXxService;
import com.lhq.prj.bms.service.ILmBaxyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ActXxAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class ActXxAction extends BaseAction {

    private static final Logger LOGGER = LoggerFactory.getLogger(ActXxAction.class);

	public static final String SUCCESS_MANAGER = "success_manager";
	private IActXxService actXxService;
    private TagService tagService;

	private ActXx actXx;
	private boolean success;
	private String dstJsp;
	private String tip;
	private Integer lyId;
	private Integer actId;
	private String actName;
	private String actLink;
	private String dtCrea;
	private String actContent;
	private String lyContent;
	private String dtStart;
	private String dtEnd;
	private String actImg;
	private Integer actStatus;
	private Integer userId;
	private String userName;
	private String jpJs;
	private File fActImg;
	private Integer photoWidth;
	private Integer photoHeight;
	private String hdJs;
	private static final String hdImgPath="graph/game";


    public void setTagService(TagService tagService){
        this.tagService = tagService;
    }

	public Integer getLyId()
	{
		return lyId;
	}
	public void setLyId(Integer s)
	{
		this.lyId=s;
	}
	public Integer getActId()
	{
		return actId;
	}
	public void setActId(Integer s)
	{
		this.actId=s;
	}
	public String getActName()
	{
		return actName;
	}
	public void setActName(String s)
	{
		this.actName=s;
	}
	public String getActLink() {
		return actLink;
	}
	public void setActLink(String s) {
		this.actLink = s;
	}

	public String getDtCrea()
	{
		return dtCrea;
	}
	public void setDtCrea(String s)
	{
		this.dtCrea=s;
	}
	public String getActContent()
	{
		return actContent;
	}
	public void setActContent(String s)
	{
		this.actContent=s;
	}
	public String getLyContent()
	{
		return lyContent;
	}
	public void setLyContent(String s)
	{
		this.lyContent=s;
	}
	public String getDtStart()
	{
		return dtStart;
	}
	public void setDtStart(String s)
	{
		this.dtStart=s;
	}
	public String getDtEnd()
	{
		return dtEnd;
	}
	public void setDtEnd(String s)
	{
		this.dtEnd=s;
	}
	public String getActImg()
	{
		return actImg;
	}
	public void setActImg(String s)
	{
		this.actImg=s;
	}
	public Integer getActStatus()
	{
		return actStatus;
	}
	public void setActStatus(Integer s)
	{
		this.actStatus=s;
	}
	public Integer getUserId()
	{
		return userId;
	}
	public void setUserId(Integer s)
	{
		this.userId=s;
	}

	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String s)
	{
		this.userName=s;
	}
	public String getJpJs()
	{
		return jpJs;
	}
	public void setJpJs(String s)
	{
		this.jpJs=s;
	}

	public File getFActImg()
	{
		return fActImg;
	}
	public void setFActImg(File s)
	{
		this.fActImg=s;
	}
	public Integer getPhotoWidth() {
		return photoWidth;
	}
	public void setPhotoWidth(Integer s) {
		this.photoWidth = s;
	}
	public Integer getPhotoHeight() {
		return photoHeight;
	}
	public void setPhotoHeight(Integer s) {
		this.photoHeight = s;
	}
	public String getHdJs()
	{
		return hdJs;
	}
	public void setHdJs(String s)
	{
		this.hdJs=s;
	}

	public String getTip() {
		return tip;
	}
	public void setTip(String s) {
		this.tip = s;
	}
	public String getDstJsp() {
		return dstJsp;
	}
	public void setDstJsp(String s) {
		this.dstJsp = s;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public ActXx getActXx() {
		return actXx;
	}

	public void setActXx(ActXx l) {
		this.actXx = l;
	}

	public void setActXxService(IActXxService l) {
		this.actXxService = l;
	}

    //TODO this is should to remove to BaseAction.
    private void tagActivity(Integer i) {
        int articleId = i;
        List<Integer> tags = new ArrayList<Integer>();
        String[] tagsParams = getRequest().getParameterValues("tags");
        LOGGER.debug("request => {}", tagsParams);
        for(String tagParam : tagsParams){
            Integer tagId = ApplicationHelper.parseInt(tagParam);
            if(tagId != null){
                tags.add(tagId);
            }else{
                LOGGER.warn("Can't add tag => {}", tagParam);
            }
        }
        tagService.tagging(articleId, "Activity", tags);
    }


	public String saveActXx() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String sdt;
		String strPrjPath=getSession().getServletContext().getRealPath("/");
		String strNewName;
		String strNewPath;
		String strLmp;
		String[] arrSize;
		ActXx ac=new ActXx();
		ac.setActContent(actContent);
		ac.setJpJs(jpJs);
		ac.setActName(actName);
		ac.setActLink(actLink);
		ac.setActStatus(actStatus);
		sdt=getStringDateShort();
		ac.setDtCrea(sdt);
		ac.setDtStart(dtStart);
		ac.setDtEnd(dtEnd);
		ac.setUserId(_user.getUserId());
		ac.setUserName(_user.getUserName());
		ac.setHdJs(hdJs);
		
		strNewName="";
		if (fActImg!=null)
		{
			strNewPath=strPrjPath+"/"+hdImgPath+"/";
			strNewName=MyUtils.upload(actImg, strNewPath, fActImg);
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

        //TODO
        tagActivity(i);
		this.tip="成功提交";
		this.dstJsp="sysmanaHd.action";

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("GAME");
		lg.setOperatorDesc("成功发布贝爱活动");
		actXxService.addActLogInfo(lg);

		success=true;
		return SUCCESS;
	}

	public String saveActLy()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strUserAcl=(String)getSession().getAttribute("userAcl");
		if(!(strUserAcl.indexOf("LY509")>=0 || strUserAcl.indexOf("999")>=0))
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		BaDocSh bd=actXxService.findBADOCSH();
		String[] objKey;
		Integer intLmp;
		Integer intTmp;
		if (bd!=null)
		{
			intTmp=1;
			if (bd.getShKey().contains(","))
			{
				objKey=bd.getShKey().split(",");
				for (intLmp=0;intLmp<objKey.length;intLmp++)
				{
					if (lyContent.contains(objKey[intLmp]))
					{
						intTmp=0;
						break;
					}
				}
			}else
			{
				if (lyContent.contains(bd.getShKey()))
				{
					intTmp=0;
				}
			}
			if (intTmp==0)
			{
				this.tip="对不起，您提交的文档包含了国家禁止的字、词汇等！";
				this.dstJsp="prevOpenActXx.action?actId="+String.valueOf(actId);
				return "input";
			}
		}

		String sdt;
		ActLy ac=new ActLy();
		ac.setLyContent(lyContent);
		ac.setActName(actName);
		ac.setActId(actId);
		sdt=getStringDateShort();
		ac.setDtCrea(sdt);
		ac.setUserId(_user.getUserId());
		ac.setNickName(_user.getNickName());
		
		Integer i=actXxService.saveActLy(ac);
		this.tip="成功提交";
		this.dstJsp="prevOpenActXx.action?actId="+String.valueOf(actId);

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("GAME");
		lg.setOperatorDesc("成功发布乐园活动留言");
		actXxService.addActLogInfo(lg);

		success=true;
		return SUCCESS;
	}


	public String updateActXx() throws Exception 
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strUserAcl=(String)getSession().getAttribute("userAcl");
		if(!(strUserAcl.indexOf("LY509")>=0 || strUserAcl.indexOf("999")>=0))
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}

		String sdt;
		String strPrjPath=getSession().getServletContext().getRealPath("/");
		String strNewName;
		String strNewPath;
		ActXx ac=actXxService.findActXxById(actId);
		String strLmp;
		String[] arrSize;

		sdt=getStringDateShort();
		ac.setActContent(actContent);
		ac.setJpJs(jpJs);
		ac.setActName(actName);
		ac.setActLink(actLink);
		ac.setActStatus(actStatus);
		ac.setDtStart(dtStart);
		ac.setDtEnd(dtEnd);
		ac.setHdJs(hdJs);
		
		strNewName="";
		
		if (fActImg!=null)
		{
			strNewPath=strPrjPath+"/"+hdImgPath+"/";
			if (ac.getActImg()!=null)
			{
				if (!"".equals(ac.getActImg()))
				{
					MyUtils.delFile(strNewPath+ac.getActImg());
				}
			}
			strNewName=MyUtils.upload(actImg, strNewPath, fActImg);
			ac.setActImg(strNewName);

			strLmp=MyUtils.getSizeOfPic(fActImg);
			strLmp=strLmp.substring(1, strLmp.length()-1);
			arrSize=strLmp.split(",");
			this.photoWidth=Integer.valueOf(arrSize[0]);
			this.photoHeight=Integer.valueOf(arrSize[1]);

			ac.setPhotoHeight(photoHeight);
			ac.setPhotoWidth(photoWidth);
		}
		
		success=actXxService.updateActXx(ac);

        //TODO
        tagActivity(ac.getActId());
		
		this.tip="成功提交";
		this.dstJsp="sysmanaHd.action";

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(sdt);
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功更新贝爱活动");
		actXxService.addActLogInfo(lg);
		
		return SUCCESS;
	}
	public String deleteActXxById()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strUserAcl=(String)getSession().getAttribute("userAcl");
		if(!(strUserAcl.indexOf("LY509")>=0 || strUserAcl.indexOf("999")>=0))
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strNewPath;
		String strPrjPath=getSession().getServletContext().getRealPath("/");
		ActXx ac=actXxService.findActXxById(actId);
		strNewPath=strPrjPath+"/"+hdImgPath+"/";
		if (ac.getActImg()!=null)
		{
			if (!"".equals(ac.getActImg()))
			{
				MyUtils.delFile(strNewPath+ac.getActImg());
			}
		}
		success=actXxService.deleteActXxById(actId);
		this.tip="成功删除";
		this.dstJsp="sysmanaHd.action";

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功删除贝爱活动");
		actXxService.addActLogInfo(lg);
		return SUCCESS;
	}
	public String deleteActLyById()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strUserAcl=(String)getSession().getAttribute("userAcl");
		if(!(strUserAcl.indexOf("LY509")>=0 || strUserAcl.indexOf("999")>=0))
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		
		success=actXxService.deleteActLyById(lyId);
		this.tip="成功删除";
		this.dstJsp="firstLY.action";

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功删除贝爱活动留言");
		actXxService.addActLogInfo(lg);
		return SUCCESS;
	}
	public String sysActXxEdit()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		ActXx s=actXxService.findActXxById(actId);
		getRequest().setAttribute("waitOpen_actXxDoc", s);

		success=true;
		return SUCCESS;
	}
	public String prevOpenActXx()
	{
		ActXx s=actXxService.findActXxById(actId);
		getRequest().setAttribute("waitOpen_actXxDoc", s);
		String tmplb = getRequest().getParameter("lb");
		getRequest().setAttribute("waitOpen_lb", tmplb);
		List ly=actXxService.findAllLyByAct(actId);
		getRequest().setAttribute("waitOpen_ly", ly);
		
		success=true;
		return SUCCESS;
	}
	public String prevActLyOpen()
	{
		ActLy s=actXxService.findActLyById(lyId);
		getRequest().setAttribute("waitOpen_actLyDoc", s);
		
		success=true;
		return SUCCESS;
	}

	public String sysmanaHd()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=actXxService.findByCount();
		int li=0;
		int ls=0;
		String[] objLmp;
		
		li=10;
		ls=0;
		if (tmpa!=null)
		{
			li=Integer.valueOf(tmpa);
		}
		if (tmpb!=null)
		{
			ls=Integer.valueOf(tmpb);
		}
		Page p=new Page();
		p.setLimit(li);
		p.setStart(ls);

		List l=actXxService.findAllActXx(p);
		getRequest().setAttribute("sysList_disp", l);
		getRequest().setAttribute("sysCount_disp", iz);
		//总页数
		Double dblLmp=Math.floor(iz/li);
		Double dblTmp=dblLmp*li;
		if (dblTmp<iz)
		{
			dblLmp=dblLmp+1;
		}
		String strLmp=String.valueOf(dblLmp);
		objLmp=strLmp.split("\\.");
		strLmp=objLmp[0];
		Integer intPageZs=Integer.valueOf(strLmp);
		getRequest().setAttribute("sysPageZs_disp", intPageZs);
		
		success=true;
		return SUCCESS;
	}
	public String firstLY()
	{
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		String tmpJxz=getRequest().getParameter("JXZ");
		int iz=0;
		int li=0;
		int ls=0;
		String[] objLmp;
		
		li=4;
		ls=0;
		if (tmpa!=null)
		{
			li=Integer.valueOf(tmpa);
		}
		if (tmpb!=null)
		{
			ls=Integer.valueOf(tmpb);
		}
		Page p=new Page();
		p.setLimit(li);
		p.setStart(ls);

		if (tmpJxz==null) tmpJxz="Y";
		getRequest().setAttribute("sysList_jxz", tmpJxz);
		
		List la=null;
		if (tmpJxz.equals("Y"))
		{
			la=actXxService.findAllJxzActXx(p);
			iz=actXxService.findJxzActXxCount();
		}else
		{
			la=actXxService.findAllEndActXx(p);
			iz=actXxService.findEndActXxCount();
		}
		getRequest().setAttribute("sysList_act", la);
		List lb=actXxService.findAllLySpgg();
		getRequest().setAttribute("sysList_gg", lb);
		
		List ll=actXxService.findAllActLy();
		getRequest().setAttribute("sysList_ly", ll);

		getRequest().setAttribute("sysCount_disp", iz);
		//总页数
		Double dblLmp=Math.floor(iz/li);
		Double dblTmp=dblLmp*li;
		if (dblTmp<iz)
		{
			dblLmp=dblLmp+1;
		}
		String strLmp=String.valueOf(dblLmp);
		objLmp=strLmp.split("\\.");
		strLmp=objLmp[0];
		Integer intPageZs=Integer.valueOf(strLmp);
		getRequest().setAttribute("sysPageZs_disp", intPageZs);

        //TODO we will remove the lmCode and just use module_id.
        List<Tag> tags = tagService.findTagsByGroup(ModuleConfig.moduleId("译言堂"));
        getRequest().setAttribute("tagList", tags);

		success=true;
		return SUCCESS;
	}
}
