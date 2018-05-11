<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysManagerList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemManage"/> >> <fmt:message key="menu.organizePeopleManage"/>"/>
</head>

<frameset cols="160,*">
	<frame id="frmDepartmentTree" src="/corp/sysTreeDepartment.jhtml" name="frmDepartmentTree" frameborder="no" scrolling="auto" marginwidth="0" >
	<frameset rows="248,*" cols="*" framespacing="4" frameborder="yes" border="4">
		<frame id="frmDepartmentList" src="/corp/alCompanys.jhtml" name="frmDepartmentList" frameborder="no" scrolling="auto" marginwidth="0">
		<frame id="frmManagerList" src="/corp/sysManagerOrg.jhtml?departmentId=0" name="frmManagerList" frameborder="yes" scrolling="auto" marginwidth="0">
	</frameset>
</frameset>

<noframes><body>
</body>
</noframes>