<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sys.handle.log.search"/></title>
    <meta name="heading" content="<fmt:message key="sys.handle.log.search"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysOperationLogSimples.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><wecs:locale key="label.month"/></dd>
			<dd>
				<select name="month">
					<c:forEach items="${dates }" var="dateVar">
						<option value="${dateVar }"<c:if test="${dateVar==param.month}"> selected</c:if>>${dateVar}</option>
					</c:forEach>
				</select>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysOperationLog.operaterCode"/></dd>
			<dd><input name="userCode" type="text" value="${param.userCode }" size="16"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sys.handler.no"/></dd>
			<dd><input name="operaterCode" type="text" value="${param.operaterCode }" size="16"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="comm.it.ip"/></dd>
			<dd><input name="ipAddr" type="text" value="${param.ipAddr }" size="16"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysOperationLog.operateTime"/></dd>
			<dd>
				<input name="startOperateTime" id="startOperateTime" type="text" value="${param.startOperateTime }" size="14"/> - 
				<input name="endOperateTime" id="endOperateTime" type="text" value="${param.endOperateTime }" size="14"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="desc.key.value"/></dd>
			<dd><input name="keyValue" type="text" value="${param.keyValue }" size="16"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysOperationLogSimples"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	<form id="sysOperationLogListTableForm" method="get" >
		<ec:table 
			tableId="sysOperationLogListTable"
			items="sysOperationLogs"
			var="sysOperationLog"
			action="sysOperationLogSimples.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysOperationLogListTableForm">
			<ec:row highlightRow="false">
				<ec:column property="log_id" title="title.view" sortable="false" style="white-space: nowrap;width:5px;">
		  			<win:power powerCode="viewSimpleSysOperationLog">
						<a href="viewSimpleSysOperationLog.jhtml?strAction=viewSimpleSysOperationLog&logId=${sysOperationLog.log_id}&viewData=changedData&month=${param.month }" name="view">
						<fmt:message key="function.menu.view"/></a>
					</win:power>
				</ec:column>
				<ec:column property="operate_time" title="sysOperationLog.operateTime" />
				<ec:column property="operater_code" title="title.operator" >
					${sysOperationLog.operater_code }&nbsp;${sysOperationLog.operater_name }
				</ec:column>
				<ec:column property="ip_addr" title="comm.it.ip" />
				<ec:column property="module_name" title="sysOperationLog.moduleName" >
					[<win:code listCode="sysoperationlog.dotype" value="${sysOperationLog.do_type}"/>]
					<fmt:message key="${sysOperationLog.module_name }"/>
				</ec:column>
				<ec:column property="company_code" title="bdReconsumMoneyReport.company" />
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
	$( "#startOperateTime,#endOperateTime" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});
</script>