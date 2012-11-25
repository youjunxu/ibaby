package com.lhq.prj.bms.action;

import java.util.List;
import java.util.ArrayList;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.po.MemberGz;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.service.IMemberGzService;

/**
 * MemberGzAction.java Create on 2012-6-4
 *
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MemberGzAction extends BaseAction {
    public static final String SUCCESS_MANAGER = "success_manager";
    private IMemberGzService memberGzService;
    private MemberGz memberGz;
    private boolean success;
    private Integer gzId;
    private Integer gzUserId;
    private String gzUserName;
    private Integer bgzUserId;
    private String bgzUserName;
    private String dtGzDate;
    private String tip;
    private String dstJsp;

    public void setGzId(Integer s) {
        this.gzId = s;
    }

    public Integer getGzId() {
        return this.gzId;
    }

    public void setGzUserId(Integer s) {
        this.gzUserId = s;
    }

    public Integer getGzUserId() {
        return this.gzUserId;
    }

    public void setGzUserName(String s) {
        this.gzUserName = s;
    }

    public String getGzUserName() {
        return this.gzUserName;
    }

    public void setBgzUserId(Integer s) {
        this.bgzUserId = s;
    }

    public Integer getBgzUserId() {
        return this.bgzUserId;
    }

    public void setBgzUserName(String s) {
        this.bgzUserName = s;
    }

    public String getBgzUserName() {
        return this.bgzUserName;
    }

    public void setDtGzDate(String s) {
        this.dtGzDate = s;
    }

    public String getDtGzDate() {
        return this.dtGzDate;
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

    public MemberGz getMemberGz() {
        return memberGz;
    }

    public void setMemberGz(MemberGz l) {
        this.memberGz = l;
    }

    public void setMemberGzService(IMemberGzService l) {
        this.memberGzService = l;
    }

    public String checkPrevAddHy() {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        UserInfo uo = new UserInfo();
        uo.setUserName(bgzUserName);
        UserInfo ucur = memberGzService.findByUserInfo(uo);
        if (ucur == null) {
            this.tip = "0";
        } else {
            GoodFriend gf = new GoodFriend();
            gf.setGzUserId(ui.getUserId());
            gf.setBgzUserId(ucur.getUserId());
            GoodFriend go = memberGzService.findIsMyFriends(gf);
            if (go != null) {
                this.tip = "1";
            } else {
                this.tip = "9";
                this.dstJsp = String.valueOf(ucur.getUserId());
            }
        }
        success = true;
        return SUCCESS;
    }

    public String addMemberHy() {
        UserInfo u = (UserInfo) getSession().getAttribute("user");
        if (u == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        UserInfo utmp = new UserInfo();
        utmp.setUserId(bgzUserId);
        UserInfo ucur = (UserInfo) memberGzService.findByUserInfo(utmp);
        if (ucur == null) {
            this.tip = "对不起，该人员不存在！";
            this.dstJsp = "turnSelfHy.action";
            return "input";
        }
        GoodFriend gf = new GoodFriend();
        gf.setGzUserId(u.getUserId());
        gf.setBgzUserId(bgzUserId);
        GoodFriend go = memberGzService.findIsMyFriends(gf);
        if (go != null) {
            this.tip = "对不起，该人员已经是您的好友！";
            this.dstJsp = "turnSelfHy.action";
            return "input";
        }

        MemberGz mg = new MemberGz();
        String sdt = "";
        sdt = getStringDateShort();

        mg.setBgzUserId(bgzUserId);
        mg.setBgzUserName(bgzUserName);
        mg.setDtGzDate(sdt);
        mg.setGzUserId(u.getUserId());
        mg.setGzUserName(u.getUserName());
        memberGzService.saveMemberGz(mg);
        this.tip = "成功添加好友";
        this.dstJsp = "turnSelfHy.action";

        success = true;
        return SUCCESS;
    }

    public String deleteHy() {
        UserInfo u = (UserInfo) getSession().getAttribute("user");
        if (u == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        success = memberGzService.deleteHy(gzId);
        this.tip = "成功删除好友";
        this.dstJsp = "turnSelfHy.action";

        return SUCCESS;
    }

}
