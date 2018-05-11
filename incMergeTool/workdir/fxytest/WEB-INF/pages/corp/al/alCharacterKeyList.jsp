<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.al.alLanguageManagement"/></title>
    <meta name="heading" content="<fmt:message key="menu.basicDataManage.langValueManage"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="alCharacterKeys.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="alCharacterKey.characterKey"/></dd>
			<dd><input type="text" name="characterKey" value="${param.characterKey }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="alCharacterKey.keyDesc"/></dd>
			<dd><input type="text" name="keyDesc" value="${param.keyDesc }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="label.keyword"/></dd>
			<dd><input type="text" name="characterValue" value="${param.characterValue }"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listAlCharacterKeys"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="alCharacterKeyFunctionForm" id="alCharacterKeyFunctionForm" action="editAlCharacterKey.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addAlCharacterKey">
				<a href="editAlCharacterKey.jhtml?strAction=addAlCharacterKey" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteAlCharacterKey">
				<a href="javascript:multiDeleteAlCharacterKey()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedCharacterKeys">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="alCharacterKeyListTableForm" method="get" >
		<ec:table 
			tableId="alCharacterKeyListTable"
			items="alCharacterKeys"
			var="alCharacterKeyVar"
			action="alCharacterKeys.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="alCharacterKeyListTableForm">
			<ec:row onclick="showSysConfigValues('${alCharacterKeyVar.characterKey}')">
				<ec:column alias="chkCharacterKey" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkCharacterKey" value="${alCharacterKeyVar.characterKey}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editAlCharacterKey">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editAlCharacterKey.jhtml?strAction=editAlCharacterKey&characterKey=${alCharacterKeyVar.characterKey}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="characterKey" title="alCharacterKey.characterKey" />
				<ec:column property="keyDesc" title="alCharacterKey.keyDesc" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteAlCharacterKey(){
	var selectedValues=getCheck(document.getElementsByName("chkCharacterKey"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.alCharacterKeyFunctionForm;
	theForm.selectedCharacterKeys.value=selectedValues;
	theForm.strAction.value="multiDeleteAlCharacterKey";
	
	//showLoading();
	theForm.submit();
}
function getCheck(objectsArray){
	var checkValue = "";
	var i = 0;
	for ( var j=0;j< objectsArray.length;j++) {
		if (objectsArray[j].checked) {
			checkValue  += "'"+objectsArray[j].value+"',";
			i++;
			
		}
	}
	checkValue = checkValue.substring(0,checkValue.length-1);
	return checkValue;
}
function showSysConfigValues(keyId){
	<win:power powerCode="editAlCharacterValue">
		window.parent.frmCharacterValue.location="/corp/alCharacterValues.jhtml?strAction=editAlCharacterKey&keyId="+keyId;
	</win:power>
}
</script>