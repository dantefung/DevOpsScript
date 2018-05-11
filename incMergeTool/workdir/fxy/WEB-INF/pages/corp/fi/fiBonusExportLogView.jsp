<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusExportLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusExportLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusExportLog" method="post" id="fiBonusExportLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusExportLog.operNo"/>:</th>
    		<td>${fiBonusExportLog.operNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusExportLog.operatorCode"/>:</th>
    		<td>${fiBonusExportLog.operatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusExportLog.operatorName"/>:</th>
    		<td>${fiBonusExportLog.operatorName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusExportLog.operateTime"/>:</th>
    		<td>${fiBonusExportLog.operateTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiBonusExportLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>