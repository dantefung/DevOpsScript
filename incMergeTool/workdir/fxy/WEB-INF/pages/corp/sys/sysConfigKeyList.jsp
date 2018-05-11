<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysConfigKeyList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemParameterManage.paraManage"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysConfigKeys.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="sysConfigKey.configCode"/></dd>
			<dd><input type="text" name="configCode" value="${param.configCode }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysConfigKey.keyDesc"/></dd>
			<dd><input type="text" name="keyDesc" value="${param.keyDesc }"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysConfigKeys"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysConfigKeyFunctionForm" id="sysConfigKeyFunctionForm" action="editSysConfigKey.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysConfigKey">
				<a href="editSysConfigKey.jhtml?strAction=addSysConfigKey" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysConfigKey">
				<a href="javascript:multiDeleteSysConfigKey()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedKeyIds">
		<input type="hidden" name="strAction" >
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysConfigKeyListTableForm" method="get" >
		<ec:table 
			tableId="sysConfigKeyListTable"
			items="sysConfigKeys"
			var="sysConfigKeyVar"
			action="sysConfigKeys.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysConfigKeyListTableForm">
			<ec:row onclick="javascript:showSysConfigValues(${sysConfigKeyVar.keyId});">
				<ec:column alias="chkKeyId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkKeyId" value="${sysConfigKeyVar.keyId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysConfigKey">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysConfigKey.jhtml?strAction=editSysConfigKey&keyId=${sysConfigKeyVar.keyId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<%-- <ec:column property="keyId" title="sysConfigKey.keyId" /> --%>
				<ec:column property="configCode" title="sysConfigKey.configCode" />
				<ec:column property="keyDesc" title="sysConfigKey.keyDesc" />
				<ec:column property="defaultValue" title="sysConfigKey.defaultValue" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysConfigKey(){
	var selectedValues=getCheck(document.getElementsByName("chkKeyId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysConfigKeyFunctionForm;
	theForm.selectedKeyIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysConfigKey";
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
function showSysConfigValues(keyId){
	<win:power powerCode="editSysConfigValue">
	  window.parent.frmConfigValue.location="/corp/sysConfigValues.jhtml?strAction=editSysConfigValue&keyId="+keyId;
	  </win:power>
}
</script>