<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysManagerModlPowList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysManagerModlPowList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysManagerModlPows.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd>搜索条件1</dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysManagerModlPows"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysManagerModlPowFunctionForm" id="sysManagerModlPowFunctionForm" action="editSysManagerModlPow.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysManagerModlPow">
				<a href="editSysManagerModlPow.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysManagerModlPow">
				<a href="javascript:multiDeleteSysManagerModlPow()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedPowerIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysManagerModlPowListTableForm" method="get" >
		<ec:table 
			tableId="sysManagerModlPowListTable"
			items="sysManagerModlPows"
			var="sysManagerModlPowVar"
			action="sysManagerModlPows.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysManagerModlPowListTableForm">
			<ec:row>
				<ec:column alias="chkPowerId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkPowerId" value="${sysManagerModlPowVar.powerId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysManagerModlPow">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysManagerModlPow.jhtml?strAction=editSysManagerModlPow&powerId=${sysManagerModlPowVar.powerId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="powerId" title="sysManagerModlPow.powerId" />
				<ec:column property="userCode" title="sysManagerModlPow.userCode" />
				<ec:column property="moduleId" title="sysManagerModlPow.moduleId" />
				<ec:column property="companyCode" title="sysManagerModlPow.companyCode" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysManagerModlPow(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkPowerId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysManagerModlPowFunctionForm;
	theForm.selectedPowerIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysManagerModlPow";
	
	showLoading();
	theForm.submit();
}
</script>