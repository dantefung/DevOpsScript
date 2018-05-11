<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusSendDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusSendDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusSendDetail" method="post" id="fiBonusSendDetailForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.operNo"/>:</th>
    		<td>${fiBonusSendDetail.operNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.memberNo"/>:</th>
    		<td>${fiBonusSendDetail.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.money"/>:</th>
    		<td>${fiBonusSendDetail.money }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.bnum"/>:</th>
    		<td>${fiBonusSendDetail.bnum }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.openBank"/>:</th>
    		<td>${fiBonusSendDetail.openBank }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.bname"/>:</th>
    		<td>${fiBonusSendDetail.bname }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiBonusSendDetails.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>