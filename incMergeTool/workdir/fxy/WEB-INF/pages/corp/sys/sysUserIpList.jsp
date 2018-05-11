<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysUserIpList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysUserIpList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysUserIps.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd>搜索条件1</dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysUserIps"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysUserIpFunctionForm" id="sysUserIpFunctionForm" action="editSysUserIp.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysUserIp">
				<a href="editSysUserIp.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysUserIp">
				<a href="javascript:multiDeleteSysUserIp()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIpIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysUserIpListTableForm" method="get" >
		<ec:table 
			tableId="sysUserIpListTable"
			items="sysUserIps"
			var="sysUserIpVar"
			action="sysUserIps.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysUserIpListTableForm">
			<ec:row>
				<ec:column alias="chkIpId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkIpId" value="${sysUserIpVar.ipId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysUserIp">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysUserIp.jhtml?strAction=editSysUserIp&ipId=${sysUserIpVar.ipId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="ipId" title="sysUserIp.ipId" />
				<ec:column property="userCode" title="sysUserIp.userCode" />
				<ec:column property="ipAddress" title="sysUserIp.ipAddress" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysUserIp(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkIpId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysUserIpFunctionForm;
	theForm.selectedIpIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysUserIp";
	
	showLoading();
	theForm.submit();
}
</script>