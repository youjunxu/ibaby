<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lhq.prj.bms.core.MyUtils" %>
<%@ page import="com.lhq.prj.bms.po.UserInfo" %>
<%@ page import="com.lhq.prj.bms.po.LmBaxy" %>
<%@ page import="com.ibaby.www.domain.valuetypes.Tag" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    UserInfo objUser = (UserInfo) request.getSession().getAttribute("user");
    String strUserAcl = (String) request.getSession().getAttribute("userAcl");
    Integer flagUser = (Integer) request.getSession().getAttribute("flagUser");

    Integer intCurCode = (Integer) request.getAttribute("baList_lmCode");
    String strCurMk = (String) request.getAttribute("baList_lmName");
    List ls = (List) request.getAttribute("baList_list");
    List lstmk = (List) request.getAttribute("baList_mkxx");

    List tags = (List) request.getAttribute("tag_list");

    Integer intSize;
    Integer intA;
    Integer intB;
    Integer pageZs;
    Integer pageCur;
    Integer lineStart;
    Integer lineEnd;
    Double dblLmp;
    Double dblTmp;
    String strLmp;
    String[] objLmp;
    String strMkDisp;
    String strFbsj;
    SimpleDateFormat simpleDateFormat;
    java.util.Date date;
    Integer intLmp;
    String[] slmp;
    simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    if (intCurCode == null || strCurMk == null) {
%>
<jsp:forward page="error.jsp"/>
<%
    }
    intSize = 0;
    if (ls == null) {
        intSize = 0;
    } else {
        intSize = ls.size();
    }
    strMkDisp = "";
    strLmp = "";
    if (lstmk == null) {
        strMkDisp = "";
    } else {
        for (intLmp = 0; intLmp < lstmk.size(); intLmp++) {
            String temp = (String) lstmk.get(intLmp);
            slmp = temp.split("`");
            if (strCurMk.equals(slmp[0])) {
                strLmp = "<font color='#FF0000'>" + slmp[0] + "</font>";
            } else {
                strLmp = "<a href='" + basePath + "/baSeekList.action?lmCode=" + slmp[1] + "' >";
                strLmp = strLmp + "<font color='#2F9681'>";
                strLmp = strLmp + slmp[0] + "</font></a>";
            }
            if (!"".equals(strMkDisp)) {
                strMkDisp = strMkDisp + " / ";
            }
            strMkDisp = strMkDisp + strLmp;
        }
    }
    strLmp = "<a href='" + basePath + "/manager.jsp'><font color='#2F9681'>首页</font></a>";
    strLmp = strLmp + " > <a href='" + basePath + "/firstBA.action'><font color='#2F9681'>贝爱学园</font></a>";
    strMkDisp = strLmp + " > " + strMkDisp;
//计算翻页信息
    Integer intPageLine = 15;
    strLmp = request.getParameter("pCur");
    pageZs = 0;
    if (strLmp == null) {
        pageCur = 1;
    } else {
        if (strLmp == "") {
            pageCur = 1;
        } else {
            pageCur = Integer.valueOf(strLmp);
        }
    }
    lineStart = (pageCur - 1) * intPageLine + 1;
    lineEnd = lineStart + intPageLine - 1;
    dblLmp = 0.0;
    dblTmp = 0.0;

    if (intSize > 0) {
        dblLmp = Math.floor(intSize / intPageLine);
        dblTmp = dblLmp * intPageLine;
        if (dblTmp < intSize) {
            dblLmp = dblLmp + 1;
        }
        strLmp = String.valueOf(dblLmp);
        objLmp = strLmp.split("\\.");
        strLmp = objLmp[0];
        pageZs = Integer.valueOf(strLmp);
    }
    intLmp = 4;
    String strPageOut = MyUtils.getNormalPageInfo(intSize, intPageLine, pageCur, pageZs, intLmp);
    intLmp = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>贝爱学园</title>
    <link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>/assets/stylesheets/tags.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/validate.js"></script>
    <style type="text/css">
        <!--
        .grnbold {
            color: #079607;
            font-weight: bold;
        }

        #idBaYyys {
            color: #59B1A9;
            font-size: 24px;
        }

        -->
    </style>
    <script LANGUAGE='Javascript'>
        function doOpenDoc(strId) {
            location.href = '<%=basePath%>/prevOpenBADoc.action?baId=' + strId;
        }
        function toPage(strP) {
            var i = 0;
            var t1 = '';

            i = (parseInt(strP) - 1) *<%=intPageLine%>;
            t1 = '<%=basePath%>/baSeekList.action?lmCode=<%=intCurCode%>&pCur=' + strP + '&limit=<%=intPageLine%>&start=' + i;
            location.href = t1;
        }
        function toTurnPage() {
            var doc = document.frmTurnPage;
            var t1 = doc.ipg.value;

            if (t1 == '') {
                alert('请输入欲跳转的页数！');
                return false;
            }
            if (!checkIsNumber(doc.ipg)) {
                alert('非法输入，请重新输入跳转页数！');
                return false;
            }
            if (parseInt(t1) == 0 || parseInt(t1) ><%=pageZs%>) {
                alert('非法输入，请重新输入跳转页数！');
                return false;
            }
            toPage(t1);
        }

        function doWyfx() {
        <%
      if (objUser!=null)
      {
          if(strUserAcl.indexOf("BA303")>=0 || strUserAcl.indexOf("BA509")>=0 || strUserAcl.indexOf("909")>=0){
              %>
            location.href = '<%=basePath%>/prevSay.action';
        <%
          }else
          {
              %>
            alert('对不起，您的账号暂时不支持此操作，请联系网站管理员！');
        <%
          }
      }else
      {
          %>
            alert('请您先登录再进行此操作！');
            location.href = '<%=basePath%>/login.jsp';
        <%
        }
        %>
        }

    </script>
