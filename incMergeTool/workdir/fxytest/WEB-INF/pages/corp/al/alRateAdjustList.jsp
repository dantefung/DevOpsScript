<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="货币汇率调整"/></title>
    <meta name="heading" content="<fmt:message key="货币汇率调整"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="alRateAdjusts.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd>调整单编号</dd>
			<dd><input type="text" name="adjustCode" id="adjustCode" value="${param.adjustCode}"/></dd>
		</dl>
		<dl>
			<dd>调整类型</dd>
			<dd><win:list name="adjustType" listCode="rate_adjust_type" defaultValue="" value="${param.adjustType}" showBlankLine="true"/> </dd>
		</dl>
		<dl>
			<dd>状态</dd>
			<dd><win:list name="status" listCode="rate_adjust_status" defaultValue="" value="${param.status}" showBlankLine="true"/> </dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listAlRateAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="alRateAdjustFunctionForm" id="alRateAdjustFunctionForm" action="editAlRateAdjust.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addAlRateAdjust">
				<a href="editAlRateAdjust.jhtml?strAction=addAlRateAdjust" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedAdjustCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="alRateAdjustListTableForm" method="get" >
		<ec:table 
			tableId="alRateAdjustListTable"
			items="alRateAdjusts"
			var="alRateAdjustVar"
			action="alRateAdjusts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="alRateAdjustListTableForm">
			<ec:row>
				<win:power powerCode="viewAlRateAdjust">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" styleClass="centerColumn">
						<a href="viewAlRateAdjust.jhtml?strAction=viewAlRateAdjust&adjustCode=${alRateAdjustVar.adjustCode}" name="view"><fmt:message key="function.menu.view"/></a>
					</ec:column>
				</win:power>
				<ec:column property="adjustCode" title="调整单编号" />
				<ec:column property="adjustType" title="调整类型">
					<win:code listCode="rate_adjust_type" value="${alRateAdjustVar.adjustType}"/>
				</ec:column>
				<ec:column property="preAdjustTime" title="计划调整时间" />
				<ec:column property="status" title="状态">
					<win:code listCode="rate_adjust_status" value="${alRateAdjustVar.status}"/>
				</ec:column>
				<ec:column property="creatorCode" title="创建时间">
					${alRateAdjustVar.createTime } - ${alRateAdjustVar.creatorCode } 
				</ec:column>
				<ec:column property="checkerCode" title="审核时间">
					${alRateAdjustVar.checkTime } - ${alRateAdjustVar.checkerCode }
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>