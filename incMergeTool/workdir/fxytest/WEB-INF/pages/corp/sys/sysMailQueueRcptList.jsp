<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysMailQueueRcptList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysMailQueueRcptList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysMailQueueRcpts.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysMailQueueRcpts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysMailQueueRcptFunctionForm" id="sysMailQueueRcptFunctionForm" action="editSysMailQueueRcpt.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysMailQueueRcpt">
				<a href="editSysMailQueueRcpt.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysMailQueueRcpt">
				<a href="javascript:multiDeleteSysMailQueueRcpt()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedRcptIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysMailQueueRcptListTableForm" method="get" >
		<ec:table 
			tableId="sysMailQueueRcptListTable"
			items="sysMailQueueRcpts"
			var="sysMailQueueRcptVar"
			action="sysMailQueueRcpts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysMailQueueRcptListTableForm">
			<ec:row>
				<ec:column alias="chkRcptId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkRcptId" value="${sysMailQueueRcptVar.rcptId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysMailQueueRcpt">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysMailQueueRcpt.jhtml?strAction=editSysMailQueueRcpt&rcptId=${sysMailQueueRcptVar.rcptId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="rcptId" title="sysMailQueueRcpt.rcptId" />
				<ec:column property="queueId" title="sysMailQueueRcpt.queueId" />
				<ec:column property="companyCode" title="sysMailQueueRcpt.companyCode" />
				<ec:column property="toUserCode" title="sysMailQueueRcpt.toUserCode" />
				<ec:column property="toEmail" title="sysMailQueueRcpt.toEmail" />
				<ec:column property="toName" title="sysMailQueueRcpt.toName" />
				<ec:column property="isSent" title="sysMailQueueRcpt.isSent" />
				<ec:column property="sentDate" title="sysMailQueueRcpt.sentDate" />
				<ec:column property="retryTimes" title="sysMailQueueRcpt.retryTimes" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysMailQueueRcpt(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkRcptId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysMailQueueRcptFunctionForm;
	theForm.selectedRcptIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysMailQueueRcpt";
	
	showLoading();
	theForm.submit();
}
</script>