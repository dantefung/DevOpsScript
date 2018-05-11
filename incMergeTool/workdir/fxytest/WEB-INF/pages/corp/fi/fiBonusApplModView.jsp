<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusApplModDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusApplModDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusApplMod" method="post" id="fiBonusApplModForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.applNo"/>:</th>
    		<td>${fiBonusApplMod.applNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.oldStatus"/>:</th>
    		<td>${fiBonusApplMod.oldStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.newStatus"/>:</th>
    		<td>${fiBonusApplMod.newStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.oldFalseReason"/>:</th>
    		<td>${fiBonusApplMod.oldFalseReason }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.newFalseReason"/>:</th>
    		<td>${fiBonusApplMod.newFalseReason }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.createrCode"/>:</th>
    		<td>${fiBonusApplMod.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.createrName"/>:</th>
    		<td>${fiBonusApplMod.createrName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.createTime"/>:</th>
    		<td>${fiBonusApplMod.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.remark"/>:</th>
    		<td>${fiBonusApplMod.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.checkerCode"/>:</th>
    		<td>${fiBonusApplMod.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.checkerName"/>:</th>
    		<td>${fiBonusApplMod.checkerName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusApplMod.checkTime"/>:</th>
    		<td>${fiBonusApplMod.checkTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiBonusApplMods.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>