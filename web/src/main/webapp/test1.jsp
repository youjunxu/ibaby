
<script type="text/javascript">
        var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        var s;
        (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
        (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
        (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
        (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
        (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

        //以下进行测试
        if (Sys.ie) document.write('IE: ' + Sys.ie);
        if (Sys.firefox) document.write('Firefox: ' + Sys.firefox);
        if (Sys.chrome) document.write('Chrome: ' + Sys.chrome);
        if (Sys.opera) document.write('Opera: ' + Sys.opera);
        if (Sys.safari) document.write('Safari: ' + Sys.safari);
    </script>

<hr>
<%
String agent;
agent = request.getHeader("USER-AGENT"); 
   out.println("--------------------agent==========" + agent);
   
 if (null != agent && -1 != agent.indexOf("MSIE")) { 
   out.println("aaaaaaaaaaaaaaaa");
   } else if (null != agent && -1 != agent.indexOf("Firefox")) { 
	   out.println("ccccccccccc");
 } else if (null != agent && -1 != agent.indexOf("Safari")) { 
	   out.println("dddddddddddddddd");
 } else if (null != agent && -1 != agent.indexOf("Chrome")) { 
	   out.println("wwwwwwwwwwwwwwwwww");
   } else {
	   out.println("eeeeeeeeeeeeee");
 }
%>
