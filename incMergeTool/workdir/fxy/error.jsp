<%@ page language="java" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.cn1win.tjc.web.util.ConfigUtil" %>
<%@page import="com.cn1win.tjc.web.util.SessionUtil" %>
<%@page import="com.cn1win.tjc.model.SessionUser" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>Error</title>
<style type="text/css">

body {
	background: #ffffff;
	color: #000000;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	margin: 0;
	padding: 0;
	line-height: 18px;
	padding: 4px;
}

#main {
	height: 300px;
	overflow: scroll;
	border: 1px solid #666666;
	background-color: #EEEEEE;
}
</style>
</head>

<body id="error">
<div id="page">
	<div id="content" class="clearfix">
		<h1>Error</h1>
		<div id="main">
		
		<%
		SessionUser sessionUser=SessionUtil.getSessionLoginUser(request);
		String systemRunMode=ConfigUtil.getConfigValue("AA", "system.run.mode");
		boolean showErrorDetail=false;
		if("C".equals(sessionUser.getUserType()) || (!"C".equals(sessionUser.getUserType()) && "0".equals(systemRunMode))){
			showErrorDetail=true;
		}
		 	if (exception != null && showErrorDetail) {
		%>
		<pre>
		<%
			exception.printStackTrace(new java.io.PrintWriter(out));
		%>
		</pre> 
		<%
		 	} else if ((Exception) request.getAttribute("javax.servlet.error.exception") != null && showErrorDetail) {
		 %> 
		 <pre>
		<%
			((Exception) request.getAttribute("javax.servlet.error.exception")).printStackTrace(new java.io.PrintWriter(out));
		%>
		</pre> 
		<%
		 	}
		 %>
		</div>
	</div>
</div>
</body>
</html>
