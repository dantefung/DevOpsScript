<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icFilePowDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="icFilePowDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="icFilePow" method="post" id="icFilePowForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icFilePow.fileId"/>:</th>
    		<td>${icFilePow.fileId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icFilePow.roleId"/>:</th>
    		<td>${icFilePow.roleId }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="powId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='icFilePows.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>