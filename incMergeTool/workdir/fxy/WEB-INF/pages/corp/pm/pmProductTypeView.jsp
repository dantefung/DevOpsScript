<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmProductTypeDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pmProductTypeDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pmProductType" method="post" id="pmProductTypeForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.parentTypeId"/>:</th>
    		<td>${pmProductType.parentTypeId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.typeName"/>:</th>
    		<td>${pmProductType.typeName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.descText"/>:</th>
    		<td>${pmProductType.descText }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.treeIndex"/>:</th>
    		<td>${pmProductType.treeIndex }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.typeLevel"/>:</th>
    		<td>${pmProductType.typeLevel }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.iconUrl"/>:</th>
    		<td>${pmProductType.iconUrl }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.picUrl"/>:</th>
    		<td>${pmProductType.picUrl }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.creatorCode"/>:</th>
    		<td>${pmProductType.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.createTime"/>:</th>
    		<td>${pmProductType.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.editorCode"/>:</th>
    		<td>${pmProductType.editorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductType.editTime"/>:</th>
    		<td>${pmProductType.editTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="typeId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pmProductTypes.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>