<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.listIcOnePages"/></title>
    <meta name="heading" content="<fmt:message key="menu.listIcOnePages"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icOnePages.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="icOnePage.pageCode"/></dt>
			<dd><win:list name="pageCode" listCode="one_page_codes" defaultValue="" value="${param.pageCode }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="ic.lable.key.word"/></dt>
			<dd><input type="text" name="keyword" value="${param.keyword }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd> 
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listIcOnePages"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="icOnePageFunctionForm" id="icOnePageFunctionForm" action="editIcOnePage.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addIcOnePage">
				<a href="editIcOnePage.jhtml?strAction=addIcOnePage" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedPageIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icOnePageListTableForm" method="get" >
		<ec:table 
			tableId="icOnePageListTable"
			items="icOnePages"
			var="icOnePageVar"
			action="icOnePages.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icOnePageListTableForm">
			<ec:row>
				<win:power powerCode="editIcOnePage">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" styleClass="centerColumn">
						<a href="editIcOnePage.jhtml?strAction=editIcOnePage&pageId=${icOnePageVar.pageId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="pageCode" title="icOnePage.pageCode">
					<win:code listCode="one_page_codes" value="${icOnePageVar.pageCode}"/>
				</ec:column>
				<ec:column property="langCode" title="alCharacterValue.langCode" />
				<ec:column property="pageTitle" title="icInformation.title" sortable="false"/>
				<ec:column property="creatorCode" title="pmProductSppm.createUser" />
				<ec:column property="createTime" title="pd.createTime" />
				<ec:column property="editorCode" title="poCounterOrder.editUserNo" />
				<ec:column property="editTime" title="poCounterOrder.editTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcOnePage(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkPageId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icOnePageFunctionForm;
	theForm.selectedPageIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcOnePage";
	
	showLoading();
	theForm.submit();
}
</script>