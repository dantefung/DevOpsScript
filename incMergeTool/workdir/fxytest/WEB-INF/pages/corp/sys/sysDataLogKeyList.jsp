<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysDataLogKeyList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysDataLogKeyList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysDataLogKeys.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysDataLogKeys"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysDataLogKeyFunctionForm" id="sysDataLogKeyFunctionForm" action="editSysDataLogKey.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysDataLogKey">
				<a href="editSysDataLogKey.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysDataLogKey">
				<a href="javascript:multiDeleteSysDataLogKey()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedKeyIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysDataLogKeyListTableForm" method="get" >
		<ec:table 
			tableId="sysDataLogKeyListTable"
			items="sysDataLogKeys"
			var="sysDataLogKeyVar"
			action="sysDataLogKeys.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysDataLogKeyListTableForm">
			<ec:row>
				<ec:column alias="chkKeyId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkKeyId" value="${sysDataLogKeyVar.keyId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysDataLogKey">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysDataLogKey.jhtml?strAction=editSysDataLogKey&keyId=${sysDataLogKeyVar.keyId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="keyId" title="sysDataLogKey.keyId" />
				<ec:column property="logId" title="sysDataLogKey.logId" />
				<ec:column property="keyName" title="sysDataLogKey.keyName" />
				<ec:column property="keyValue" title="sysDataLogKey.keyValue" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysDataLogKey(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkKeyId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysDataLogKeyFunctionForm;
	theForm.selectedKeyIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysDataLogKey";
	
	showLoading();
	theForm.submit();
}
</script>