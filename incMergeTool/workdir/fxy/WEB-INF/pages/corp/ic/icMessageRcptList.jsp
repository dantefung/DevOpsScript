<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icMessageRcptList.title"/></title>
    <meta name="heading" content="<fmt:message key="icMessageRcptList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icMessageRcpts.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="poOrder.searchCondition"/></dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listIcMessageRcpts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="icMessageRcptFunctionForm" id="icMessageRcptFunctionForm" action="editIcMessageRcpt.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addIcMessageRcpt">
				<a href="editIcMessageRcpt.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteIcMessageRcpt">
				<a href="javascript:multiDeleteIcMessageRcpt()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedRcptIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icMessageRcptListTableForm" method="get" >
		<ec:table 
			tableId="icMessageRcptListTable"
			items="icMessageRcpts"
			var="icMessageRcptVar"
			action="icMessageRcpts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icMessageRcptListTableForm">
			<ec:row>
				<ec:column alias="chkRcptId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkRcptId" value="${icMessageRcptVar.rcptId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editIcMessageRcpt">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editIcMessageRcpt.jhtml?strAction=editIcMessageRcpt&rcptId=${icMessageRcptVar.rcptId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="rcptId" title="icMessageRcpt.rcptId" />
				<ec:column property="messageId" title="icMessageRcpt.messageId" />
				<ec:column property="rcptCode" title="icMessageRcpt.rcptCode" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcMessageRcpt(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkRcptId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icMessageRcptFunctionForm;
	theForm.selectedRcptIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcMessageRcpt";
	
	showLoading();
	theForm.submit();
}
</script>