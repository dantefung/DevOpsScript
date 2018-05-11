<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icFilePowList.title"/></title>
    <meta name="heading" content="<fmt:message key="icFilePowList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icFilePows.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listIcFilePows"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="icFilePowFunctionForm" id="icFilePowFunctionForm" action="editIcFilePow.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addIcFilePow">
				<a href="editIcFilePow.jhtml?strAction=addIcFilePow" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteIcFilePow">
				<a href="javascript:multiDeleteIcFilePow()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedPowIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icFilePowListTableForm" method="get" >
		<ec:table 
			tableId="icFilePowListTable"
			items="icFilePows"
			var="icFilePowVar"
			action="icFilePows.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icFilePowListTableForm">
			<ec:row>
				<ec:column alias="chkPowId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkPowId" value="${icFilePowVar.powId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewIcFilePow">
						<a href="viewIcFilePow.jhtml?strAction=viewIcFilePow&powId=${icFilePowVar.powId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editIcFilePow">
						<a href="editIcFilePow.jhtml?strAction=editIcFilePow&powId=${icFilePowVar.powId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="powId" title="icFilePow.powId" />
				<ec:column property="fileId" title="icFilePow.fileId" />
				<ec:column property="roleId" title="icFilePow.roleId" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcFilePow(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkPowId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icFilePowFunctionForm;
	theForm.selectedPowIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcFilePow";
	
	showLoading();
	theForm.submit();
}
</script>