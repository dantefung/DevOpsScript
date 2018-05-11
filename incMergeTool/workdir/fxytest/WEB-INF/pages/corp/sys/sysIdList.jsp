<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.systemParameterManage.seqenceManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemParameterManage.seqenceManage"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysIds.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="sysId.idCode"/></dd>
			<dd><input name="idCode" type="text" value="${param.idCode }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysId.idName"/></dd>
			<dd><input name="idName" type="text" value="${param.idName }"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysIds"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysIdFunctionForm" id="sysIdFunctionForm" action="editSysId.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysId">
				<a href="editSysId.jhtml?strAction=addSysId" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysIdListTableForm" method="get" >
		<ec:table 
			tableId="sysIdListTable"
			items="sysIds"
			var="sysIdVar"
			action="sysIds.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysIdListTableForm">
			<ec:row>
				<win:power powerCode="editSysId">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysId.jhtml?strAction=editSysId&id=${sysIdVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="idName" title="sysId.idName" />
				<ec:column property="idValue" title="sysId.idValue" />
				<ec:column property="idCode" title="sysId.idCode" />
				<ec:column property="dateFormat" title="alCompany.dateFormat">
					<win:code listCode="date_format" value="${sysIdVar.dateFormat}"/>
				</ec:column>
				<ec:column property="dateValue" title="sysId.dateValue" />
				<ec:column property="prefix" title="sysId.prefix" />
				<ec:column property="postfix" title="sysId.postfix" />
				<ec:column property="idLength" title="sysId.idLength" />
				<ec:column property="infix" title="sysId.infix" />
				<ec:column property="valueRandom" title="随机类型">
					<win:code listCode="sysid_random_type" value="${sysIdVar.valueRandom}"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysId(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysIdFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysId";
	
	showLoading();
	theForm.submit();
}
</script>