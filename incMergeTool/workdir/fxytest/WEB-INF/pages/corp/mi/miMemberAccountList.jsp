<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberAccountList.title"/></title>
    <meta name="heading" content="银行账户列表"/>
</head>

<div class="searchBar">
	<form method="get" action="miMemberAccounts.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>会员编号</dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo}"/></dd>
		</dl>
		<dl>
			<dt>开户行</dt>
			<dd><input type="text" name="openBank" value="${param.openBank}"/></dd>
		</dl>
		<dl>
			<dt>银行账号</dt>
			<dd><input type="text" name="bnum" value="${param.bnum}"/></dd>
		</dl>
		<dl>
			<dt>开户人姓名</dt>
			<dd><input type="text" name="bname" value="${param.bname}"/></dd>
		</dl>

		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miMemberAccountFunctionForm" id="miMemberAccountFunctionForm" action="editMiMemberAccount.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiMemberAccount">
				<a href="editMiMemberAccount.jhtml?strAction=addMiMemberAccount" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiMemberAccount">
				<a href="javascript:multiDeleteMiMemberAccount()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedAccIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miMemberAccountListTableForm" method="get" >
		<ec:table 
			tableId="miMemberAccountListTable"
			items="miMemberAccounts"
			var="miMemberAccountVar"
			action="miMemberAccounts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberAccountListTableForm">
			<ec:row>
				<ec:column alias="chkAccId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkAccId" value="${miMemberAccountVar.accId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewMiMemberAccount">
						<a href="viewMiMemberAccount.jhtml?strAction=viewMiMemberAccount&accId=${miMemberAccountVar.accId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editMiMemberAccount">
						<a href="editMiMemberAccount.jhtml?strAction=editMiMemberAccount&accId=${miMemberAccountVar.accId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<%--<ec:column property="accId" title="miMemberAccount.accId" />--%>
				<ec:column property="memberNo" title="会员编号" />
				<ec:column property="openBank" title="开户行" />
				<%--<ec:column property="bcity" title="miMemberAccount.bcity" />--%>
				<ec:column property="bname" title="开户人姓名" />
				<ec:column property="bnum" title="银行账号" />
				<%--<ec:column property="lastEditorCode" title="miMemberAccount.lastEditorCode" />--%>
				<%--<ec:column property="lastEditorName" title="miMemberAccount.lastEditorName" />--%>
				<%--<ec:column property="lastEitTime" title="miMemberAccount.lastEitTime" />--%>
				<%--<ec:column property="companyCode" title="miMemberAccount.companyCode" />--%>
				<%--<ec:column property="bprovince" title="miMemberAccount.bprovince" />--%>
				<ec:column property="bbranch" title="支行名称" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiMemberAccount(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAccId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miMemberAccountFunctionForm;
	theForm.selectedAccIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiMemberAccount";
	
	showLoading();
	theForm.submit();
}
</script>