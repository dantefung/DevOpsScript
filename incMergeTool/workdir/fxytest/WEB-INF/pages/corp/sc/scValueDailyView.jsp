<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="scValueDailyDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="scValueDailyDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="scValueDaily" method="post" id="scValueDailyForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="scValueDaily.scType"/>:</th>
    		<td>${scValueDaily.scType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="scValueDaily.runDate"/>:</th>
    		<td>${scValueDaily.runDate }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="scValueDaily.scValue"/>:</th>
    		<td>${scValueDaily.scValue }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='scValueDailys.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>