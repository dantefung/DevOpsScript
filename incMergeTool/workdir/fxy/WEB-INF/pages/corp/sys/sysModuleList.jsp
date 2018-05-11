<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sys.modleList"/>(<fmt:message key="sysModule.parent"/>：${parentSysModule.moduleName })</title>
    <meta name="heading" content="<fmt:message key="sys.modleList"/>(<fmt:message key="sysModule.parent"/>：<fmt:message key="${parentSysModule.moduleName }"/>)"/>
</head>

<c:if test="${not empty successMessages}">
	<script>
	window.parent.frmSysModuleTree.location.reload();
	</script>
</c:if>

<div class="searchBar">
	<form method="get" action="sysModules.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="sysModule.moduleCode"/></dd>
			<dd><input name="moduleCode" type="text" value="${param.module_code }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysModule.moduleDesc"/></dd>
			<dd><input name="moduleDesc" type="text" value="${param.module_desc }"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysModules"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<c:if test="${not empty param.userType }">
		<form name="sysModuleFunctionForm" id="sysModuleFunctionForm" action="editSysModule.jhtml" method="post" >
			<%@ include file="/common/messages.jsp" %>
			
			<div class="functionBar">
				<win:power powerCode="addSysModule">
					<a href="editSysModule.jhtml?strAction=addSysModule&parentId=${param.parentId }&userType=${param.userType}" name="add">
	                    <fmt:message key="operation.button.add"/>
					</a>
				</win:power>
	
			</div>
			<input type="hidden" name="selectedModuleIds">
			<input type="hidden" name="strAction">
			<input type="hidden" name="_form_uniq_id" value="${form.token}" />
		</form>
	</c:if>
	
	<form id="sysModuleListTableForm" method="get" >
		<ec:table 
			tableId="sysModuleListTable"
			items="sysModules"
			var="sysModule"
			action="sysModules.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysModuleListTableForm">
			<ec:row>
				<win:power powerCode="editSysModule">
					<ec:column property="1" title="操作" sortable="false" styleClass="centerColumn">
						<a href="editSysModule.jhtml?strAction=editSysModule&moduleId=${sysModule.module_id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="module_code" title="sysModule.moduleCode" />
				<ec:column property="module_name" title="sysModule.moduleName" >
					<fmt:message key="${sysModule.module_name}"/>
				</ec:column>
				<ec:column property="parent_id" title="sysModule.parent" >
					<c:if test="${sysModule.parent_id==0}"><fmt:message key="${sys.top.directory}"/></c:if>
					<c:if test="${sysModule.parent_id!=0}"><fmt:message key="${sysModule.parent_module_name}"/></c:if>
				</ec:column>
				<ec:column property="module_type" title="sysDataLog.changeType" styleClass="centerColumn">
					<win:code listCode="module_type" value="${sysModule.module_type}"/>
				</ec:column>
				<ec:column property="link_url" title="sys.url" />
				<ec:column property="order_no" title="sysModule.orderNo" />
				<ec:column property="is_active" title="sysModule.isActive" styleClass="centerColumn">
					<win:code listCode="yesno" value="${sysModule.is_active}"/>
				</ec:column>
				<ec:column property="is_validate" title="sys.verify.mode" styleClass="centerColumn">
					<win:code listCode="module_validate" value="${sysModule.is_validate}"/>
				</ec:column>
				<ec:column property="user_type" title="sys.used.user" styleClass="centerColumn">
					<win:code listCode="user_type" value="${sysModule.user_type}"/>
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

function multiDeleteSysModule(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkModuleId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysModuleFunctionForm;
	theForm.selectedModuleIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysModule";
	
	showLoading();
	theForm.submit();
}
</script>