package com.lhq.prj.bms.action;

import java.io.File;
import java.util.List;
import java.util.ArrayList;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.service.IUserEjService;

/**
 * UserEjAction.java Create on 2012-5-4
 *
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class UserEjAction extends BaseAction {

    public static final String SUCCESS_MANAGER = "success_manager";
    private IUserEjService userEjService;
    private UserEj userEj;
    private boolean success;
    private Integer userId;
    private String userName;
    private String nickName;
    private String dtZcrq;
    private String dtYzrq;
    private String sex;
    private String headImg;
    private Integer userStatus;
    private Integer userJfzs;
    private Integer userXfjf;
    private Integer userSyjf;
    private String strContent;
    private String lxTel;
    private String lxSj;
    private String lxEmail;
    private String lxQq;
    private String lxMsn;
    private String ssName;
    private String strCity;
    private Integer ejId;
    private String ejName;
    private String syPhoto;
    private String homeXy;
    private String grLable;
    private String dtUpdate;
    private String ejContent;
    private Integer intReaders;
    private Integer photoStatus;
    private String tip;
    private String dstJsp;
    private String leftMk;
    private String topMk;
    private File fiHeadImg;
    private File fiSyPhoto;
    private String strCond;
    private static final String headPath = "graph/net";

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer s) {
        this.userId = s;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String s) {
        this.userName = s;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String s) {
        this.nickName = s;
    }

    public String getDtZcrq() {
        return dtZcrq;
    }

    public void setDtZcrq(String s) {
        this.dtZcrq = s;
    }

    public String getDtYzrq() {
        return dtYzrq;
    }

    public void setDtYzrq(String s) {
        this.dtYzrq = s;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String s) {
        this.sex = s;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String s) {
        this.headImg = s;
    }

    public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Integer s) {
        this.userStatus = s;
    }

    public Integer getUserJfzs() {
        return userJfzs;
    }

    public void setUserJfzs(Integer s) {
        this.userJfzs = s;
    }

    public Integer getUserXfjf() {
        return userXfjf;
    }

    public void setUserXfjf(Integer s) {
        this.userXfjf = s;
    }

    public Integer getUserSyjf() {
        return userSyjf;
    }

    public void setUserSyjf(Integer s) {
        this.userSyjf = s;
    }

    public String getStrContent() {
        return strContent;
    }

    public void setStrContent(String s) {
        this.strContent = s;
    }

    public String getLxTel() {
        return lxTel;
    }

    public void setLxTel(String s) {
        this.lxTel = s;
    }

    public String getLxEmail() {
        return lxEmail;
    }

    public void setLxEmail(String s) {
        this.lxEmail = s;
    }

    public String getSj() {
        return lxSj;
    }

    public void setLxSj(String s) {
        this.lxSj = s;
    }

    public String getLxQq() {
        return lxQq;
    }

    public void setLxQq(String s) {
        this.lxQq = s;
    }

    public String getLxMsn() {
        return lxMsn;
    }

    public void setLxMsn(String s) {
        this.lxMsn = s;
    }

    public String getSsName() {
        return ssName;
    }

    public void setSsName(String s) {
        this.ssName = s;
    }

    public String getStrCity() {
        return strCity;
    }

    public void setStrCity(String s) {
        this.strCity = s;
    }

    public Integer getEjId() {
        return ejId;
    }

    public void setEjId(Integer s) {
        this.ejId = s;
    }

    public String getEjName() {
        return ejName;
    }

    public void setEjName(String s) {
        this.ejName = s;
    }

    public String getSyPhoto() {
        return syPhoto;
    }

    public void setSyPhoto(String s) {
        this.syPhoto = s;
    }

    public String getHomeXy() {
        return homeXy;
    }

    public void setHomeXy(String s) {
        this.homeXy = s;
    }

    public String getGrLable() {
        return grLable;
    }

    public void setGrLable(String s) {
        this.grLable = s;
    }

    public String getDtUpdate() {
        return dtUpdate;
    }

    public void setDtUpdate(String s) {
        this.dtUpdate = s;
    }

    public String getEjContent() {
        return ejContent;
    }

    public void setEjContent(String s) {
        this.ejContent = s;
    }

    public Integer getIntReaders() {
        return intReaders;
    }

    public void setIntReaders(Integer s) {
        this.intReaders = s;
    }

    public Integer getPhotoStatus() {
        return photoStatus;
    }

    public void setPhotoStatus(Integer s) {
        this.photoStatus = s;
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

    public String getLeftMk() {
        return leftMk;
    }

    public void setLeftMk(String s) {
        this.leftMk = s;
    }

    public String getTopMk() {
        return topMk;
    }

    public void setTopMk(String s) {
        this.topMk = s;
    }

    public void setFiHeadImg(File f) {
        this.fiHeadImg = f;
    }

    public File getFiHeadImg() {
        return fiHeadImg;
    }

    public void setFiSyPhoto(File f) {
        this.fiSyPhoto = f;
    }

    public File getFiSyPhoto() {
        return fiSyPhoto;
    }

    public String getStrCond() {
        return strCond;
    }

    public void setStrCond(String s) {
        this.strCond = s;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public UserEj getUserEj() {
        return userEj;
    }

    public void setUserEj(UserEj userEj) {
        this.userEj = userEj;
    }

    public void setUserEjService(IUserEjService userEjService) {
        this.userEjService = userEjService;
    }

    public String deleteUserHeadImg() throws Exception {
        String strPrjPath = getSession().getServletContext().getRealPath("/");
        String strNewPath = "";
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        if (strUserAcl.indexOf("999") < 0) {
            this.tip = "对不起，您无权执行此操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String sdt = getStringDateShort();
        strNewPath = strPrjPath + "/" + headPath + "/";
        UserInfo uo = userEjService.findByUserId(userId);
        if (uo.getHeadImg() != null) {
            if (!"".equals(uo.getHeadImg())) {
                MyUtils.delFile(strNewPath + uo.getHeadImg());
            }
        }
        UserInfo un = new UserInfo();
        un.setUserId(userId);
        un.setHeadImg("");
        un.setIntTxsh(2);
        userEjService.updateHeadImg(un);

        LmBaej ue = userEjService.findBaejByUser(userId);
        if (ue != null) {
            if (ue.getSyPhoto() != null) {
                if (!"".equals(ue.getSyPhoto())) {
                    MyUtils.delFile(strNewPath + ue.getSyPhoto());
                }
            }
            LmBaej uu = new LmBaej();
            uu.setEjId(ue.getEjId());
            uu.setSyPhoto("");
            uu.setIntTxsh(2);
            userEjService.updateBaej(uu);
        }
        this.tip = "成功删除头像";
        this.dstJsp = "sysmanaTxsh.action";
        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(sdt);
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(ui.getUserId());
        lg.setUserName(ui.getUserName());
        lg.setCName("SYS");
        lg.setOperatorDesc("删除用户" + uo.getNickName() + "(" + uo.getUserName() + ")头像");
        userEjService.addEjLogInfo(lg);

        //发站内信
        TbInbox tb = new TbInbox();
        tb.setDtSend(sdt);
        tb.setRecUserId(uo.getUserId());
        tb.setRecUserName(uo.getNickName());
        tb.setSendUserId(ui.getUserId());
        tb.setSendUserName("系统管理员");
        tb.setXsIn(1);
        tb.setXsOut(1);
        tb.setYdBj(0);
        tb.setXxBody("您上传的头像已被系统删除");
        tb.setXxTitle("您上传的头像已被系统删除");
        userEjService.saveTbInbox(tb);

        success = true;
        return SUCCESS;
    }

    public String passUserHeadImgSh() throws Exception {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (ui == null) {
            this.tip = "对不起，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        if (strUserAcl.indexOf("999") < 0) {
            this.tip = "对不起，您无权执行此操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String sdt = getStringDateShort();
        UserInfo uo = userEjService.findByUserId(userId);
        UserInfo un = new UserInfo();
        un.setUserId(userId);
        un.setIntTxsh(1);
        userEjService.updateHeadImg(un);

        LmBaej ux = userEjService.findBaejByUser(userId);
        if (ux != null) {
            LmBaej uy = new LmBaej();
            uy.setEjId(ux.getEjId());
            uy.setIntTxsh(1);
            userEjService.updateBaej(uy);
        }
        this.tip = "成功审核头像";
        this.dstJsp = "sysmanaTxsh.action";

        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(sdt);
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(ui.getUserId());
        lg.setUserName(ui.getUserName());
        lg.setCName("SYS");
        lg.setOperatorDesc("审核通过用户" + uo.getNickName() + "(" + uo.getUserName() + ")头像");
        userEjService.addEjLogInfo(lg);
        //发站内信
        TbInbox tb = new TbInbox();
        tb.setDtSend(sdt);
        tb.setRecUserId(uo.getUserId());
        tb.setRecUserName(uo.getNickName());
        tb.setSendUserId(ui.getUserId());
        tb.setSendUserName("系统管理员");
        tb.setXsIn(1);
        tb.setXsOut(1);
        tb.setYdBj(0);
        tb.setXxBody("您上传的头像已通过系统审核");
        tb.setXxTitle("您上传的头像已通过系统审核");
        userEjService.saveTbInbox(tb);

        success = true;
        return SUCCESS;
    }

    public String deleteUser() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        String strPrjPath = getSession().getServletContext().getRealPath("/");
        String strNewPath = "";
        String strNewName = "";
        String strDelMc = "";
        if (userId != null) {
            UserInfo uf = userEjService.findByUserId(userId);
            UserEj ue = userEjService.findEjById(userId);
            strDelMc = uf.getUserName();
            //
            strNewPath = strPrjPath + "/" + headPath + "/";
            if (ue.getSyPhoto() != null) {
                if (!"".equals(ue.getSyPhoto())) {
                    MyUtils.delFile(strNewPath + ue.getSyPhoto());
                }
            }
            if (uf.getHeadImg() != null) {
                if (!"".equals(uf.getHeadImg())) {
                    MyUtils.delFile(strNewPath + uf.getHeadImg());
                }
            }

            success = userEjService.deleteUser(userId);
        }
        if (ui == null) {
            this.tip = "删除失败，请您先登录";
            this.dstJsp = "login.jsp";
            return "input";
        }
        this.tip = "成功删除";
        this.dstJsp = "sysmanaB.action";
        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(ui.getUserId());
        lg.setUserName(ui.getUserName());
        lg.setCName("SYS");
        lg.setOperatorDesc("删除用户" + strDelMc);
        userEjService.addEjLogInfo(lg);
        return SUCCESS;
    }

    public String findAllEJByFirst() {
        Integer intLmp;
        Integer intTmp;

        List la = userEjService.findAllEj();
        List lb = new ArrayList();
        intTmp = la.size();
        if (intTmp > 9) intTmp = 9;
        for (intLmp = 0; intLmp < intTmp; intLmp++) {
            lb.add(la.get(intLmp));
        }
        getRequest().setAttribute("waitDispEj", lb);

        success = true;
        return SUCCESS;
    }

    public String firstEJ() {
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = 0;
        int li = 0;
        int ls = 0;
        String[] objLmp;

        li = 9;
        ls = 0;
        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }
        List la = userEjService.findAllEj();
        iz = la.size();

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
        Integer intLmp;
        Integer intTmp;
        List lfin = new ArrayList();
        Integer intUmp = 0;
        if (la.size() > 0) {
            for (intLmp = 0; intLmp < la.size(); intLmp = intLmp + 1) {
                if (intLmp >= ls && intLmp < (ls + li)) {
                    UserEj a = (UserEj) la.get(intLmp);
                    List lc = userEjService.findAllDocAByUser(a.getUserId());
                    if (lc.size() > 0) {
                        List lch = new ArrayList();
                        intUmp = lc.size();
                        if (lc.size() > 3) intUmp = 3;
                        for (intTmp = 0; intTmp < intUmp; intTmp = intTmp + 1) {
                            lch.add(lc.get(intTmp));
                        }
                        a.setUserDocList(lch);
                    }
                    lfin.add(a);
                } else {
                    if (intLmp >= (ls + li)) break;
                }
            }
        }
        getRequest().setAttribute("waitList_baej", lfin);

        success = true;
        return SUCCESS;
    }

    public String toPersonHome() {
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = 0;
        int li = 0;
        int ls = 0;
        String[] objLmp;
        Integer intLmp;
        UserEj ej = (UserEj) userEjService.findEjById(userId);
        getSession().removeAttribute("waitListA_ej");
        getSession().setAttribute("waitListA_ej", ej);

        li = 10;
        ls = 0;
        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }

        List lb = userEjService.findAllDocAByUser(userId);
        List lc = new ArrayList();
        iz = lb.size();
        if (iz > ls) {
            for (intLmp = (ls); intLmp < lb.size(); intLmp++) {
                if (intLmp < (ls + li)) {
                    lc.add(lb.get(intLmp));
                } else {
                    break;
                }
            }
        }
        getRequest().setAttribute("waitList_doc", lc);
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

        //好友
        List friLst = userEjService.findAllFriendsById(userId);
        getRequest().setAttribute("sysFriends_disp", friLst);
        //是否本人好友
        UserInfo ou = (UserInfo) getSession().getAttribute("user");
        if (ou == null) {
            getRequest().setAttribute("flagHy", 0);
        } else {
            GoodFriend gd = new GoodFriend();
            gd.setGzUserId(ou.getUserId());
            gd.setBgzUserId(userId);
            GoodFriend gn = userEjService.findIsMyFriends(gd);
            if (gn == null) {
                getRequest().setAttribute("flagHy", 0);
            } else {
                getRequest().setAttribute("flagHy", 1);
            }
        }

        success = true;
        return SUCCESS;
    }

    public String sysmanaTxsh() {
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "对不起，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        if (strUserAcl.indexOf("999") < 0) {
            this.tip = "对不起，您无权执行此操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = 0;
        int li = 0;
        int ls = 0;
        String[] objLmp;
        Integer intLmp;

        li = 10;
        ls = 0;
        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }
        Page p = new Page();
        p.setLimit(li);
        p.setStart(ls);
        List lb = userEjService.findAllBaejByTxsh(p);
        List lc = new ArrayList();
        iz = lb.size();
        if (iz > ls) {
            for (intLmp = (ls); intLmp < lb.size(); intLmp++) {
                if (intLmp < (ls + li)) {
                    lc.add(lb.get(intLmp));
                } else {
                    break;
                }
            }
        }
        getRequest().setAttribute("sysList_disp", lc);
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

    public String toMyHome() {
        UserInfo ou = (UserInfo) getSession().getAttribute("user");
        if (ou == null) {
            this.tip = "请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = 0;
        int li = 0;
        int ls = 0;
        String[] objLmp;
        Integer intLmp;
        UserInfo ui = userEjService.findByUserId(ou.getUserId());
        getSession().removeAttribute("user");
        getSession().setAttribute("user", ui);
        UserEj ej = (UserEj) userEjService.findEjById(ou.getUserId());
        getSession().removeAttribute("waitDisp_ej");
        getSession().setAttribute("waitDisp_ej", ej);

        li = 10;
        ls = 0;
        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }

        List lb = userEjService.findAllDocsByUser(ou.getUserId());
        List lc = new ArrayList();
        iz = lb.size();
        if (iz > ls) {
            for (intLmp = (ls); intLmp < lb.size(); intLmp++) {
                if (intLmp < (ls + li)) {
                    lc.add(lb.get(intLmp));
                } else {
                    break;
                }
            }
        }
        getRequest().setAttribute("waitList_doc", lc);
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

        //好友
        List friLst = userEjService.findAllFriendsById(ou.getUserId());
        getRequest().setAttribute("sysFriends_disp", friLst);

        success = true;
        return SUCCESS;
    }

    public String myPersonXx() {
        UserInfo ou = (UserInfo) getSession().getAttribute("user");
        if (ou == null) {
            this.tip = "请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        getSession().removeAttribute("waitDisp_ej");
        UserInfo uo = userEjService.findByUserId(ou.getUserId());
        getSession().setAttribute("user", uo);

        UserEj ej = (UserEj) userEjService.findEjById(ou.getUserId());
        getSession().setAttribute("waitDisp_ej", ej);
        List la = userEjService.findAllSs();
        getRequest().setAttribute("addSsName", la);
        List lb = userEjService.findCityBySs(ou.getSsName());
        getRequest().setAttribute("addCityName", lb);

        success = true;
        return SUCCESS;
    }

    public String myPersonXxA() {
        UserInfo ou = (UserInfo) getSession().getAttribute("user");
        if (ou == null) {
            this.tip = "请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        getSession().removeAttribute("waitDisp_ej");
        UserInfo uo = userEjService.findByUserId(ou.getUserId());
        getSession().setAttribute("user", uo);

        UserEj ej = (UserEj) userEjService.findEjById(ou.getUserId());
        getSession().setAttribute("waitDisp_ej", ej);
        List la = userEjService.findAllSs();
        getRequest().setAttribute("addSsName", la);
        List lb = userEjService.findCityBySs(ou.getSsName());
        getRequest().setAttribute("addCityName", lb);

        success = true;
        return SUCCESS;
    }

    public String updateBaej() throws Exception {
        UserInfo u = (UserInfo) getSession().getAttribute("user");
        if (u == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        UserEj ej = (UserEj) getSession().getAttribute("waitDisp_ej");
        LmBaej nj = new LmBaej();

        if (ej == null) {
            this.tip = "更新失败！";
            this.dstJsp = "myPersonXx.action";
            return "input";
        } else {
            nj.setUserId(ej.getUserId());
            nj.setEjId(ej.getEjId());
            nj.setEjName(ejName);
            nj.setHomeXy(homeXy);
            nj.setGrLable(grLable);
            nj.setStrContent(strContent);

            UserEj enj = (UserEj) userEjService.findEjById(ej.getUserId());
            getSession().removeAttribute("waitDisp_ej");
            getSession().setAttribute("waitDisp_ej", enj);
            this.tip = "更新成功！";
            this.dstJsp = "myPersonXx.action";
            success = userEjService.updateBaej(nj);

            //写日志
            LogInfo lg = new LogInfo();
            lg.setCzDate(getStringDateShort());
            lg.setLogIp(getRequest().getRemoteAddr());
            lg.setUserId(ej.getUserId());
            lg.setUserName(ej.getUserName());
            lg.setCName("SYS");
            lg.setOperatorDesc("成功更新e家信息");
            userEjService.addEjLogInfo(lg);
        }
        return SUCCESS;
    }

    public String updateHeadImg() throws Exception {
        UserInfo u = (UserInfo) getSession().getAttribute("user");
        if (u == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }

        String strPrjPath = getSession().getServletContext().getRealPath("/");
        String strNewPath = "";
        String strNewName = "";
        UserEj ej = (UserEj) getSession().getAttribute("waitDisp_ej");
        if (fiHeadImg == null || headImg == null || ej == null) {
            this.tip = "上传失败！";
            this.dstJsp = "myPersonXx.action";
            success = false;
        } else {
            strNewPath = strPrjPath + "/" + headPath + "/";
            if (ej.getHeadImg() != null) {
                if (!"".equals(ej.getHeadImg())) {
                    MyUtils.delFile(strNewPath + ej.getHeadImg());
                }
            }
            strNewName = MyUtils.upload(headImg, strNewPath, fiHeadImg);
            UserInfo iu = new UserInfo();
            iu.setUserId(ej.getUserId());
            iu.setHeadImg(strNewName);
            iu.setIntTxsh(0);
            success = userEjService.updateHeadImg(iu);
            //2012-09-09同时更新用户e家信息
            LmBaej ue = new LmBaej();
            ue.setEjId(ej.getEjId());
            ue.setSyPhoto(strNewName);
            ue.setIntTxsh(0);
            success = userEjService.updateBaej(ue);
            ej.setHeadImg(strNewName);
            ej.setIntTxsh(0);

            this.tip = "成功上传！";
            this.dstJsp = "myPersonXx.action";
            //写日志
            LogInfo lg = new LogInfo();
            lg.setCzDate(getStringDateShort());
            lg.setLogIp(getRequest().getRemoteAddr());
            lg.setUserId(ej.getUserId());
            lg.setUserName(ej.getUserName());
            lg.setCName("SYS");
            lg.setOperatorDesc("成功更新头像");
            userEjService.addEjLogInfo(lg);
        }
        getSession().removeAttribute("waitDisp_ej");
        getSession().setAttribute("waitDisp_ej", ej);

        return SUCCESS;
    }

    public String turnSelfHy() {
        getSession().removeAttribute("waitDisp_ej");
        UserInfo u = (UserInfo) getSession().getAttribute("user");
        if (u == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        UserEj ej = userEjService.findEjById(u.getUserId());
        if (ej == null) {
            this.tip = "操作失败！";
            this.dstJsp = "manager.jsp";
            return "input";
        }
        getSession().setAttribute("waitDisp_ej", ej);
        List l = userEjService.findAllFriendsById(u.getUserId());

        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = 0;
        int li = 0;
        int ls = 0;
        String[] objLmp;
        Integer intLmp;

        li = 25;
        ls = 0;
        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }
        iz = l.size();
        List lc = new ArrayList();
        if (iz >= ls) {
            for (intLmp = (ls); intLmp < iz; intLmp++) {
                if (intLmp < (ls + li)) {
                    lc.add(l.get(intLmp));
                } else {
                    break;
                }
            }
        }
        getRequest().setAttribute("waitList_doc", lc);
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


        return SUCCESS;
    }

    public String seekOtherHy() {
        List l = userEjService.findAllFriendsById(userId);
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = 0;
        int li = 0;
        int ls = 0;
        String[] objLmp;
        Integer intLmp;

        li = 90;
        ls = 0;
        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }
        iz = l.size();
        List lc = new ArrayList();
        if (iz >= ls) {
            for (intLmp = (ls); intLmp < iz; intLmp++) {
                if (intLmp < (ls + li)) {
                    lc.add(l.get(intLmp));
                } else {
                    break;
                }
            }
        }
        getRequest().setAttribute("waitList_doc", lc);
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

        return SUCCESS;
    }

    public String myPageLeft() {
        getRequest().setAttribute("leftmk", leftMk);

        success = true;
        return SUCCESS;
    }

    public String myJfxx() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        UserInfo uo = userEjService.findByUserId(ui.getUserId());
        getSession().setAttribute("user", uo);

        success = true;
        return SUCCESS;
    }

    public String myPageTopMenu() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        getRequest().setAttribute("topmk", topMk);
        //新信件数
        Integer intNew = userEjService.findNewInboxCountByUser(ui.getUserId());
        getRequest().setAttribute("sysNewIn_zs", intNew);

        success = true;
        return SUCCESS;
    }

    public String findUserForAddHy() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        List l = userEjService.findAllUserByNickName(nickName);
        getRequest().setAttribute("waitList_waitA", l);
        if (l == null) {
            getRequest().setAttribute("waitList_waitB", 0);
        } else {
            getRequest().setAttribute("waitList_waitB", l.size());
        }

        success = true;
        return SUCCESS;
    }
}
