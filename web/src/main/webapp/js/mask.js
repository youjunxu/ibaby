function addLoadMask(strHtml)
{
	var arrayPageSize   = getPageSize();//调用getPageSize()函数
	var arrayPageScroll = getPageScroll();//调用getPageScroll()函数
	var popupDiv=null;
	var bodyBack=null;
	var arrayConSize;
	var il=0;
	var it=0;

	popupDiv=document.getElementById("popupAddr");
	bodyBack = document.getElementById("popupBg");
	if (!popupDiv)
	{
		//创建弹出内容层
		popupDiv = document.createElement("div");
		//给这个元素设置属性与样式
		popupDiv.setAttribute("id","popupAddr")
		popupDiv.style.position = "absolute";
		popupDiv.style.border = "1px solid #ccc";
		popupDiv.style.background = "#fff";
		popupDiv.style.zIndex = 998;

		//创建弹出背景层
		bodyBack = document.createElement("div");
		bodyBack.setAttribute("id","popupBg")
		bodyBack.style.position = "absolute";
		bodyBack.style.width = document.body.scrollWidth;
		bodyBack.style.height = (arrayPageSize[1] + 35 + 'px');
		bodyBack.style.zIndex = 997;
		bodyBack.style.top = 0;
		bodyBack.style.left = 0;
		bodyBack.style.filter = "alpha(opacity=50)";
		bodyBack.style.opacity = 0.5;
		bodyBack.style.background = "#ddf";
		//实现弹出(插入到目标元素之后)
		document.body.appendChild(popupDiv);
		document.body.appendChild(bodyBack);
	}
	//显示背景层
	bodyBack.style.display = "block";
	if (strHtml)
	{
		popupDiv.innerHTML =strHtml;
	}else
	{
		popupDiv.innerHTML ='';
	}
	popupDiv.style.display = "block";
	//让弹出层在页面中垂直左右居中(个性)
	it=arrayPageScroll[1] + (arrayPageSize[3] - it) / 2-50;
	popupDiv.style.top  = it + 'px';
	il=(document.body.clientWidth-popupDiv.style.width)/2-50;
	if (il>(document.body.clientWidth/2-50))
	{
		il=(document.body.clientWidth-popupDiv.style.width)/2;
		if (il<0) il=20;
	}
	popupDiv.style.left = il + 'px';
}
function removeLoadMask()
{
	var objM=document.getElementById('popupAddr');
	var objN=document.getElementById('popupBg');
	if(objM) objM.style.display='none';
	if(objN) objN.style.display='none';
}
//获取滚动条的高度
function getPageScroll()
{
	var yScroll;

	if (self.pageYOffset) {
		yScroll = self.pageYOffset;
	}else
	{
		if (document.documentElement  &&  document.documentElement.scrollTop){
			yScroll = document.documentElement.scrollTop;
		}else
		{
			if (document.body) {
				yScroll = document.body.scrollTop;
			}
		}
	}
	arrayPageScroll = new Array('',yScroll)
	return arrayPageScroll;
}
//获取页面实际大小
function getPageSize(){
	var xScroll,yScroll;
	var windowWidth,windowHeight;
	var pageWidth,pageHeight;

	if (window.innerHeight  &&  window.scrollMaxY){
		xScroll = document.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
	}else
	{
		if (document.body.scrollHeight > document.body.offsetHeight){
			sScroll = document.body.scrollWidth;
			yScroll = document.body.scrollHeight;
		}else
		{
			xScroll = document.body.offsetWidth;
			yScroll = document.body.offsetHeight;
		}
	}
	if (self.innerHeight) {
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
	}else
	{
		if (document.documentElement  &&  document.documentElement.clientHeight) {
			windowWidth = document.documentElement.clientWidth;
			windowHeight = document.documentElement.clientHeight;
		}else
		{
			if (document.body) {
				windowWidth = document.body.clientWidth;
				windowHeight = document.body.clientHeight;
			}
		}
	}
	pageHeight = windowHeight;
	if (yScroll)
	{
		if(yScroll > windowHeight)
		{
			pageHeight = yScroll;
		}
	}
	pageWidth = windowWidth;
	if (xScroll)
	{
		if(xScroll > windowWidth)
		{
			pageWidth = xScroll;
		}
	}
	arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight);
	return arrayPageSize;
}
