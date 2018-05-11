<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poOrderPayLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="poOrderPayLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poOrderPayLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPoOrderPayLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poOrderPayLogFunctionForm" id="poOrderPayLogFunctionForm" action="editPoOrderPayLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoOrderPayLog">
				<a href="editPoOrderPayLog.jhtml?strAction=addPoOrderPayLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoOrderPayLog">
				<a href="javascript:multiDeletePoOrderPayLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poOrderPayLogListTableForm" method="get" >
		<ec:table 
			tableId="poOrderPayLogListTable"
			items="poOrderPayLogs"
			var="poOrderPayLogVar"
			action="poOrderPayLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderPayLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${poOrderPayLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPoOrderPayLog">
						<a href="viewPoOrderPayLog.jhtml?strAction=viewPoOrderPayLog&logId=${poOrderPayLogVar.logId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editPoOrderPayLog">
						<a href="editPoOrderPayLog.jhtml?strAction=editPoOrderPayLog&logId=${poOrderPayLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="logId" title="poOrderPayLog.logId" />
				<ec:column property="orderId" title="poOrderPayLog.orderId" />
				<ec:column property="paymentMethod" title="poOrderPayLog.paymentMethod" />
				<ec:column property="accountType" title="poOrderPayLog.accountType" />
				<ec:column property="money" title="poOrderPayLog.money" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePoOrderPayLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poOrderPayLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeletePoOrderPayLog";
	
	showLoading();
	theForm.submit();
}
</script>