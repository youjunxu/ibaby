<?xml version="1.0" encoding="ISO-8859-1" ?>  
<%@ taglib prefix="s" uri="/struts-tags"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
    pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
<s:head />  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />  
<title>Random Picture</title>  
</head>  
<body>  
<script type="text/javascript">  
    function changeValidateCode(obj) {  
        var currentTime= new Date().getTime();  
        obj.src = "rand.action?d=" + currentTime;  
    }  
</script>  
  
<img src="rand.action" onclick="changeValidateCode(this)" />  
</body>  
</html>  
