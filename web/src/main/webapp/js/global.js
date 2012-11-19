/*
 * 1.trim(aStr)：
 * 	去除字符串的空格
 * 2.getValueBySelected(objSrc,intBj)
 * 	返回下拉框的选中值
 *	参数：  intBj  1:返回选项text   2：返回选项value
 *	空:无选中值
 * 3.getRadioSelected(objSrc)
 *	返回单选按钮的选中值
 *	返回: 空:无选中值
 * 4.emptyradio(objSrc)
 *	清除单选按钮选中的选项
 * 5.CompareDate(d1,d2)
 *	比较日期
 * 6.dcmAdd(arg1,arg2)
 *	加法
 * 7.dcmSub(arg1,arg2)
 *	减法
 * 8.dcmDiv(arg1,arg2)
 *	除法
 * 9.dcmMul(arg1,arg2)
 *	乘法
 * 10.AutomateWordAutoPaging(prefixion,Count)
 * 
 * 11.AutomateExcel(prefixion)
 * 
 * 12.strlen(str)
 *	处理英文、中文长度计算
 * 13.changeValidateCode(obj)
 *  生成不重复图形验证码
 * 14.GetCookie(name)
 * 15.getCookieVal(offset)
 * 16.SetCookie(name, value, expires)
 * 17.ResetCookie()
 * 18.appInfo
*/
function trim(aStr) {
	return aStr.replace(/^\s{1,}/, "").replace(/\s{1,}$/, "");
}
function getValueBySelected(objSrc,strLb)
{
	var n;
	var t1='';
	var t2='';

	if (!objSrc) return '';
	n=objSrc.selectedIndex;

	if (n!=-1)
	{
		t1=objSrc.options[n].text;
		t2=objSrc.options[n].value;
	}

	if (strLb=='1')
	{
		return t1;
	}else
	{
		return t2;
	}
}
function getRadioSelected(objSrc)
{
	var ilen;
	var t='';

	if (objSrc[0])
	{
		ilen=objSrc.length;
		for (var i=0;i<ilen;i=i+1)
		{
			if (objSrc[i].checked)
			{
				t=objSrc[i].value;
				break;
			}
		}
	}else
	{
		if (objSrc.checked) t=objSrc.value;
	}
	return t;
}
function emptyradio(strObj)
{
	var f=document.forms[0];
	var obj=eval('f.'+strObj);
	var i=0;
	if (obj)
	{
		if (obj.length)
		{
			for (i=0;i<obj.length;i++)
			{
				obj[i].checked=false;
			}
		}else
		{ 
			obj.checked=false;
		}
	}
}
function CompareDate(d1,d2)
{
   return ((new Date(d1.replace(/-/g,"\/"))) > (d2));
}
function dcmAdd(arg1,arg2){
	var r1,r2,m;
	try{
		r1=arg1.toString().split(".")[1].length;
	}catch(e){
		r1=0;
	}
	try{
		r2=arg2.toString().split(".")[1].length;
	}catch(e){
		r2=0;
	}
	m=Math.pow(10,Math.max(r1,r2));
	return ((arg1*m+arg2*m)/m).toFixed(Math.max(r1,r2));
}
function dcmSub(arg1,arg2){
//减法
	var r1,r2,m;
	try{
		r1=arg1.toString().split(".")[1].length;
	}catch(e){
		r1=0;
	}
	try{
		r2=arg2.toString().split(".")[1].length;
	}catch(e){
		r2=0;
	}
	m=Math.pow(10,Math.max(r1,r2));
	return ((arg1*m-arg2*m)/m).toFixed(Math.max(r1,r2));
}
function dcmDiv(arg1,arg2){
//除法
	var t1=0,t2=0,r1,r2;
	try{
		t1=arg1.toString().split(".")[1].length;
	}catch(e){}
	try{
		t2=arg2.toString().split(".")[1].length;
	}catch(e){}
	with(Math){
		r1=Number(arg1.toString().replace(".",""));
		r2=Number(arg2.toString().replace(".",""));
		return (r1/r2)*Math.pow(10,t2-t1);
	}
}
function dcmMul(arg1,arg2){
//乘法
	var m=0,s1=arg1.toString(),s2=arg2.toString();
	try{
		m+=s1.split(".")[1].length;
	}catch(e){}
	try{
		m+=s2.split(".")[1].length;
	}catch(e){}
	return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);
}
function AutomateWordAutoPaging(prefixion,Count) 
{
	var oWD = null; 
	var oDC = null;
	var oRange=null;

	try{
		oWD=new ActiveXObject("Word.Application");
	}catch(e)
	{
		alert("无法调用Office对象，请确保您的机器已安装了Office并已将本系统的站点名加入到IE的信任站点列表中！");
		return;
	}
	oDC = oWD.Documents.Add("",0,1);
	oDC.ShowGrammaticalErrors = false; //屏蔽语法检查
	oDC.ShowSpellingErrors = false;  //屏蔽语法检查
	oRange =oDC.Range(0,1);

	for (i=0;i<Count;i++)
	{
		var sel = document.body.createTextRange(); 
		var TableName = prefixion+i
		var Table = document.getElementById(TableName)
		sel.moveToElementText(Table); 
		sel.select(); 
		sel.execCommand("Copy"); 
		oWD.Selection.Paste();
		//oWD.Selection.TypeText("aaa")
		oWD.Selection.InsertBreak(7) //插入分页符
	}

	oWD.ActiveDocument.ActiveWindow.View.Type=3 //设置浏览模式
	oWD.Application.Visible = true;
	alert('输出完毕，请检查新打开的word窗口！');
}
function AutomateExcel(prefixion)
{
	var elTable = document.getElementById("AutomateExcel"); 
	var oRangeRef = document.body.createTextRange(); 

	oRangeRef.moveToElementText(elTable); 
	oRangeRef.execCommand("Copy"); 
	try{
		var appExcel = new ActiveXObject( "Excel.Application" ); 
	}catch(e)
	{
		alert("无法调用Office对象，请确保您的机器已安装了Office并已将本系统的站点名加入到IE的信任站点列表中！");
		return;
	}
	appExcel.Visible = true; 
	appExcel.Workbooks.Add().Worksheets.Item(1).Paste();
	appExcel.Workbooks(1).Worksheets.Item(1).Columns("A:A").ColumnWidth = 100; 
	//appExcel.Workbooks(1).Worksheets.Item(1).Columns("B:B").ColumnWidth = 21; 
	appExcel = null;
	alert('输出完毕，请检查新打开的excel窗口！');
}
function strlen(str) {  
	var len = 0;  
    for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 255 || str.charCodeAt(i) < 0){
			len += 2;
		} else {
			len ++;
		}  
	}
	return len;  
}
function changeValidateCode(obj) {  
	var currentTime= new Date().getTime();  
	obj.src = "rand.action?d=" + currentTime;  
}  
//取Cookie的值
function GetCookie(name) 
{
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while (i < clen) 
	{
		var j = i + alen;
		if (document.cookie.substring(i, j) == arg)
			return getCookieVal (j);
		i = document.cookie.indexOf(" ", i) + 1;
		if (i == 0) break; 
	}
	return null;
}
function getCookieVal(offset)
{           
	var endstr = document.cookie.indexOf (";", offset);       
	if (endstr == -1)
		endstr = document.cookie.length;
	return unescape(document.cookie.substring(offset, endstr));           
}
//寫入到Cookie
function SetCookie(name, value, expires)
{
	var argv = SetCookie.arguments;
	var argc = SetCookie.arguments.length;
	var expires = (argc > 2) ? argv[2] : null;
	var path = (argc > 3) ? argv[3] : null;
	var domain = (argc > 4) ? argv[4] : null;
	var secure = (argc > 5) ? argv[5] : false;
	document.cookie = name + "=" + escape (value) +
		((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +     
		((path == null) ? "" : ("; path=" + path)) +
		((domain == null) ? "" : ("; domain=" + domain)) +
		((secure == true) ? "; secure" : "");
}
function ResetCookie(strVal)
{
	var expdate = new Date();            
	SetCookie(strVal, null, expdate);
}
function appInfo()
{
	var browser = {
		msie: false, firefox: false, opera: false, safari: false, 
		chrome: false, netscape: false, appname: 'unknown', version: 0
	};
	userAgent = window.navigator.userAgent.toLowerCase();
	if ( /(msie|firefox|opera|chrome|netscape)\D+(\d[\d.]*)/.test( userAgent ) ){
		browser[RegExp.$1] = true;
		browser.appname = RegExp.$1;
		browser.version = RegExp.$2;
	}else
	{
		if ( /version\D+(\d[\d.]*).*safari/.test( userAgent ) ){ // safari
			browser.safari = true;
			browser.appname = 'safari';
			browser.version = RegExp.$2;
		}
	}
    return browser;
}

