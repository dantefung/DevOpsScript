<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysSecCodeList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysSecCodeList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysSecCodes.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listSysSecCodes"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysSecCodeFunctionForm" id="sysSecCodeFunctionForm" action="editSysSecCode.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysSecCode">
				<a href="editSysSecCode.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysSecCode">
				<a href="javascript:multiDeleteSysSecCode()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysSecCodeListTableForm" method="get" >
		<ec:table 
			tableId="sysSecCodeListTable"
			items="sysSecCodes"
			var="sysSecCodeVar"
			action="sysSecCodes.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysSecCodeListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${sysSecCodeVar.id}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysSecCode">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysSecCode.jhtml?strAction=editSysSecCode&id=${sysSecCodeVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="id" title="sysSecCode.id" />
				<ec:column property="secType" title="sysSecCode.secType" />
				<ec:column property="userCode" title="sysSecCode.userCode" />
				<ec:column property="mobile" title="sysSecCode.mobile" />
				<ec:column property="secCode" title="sysSecCode.secCode" />
				<ec:column property="createTime" title="sysSecCode.createTime" />
				<ec:column property="expireTime" title="sysSecCode.expireTime" />
				<ec:column property="clientIp" title="sysSecCode.clientIp" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysSecCode(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysSecCodeFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysSecCode";
	
	showLoading();
	theForm.submit();
}
</script>