package com.lhq.prj.bms.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.po.Yqlj;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.IYqljService;

@SuppressWarnings("serial")
public class YqljAction extends BaseAction {
    public static final String SUCCESS_MANAGER = "success_manager";
    private IYqljService yqljService;
    private Yqlj yqlj;
    private boolean success;
    private Integer ljId;
    private String ljName;
    private String ljAddr;
    private String dtCrea;
    private Integer userId;
    private String nickName;
    private File fiLinkImg;
    private String linkImg;
    private String tip;
    private String dstJsp;

    public Integer getLjId() {
        return ljId;
    }

    public void setLjId(Integer s) {
        this.ljId = s;
    }

    public String getLjName() {
        return ljName;
    }

    public void setLjName(String s) {
        this.ljName = s;
    }

    public String getLjAddr() {
        return ljAddr;
    }

    public void setLjAddr(String s) {
        this.ljAddr = s;
    }

    public String getDtCrea() {
        return dtCrea;
    }

    public void setDtCrea(String s) {
        this.dtCrea = s;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer s) {
        this.userId = s;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String s) {
        this.nickName = s;
    }

    public void setFiLinkImg(File f) {
        this.fiLinkImg = f;
    }

    public File getFiLinkImg() {
        return fiLinkImg;
    }

    public String getLinkImg() {
        return linkImg;
    }

    public void setLinkImg(String s) {
        this.linkImg = s;
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

    public Yqlj getYqlj() {
        return yqlj;
    }

    public void setYqlj(Yqlj l) {
        this.yqlj = l;
    }

    public void setYqljService(IYqljService l) {
        this.yqljService = l;
    }

    public String saveYqlj() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您先登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String sdt;
        Yqlj nx = new Yqlj();
        nx.setLjName(ljName);
        nx.setLjAddr(ljAddr);

        sdt = getStringDateShort();
        nx.setDtCrea(sdt);
        nx.setNickName(ui.getNickName());
        nx.setUserId(ui.getUserId());

        String strPrjPath = getSession().getServletContext().getRealPath("/");
        String strNewPath = "";
        String strNewName = "";
        strNewPath = strPrjPath + "/graph/yqlj/";
        if (fiLinkImg != null) {
            strNewName = MyUtils.upload(linkImg, strNewPath, fiLinkImg);
            nx.setLinkImg(strNewName);
        } else {
            nx.setLinkImg("");
        }

        yqljService.saveYqlj(nx);
        this.tip = "成功提交！";
        this.dstJsp = "sysmanaYqlj.action";

        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(ui.getUserId());
        lg.setUserName(ui.getUserName());
        lg.setCName("SYS");
        lg.setOperatorDesc("成功发布友情链接：" + ljName);
        yqljService.addLogInfo(lg);

        success = true;
        return SUCCESS;
    }

    public String updateYqlj() throws Exception {
        String sdt;
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您先登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        Yqlj nx = yqljService.findYqljById(ljId);
        if (nx == null) {
            this.tip = "处理失败！";
            this.dstJsp = "sysmanaYqlj.action";
            return "input";
        }
        nx.setLjName(ljName);
        nx.setLjAddr(ljAddr);
        sdt = getStringDateShort();
        nx.setDtCrea(sdt);
        nx.setNickName(ui.getNickName());
        nx.setUserId(ui.getUserId());

        String strPrjPath = getSession().getServletContext().getRealPath("/");
        String strNewPath = "";
        String strNewName = "";
        strNewPath = strPrjPath + "/graph/yqlj/";
        if (fiLinkImg != null) {
            if (nx.getLinkImg() != null) {
                if (!"".equals(nx.getLinkImg())) {
                    MyUtils.delFile(strNewPath + nx.getLinkImg());
                }
            }
            strNewName = MyUtils.upload(linkImg, strNewPath, fiLinkImg);
            nx.setLinkImg(strNewName);
        } else {
//			nx.setLinkImg("");
        }

        success = yqljService.updateYqlj(nx);
        this.tip = "成功更新！";
        this.dstJsp = "sysmanaYqlj.action";

        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(ui.getUserId());
        lg.setUserName(ui.getUserName());
        lg.setCName("SYS");
        lg.setOperatorDesc("成功更新友情链接：" + ljName);
        yqljService.addLogInfo(lg);

        success = true;
        return SUCCESS;
    }

    public String deleteYqljById() {
        String smp;
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您先登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        Yqlj nx = yqljService.findYqljById(ljId);
        if (nx == null) {
            this.tip = "处理失败！";
            this.dstJsp = "sysmanaYqlj.action";
            return "input";
        }
        smp = nx.getLjName();
        success = yqljService.deleteYqljById(ljId);
        this.tip = "成功删除！";
        this.dstJsp = "sysmanaYqlj.action";

        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(ui.getUserId());
        lg.setUserName(ui.getUserName());
        lg.setCName("SYS");
        lg.setOperatorDesc("成功删除友情链接：" + smp);
        yqljService.addLogInfo(lg);

        return SUCCESS;
    }

    public String sysmanaYqlj() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您先登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        String[] objLmp;
        Integer intLmp;
        int li = 0;
        int ls = 0;
        int iz;

        li = 10;
        ls = 0;
        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }
        List lm = yqljService.findAllYqlj();
        iz = lm.size();
        List lb = new ArrayList();
        if (iz >= ls) {
            for (intLmp = ls; intLmp < (ls + li); intLmp++) {
                if (intLmp < iz) {
                    lb.add(lm.get(intLmp));
                } else {
                    break;
                }
            }
        }

        getRequest().setAttribute("sysList_disp", lb);
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

    public String prevOpenYqlj() {
        Yqlj nx = yqljService.findYqljById(ljId);
        getRequest().setAttribute("waitDoc", nx);

        success = true;
        return SUCCESS;
    }

    public String prevFirstYqlj() {
        List lx = yqljService.findAllYqlj();
        getRequest().setAttribute("waitYqlj", lx);

        success = true;
        return SUCCESS;
    }
}
