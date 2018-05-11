<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alCharacterCodingList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.al.alLanguageManagement"/> >> <fmt:message key="menu.basicDataManage.langCodeManage"/>"/>
</head>
<div class="contentBody">
	<form name="alLangCodeFunctionForm" id="alLangCodeFunctionForm" action="editAlLangCode.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addAlLangCode">
				<a href="editAlLangCode.jhtml?strAction=addAlLangCode" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteAlLangCode">
				<a href="javascript:multiDeleteAlLangCode()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLangCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="alLangCodeListTableForm" method="get" >
		<ec:table 
			tableId="alLangCodeListTable"
			items="alLangCodes"
			var="alLangCodeVar"
			action="alLangCodes.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="alLangCodeListTableForm">
			<ec:row>
				<ec:column alias="chkLangCode" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLangCode" value="${alLangCodeVar.langCode}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editAlLangCode">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editAlLangCode.jhtml?strAction=editAlLangCode&langCode=${alLangCodeVar.langCode}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="langCode" title="alCharacterValue.langCode" />
				<ec:column property="langName" title="alCharacterCoding.characterName" />
				<ec:column property="allowedUser" title="login.userType.console" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteAlLangCode(){
	var selectedValues=getCheck(document.getElementsByName("chkLangCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.alLangCodeFunctionForm;
	theForm.selectedLangCodes.value=selectedValues;
	theForm.strAction.value="multiDeleteAlLangCode";
	
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
</script>