<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bd.settlement.log"/></title>
    <meta name="heading" content="<fmt:message key="bd.settlement.log"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdCaculateLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="fiAwardTemp.week"/></dt>
			<dd><input name="wweek" type="text" value="${param.wweek }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="bdPeriod.wmonth"/></dt>
			<dd><input name="wmonth" type="text" value="${param.wmonth }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="bd.step"/></dt>
			<dd><win:list listCode="bonus.step" name="currentStep" id="currentStep" value="${param.currentStep}" defaultValue="0" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.handle.time"/></dt>
			<dd>
				<input name="startCretaeTime" id="startCretaeTime" type="text" value="${param.startCretaeTime }" size="14"/> - 
				<input name="endCretaeTime" id="endCretaeTime" type="text" value="${param.endCretaeTime }" size="14"/>
				</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listBdCaculateLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	
	<form id="bdCaculateLogListTableForm" method="get" >
		<ec:table 
			tableId="bdCaculateLogListTable"
			items="bdCaculateLogs"
			var="bdCaculateLog"
			action="bdCaculateLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdCaculateLogListTableForm">
			<ec:row>
				<ec:column property="wweek" title="fiAwardTemp.week" />
				<ec:column property="wmonth" title="printReturnList.month" />
				<ec:column property="currentStep" title="bdCaculateLog.currentStep" >
					<win:code listCode="bonus.step" value="${bdCaculateLog.currentStep}"/>
				</ec:column>
				<ec:column property="userCode" title="fiPayAdvice.userCode" />
				<ec:column property="errmsg" title="icon.information">
					<c:if test="${bdCaculateLog.errno!=0 or empty bdCaculateLog.userCode}"><font color="red"></c:if>
					${bdCaculateLog.errmsg}
					<c:if test="${bdCaculateLog.errno!=0 or empty bdCaculateLog.userCode}"></font></c:if>
				</ec:column>
				<ec:column property="cretaeTime" title="bdCaculateLog.cretaeTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startCretaeTime,#endCretaeTime" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});
function validateSearch(theForm) {
	if(theForm.currentStep.value=="" || (theForm.wmonth.value=="" && theForm.wweek.value=="")){
		alert("<fmt:message key="please.input.search.condition"/>");
		return false;
	}
	showLoading();
	return true;
}
</script>