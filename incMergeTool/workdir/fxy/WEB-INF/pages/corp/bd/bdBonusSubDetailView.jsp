<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdBonusSubDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdBonusSubDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdBonusSubDetail" method="post" id="bdBonusSubDetailForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.wmonth"/>:</th>
    		<td>${bdBonusSubDetail.wmonth }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.memberNo"/>:</th>
    		<td>${bdBonusSubDetail.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.bonusType"/>:</th>
    		<td>${bdBonusSubDetail.bonusType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.money"/>:</th>
    		<td>${bdBonusSubDetail.money }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.pv"/>:</th>
    		<td>${bdBonusSubDetail.pv }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.bonusPoint"/>:</th>
    		<td>${bdBonusSubDetail.bonusPoint }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.recommendCode"/>:</th>
    		<td>${bdBonusSubDetail.recommendCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.algebras"/>:</th>
    		<td>${bdBonusSubDetail.algebras }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='bdBonusSubDetails.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>