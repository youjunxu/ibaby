<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>${param.title}</title>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link href="vender/assets/stylesheets/jquery-ui.css" rel="stylesheet" type="text/css"/>
<link href="vender/assets/stylesheets/chosen.css" rel="stylesheet" type="text/css"/>
<link href="assets/stylesheets/application.css" rel="stylesheet" type="text/css"/>
<link href="assets/stylesheets/pager.css" rel="stylesheet" type="text/css"/>
<link href="assets/stylesheets/tags.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
    var pageSize = '${requestScope.pageSize}' || 65536, pageCount = '${requestScope.pageCount}' || 1;
    var requestContextPath = '${request.contextPath}';
</script>
<script type="text/javascript" src="vender/assets/javascripts/jquery.js"></script>
<script type="text/javascript" src="vender/assets/javascripts/jquery-ui.js"></script>
<script type="text/javascript" src="vender/assets/javascripts/jquery_ujs.js"></script>
<script type="text/javascript" src="vender/assets/javascripts/chosen.jquery.js"></script>
<script type="text/javascript" src="vender/assets/javascripts/ajax-chosen.js"></script>
<script type="text/javascript" src="assets/javascripts/application.js"></script>