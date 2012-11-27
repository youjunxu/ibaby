<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <c:import url='../includes/_head.jsp'>
        <c:param name="title" value="贝爱学园" />
    </c:import>
</head>
<body>
<s:action name="defaultTopMenu" executeResult="true">
    <s:param name="strCurMkCode">BAXY</s:param>
</s:action>


<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
    <tr style='height:30px;'>
        <td style='background:url(${request.contextPath}/images/top_bottom.gif) no-repeat;'/>
            <c:import url='../includes/_user_nav.jsp' />
        </td>
    </tr>
    <tr>
        <td style='height:40px;'>
            <table cellspacing='0' cellpadding="0" border='0' style='width:98%;'>
                <tr>
                    <td width=38 align='left'></td>
                    <td width=202 align='left' style="color:#A9714E; font-size:20px;">${requestScope.moduleName}</td>
                    <td valign="bottom"><img src="${request.contextPath}/images/top_bottom.gif" width="693"/></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table cellspacing='0' cellpadding="0" border='0' style='width:100%; height:500px; font-size: 12px;'>
                <tr>
                    <td width=20% valign="top" align='left'>
                        <c:import url='../includes/_tags.jsp' />
                    </td>
                    <td width=5% style='background:url(${request.contextPath}/images/icon_dash.gif) repeat-y;'/></td>
                    <td valign="top" align='left'>
                        <div class="article_list">
                            <c:forEach var="article" items="${requestScope.articles}" varStatus="status">
                                <c:import url="../includes/_article_mini.jsp">
                                    <c:param name="index" value="${status.index}" />
                                </c:import>
                            </c:forEach>
                        </div>
                        <div style="text-align: center">${requestScope.pager}</div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style='height:1px;'>
        <td colspan=3>&nbsp;</td>
    </tr>
</table>



<c:import url='../footer.jsp' />

</body>
</html>


