package com.lhq.prj.bms.action;

import java.util.List;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.po.TbCity;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.ITbCityService;

/**
 * TbCityAction.java Create on 2012-5-4
 *
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class TbCityAction extends BaseAction {
    public static final String SUCCESS_MANAGER = "success_manager";
    private ITbCityService tbCityService;
    private TbCity tbCity;
    private boolean success;
    private Integer cityId;
    private String ssName;
    private String cityName;
    private String tip;
    private String dstJsp;
    private Integer flagEdit;
    private List ssCityList;

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer s) {
        this.cityId = s;
    }

    public String getSsName() {
        return ssName;
    }

    public void setSsName(String s) {
        this.ssName = s;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String s) {
        this.cityName = s;
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

    public Integer getFlagEdit() {
        return flagEdit;
    }

    public void setFlagEdit(Integer s) {
        if (s == null) {
            this.flagEdit = 0;
        } else {
            this.flagEdit = s;
        }
    }

    public List getSsCityList() {
        return ssCityList;
    }

    public void setSsCityList(List s) {
        this.ssCityList = s;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public TbCity getTbCity() {
        return tbCity;
    }

    public void setTbCity(TbCity l) {
        this.tbCity = l;
    }

    public void setTbCityService(ITbCityService l) {
        this.tbCityService = l;
    }

    public String saveCity() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        TbCity c = new TbCity();
        c.setSsName(ssName);
        c.setCityName(cityName);
        tbCityService.saveCity(c);
        this.tip = "成功提交";
        this.dstJsp = "sysmanaE.action";

        success = true;
        return SUCCESS;
    }

    public String updateCity() throws Exception {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        TbCity c = new TbCity();
        c.setCityId(cityId);
        c.setSsName(ssName);
        c.setCityName(cityName);

        success = tbCityService.updateCity(c);
        this.tip = "成功提交";
        this.dstJsp = "sysmanaE.action";

        return SUCCESS;
    }

    public String deleteCity() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        success = tbCityService.deleteByCity(cityId);
        this.tip = "成功删除";
        this.dstJsp = "sysmanaE.action";
        return SUCCESS;
    }

    public String sysCityOpen() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        TbCity s = tbCityService.findCityById(cityId);
        getRequest().setAttribute("waitOpen_cityDoc", s);
        getRequest().setAttribute("waitOpen_Edit", flagEdit);

        success = true;
        return SUCCESS;
    }

    public String sysmanaE() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        Page p = new Page();
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = (int) tbCityService.findByCount();
        String[] objLmp;
        int li;
        int ls;

        li = 10;
        ls = 0;

        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }

        p.setLimit(li);
        p.setStart(ls);
        List l = tbCityService.findAllCity(p);
        getRequest().setAttribute("sysList_disp", l);
        getRequest().setAttribute("sysCount_disp", iz);

        //总页数
        Double dblLmp = Math.floor(iz / li);
        Double dblTmp = dblLmp * li;
        if (dblTmp < iz) {
            dblLmp = dblLmp + 1;
        }
        String strLmp = String.valueOf(dblLmp);
        objLmp = strLmp.split("\\.");
        strLmp = objLmp[0];
        Integer intPageZs = Integer.valueOf(strLmp);
        getRequest().setAttribute("sysPageZs_disp", intPageZs);

        success = true;
        return SUCCESS;
    }

    public String findCityBySs() {
        String ss = "";
        try {
            ss = URLDecoder.decode(ssName, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List l = tbCityService.findCityBySs(ss);
        ssCityList = l;
        success = true;
        return SUCCESS;
    }

}
