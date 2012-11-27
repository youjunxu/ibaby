package com.lhq.prj.bms.action;

import com.ibaby.www.dao.QueryParamsBuilder;
import com.ibaby.www.domain.service.TagService;
import com.ibaby.www.domain.valuetypes.Tag;
import com.ibaby.www.util.ApplicationHelper;
import com.ibaby.www.util.ModuleConfig;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.po.*;
import com.lhq.prj.bms.service.ILmBaxyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

import static com.ibaby.www.util.ApplicationHelper.parseInt;

/**
 * LmBaxyAction.java Create on 2012-5-4
 *
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class LmBaxyAction extends BaseAction {

    private final static Logger LOGGER = LoggerFactory.getLogger(LmBaxyAction.class);

    public static final String SUCCESS_MANAGER = "success_manager";
    private ILmBaxyService lmBaxyService;

    private TagService tagService;

    private LmBaxy lmBaxy;
    private boolean success;
    private Integer baId;
    private String strTitle;
    private String strAuthor;
    private Integer userId;
    private String userName;
    private String fromName;
    private String dtCrea;
    private String strContent;
    private String strMemo;
    private Integer readers;
    private Integer lmCode;
    private String lmName;
    private String strLable;
    private Integer plZans;
    private Integer plFlowers;
    private Integer plHands;
    private Integer plYms;
    private Integer plCais;
    private Integer grpCode;
    private Integer shbj;
    private String shrq;
    private Integer shUserId;
    private String shUserName;
    private String shLy;
    private Integer reEdit;
    private String shKey;
    private String tip;
    private String dstJsp;
    private String plSort;
    //	private String[] strMkList={"食谱/饮品/零食","保健/体育","认知/儿歌/故事/游戏/理财","玩具/书籍/音像","服饰/造型/居家"};
//	private String[] strMkList={"食谱/饮品/零食","保健/体育","认知/手工/游戏/理财","玩具/读本/视听","服饰/发型/居家"};
    private String[] strMkList = {"认知多一点", "健康加一点", "动手勤一点", "天天学一点", "扮靓美一点"};

    public void setTagService(TagService tagService){
        this.tagService = tagService;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public LmBaxy getLmBaxy() {
        return lmBaxy;
    }

    public void setLmBaxy(LmBaxy l) {
        this.lmBaxy = l;
    }

    public void setLmBaxyService(ILmBaxyService l) {
        this.lmBaxyService = l;
    }

    public Integer getBaId() {
        return baId;
    }

    public void setBaId(Integer s) {
        this.baId = s;
    }

    public String getStrTitle() {
        return strTitle;
    }

    public void setStrTitle(String s) {
        this.strTitle = s;
    }

    public String getStrAuthor() {
        return strAuthor;
    }

    public void setStrAuthor(String s) {
        this.strAuthor = s;
    }

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

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String s) {
        this.fromName = s;
    }

    public String getDtCrea() {
        return dtCrea;
    }

    public void setDtCrea(String s) {
        this.dtCrea = s;
    }

    public String getStrContent() {
        return strContent;
    }

    public void setStrContent(String s) {
        this.strContent = s;
    }

    public String getStrMemo() {
        return strMemo;
    }

    public void setStrMemo(String s) {
        this.strMemo = s;
    }

    public Integer getReaders() {
        return readers;
    }

    public void setReaders(Integer s) {
        this.readers = s;
    }

    public Integer getLmCode() {
        return lmCode;
    }

    public void setLmCode(Integer s) {
        this.lmCode = s;
    }

    public String getLmName() {
        return lmName;
    }

    public void setLmName(String s) {
        this.lmName = s;
    }

    public String getStrLable() {
        return strLable;
    }

    public void setStrLable(String s) {
        this.strLable = s;
    }

    public Integer getPlZans() {
        return plZans;
    }

    public void setPlZans(Integer s) {
        this.plZans = s;
    }

    public Integer getPlFlowers() {
        return plFlowers;
    }

    public void setPlFlowers(Integer s) {
        this.plFlowers = s;
    }

    public Integer getPlHands() {
        return plHands;
    }

    public void setPlHands(Integer s) {
        this.plHands = s;
    }

    public Integer getPlYms() {
        return plYms;
    }

    public void setPlYms(Integer s) {
        this.plYms = s;
    }

    public Integer getPlCais() {
        return plCais;
    }

    public void setPlCais(Integer s) {
        this.plCais = s;
    }

    public Integer getGrpCode() {
        return grpCode;
    }

    public void setGrpCode(Integer s) {
        this.grpCode = s;
    }

    public Integer getShbj() {
        return shbj;
    }

    public void setShbj(Integer s) {
        this.shbj = s;
    }

    public String getShrq() {
        return shrq;
    }

    public void setShrq(String s) {
        this.shrq = s;
    }

    public Integer getShUserId() {
        return shUserId;
    }

    public void setShUserId(Integer s) {
        this.shUserId = s;
    }

    public String getShUserName() {
        return shUserName;
    }

    public void setShUserName(String s) {
        this.shUserName = s;
    }

    public String getShLy() {
        return shLy;
    }

    public void setShLy(String s) {
        this.shLy = s;
    }

    public Integer getReEdit() {
        return reEdit;
    }

    public void setReEdit(Integer s) {
        this.reEdit = s;
    }

    public String getShKey() {
        return shKey;
    }

    public void setShKey(String s) {
        this.shKey = s;
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

    public String getPlSort() {
        return plSort;
    }

    public void setPlSort(String s) {
        this.plSort = s;
    }

    public String saveBaxy() throws Exception {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "非法操作，请先登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (!(strUserAcl.indexOf("BA303") >= 0 || strUserAcl.indexOf("BA507") >= 0 || strUserAcl.indexOf("BA509") >= 0 || strUserAcl.indexOf("999") >= 0)) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        LmBaxy x = new LmBaxy();
        Integer i;
        String sdt = "";
        List l;

        if ("".equals(strMemo) || strMemo == null) {
            this.tip = "请输入文章内容！";
            this.dstJsp = "prevSay.action";
            return "input";
        }

        x.setShbj(0);
        sdt = getStringDateShort();
        x.setStrTitle(strTitle);
        x.setStrAuthor(strAuthor);
        x.setUserId(userId);
        x.setUserName(userName);
        x.setFromName(fromName);
        x.setDtCrea(sdt);
        x.setLmCode(lmCode);
        x.setLmName(lmName);
        x.setReaders(0);
        x.setStrContent(strContent);
        x.setStrLable(strLable);

        BaDocSh bd = lmBaxyService.findBADOCSH();
        String[] objKey;
        Integer intLmp;
        Integer intTmp;
        if (bd != null) {
            intTmp = 1;
            if (bd.getShKey().contains(",")) {
                objKey = bd.getShKey().split(",");
                for (intLmp = 0; intLmp < objKey.length; intLmp++) {
                    if (strMemo.contains(objKey[intLmp])) {
                        intTmp = 0;
                        break;
                    }
                }
            } else {
                if (strMemo.contains(bd.getShKey())) {
                    intTmp = 0;
                }
            }
            if (intTmp == 0) {
                this.tip = "对不起，您提交的文档包含了国家禁止的字、词汇等！";
                this.dstJsp = "prevSay.action";
                return "input";
            }
        }

        x.setStrMemo(strMemo);
        x.setPlZans(0);
        x.setPlFlowers(0);
        x.setPlHands(0);
        x.setPlYms(0);
        x.setPlCais(0);
        i = lmBaxyService.saveBaxy(x);
        x.setBaId(i);

        tagArticle(i);

        getRequest().setAttribute("baList_lmName", lmName);
        getRequest().setAttribute("baList_lmCode", lmCode);
        LmBaxy lm = new LmBaxy();
        lm.setLmCode(lmCode);
        lm.setShbj(1);
        l = lmBaxyService.findBaxyByCond(lm);
        if (l.size() > 0) {
            getRequest().setAttribute("baList_list", l);
        }
        //计算导航链接用关键字
        String sCurname = lmName;
        for (String temp : strMkList) {
            String[] smp = temp.split("/");
            if (MyUtils.isValid(sCurname, smp)) {
                sCurname = temp;
                break;
            }
        }
        String strTemp = "";
        List lf = new ArrayList();
        if (sCurname.contains("/")) {
            String[] smp = sCurname.split("/");
            for (String temp : smp) {
                BaType bt = new BaType();
                bt.setLmName(temp);
                BaType ba = lmBaxyService.findBalxByCond(bt);
                if (ba == null) {
                    success = false;
                    return "input";
                } else {
                    strTemp = temp + "`" + String.valueOf(ba.getLmId());
                    lf.add(strTemp);
                }
            }
        } else {
            sCurname = sCurname + "`" + String.valueOf(lmCode);
            lf.add(sCurname);
        }

        getRequest().setAttribute("baList_mkxx", lf);
        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(_user.getUserId());
        lg.setUserName(_user.getUserName());
        lg.setCName("BA");
        lg.setOperatorDesc("成功发布贝爱学园文档");
        lmBaxyService.addBaLogInfo(lg);

        success = true;
        return SUCCESS;
    }

    private void tagArticle(Integer i) {
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
        tagService.tagging(articleId, "Article", tags);
    }

    public String updateBaxy() throws Exception {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "请先登录！";
            this.dstJsp = "login.jsp";
            success = false;
            return "input";
        }
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (!(strUserAcl.indexOf("BA303") >= 0 || strUserAcl.indexOf("BA507") >= 0 || strUserAcl.indexOf("BA509") >= 0 || strUserAcl.indexOf("999") >= 0)) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        LmBaxy yi = new LmBaxy();
        yi.setBaId(baId);
        List lold = lmBaxyService.findBaxyByCond(yi);
        if (lold.size() <= 0) {
            this.tip = "待更新的文档不存在！";
            this.dstJsp = "myHome.action";
            success = false;
            return "input";
        }
        LmBaxy y = (LmBaxy) lold.get(0);
        LmBaxy x = new LmBaxy();
        String sdt = "";
        List l;

        sdt = getStringDateShort();
        x.setBaId(baId);
        x.setStrTitle(strTitle);
        x.setStrAuthor(strAuthor);
        x.setFromName(fromName);
        x.setDtCrea(sdt);
        x.setLmCode(lmCode);
        x.setLmName(lmName);
        x.setStrContent(strContent);
        x.setStrLable(strLable);
        x.setStrMemo(strMemo);

        BaDocSh bd = lmBaxyService.findBADOCSH();
        String[] objKey;
        Integer intLmp;
        Integer intTmp;
        x.setShbj(null);
        if (bd != null) {
            if (bd.getReEdit().equals(1) || bd.getReEdit() == 1) {
                x.setShbj(0);
            }
            intTmp = 1;
            if (bd.getShKey().contains(",")) {
                objKey = bd.getShKey().split(",");
                for (intLmp = 0; intLmp < objKey.length; intLmp++) {
                    if (strMemo.contains(objKey[intLmp])) {
                        intTmp = 0;
                        break;
                    }
                }
            } else {
                if (strMemo.contains(bd.getShKey())) {
                    intTmp = 0;
                }
            }
            if (intTmp == 0) {
                this.tip = "对不起，您提交的文档包含了国家禁止的字、词汇等！";
                this.dstJsp = "prevEditBADoc.action?baId=" + String.valueOf(baId);
                success = false;
                return "input";
            }
        }
        if (y.getShbj() == 2) {
            x.setShbj(0);
        }
        this.tip = "成功更新！";
        this.dstJsp = "myPersonContent.action";

        success = lmBaxyService.updateBaxy(x);
        //TODO
        tagArticle(x.getBaId());

        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(_user.getUserId());
        lg.setUserName(_user.getUserName());
        lg.setCName("BA");
        lg.setOperatorDesc("成功更新贝爱学园文档");
        lmBaxyService.addBaLogInfo(lg);

        return SUCCESS;
    }

    public String updateBaxyA() throws Exception {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "请先登录！";
            this.dstJsp = "login.jsp";
            success = false;
            return "input";
        }
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (!(strUserAcl.indexOf("BA507") >= 0 || strUserAcl.indexOf("BA509") >= 0 || strUserAcl.indexOf("999") >= 0)) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }

        LmBaxy x = new LmBaxy();
        String sdt = "";
        List l;

        sdt = getStringDateShort();
        x.setStrTitle(strTitle);
        x.setStrAuthor(strAuthor);
        x.setFromName(fromName);
        x.setLmCode(lmCode);
        x.setLmName(lmName);
        x.setStrContent(strContent);
        x.setStrLable(strLable);
        x.setStrMemo(strMemo);
        x.setBaId(baId);

        BaDocSh bd = lmBaxyService.findBADOCSH();
        String[] objKey;
        Integer intLmp;
        Integer intTmp;
        if (bd != null) {
            intTmp = 1;
            if (bd.getShKey().contains(",")) {
                objKey = bd.getShKey().split(",");
                for (intLmp = 0; intLmp < objKey.length; intLmp++) {
                    if (strMemo.contains(objKey[intLmp])) {
                        intTmp = 0;
                        break;
                    }
                }
            } else {
                if (strMemo.contains(bd.getShKey())) {
                    intTmp = 0;
                }
            }
            if (intTmp == 0) {
                this.tip = "对不起，您提交的文档包含了国家禁止的字、词汇等！";
                this.dstJsp = "passBaxyEDoc.action?baId=" + String.valueOf(baId);
                return "input";
            }
        }
        this.tip = "成功更新！";
        this.dstJsp = "sysmanaBa.action";

        success = lmBaxyService.updateBaxy(x);

        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(_user.getUserId());
        lg.setUserName(_user.getUserName());
        lg.setCName("BA");
        lg.setOperatorDesc("成功更新贝爱学园文档");
        lmBaxyService.addBaLogInfo(lg);

        return SUCCESS;
    }

    public String updateBaDocSh() {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "非法操作，请先登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        BaDocSh bd = lmBaxyService.findBADOCSH();
        if (bd == null) {
            this.tip = "对不起，错误操作！";
            success = false;
            return "input";
        }
        bd.setReEdit(reEdit);
        bd.setShKey(shKey);
        bd.setUserId(_user.getUserId());
        bd.setUserName(_user.getUserName());
        bd.setDtUpdate(getStringDateShort());
        success = lmBaxyService.updateBADOCSH(bd);
        return SUCCESS;
    }

    public String saveBaDocSh() {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "非法操作，请先登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        BaDocSh be = lmBaxyService.findBADOCSH();
        if (be != null) {
            this.tip = "对不起，错误操作！";
            success = false;
            return "input";
        }
        BaDocSh bd = new BaDocSh();
        bd.setReEdit(reEdit);
        bd.setShKey(shKey);
        bd.setUserId(_user.getUserId());
        bd.setUserName(_user.getUserName());
        bd.setDtUpdate(getStringDateShort());
        lmBaxyService.saveBADOCSH(bd);
        success = true;
        return SUCCESS;
    }

    public String prevRemoveBADoc() {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        LmBaxy x = new LmBaxy();
        x.setBaId(baId);
        List l = lmBaxyService.findBaxyByCond(x);
        LmBaxy lm = null;
        if (l.size() > 0) {
            lm = (LmBaxy) l.get(0);
        }
        if (_user == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (!(strUserAcl.indexOf("BA303") >= 0 || strUserAcl.indexOf("BA507") >= 0 || strUserAcl.indexOf("BA509") >= 0 || strUserAcl.indexOf("999") >= 0)) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        if (lm == null) {
            this.tip = "错误的文档号！";
            this.dstJsp = "toMyHome.action";
            return "input";
        }
        success = lmBaxyService.deleteBaxy(baId);
        this.tip = "成功删除！";
        this.dstJsp = "toMyHome.action";
        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(_user.getUserId());
        lg.setUserName(_user.getUserName());
        lg.setCName("BA");
        lg.setOperatorDesc("成功删除贝爱学园文档（" + lm.getStrTitle() + "）");
        lmBaxyService.addBaLogInfo(lg);

        return SUCCESS;
    }

    public String forceRemoveBADoc() {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (strUserAcl.indexOf("BA509") == -1 && strUserAcl.indexOf("999") == -1) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String smp;
        LmBaxy x = new LmBaxy();
        x.setBaId(baId);
        List l = lmBaxyService.findBaxyByCond(x);
        LmBaxy lm = null;
        smp = "";
        if (l.size() > 0) {
            lm = (LmBaxy) l.get(0);
            smp = lm.getStrTitle();
        }
        if (lm == null) {
            this.tip = "错误的文档号！";
            this.dstJsp = "sysmanaBa.action";
            return "input";
        }
        success = lmBaxyService.deleteBaxy(baId);
        this.tip = "成功删除！";
        if (lm.getShbj() == 0) {
            this.dstJsp = "sysmanaBa.action";
        } else {
            this.dstJsp = "sysmanaBb.action";
        }
        String sdt = getStringDateShort();
        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(sdt);
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(_user.getUserId());
        lg.setUserName(_user.getUserName());
        lg.setCName("BA");
        lg.setOperatorDesc("成功删除贝爱学园文档（" + smp + "）");
        lmBaxyService.addBaLogInfo(lg);

        TbInbox tb = new TbInbox();
        tb.setDtSend(sdt);
        tb.setRecUserId(lm.getUserId());
        UserInfo un = lmBaxyService.findByUseId(lm.getUserId());
        tb.setRecUserName(un.getNickName());
        tb.setSendUserId(_user.getUserId());
        tb.setSendUserName("系统管理员");
        tb.setXsIn(1);
        tb.setXsOut(1);
        tb.setYdBj(0);

        return SUCCESS;
    }

    public String sysBA_jygl() {
        BaDocSh bd = lmBaxyService.findBADOCSH();
        getRequest().setAttribute("waitDisp_doc", bd);
        if (bd == null) {
            getRequest().setAttribute("waitDisp_bj", 0);
        } else {
            getRequest().setAttribute("waitDisp_bj", 1);
        }
        success = true;
        return SUCCESS;
    }

    public String findIndexBaxy() {
        List l;
        LmBaxy lm = new LmBaxy();
        lm.setLmCode(6);
        l = lmBaxyService.findBaxyByCond(lm);
        if (l.size() > 0) {
            getRequest().setAttribute("baIndex_yyt", l);
        }

        l = lmBaxyService.findNoYytBaxy();
        if (l.size() > 0) {
            getRequest().setAttribute("baIndex_noYyt", l);
        }
        success = true;
        return SUCCESS;
    }

    public String findIndexABaxy() {
        List l;
        LmBaxy lm = new LmBaxy();
        lm.setLmCode(6);
        lm.setShbj(1);
        l = lmBaxyService.findBaxyByCond(lm);
        if (l.size() > 0) {
            getRequest().setAttribute("baIndex_yyt", l);
        }

        l = lmBaxyService.findNoYytBaxy();
        if (l.size() > 0) {
            getRequest().setAttribute("baIndex_noYyt", l);
        }
        success = true;
        return SUCCESS;
    }

    public String baSeekList() {
        getRequest().setAttribute("baList_mkxx", strMkList);

        return beforeBAList();
    }

    public String beforeBAList() {
        List lq;
        LmBaxy lm = new LmBaxy();
        String sCurname;
        String strTemp;
        sCurname = "";

        if (lmCode == null && grpCode == null) {
            this.tip = "非法操作！";
            this.dstJsp = "firstBA.action";
            return "input";
        }
        BaType bp = new BaType();
        if (lmCode == null) {
            if (grpCode == 6) {
                strTemp = "译言堂";
            } else {
                strTemp = strMkList[grpCode - 1];
                strTemp = strTemp.split("/")[0];
            }
            bp.setLmName(strTemp);
        } else {
            bp.setLmId(lmCode);
        }
        BaType bb = lmBaxyService.findBalxByCond(bp);
        if (bb == null) {
            this.tip = "非法操作！";
            this.dstJsp = "firstBA.action";
            return "input";
        }

        lm.setLmCode(bb.getLmId());
        lm.setShbj(1);
        lq = lmBaxyService.findBaxyByCond(lm);
        getRequest().setAttribute("baList_list", lq);
        getRequest().setAttribute("baList_lmName", bb.getLmName());
        getRequest().setAttribute("baList_lmCode", bb.getLmId());

        sCurname = bb.getLmName();
        //计算导航链接用关键字
        for (String temp : strMkList) {
            String[] smp = temp.split("/");
            if (MyUtils.isValid(sCurname, smp)) {
                sCurname = temp;
                break;
            }
        }
        strTemp = "";
        List<String> lf = new ArrayList();
        if (sCurname.contains("/")) {
            String[] smp = sCurname.split("/");
            for (String temp : smp) {
                BaType bt = new BaType();
                bt.setLmName(temp);
                BaType ba = lmBaxyService.findBalxByCond(bt);
                if (ba == null) {
                    success = false;
                    return "input";
                } else {
                    strTemp = temp + "`" + String.valueOf(ba.getLmId());
                    lf.add(strTemp);
                }
            }
        } else {
            sCurname = sCurname + "`" + String.valueOf(bb.getLmId());
            lf.add(sCurname);
        }
        getRequest().setAttribute("baList_mkxx", lf);
        success = true;

        //TODO we will remove the lmCode and just use module_id.
        List<Tag> tags = tagService.findTagsByGroup(lmCode);
        getRequest().setAttribute("moduleId", lmCode);
        getRequest().setAttribute("tagList", tags);

        return SUCCESS;
    }

    public String firstBA() {

        Integer intLmp;
        Integer intTmp;
        String[] objA;
        String strLmp;
        List la = new ArrayList();
        List lb = new ArrayList();
        List lc = new ArrayList();
        List ld = new ArrayList();
        List le = new ArrayList();

        strLmp = "";
        for (intLmp = 0; intLmp < strMkList.length; intLmp++) {
            objA = strMkList[intLmp].split("/");
            for (intTmp = 0; intTmp < objA.length; intTmp++) {
                BaType x = new BaType();
                x.setLmName(objA[intTmp]);
                BaType a = lmBaxyService.findBalxByCond(x);
                if (a != null) {
                    strLmp = objA[intTmp] + "`" + String.valueOf(a.getLmId());
                } else {
                    strLmp = objA[intTmp] + "`";
                }
                if (intLmp == 0) la.add(strLmp);
                if (intLmp == 1) lb.add(strLmp);
                if (intLmp == 2) lc.add(strLmp);
                if (intLmp == 3) ld.add(strLmp);
                if (intLmp == 4) le.add(strLmp);
            }
        }
        List al = lmBaxyService.findBaxyByFirstA();
        getRequest().setAttribute("baFirst_aa", al);

        List bl = lmBaxyService.findBaxyByFirstB();
        List cl = lmBaxyService.findBaxyByFirstC();
        List dl = lmBaxyService.findBaxyByFirstD();
        List el = lmBaxyService.findBaxyByFirstE();

        getRequest().setAttribute("baFirst_aa", al);
        getRequest().setAttribute("baFirst_ba", bl);
        getRequest().setAttribute("baFirst_ca", cl);
        getRequest().setAttribute("baFirst_da", dl);
        getRequest().setAttribute("baFirst_ea", el);

        getRequest().setAttribute("baFirst_ab", la);
        getRequest().setAttribute("baFirst_bb", lb);
        getRequest().setAttribute("baFirst_cb", lc);
        getRequest().setAttribute("baFirst_db", ld);
        getRequest().setAttribute("baFirst_eb", le);

        List lgg = lmBaxyService.findSpggByBaxy();
        getRequest().setAttribute("baFirst_spgg", lgg);

        BaType y = new BaType();
        y.setLmName("译言堂");
        BaType a = lmBaxyService.findBalxByCond(y);
        List lf = new ArrayList();
        lf.add("译言堂");
        lf.add(String.valueOf(a.getLmId()));
        getRequest().setAttribute("baFirst_fb", lf);
        List fl = lmBaxyService.findBaxyByFirstF();
        getRequest().setAttribute("baFirst_fa", fl);

        success = true;
        return SUCCESS;
    }

    public String prevOpenBAShDoc() {
        Integer iz;
        LmBaxy lm = new LmBaxy();
        LmBaxy ln = new LmBaxy();
        List lsA;
        List lsB;
        String sCurname;
        String strTemp;
        Integer intCur;
        LmBaxy baPrev = null;
        LmBaxy baNext = null;

        lm.setBaId(baId);
        lsA = lmBaxyService.findBaxyByCond(lm);
        if (lsA.size() == 0) {
            this.tip = "非法操作！";
            this.dstJsp = "firstBA.action";
            return "input";
        }
        intCur = 0;
        LmBaxy la = (LmBaxy) lsA.get(0);
        getRequest().setAttribute("baIndex_docOpen", la);
        UserInfo un = lmBaxyService.findByUseId(la.getUserId());
        getRequest().setAttribute("baIndex_docFbr", un.getNickName());

        //获得同一类的集合
        ln.setLmCode(la.getLmCode());
        ln.setShbj(0);
        lsB = lmBaxyService.findBaxyByCond(ln);
        for (Integer i = 0; i < lsB.size(); i++) {
            LmBaxy by = (LmBaxy) lsB.get(i);
            if (by.getBaId().equals(baId)) {
                intCur = 1;
            } else {
                if (intCur == 0) {
                    baPrev = by;
                }
                if (intCur == 1) {
                    if (baNext == null) {
                        baNext = by;
                        break;
                    }
                }
            }
        }
        getRequest().setAttribute("baIndex_docPrev", baPrev);
        getRequest().setAttribute("baIndex_docNext", baNext);
        //计算导航链接用关键字
        sCurname = la.getLmName();
        for (String temp : strMkList) {
            String[] smp = temp.split("/");
            if (MyUtils.isValid(sCurname, smp)) {
                sCurname = temp;
                break;
            }
        }
        strTemp = "";
        List lf = new ArrayList();
        if (sCurname.contains("/")) {
            String[] smp = sCurname.split("/");
            for (String temp : smp) {
                BaType bt = new BaType();
                bt.setLmName(temp);
                BaType ba = lmBaxyService.findBalxByCond(bt);
                if (ba == null) {
                    this.tip = "非法操作！";
                    this.dstJsp = "firstBA.action";
                    return "input";
                } else {
                    strTemp = temp + "`" + String.valueOf(ba.getLmId());
                    lf.add(strTemp);
                }
            }
        } else {
            sCurname = sCurname + "`" + String.valueOf(la.getLmCode());
            lf.add(sCurname);
        }
        getRequest().setAttribute("baList_mkxx", lf);

        success = true;
        return SUCCESS;
    }

    public String prevOpenBADoc() throws Exception {
        UserInfo uu = (UserInfo) getSession().getAttribute("user");
        Integer iz;
        LmBaxy lm = new LmBaxy();
        LmBaxy ln = new LmBaxy();
        String sdt = getStringDateShort();
        String dtCurOnly = getStringDateOnly();
        List lsA;
        List lsB;
        String sCurname;
        String strTemp;
        Integer intCur;
        LmBaxy baPrev = null;
        LmBaxy baNext = null;
        lm.setBaId(baId);
        //更新阅读数
        success = lmBaxyService.updateBaReaders(baId);

        lsA = lmBaxyService.findBaxyByCond(lm);
        if (lsA.size() == 0) {
            this.tip = "非法操作！";
            this.dstJsp = "firstBA.action";
            return "input";
        }
        intCur = 0;
        LmBaxy la = (LmBaxy) lsA.get(0);
        getRequest().setAttribute("baIndex_docOpen", la);
        UserInfo un = lmBaxyService.findByUseId(la.getUserId());
        getRequest().setAttribute("baIndex_docFbr", un.getNickName());

        if (uu != null) {
            //查看当天是否第一次阅读此文档
            SeekLog sl = new SeekLog();
            sl.setDocId(la.getBaId());
            sl.setDtSeek(dtCurOnly);
            sl.setSkUserId(uu.getUserId());
            List sst = lmBaxyService.findSeekLogByInfo(sl);
            SeekLog sg = null;
            if (sst.size() > 0) {
                sg = (SeekLog) sst.get(0);
            }
            if (sg == null) {
                //积分
                MemberJfgz curJfgz = lmBaxyService.findJfgzByCode("BA_SKDOC");
                if (curJfgz != null) {
                    MemberJfxf xfjf = new MemberJfxf();
                    xfjf.setDtXfDate(sdt);
                    xfjf.setGzCode(curJfgz.getGzCode());
                    xfjf.setGzId(curJfgz.getGzId());
                    xfjf.setUserId(uu.getUserId());
                    xfjf.setUserName(uu.getUserName());
                    xfjf.setXfDesc("阅读贝爱学园文章");
                    xfjf.setXfJf(curJfgz.getJfs());
                    lmBaxyService.addUserJfxx(xfjf);
                    UserInfo uo = new UserInfo();
                    uo.setUserId(uu.getUserId());
                    Float fltCurs = uu.getUserJfzs();
                    fltCurs = fltCurs + curJfgz.getJfs();
                    uo.setUserJfzs(fltCurs);
                    uo.setUserSyjf(fltCurs);
                    success = lmBaxyService.updateUser(uo);
                    uu.setUserJfzs(fltCurs);
                    uu.setUserSyjf(fltCurs);
                    getSession().removeAttribute("user");
                    getSession().setAttribute("user", uu);
                }
            }
            //记录日志
            SeekLog so = new SeekLog();
            so.setDocId(la.getBaId());
            so.setDtSeek(sdt);
            so.setSkUserId(uu.getUserId());
            so.setSkUserName(uu.getUserName());
            so.setMkCode("BA");
            so.setSkIp(getRequest().getRemoteAddr());
            lmBaxyService.saveSeekLog(so);
        }

        //获得同一类的集合
        ln.setLmCode(la.getLmCode());
        ln.setShbj(1);
        lsB = lmBaxyService.findBaxyByCond(ln);
        for (Integer i = 0; i < lsB.size(); i++) {
            LmBaxy by = (LmBaxy) lsB.get(i);
            if (by.getBaId().equals(baId)) {
                intCur = 1;
            } else {
                if (intCur == 0) {
                    baPrev = by;
                }
                if (intCur == 1) {
                    if (baNext == null) {
                        baNext = by;
                        break;
                    }
                }
            }
        }
        getRequest().setAttribute("baIndex_docPrev", baPrev);
        getRequest().setAttribute("baIndex_docNext", baNext);
        //计算导航链接用关键字
        sCurname = la.getLmName();
        for (String temp : strMkList) {
            String[] smp = temp.split("/");
            if (MyUtils.isValid(sCurname, smp)) {
                sCurname = temp;
                break;
            }
        }
        strTemp = "";
        List lf = new ArrayList();
        if (sCurname.contains("/")) {
            String[] smp = sCurname.split("/");
            for (String temp : smp) {
                BaType bt = new BaType();
                bt.setLmName(temp);
                BaType ba = lmBaxyService.findBalxByCond(bt);
                if (ba == null) {
                    this.tip = "非法操作！";
                    this.dstJsp = "firstBA.action";
                    return "input";
                } else {
                    strTemp = temp + "`" + String.valueOf(ba.getLmId());
                    lf.add(strTemp);
                }
            }
        } else {
            sCurname = sCurname + "`" + String.valueOf(la.getLmCode());
            lf.add(sCurname);
        }
        getRequest().setAttribute("baList_mkxx", lf);

        success = true;
        return SUCCESS;
    }

    public String prevOpenBACXDoc() throws Exception {
        UserInfo uu = (UserInfo) getSession().getAttribute("user");
        LmBaxy lm = new LmBaxy();
        String sdt = getStringDateShort();
        String dtCurOnly = getStringDateOnly();
        List lsA;
        String sCurname;
        String strTemp;
        lm.setBaId(baId);
        //更新阅读数
        success = lmBaxyService.updateBaReaders(baId);

        lsA = lmBaxyService.findBaxyByCond(lm);
        if (lsA.size() == 0) {
            this.tip = "非法操作！";
            this.dstJsp = "firstBA.action";
            return "input";
        }
        LmBaxy la = (LmBaxy) lsA.get(0);
        getRequest().setAttribute("baIndex_docOpen", la);
        UserInfo un = lmBaxyService.findByUseId(la.getUserId());
        getRequest().setAttribute("baIndex_docFbr", un.getNickName());

        if (uu != null) {
            //查看当天是否第一次阅读此文档
            SeekLog sl = new SeekLog();
            sl.setDocId(la.getBaId());
            sl.setDtSeek(dtCurOnly);
            sl.setSkUserId(uu.getUserId());
            List sst = lmBaxyService.findSeekLogByInfo(sl);
            SeekLog sg = null;
            if (sst.size() > 0) {
                sg = (SeekLog) sst.get(0);
            }
            if (sg == null) {
                //积分
                MemberJfgz curJfgz = lmBaxyService.findJfgzByCode("BA_SKDOC");
                if (curJfgz != null) {
                    MemberJfxf xfjf = new MemberJfxf();
                    xfjf.setDtXfDate(sdt);
                    xfjf.setGzCode(curJfgz.getGzCode());
                    xfjf.setGzId(curJfgz.getGzId());
                    xfjf.setUserId(uu.getUserId());
                    xfjf.setUserName(uu.getUserName());
                    xfjf.setXfDesc("阅读贝爱学园文章");
                    xfjf.setXfJf(curJfgz.getJfs());
                    lmBaxyService.addUserJfxx(xfjf);
                    UserInfo uo = new UserInfo();
                    uo.setUserId(uu.getUserId());
                    Float fltCurs = uu.getUserJfzs();
                    fltCurs = fltCurs + curJfgz.getJfs();
                    uo.setUserJfzs(fltCurs);
                    uo.setUserSyjf(fltCurs);
                    success = lmBaxyService.updateUser(uo);
                    uu.setUserJfzs(fltCurs);
                    uu.setUserSyjf(fltCurs);
                    getSession().removeAttribute("user");
                    getSession().setAttribute("user", uu);
                }
            }
            //记录日志
            SeekLog so = new SeekLog();
            so.setDocId(la.getBaId());
            so.setDtSeek(sdt);
            so.setSkUserId(uu.getUserId());
            so.setSkUserName(uu.getUserName());
            so.setMkCode("BA");
            so.setSkIp(getRequest().getRemoteAddr());
            lmBaxyService.saveSeekLog(so);
        }

        //计算导航链接用关键字
        sCurname = la.getLmName();
        for (String temp : strMkList) {
            String[] smp = temp.split("/");
            if (MyUtils.isValid(sCurname, smp)) {
                sCurname = temp;
                break;
            }
        }
        strTemp = "";
        List lf = new ArrayList();
        if (sCurname.contains("/")) {
            String[] smp = sCurname.split("/");
            for (String temp : smp) {
                BaType bt = new BaType();
                bt.setLmName(temp);
                BaType ba = lmBaxyService.findBalxByCond(bt);
                if (ba == null) {
                    this.tip = "非法操作！";
                    this.dstJsp = "firstBA.action";
                    return "input";
                } else {
                    strTemp = temp + "`" + String.valueOf(ba.getLmId());
                    lf.add(strTemp);
                }
            }
        } else {
            sCurname = sCurname + "`" + String.valueOf(la.getLmCode());
            lf.add(sCurname);
        }
        getRequest().setAttribute("baList_mkxx", lf);

        success = true;
        return SUCCESS;
    }

    public String prevEditBADoc() {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "非法操作，请先登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (!(strUserAcl.indexOf("BA303") >= 0 || strUserAcl.indexOf("BA507") >= 0 || strUserAcl.indexOf("BA509") >= 0 || strUserAcl.indexOf("999") >= 0)) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }

        LmBaxy lm = new LmBaxy();
        lm.setBaId(baId);
        LmBaxy bf;
        List l = lmBaxyService.findBaxyByCond(lm);
        if (l.size() > 0) {
            bf = (LmBaxy) l.get(0);
            getRequest().setAttribute("waitEdit_doc", bf);
        }
        List ll = lmBaxyService.findAllBalx();
        getRequest().setAttribute("waitList_balx", ll);

        success = true;
        return SUCCESS;
    }

    public String passBaxyEDoc() {
        LmBaxy lm = new LmBaxy();
        lm.setBaId(baId);
        LmBaxy bf;
        List l = lmBaxyService.findBaxyByCond(lm);
        if (l.size() > 0) {
            bf = (LmBaxy) l.get(0);
            getRequest().setAttribute("waitEdit_doc", bf);
        }
        List ll = lmBaxyService.findAllBalx();
        getRequest().setAttribute("waitList_balx", ll);

        success = true;
        return SUCCESS;
    }

    public String changeDocPlResult() {
        String s = getRequest().getParameter("pl");
        UserInfo uu = (UserInfo) getSession().getAttribute("user");
        PingLun pl = new PingLun();
        String sdt = getStringDateShort();
        String strReturn = "";
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (!(strUserAcl.indexOf("303") >= 0 || strUserAcl.indexOf("999") >= 0)) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }

        this.plSort = s;
        if (s == null || uu == null) {
            success = false;
            this.tip = "请登录后从正常链接进入！";
        } else {
            success = false;
            pl.setUserId(uu.getUserId());
            pl.setUserName(uu.getUserName());
            pl.setDocId(baId);
            pl.setMkCode("BA");
            pl.setPlDate(sdt);
            if (s.equals("1")) {
                pl.setPlResult(1);
                success = lmBaxyService.updatePingLun(pl);
                if (success) {
                    success = lmBaxyService.updateBaPlzans(baId);
                }
            }
            if (s.equals("2")) {
                pl.setPlResult(2);
                success = lmBaxyService.updatePingLun(pl);
                if (success) {
                    success = lmBaxyService.updateBaPlxhs(baId);
                }
            }
            if (s.equals("3")) {
                pl.setPlResult(3);
                success = lmBaxyService.updatePingLun(pl);
                if (success) {
                    success = lmBaxyService.updateBaPlhands(baId);
                }
            }
            if (s.equals("4")) {
                pl.setPlResult(4);
                success = lmBaxyService.updatePingLun(pl);
                if (success) {
                    success = lmBaxyService.updateBaPlyms(baId);
                }
            }
            if (s.equals("5")) {
                pl.setPlResult(5);
                success = lmBaxyService.updatePingLun(pl);
                if (success) {
                    success = lmBaxyService.updateBaPlcais(baId);
                }
            }
            if (success) {
                this.tip = "成功评论！";
                //写日志
                LogInfo lg = new LogInfo();
                lg.setCzDate(getStringDateShort());
                lg.setLogIp(getRequest().getRemoteAddr());
                lg.setUserId(uu.getUserId());
                lg.setUserName(uu.getUserName());
                lg.setCName("BA");
                lg.setOperatorDesc("成功对贝爱学园文档发表评论");
                lmBaxyService.addBaLogInfo(lg);
            } else {
                this.tip = "评论失败！";
            }
        }
        return SUCCESS;
    }

    public String prevSay() {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (!(strUserAcl.indexOf("BA303") >= 0 || strUserAcl.indexOf("BA507") >= 0 || strUserAcl.indexOf("BA509") >= 0 || strUserAcl.indexOf("999") >= 0)) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }

        List l = lmBaxyService.findAllBalx();
        getRequest().setAttribute("waitList_balx", l);

        success = true;
        return SUCCESS;
    }

    public String sysmanaBa() {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = 0;
        int li = 0;
        int ls = 0;
        String[] objLmp;

        li = 10;
        ls = 0;
        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }

        LmBaxy xb = new LmBaxy();
        xb.setShbj(0);
        List l = lmBaxyService.findBaxyByCond(xb);
        List lf = new ArrayList();
        Integer intLmp;
        Integer intTmp;
        if (l.size() > 0) {
            intTmp = 0;
            for (intLmp = 0; intLmp < l.size(); intLmp++) {
                intTmp = intTmp + 1;
                if (intTmp > ls && intTmp <= (ls + li)) {
                    lf.add(l.get(intLmp));
                }
                if (intTmp > (intTmp + li)) {
                    break;
                }
            }
        }

        getRequest().setAttribute("sysList_disp", lf);
        if (l == null) {
            iz = 0;
        } else {
            iz = l.size();
        }
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

    public String sysmanaBb() {
        UserInfo _user = (UserInfo) getSession().getAttribute("user");
        if (_user == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String strUserAcl = (String) getSession().getAttribute("userAcl");
        if (!(strUserAcl.indexOf("BA509") >= 0 || strUserAcl.indexOf("999") >= 0)) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        String tmpa = getRequest().getParameter("limit");
        String tmpb = getRequest().getParameter("start");
        int iz = 0;
        int li = 0;
        int ls = 0;
        String[] objLmp;

        li = 10;
        ls = 0;
        if (tmpa != null) {
            li = Integer.valueOf(tmpa);
        }
        if (tmpb != null) {
            ls = Integer.valueOf(tmpb);
        }

        List l = lmBaxyService.findBaxyByAllSys();
        List lf = new ArrayList();
        Integer intLmp;
        Integer intTmp;
        if (l.size() > 0) {
            intTmp = 0;
            for (intLmp = 0; intLmp < l.size(); intLmp++) {
                intTmp = intTmp + 1;
                if (intTmp > ls && intTmp <= (ls + li)) {
                    lf.add(l.get(intLmp));
                }
                if (intTmp > (intTmp + li)) {
                    break;
                }
            }
        }

        getRequest().setAttribute("sysList_disp", lf);
        if (l == null) {
            iz = 0;
        } else {
            iz = l.size();
        }
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

    public String passBaxyShDoc() throws Exception {
        UserInfo ui = (UserInfo) getSession().getAttribute("user");
        String tmpa = getRequest().getParameter("JG");
        String sdt = getStringDateShort();
        if (ui == null) {
            this.tip = "非法操作，请您登录！";
            this.dstJsp = "login.jsp";
            return "input";
        }
        if (baId == null || tmpa == null) {
            this.tip = "非法操作！";

            success = false;
            return SUCCESS;
        }
        if (!"1".equals(tmpa) & !"2".equals(tmpa)) {
            this.tip = "非法操作！";
            this.dstJsp = "sysmanaBa.action";
            success = false;
            return SUCCESS;
        }
        LmBaxy wb = new LmBaxy();
        wb.setBaId(baId);
        List lstOldBa = lmBaxyService.findBaxyByCond(wb);
        LmBaxy awb = new LmBaxy();
        awb = (LmBaxy) lstOldBa.get(0);
        UserInfo uf = lmBaxyService.findByUseId(awb.getUserId());
        TbInbox tb = new TbInbox();
        tb.setDtSend(sdt);
        tb.setRecUserId(awb.getUserId());
        tb.setRecUserName(uf.getNickName());
        tb.setSendUserId(ui.getUserId());
        tb.setSendUserName("admin");
        tb.setXsIn(1);
        tb.setXsOut(1);
        tb.setYdBj(0);
        //计算积分
        if (tmpa.equals("1")) {
            MemberJfgz curJfgz;
            if (awb.getFromName() != null) {
                if (awb.getFromName().equals("")) {
                    curJfgz = lmBaxyService.findJfgzByCode("BA_FBDOC");
                } else {
                    curJfgz = lmBaxyService.findJfgzByCode("BA_UPDOC");
                }
            } else {
                curJfgz = lmBaxyService.findJfgzByCode("BA_FBDOC");
            }
            if (curJfgz != null) {
                MemberJfxf xfjf = new MemberJfxf();
                xfjf.setDtXfDate(sdt);
                xfjf.setGzCode(curJfgz.getGzCode());
                xfjf.setGzId(curJfgz.getGzId());
                xfjf.setUserId(awb.getUserId());
                xfjf.setUserName(awb.getUserName());
                xfjf.setXfDesc("发布贝爱学园文章");
                xfjf.setXfJf(curJfgz.getJfs());
                lmBaxyService.addUserJfxx(xfjf);

                UserInfo uo = lmBaxyService.findByUseId(awb.getUserId());
                Float fltCurs = uo.getUserJfzs();
                fltCurs = fltCurs + curJfgz.getJfs();
                UserInfo up = new UserInfo();
                up.setUserId(awb.getUserId());
                up.setUserJfzs(fltCurs);
                up.setUserSyjf(fltCurs);
                success = lmBaxyService.updateUser(up);
                ui.setUserJfzs(fltCurs);
                ui.setUserSyjf(fltCurs);
                getSession().removeAttribute("user");
                getSession().setAttribute("user", ui);
            }
            tb.setXxBody("您创建的贝爱学园文章 (" + awb.getStrTitle() + ") 已通过系统审核");
            tb.setXxTitle("您创建的贝爱学园文章已通过系统审核");
        } else {
            tb.setXxBody("您创建的贝爱学园文章 (" + awb.getStrTitle() + ") 未通过系统审核，原因：" + shLy);
            tb.setXxTitle("您创建的贝爱学园文章未通过系统审核");
        }
        lmBaxyService.saveTbInbox(tb);

        LmBaxy s = new LmBaxy();
        s.setBaId(baId);
        s.setShbj(Integer.valueOf(tmpa));
        s.setShrq(sdt);
        s.setShUserId(ui.getUserId());
        s.setShUserName(ui.getUserName());
        s.setShLy(shLy);
        success = lmBaxyService.updateBaxyShbj(s);

        //写日志
        LogInfo lg = new LogInfo();
        lg.setCzDate(getStringDateShort());
        lg.setLogIp(getRequest().getRemoteAddr());
        lg.setUserId(ui.getUserId());
        lg.setUserName(ui.getUserName());
        lg.setCName("BA");
        if (tmpa.equals("1")) {
            lg.setOperatorDesc("审核贝爱学园文档（" + awb.getStrTitle() + "）结果：通过审核");
        } else {
            lg.setOperatorDesc("审核贝爱学园文档（" + awb.getStrTitle() + "）结果：未通过审核");
        }
        lmBaxyService.addBaLogInfo(lg);

        this.tip = "成功提交审核信息！";
        this.dstJsp = "sysmanaBa.action";
        return SUCCESS;
    }
}
