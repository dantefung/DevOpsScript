<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiAcFreezeChangeDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiAcFreezeChangeDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAcFreezeChange" method="post" id="fiAcFreezeChangeForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.changeNo"/>:</th>
    		<td>${fiAcFreezeChange.changeNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.companyCode"/>:</th>
    		<td>${fiAcFreezeChange.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.userCode"/>:</th>
    		<td>${fiAcFreezeChange.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.acType"/>:</th>
    		<td>${fiAcFreezeChange.acType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.freezeMoney"/>:</th>
    		<td>${fiAcFreezeChange.freezeMoney }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.creatorCode"/>:</th>
    		<td>${fiAcFreezeChange.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.createTime"/>:</th>
    		<td>${fiAcFreezeChange.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.checkerCode"/>:</th>
    		<td>${fiAcFreezeChange.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.checkTime"/>:</th>
    		<td>${fiAcFreezeChange.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.status"/>:</th>
    		<td>${fiAcFreezeChange.status }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcFreezeChange.remark"/>:</th>
    		<td>${fiAcFreezeChange.remark }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiAcFreezeChanges.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>