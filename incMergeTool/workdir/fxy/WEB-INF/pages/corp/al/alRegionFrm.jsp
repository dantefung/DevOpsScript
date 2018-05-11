<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><fmt:message key="function.menu.system.manageModule"/></title>
</head>

<frameset cols="200,*">
	<frame src="${ctx }/corp/alRegionTree.jhtml" name="frmAlRegionTree" frameborder="0" scrolling="auto" marginwidth="0"/>
	<frame src="${ctx }/corp/alRegions.jhtml" name="frmAlRegionList" frameborder="1" scrolling="auto" marginwidth="0" marginheight="0"/>
</frameset>

<noframes><body>
</body>
</noframes></html>