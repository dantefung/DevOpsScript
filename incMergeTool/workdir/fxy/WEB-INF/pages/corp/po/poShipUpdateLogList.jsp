<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poShipUpdateLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="poShipUpdateLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poShipUpdateLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPoShipUpdateLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poShipUpdateLogFunctionForm" id="poShipUpdateLogFunctionForm" action="editPoShipUpdateLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoShipUpdateLog">
				<a href="editPoShipUpdateLog.jhtml?strAction=addPoShipUpdateLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoShipUpdateLog">
				<a href="javascript:multiDeletePoShipUpdateLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poShipUpdateLogListTableForm" method="get" >
		<ec:table 
			tableId="poShipUpdateLogListTable"
			items="poShipUpdateLogs"
			var="poShipUpdateLogVar"
			action="poShipUpdateLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poShipUpdateLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${poShipUpdateLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPoShipUpdateLog">
						<a href="viewPoShipUpdateLog.jhtml?strAction=viewPoShipUpdateLog&logId=${poShipUpdateLogVar.logId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editPoShipUpdateLog">
						<a href="editPoShipUpdateLog.jhtml?strAction=editPoShipUpdateLog&logId=${poShipUpdateLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="logId" title="poShipUpdateLog.logId" />
				<ec:column property="shipId" title="poShipUpdateLog.shipId" />
				<ec:column property="companyCode" title="poShipUpdateLog.companyCode" />
				<ec:column property="orderId" title="poShipUpdateLog.orderId" />
				<ec:column property="recptCode" title="poShipUpdateLog.recptCode" />
				<ec:column property="shipType" title="poShipUpdateLog.shipType" />
				<ec:column property="shipFirstName" title="poShipUpdateLog.shipFirstName" />
				<ec:column property="shipLastName" title="poShipUpdateLog.shipLastName" />
				<ec:column property="shipAreaCode" title="poShipUpdateLog.shipAreaCode" />
				<ec:column property="shipAddress1" title="poShipUpdateLog.shipAddress1" />
				<ec:column property="shipAddress2" title="poShipUpdateLog.shipAddress2" />
				<ec:column property="shipZipCode" title="poShipUpdateLog.shipZipCode" />
				<ec:column property="shipPhone" title="poShipUpdateLog.shipPhone" />
				<ec:column property="shipMobile" title="poShipUpdateLog.shipMobile" />
				<ec:column property="creatorCode" title="poShipUpdateLog.creatorCode" />
				<ec:column property="createTime" title="poShipUpdateLog.createTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePoShipUpdateLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poShipUpdateLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeletePoShipUpdateLog";
	
	showLoading();
	theForm.submit();
}
</script>