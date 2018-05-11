<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysManagerUserList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysManagerUserList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysManagerUsers.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd>搜索条件1</dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysManagerUsers"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysManagerUserFunctionForm" id="sysManagerUserFunctionForm" action="editSysManagerUser.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysManagerUser">
				<a href="editSysManagerUser.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysManagerUser">
				<a href="javascript:multiDeleteSysManagerUser()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedRollIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysManagerUserListTableForm" method="get" >
		<ec:table 
			tableId="sysManagerUserListTable"
			items="sysManagerUsers"
			var="sysManagerUserVar"
			action="sysManagerUsers.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysManagerUserListTableForm">
			<ec:row>
				<ec:column alias="chkRollId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkRollId" value="${sysManagerUserVar.rollId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysManagerUser">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysManagerUser.jhtml?strAction=editSysManagerUser&rollId=${sysManagerUserVar.rollId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="rollId" title="sysManagerUser.rollId" />
				<ec:column property="masterUserCode" title="sysManagerUser.masterUserCode" />
				<ec:column property="slaveUserCode" title="sysManagerUser.slaveUserCode" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysManagerUser(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkRollId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysManagerUserFunctionForm;
	theForm.selectedRollIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysManagerUser";
	
	showLoading();
	theForm.submit();
}
</script>