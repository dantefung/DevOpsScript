<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdExchangePayLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="pdExchangePayLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdExchangePayLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPdExchangePayLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdExchangePayLogFunctionForm" id="pdExchangePayLogFunctionForm" action="editPdExchangePayLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPdExchangePayLog">
				<a href="editPdExchangePayLog.jhtml?strAction=addPdExchangePayLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePdExchangePayLog">
				<a href="javascript:multiDeletePdExchangePayLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pdExchangePayLogListTableForm" method="get" >
		<ec:table 
			tableId="pdExchangePayLogListTable"
			items="pdExchangePayLogs"
			var="pdExchangePayLogVar"
			action="pdExchangePayLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdExchangePayLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${pdExchangePayLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPdExchangePayLog">
						<a href="viewPdExchangePayLog.jhtml?strAction=viewPdExchangePayLog&logId=${pdExchangePayLogVar.logId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editPdExchangePayLog">
						<a href="editPdExchangePayLog.jhtml?strAction=editPdExchangePayLog&logId=${pdExchangePayLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="logId" title="pdExchangePayLog.logId" />
				<ec:column property="exchangeCode" title="pdExchangePayLog.exchangeCode" />
				<ec:column property="paymentMethod" title="pdExchangePayLog.paymentMethod" />
				<ec:column property="accountType" title="pdExchangePayLog.accountType" />
				<ec:column property="money" title="pdExchangePayLog.money" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePdExchangePayLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdExchangePayLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeletePdExchangePayLog";
	
	showLoading();
	theForm.submit();
}
</script>