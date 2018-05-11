<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icMessageViewList.title"/></title>
    <meta name="heading" content="<fmt:message key="icMessageViewList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icMessageViews.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd>搜索条件1</dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listIcMessageViews"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="icMessageViewFunctionForm" id="icMessageViewFunctionForm" action="editIcMessageView.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addIcMessageView">
				<a href="editIcMessageView.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteIcMessageView">
				<a href="javascript:multiDeleteIcMessageView()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedViewIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icMessageViewListTableForm" method="get" >
		<ec:table 
			tableId="icMessageViewListTable"
			items="icMessageViews"
			var="icMessageViewVar"
			action="icMessageViews.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icMessageViewListTableForm">
			<ec:row>
				<ec:column alias="chkViewId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkViewId" value="${icMessageViewVar.viewId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editIcMessageView">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editIcMessageView.jhtml?strAction=editIcMessageView&viewId=${icMessageViewVar.viewId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="viewId" title="icMessageView.viewId" />
				<ec:column property="messageId" title="icMessageView.messageId" />
				<ec:column property="userCode" title="icMessageView.userCode" />
				<ec:column property="viewTime" title="icMessageView.viewTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcMessageView(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkViewId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icMessageViewFunctionForm;
	theForm.selectedViewIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcMessageView";
	
	showLoading();
	theForm.submit();
}
</script>