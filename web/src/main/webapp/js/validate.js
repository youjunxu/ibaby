/*	校验js文件
 * 1a.isLetterNumber(str)
 *	只能是数字或字母，或下划线，且首字符必须为字母的正则表达式
 * 1b.isLetterNumberA(str)
 *	只能是数字或字母，或下划线的正则表达式
 * 1c.isLetterNumberB(str)
 *	只能是数字或字母的正则表达式
 * 2.isSomethingSelected( obj )
 *	校验单选框、复选框是否有选中值
 * 3.validateEmail( obj )
 *	校验字段值是否为邮件格式
 * 4.isListSelected( obj )
 *	校验下拉框、组合框、列表框是否选择了某个值
 * 5.checkIsNumber(objField)
 *	校验是否数值
 * 6.isItEmpty(e)
 *	校验是否空值
 * 7.writeErrorMsg(strName,strMsg)
 *	写校验错误
 * 8.removeErrorMsg(arrName)
 *	移除函数writeErrorMsg书写的错误信息
 * 9.
*/
function isLetterNumber(str)
{
	var t0='';
	var t1='';
	var regA=/^\w+$/;
	var regB=/^[a-z]/i;
	var i=0;
	
	i=0;
	if(regA.test(str))
	{
		i=1;
	}
	if (i==1)
	{
		if(regB.test(str))
		{
			i=1;
		}else
		{
			i=0;
		}
	}
	if(i==1)
	{
		return true;
	}else
	{
		return false;
	}
}
function isLetterNumberA(str)
{
	var t0='';
	var t1='';
	var regA=/^\\w+$/;
	var i=0;
	
	i=0;
	if(regA.test(str))
	{
		i=1;
	}
	if(i==1)
	{
		return true;
	}else
	{
		return false;
	}
}
function isLetterNumberB(str)
{
	var regA=/^[A-Za-z0-9]+$/;
	if(regA.test(str))
	{
		return true;
	}else
	{
		return false;
	}
}
function isSomethingSelected( obj )
{
	if (obj.type)
	{
		if (obj.checked) return true;
	}else
	{
		for (var r=0; r < obj.length; r++){
			if ( obj[r].checked ) return true;
		}
	}
	return false;
}
function validateEmail(obj)
{
	//w+([-+.]w+)*@w+([-.]w+)*.w+([-.]w+)* 
	var emailStr = obj.value;
	var reg1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; // not valid
	var reg2 = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/; // valid
	if ( !reg1.test( emailStr ) && reg2.test( emailStr ) ) {
		return true;
	} else {
	 	return false;
	}
}
function isListSelected( obj )
{
	var n=obj.selectedIndex;
	if (n==-1 || trim(obj.options[n].text)=='')
	{
		return false;
	}else
	{
		return true;
	}
}
function checkIsNumber(objSrc)
{
	var s=objSrc.value;
	if (s!="" && s.search(/^(-|\+)?\d+(\.\d+)?$/)==-1)
	{
		alert("请填写正确的数字！");
		objSrc.value="";
		objSrc.focus();
		return false;
	}
	return true;
}
function isItEmpty(e)
{
	//判断e是否为空，为空返回真
	if (e.type)
	{
		switch (e.type)
		{
			case "text":
				if (trim(e.value)!='')
				{
					return false;
				}
				break;
			case "hidden":
				if (trim(e.value)!='')
				{
					return false;
				}
				break;
			case "textarea":
				if (trim(e.value)!='')
				{
					return false;
				}
				break;
			case "radio":
				if (isSomethingSelected(e))
				{
					return false;
				}
				break;
			case "select-one":
				if (isListSelected(e))
				{
					return false;
				}
				break;
			case "checkbox":
				if (isSomethingSelected(e))
				{
					return false;
				}
				break;
			case "select-multiple":
				if (isListSelected(e))
				{
					return false;
				}
				break;
		}//end switch
	}else
	{
		switch (e[0].type)
		{
			case "radio":
				if (isSomethingSelected(e))
				{
					return false;
				}
				break;
			case "select-one":
				if (isListSelected(e))
				{
					return false;
				}
				break;
			case "checkbox":
				if (isSomethingSelected(e))
				{
					return false;
				}
				break;
			case "select-multiple":
				if (isListSelected(e))
				{
					return false;
				}
				break;
		}//end switch
	}
	return true;
}
function writeErrorMsg(strName,strMsg)
{
	var objNew;
	var objOld;
	var objBr;
	var objEle;
	var objSpan;
	var strT='';

	objSpan=document.getElementById('advice-'+trim(strName));
	objOld=document.getElementById(strName);

	if (!objOld)
	{
		//不存在要显示错误信息的字段
		if (trim(public_errorMsg)=='')
		{
			public_errorMsg=strMsg;
		}else
		{
			public_errorMsg=public_errorMsg+"<br>"+strMsg;
		}

	}else
	{
		//存在要显示错误信息的字段
		if (!objSpan)
		{
			objNew=document.createTextNode(strMsg);
			objBr=document.createElement('br');
			objEle=document.createElement('span');
			objEle.appendChild(objNew);
			objEle.className='validation-advice';
			objBr.id='advicebr-'+trim(strName);
			objEle.id='advice-'+trim(strName);
	
			strT=strName.substr(0,10);
			if (trim(strT)=='Attachment')
			{
				strT='Layer'+strName.substr(10,strName.length-10);
				objOld=document.getElementById(strT);
				objOld.parentNode.insertBefore(objEle,objOld);
			}else
			{
				if (objOld.type)
				{
					if (!getParentTableStyle(objOld))
					{
						if (trim(public_errorMsg)=='')
						{
							public_errorMsg=strMsg;
						}else
						{
							public_errorMsg=public_errorMsg+"<br>"+strMsg;
						}
					}else
					{
						if (objOld.type!='hidden')
						{
							if (objOld.type=='text')
							{
							objOld.parentNode.insertBefore(objBr,objOld.nextSibling);
							objOld.parentNode.insertBefore(objEle,objBr.nextSibling);
							}else
							{
								objOld.parentNode.insertBefore(objEle,objOld);
								objOld.parentNode.insertBefore(objBr,objOld);
							}
						}else
						{
							objOld.parentNode.insertBefore(objEle,objOld);
						}
					}
				}else
				{
					objOld.parentNode.insertBefore(objEle,objOld);
				}
			}
		}else
		{
			objSpan.style.display='block';
		}
	}
}
function removeErrorMsg(arrName)
{
	var objSpan;
	var objBr;
	var i=0;

	if (arrName[0])
	{
	//多字段
		for (i=0;i<arrName.length;i++)
		{
			objSpan=document.getElementById('advice-'+trim(arrName[i]));
			objBr=document.getElementById('advicebr-'+trim(arrName[i]));
			if (objSpan)
			{
				objSpan.style.display = 'none';
			}
			if (objBr)
			{
				objBr.style.display = 'none';
			}
		}
	}else
	{
	//单值
		objSpan=document.getElementById('advice-'+trim(arrName));
		objBr=document.getElementById('advicebr-'+trim(arrName));
		if (objSpan)
		{
			objSpan.style.display = 'none';
		}
		if (objBr)
		{
			objBr.style.display = 'none';
		}
	}
}
