<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdWeekAwardHisDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdWeekAwardHisDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdWeekAwardHis" method="post" id="bdWeekAwardHisForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.memberNo"/>:</th>
    		<td>${bdWeekAwardHis.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.companyCode"/>:</th>
    		<td>${bdWeekAwardHis.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.recommendNo"/>:</th>
    		<td>${bdWeekAwardHis.recommendNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.exitTime"/>:</th>
    		<td>${bdWeekAwardHis.exitTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.perSell"/>:</th>
    		<td>${bdWeekAwardHis.perSell }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.groupSell"/>:</th>
    		<td>${bdWeekAwardHis.groupSell }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.isRoot"/>:</th>
    		<td>${bdWeekAwardHis.isRoot }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.pass"/>:</th>
    		<td>${bdWeekAwardHis.pass }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.firstName"/>:</th>
    		<td>${bdWeekAwardHis.firstName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.lastName"/>:</th>
    		<td>${bdWeekAwardHis.lastName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.marketName"/>:</th>
    		<td>${bdWeekAwardHis.marketName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.cardType"/>:</th>
    		<td>${bdWeekAwardHis.cardType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.recommandLayer"/>:</th>
    		<td>${bdWeekAwardHis.recommandLayer }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.petName"/>:</th>
    		<td>${bdWeekAwardHis.petName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.acGroupSell"/>:</th>
    		<td>${bdWeekAwardHis.acGroupSell }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.linkNo"/>:</th>
    		<td>${bdWeekAwardHis.linkNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.wweek"/>:</th>
    		<td>${bdWeekAwardHis.wweek }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.star"/>:</th>
    		<td>${bdWeekAwardHis.star }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.nextStar"/>:</th>
    		<td>${bdWeekAwardHis.nextStar }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.activeStatus"/>:</th>
    		<td>${bdWeekAwardHis.activeStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.acPerSell"/>:</th>
    		<td>${bdWeekAwardHis.acPerSell }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='bdWeekAwardHiss.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>