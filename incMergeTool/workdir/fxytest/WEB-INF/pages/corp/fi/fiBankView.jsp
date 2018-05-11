<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBankDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBankDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBank" method="post" id="fiBankForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.companyCode"/>:</th>
    		<td>${fiBank.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.bankCode"/>:</th>
    		<td>${fiBank.bankCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.bankBranch"/>:</th>
    		<td>${fiBank.bankBranch }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.accountNo"/>:</th>
    		<td>${fiBank.accountNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.accountName"/>:</th>
    		<td>${fiBank.accountName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.remark"/>:</th>
    		<td>${fiBank.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.isActive"/>:</th>
    		<td>${fiBank.isActive }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.creatorCode"/>:</th>
    		<td>${fiBank.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.createTime"/>:</th>
    		<td>${fiBank.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.editorCode"/>:</th>
    		<td>${fiBank.editorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBank.editTime"/>:</th>
    		<td>${fiBank.editTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiBanks.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>