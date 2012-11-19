var xml_Http;
var xml_Http_returnFunc;
function getByAjax(strUrl,strFuncName)
{
	xml_Http = false;
	if (!xml_Http) getRequest();
	xml_Http_returnFunc=strFuncName;
	xml_Http.onreadystatechange=normalAjax_returnFunc;
	xml_Http.open('POST',strUrl);
//	xml_Http.open('POST',strUrl,true);
//	xml_Http.setRequestHeader('Cache-control','nostore');
	xml_Http.send(null);
}
function getRequest()
{
	if(window.ActiveXObject){
		xml_Http= new ActiveXObject("Microsoft.XMLHTTP");
	}else
	{
		if(window.XMLHttpRequest){ 
			xml_Http= new XMLHttpRequest(); 
		}else
		{
			xml_Http = false; 
		}
	}
	if (!xml_Http) alert("Error initializing XMLHttpRequest!");
}
function normalAjax_returnFunc()
{
	if (xml_Http.readyState==4)
	{
		if (xml_Http_returnFunc.indexOf('(')==-1)
		{
			eval(xml_Http_returnFunc+'()');
		}else
		{
			eval(xml_Http_returnFunc);
		}
	}
}
