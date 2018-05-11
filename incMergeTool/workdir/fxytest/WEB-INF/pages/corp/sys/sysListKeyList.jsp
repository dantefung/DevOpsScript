<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.systemParameterManage.listManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemParameterManage.listManage"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysListKeys.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="sysListKey.listCode"/></dd>
			<dd><input type="text" name="listCode" value="${param.listCode }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysListKey.listName"/></dd>
			<dd><input type="text" name="listName" value="${param.listName }"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysListKeys"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysListKeyFunctionForm" id="sysListKeyFunctionForm" action="editSysListKey.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysListKey">
				<a href="editSysListKey.jhtml?strAction=addSysListKey" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysListKey">
				<a href="javascript:multiDeleteSysListKey()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedKeyIds">
		<input type="hidden" name="strAction" value="${param.strAction }">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysListKeyListTableForm" method="get" >
		<ec:table 
			tableId="sysListKeyListTable"
			items="sysListKeys"
			var="sysListKeyVar"
			action="sysListKeys.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysListKeyListTableForm">
			<ec:row onclick="javascript:showSysListValues(${sysListKeyVar.keyId})">
				<ec:column alias="chkKeyId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkKeyId" value="${sysListKeyVar.keyId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysListKey">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysListKey.jhtml?strAction=editSysListKey&keyId=${sysListKeyVar.keyId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="listCode" title="sysListKey.listCode" />
				<ec:column property="listName" title="sysListKey.listName" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysListKey(){
	var selectedValues=getCheck(document.getElementsByName("chkKeyId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysListKeyFunctionForm;
	theForm.selectedKeyIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysListKey";
	//showLoading();
	theForm.submit();
}
function getCheck(objectsArray){
	var checkValue = new Array();
	var i = 0;
	for ( var j=0;j< objectsArray.length;j++) {
		if (objectsArray[j].checked) {
			checkValue[i] = objectsArray[j].value;
			i++;
			
		}
	}
	return checkValue.join();
}
function showSysListValues(keyId){
	<win:power powerCode="listSysListValues">
	window.parent.frmListValue.location="/corp/sysListValues.jhtml?strAction=listSysListValues&keyId="+keyId;
	</win:power>
}
</script>