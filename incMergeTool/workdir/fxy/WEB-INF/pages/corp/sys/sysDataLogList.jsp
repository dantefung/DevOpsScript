<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.logManage.dataLogManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.logManage.dataLogManage"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysDataLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="label.month"/></dd>
			<dd>
				<select name="month">
					<c:forEach items="${dates }" var="dateVar">
						<option value="${dateVar }"<c:if test="${dateVar==param.month}"> selected</c:if>>${dateVar}</option>
					</c:forEach>
				</select>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="sys.handle.no"/></dd>
			<dd><input name="operatorPerson" type="text" value="${param.operatorPerson }" size="16"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysDataLog.changeType"/></dd>
			<dd><win:list name="changeType" listCode="change_type" value="${param.changeType }" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysDataLog.beforeChange"/></dd>
			<dd><input name="beforeChange" type="text" value="${param.beforeChange }" size="14"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysDataLog.afterChange"/></dd>
			<dd><input name="afterChange" type="text" value="${param.afterChange }" size="14"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysDataLog.pidValue"/></dd>
			<dd><input name="pidValue" type="text" value="${param.pidValue }" size="10"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysDataLog.operatorTime"/></dd>
			<dd>
				<input name="startOperatorTime" id="startOperatorTime" type="text" value="${param.startOperatorTime }" size="14"/>
				 - 
				<input name="endOperatorTime" id="endOperatorTime" type="text" value="${param.endOperatorTime }" size="14"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysDataLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	<form id="sysDataLogListTableForm" method="get" >
		<ec:table 
			tableId="sysDataLogListTable"
			items="sysDataLogs"
			var="sysDataLog"
			action="sysDataLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysDataLogListTableForm">
			<ec:row>
			<ec:column property="logId" title="title.view" sortable="false" style="white-space: nowrap;width:5px;">
	  			<win:power powerCode="viewSysDataLog">
					<a href="viewSysDataLog.jhtml?strAction=viewSysDataLog&logId=${sysDataLog.log_id}&month=${param.month }" name="view"><fmt:message key="function.menu.view"/></a>
				</win:power>
			</ec:column>
  			<ec:column property="changeType" title="sysDataLog.changeType" >
  				<win:code listCode="change_type" value="${sysDataLog.change_type}"/>
  			</ec:column>
  			<ec:column property="table_name" title="sysDataLog.tableName"/>
  			<ec:column property="column_name" title="sysDataLog.column"/>
  			<ec:column property="p_id_value" title="sysDataLog.pidValue"/>
  			<ec:column property="before_change" title="sysDataLog.beforeChange" />
  			<ec:column property="after_change" title="sysDataLog.afterChange" />
  			<ec:column property="operator_person" title="sysOperationLog.operaterCode" />
  			<ec:column property="operator_time" title="sysDataLog.operatorTime" />
		</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

$(function() {
	$( "#startOperatorTime,#endOperatorTime" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});
</script>