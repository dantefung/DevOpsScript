<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdWeekAwardDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdWeekAwardDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdWeekAward" method="post" id="bdWeekAwardForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.memberNo"/>:</th>
    		<td>${bdWeekAward.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.companyCode"/>:</th>
    		<td>${bdWeekAward.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.recommendNo"/>:</th>
    		<td>${bdWeekAward.recommendNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.exitTime"/>:</th>
    		<td>${bdWeekAward.exitTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.perSell"/>:</th>
    		<td>${bdWeekAward.perSell }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.groupSell"/>:</th>
    		<td>${bdWeekAward.groupSell }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.isRoot"/>:</th>
    		<td>${bdWeekAward.isRoot }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.pass"/>:</th>
    		<td>${bdWeekAward.pass }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.firstName"/>:</th>
    		<td>${bdWeekAward.firstName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.lastName"/>:</th>
    		<td>${bdWeekAward.lastName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.marketName"/>:</th>
    		<td>${bdWeekAward.marketName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.cardType"/>:</th>
    		<td>${bdWeekAward.cardType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.recommandLayer"/>:</th>
    		<td>${bdWeekAward.recommandLayer }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.petName"/>:</th>
    		<td>${bdWeekAward.petName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.acGroupSell"/>:</th>
    		<td>${bdWeekAward.acGroupSell }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.linkNo"/>:</th>
    		<td>${bdWeekAward.linkNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.wweek"/>:</th>
    		<td>${bdWeekAward.wweek }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.star"/>:</th>
    		<td>${bdWeekAward.star }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.nextStar"/>:</th>
    		<td>${bdWeekAward.nextStar }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.activeStatus"/>:</th>
    		<td>${bdWeekAward.activeStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.acPerSell"/>:</th>
    		<td>${bdWeekAward.acPerSell }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='bdWeekAwards.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>