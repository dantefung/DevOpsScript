<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmUserActList.title"/></title>
    <meta name="heading" content="<fmt:message key="pmUserActList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pmUserActs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPmUserActs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pmUserActFunctionForm" id="pmUserActFunctionForm" action="editPmUserAct.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPmUserAct">
				<a href="editPmUserAct.jhtml?strAction=addPmUserAct" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePmUserAct">
				<a href="javascript:multiDeletePmUserAct()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedActIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmUserActListTableForm" method="get" >
		<ec:table 
			tableId="pmUserActListTable"
			items="pmUserActs"
			var="pmUserActVar"
			action="pmUserActs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmUserActListTableForm">
			<ec:row>
				<ec:column alias="chkActId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkActId" value="${pmUserActVar.actId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPmUserAct">
						<a href="viewPmUserAct.jhtml?strAction=viewPmUserAct&actId=${pmUserActVar.actId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editPmUserAct">
						<a href="editPmUserAct.jhtml?strAction=editPmUserAct&actId=${pmUserActVar.actId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="actId" title="pmUserAct.actId" />
				<ec:column property="productId" title="pmUserAct.productId" />
				<ec:column property="sessionId" title="pmUserAct.sessionId" />
				<ec:column property="userCode" title="pmUserAct.userCode" />
				<ec:column property="actType" title="pmUserAct.actType" />
				<ec:column property="createTime" title="pmUserAct.createTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePmUserAct(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkActId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pmUserActFunctionForm;
	theForm.selectedActIds.value=selectedValues;
	theForm.strAction.value="multiDeletePmUserAct";
	
	showLoading();
	theForm.submit();
}
</script>