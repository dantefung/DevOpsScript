<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysApiUserList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysApiUserList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysApiUsers.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysApiUsers"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysApiUserFunctionForm" id="sysApiUserFunctionForm" action="editSysApiUser.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysApiUser">
				<a href="editSysApiUser.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysApiUser">
				<a href="javascript:multiDeleteSysApiUser()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysApiUserListTableForm" method="get" >
		<ec:table 
			tableId="sysApiUserListTable"
			items="sysApiUsers"
			var="sysApiUserVar"
			action="sysApiUsers.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysApiUserListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${sysApiUserVar.id}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysApiUser">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysApiUser.jhtml?strAction=editSysApiUser&id=${sysApiUserVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="id" title="sysApiUser.id" />
				<ec:column property="apiUserCode" title="sysApiUser.apiUserCode" />
				<ec:column property="apiKey" title="sysApiUser.apiKey" />
				<ec:column property="isActive" title="sysApiUser.isActive" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysApiUser(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysApiUserFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysApiUser";
	
	showLoading();
	theForm.submit();
}
</script>