</head>

<body>
<s:action name="gvCurUserTopMenu" executeResult="true">
    <s:param name="strCurMkCode">BAXY</s:param>
</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
    <tr style='height:30px;'>
        <td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
        <table width=100% border=0>
            <tr>
                <td width=38></td>
                <%
                    if (flagUser == null) {
                %>
                <td align="left">
                    您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<%=strMkDisp%>
                </td>
                <%
                } else {
                    if (flagUser > 0) {
                %>
                <td align="left" width=70%>
                    您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<%=strMkDisp%>
                </td>
                <td align='right'><input name="" type="image" src="<%=basePath%>/images/wyfx1.jpg" onclick='doWyfx()'/>
                </td>
                <%
                } else {
                %>
                <td align="left">
                    您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<%=strMkDisp%>
                </td>
                <%
                        }
                    }
                %>
            </tr>
        </table>
        </td>
    </tr>
    <tr>
        <td style='height:40px;'>

            <table cellspacing='0' cellpadding="0" border='0' style='width:98%;'>
                <tr>
                    <td width=38 align='left'></td>
                    <td width=202 align='left'>
                        <font color='#A9714E' size='5'><%=strCurMk%>
                        </font>
                    </td>
                    <td valign="bottom">&nbsp;<img src='<%=basePath%>/images/top_bottom.gif' width=693/></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>


            <table cellspacing='0' cellpadding="0" border='0' style='width:100%; height:500px; font-size: 12px;'>
                <tr>
                    <td width=20% valign="top" align='left'>
                    <s:include value='includes/_tags.jsp' />
                    </td>
                    <td width=5% style='background:url(<%=basePath%>/images/icon_dash.gif) repeat-y;'/></td>
                    <td valign="top" align='left'>
                        <table cellspacing='0' cellpadding="0" border='0' width='95%'>
                            <%
                                if (intSize >= lineStart) {
                                    intLmp = lineStart - 1;
                                    intA = lineEnd;
                                    if (intA > intSize) intA = intSize;
                                    for (intB = intLmp; intB < intA; intB = intB + 1) {
                                        LmBaxy lm = (LmBaxy) ls.get(intB);
                                        strLmp = lm.getStrTitle();

                                        date = simpleDateFormat.parse(lm.getDtCrea());
                                        strFbsj = simpleDateFormat.format(date);
                            %>
                            <tr>
                                <td align='left'><font face='黑体' size=4><%=strLmp%></font></td>
                            </tr>
                            <tr>
                                <td style='height:18px;'>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align='left' style='word-break:always;'><%=lm.getStrContent()%>
                                </td>
                            </tr>
                            <%
                                strLmp = lm.getStrLable();
                                if (strLmp == null) strLmp = "";
                                if (!"".equals(strLmp)) {
                            %>
                            <tr>
                                <td align='left' style='height:24px;'>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td width=38>标签:&nbsp;</td>
                                            <%
                                                List bq = new ArrayList();
                                                String ss[];
                                                if (strLmp.indexOf(",") > 0) {
                                                    ss = strLmp.split(",");
                                                    for (int i = 0; i < ss.length; i++) {
                                            %>
                                            <td width=14 height=19
                                                style='background:url(<%=basePath%>/images/lab_left.jpg) right'>
                                                &nbsp;</td>
                                            <td style='background:url(<%=basePath%>/images/lab_middle.jpg) ;'>
                                                &nbsp;<%=ss[i]%>&nbsp;</td>
                                            <td width=4 style='background:url(<%=basePath%>/images/lab_right.jpg) ;'>
                                                &nbsp;</td>
                                            <td>&nbsp;</td>
                                            <%
                                                }
                                            } else {
                                            %>
                                            <td width=14 height=19
                                                style='background:url(<%=basePath%>/images/lab_left.jpg) right'>
                                                &nbsp;</td>
                                            <td style='background:url(<%=basePath%>/images/lab_middle.jpg) ;'>
                                                &nbsp;<%=strLmp%>&nbsp;</td>
                                            <td width=4 style='background:url(<%=basePath%>/images/lab_right.jpg) ;'>
                                                &nbsp;</td>
                                            <td>&nbsp;</td>
                                            <%
                                                }
                                            %>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td style='height:1px;'>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align='left'><input name="" type="image"
                                                        src="<%=basePath%>/images/index_fulltext.gif"
                                                        onclick="doOpenDoc('<%=lm.getBaId()%>')"/></td>
                            </tr>
                            <tr>
                                <td style='height:5px;' class='td_dash'>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style='height:10px;'>&nbsp;</td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            <tr>
                                <td style='text-align:center;font-size:12px;' valign="middle">
                                    <%=strPageOut%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style='height:1px;'>
        <td colspan=3>&nbsp;</td>
    </tr>
</table>
</body>
</html>


