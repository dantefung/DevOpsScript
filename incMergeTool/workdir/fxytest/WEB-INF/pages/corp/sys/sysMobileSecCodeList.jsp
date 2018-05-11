<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysMobileSecCodeList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysMobileSecCodeList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysMobileSecCodes.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listSysMobileSecCodes"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysMobileSecCodeFunctionForm" id="sysMobileSecCodeFunctionForm" action="editSysMobileSecCode.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysMobileSecCode">
				<a href="editSysMobileSecCode.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysMobileSecCode">
				<a href="javascript:multiDeleteSysMobileSecCode()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedCodeIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysMobileSecCodeListTableForm" method="get" >
		<ec:table 
			tableId="sysMobileSecCodeListTable"
			items="sysMobileSecCodes"
			var="sysMobileSecCodeVar"
			action="sysMobileSecCodes.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysMobileSecCodeListTableForm">
			<ec:row>
				<ec:column alias="chkCodeId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkCodeId" value="${sysMobileSecCodeVar.codeId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysMobileSecCode">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysMobileSecCode.jhtml?strAction=editSysMobileSecCode&codeId=${sysMobileSecCodeVar.codeId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="codeId" title="sysMobileSecCode.codeId" />
				<ec:column property="busiType" title="sysMobileSecCode.busiType" />
				<ec:column property="mobile" title="sysMobileSecCode.mobile" />
				<ec:column property="secCode" title="sysMobileSecCode.secCode" />
				<ec:column property="createTime" title="sysMobileSecCode.createTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysMobileSecCode(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkCodeId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysMobileSecCodeFunctionForm;
	theForm.selectedCodeIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysMobileSecCode";
	
	showLoading();
	theForm.submit();
}
</script>