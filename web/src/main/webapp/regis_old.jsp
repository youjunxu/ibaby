<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>会员注册</title>
<script LANGUAGE='Javascript'>
function check()
{
	var frm = document.form1;
	if(frm.userName.value==""){
		alert("用户名不能为空!");
		document.form1.userName.focus();
		return false;
	}else {
alert('建设中');	
		return false;
//		return true;
	}
}
</script>  
  </head>
  <body>
  	<s:action name="getCurUserTopMenu" executeResult="true" />
<div class="wrap">
  	<s:form method="post" action="saveUser" name="form1" onsubmit="return check()" theme="simple">
		<s:textfield name="user.userName" label="用户名" value="<s:property value="userName" />"/>
		<s:property value="tip" />
		<s:textfield name="user.userPass" label="密码" value="<s:property value="userPass" />"/>
		<s:textfield name="userAPass" label="确认密码" value=""/>
		<TABLE cellSpacing=0 cellPadding=0 width=368 border=0 align=center>
			<TBODY>
				<TR>
					<TD height=15 colspan=2>
					</TD>
				</TR>
				<TR>
					<TD align=left width=40%>
						<SPAN class=content_black_bold>用户名</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value="userName" />"
								autocomplete="off" style="WIDTH: 250px"
								maxLength=28 name=userName> </FONT>
						<br><font color="red"><s:property value="tip" /></font>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>密码</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='userPass' />"
								style="WIDTH: 250px" type="password" maxLength=32
								name="userPass" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>确认密码</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='userAPass' />"
								style="WIDTH: 250px" type="password" maxLength=32
								name="userAPass" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>昵称</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='nickName' />"
								style="WIDTH: 250px" maxLength=32
								name="nickName" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>性别</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='sex' />"
								style="WIDTH: 250px" maxLength=32
								name="sex" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>头像</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='headImg' />"
								style="WIDTH: 250px" maxLength=32
								name="headImg" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>电话</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='userTel' />"
								style="WIDTH: 250px" maxLength=32
								name="userTel" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>手机</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='userSj' />"
								style="WIDTH: 250px" maxLength=32
								name="userSj" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>Email</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='userEmail' />"
								style="WIDTH: 250px" maxLength=32
								name="userEmail" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>QQ</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='userQq' />"
								style="WIDTH: 250px" maxLength=32
								name="userQq" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>MSN</SPAN>
						</TD><td>
						<FONT class=form><INPUT class=form value="<s:property value='userMsn' />"
								style="WIDTH: 250px" maxLength=32
								name="userMsn" minlength="6"> </FONT>
					</TD>
				</TR>
				<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=2></TD></TR>
				<TR>
					<TD noWrap align=center colspan=2>
						<span style="padding-right: 20px;"><input type="submit" name="idBtnSubmit" value="提  交"/></span>
						<br><font color="red"><s:property value="tip" /></font>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</s:form>
</div>
  </body>
</html>
