<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poStatusLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="poStatusLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poStatusLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPoStatusLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poStatusLogFunctionForm" id="poStatusLogFunctionForm" action="editPoStatusLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoStatusLog">
				<a href="editPoStatusLog.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoStatusLog">
				<a href="javascript:multiDeletePoStatusLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poStatusLogListTableForm" method="get" >
		<ec:table 
			tableId="poStatusLogListTable"
			items="poStatusLogs"
			var="poStatusLogVar"
			action="poStatusLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poStatusLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${poStatusLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editPoStatusLog">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPoStatusLog.jhtml?strAction=editPoStatusLog&logId=${poStatusLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="logId" title="poStatusLog.logId" />
				<ec:column property="orderId" title="poStatusLog.orderId" />
				<ec:column property="oldStatus" title="poStatusLog.oldStatus" />
				<ec:column property="newStatus" title="poStatusLog.newStatus" />
				<ec:column property="operatorCode" title="poStatusLog.operatorCode" />
				<ec:column property="operateTime" title="poStatusLog.operateTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePoStatusLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poStatusLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeletePoStatusLog";
	
	showLoading();
	theForm.submit();
}
</script>