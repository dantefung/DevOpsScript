<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberApplyPwdList.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberApplyPwdList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miMemberApplyPwds.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listMiMemberApplyPwds"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miMemberApplyPwdFunctionForm" id="miMemberApplyPwdFunctionForm" action="editMiMemberApplyPwd.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiMemberApplyPwd">
				<a href="editMiMemberApplyPwd.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiMemberApplyPwd">
				<a href="javascript:multiDeleteMiMemberApplyPwd()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedDetailIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miMemberApplyPwdListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyPwdListTable"
			items="miMemberApplyPwds"
			var="miMemberApplyPwdVar"
			action="miMemberApplyPwds.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberApplyPwdListTableForm">
			<ec:row>
				<ec:column alias="chkDetailId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkDetailId" value="${miMemberApplyPwdVar.detailId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiMemberApplyPwd">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiMemberApplyPwd.jhtml?strAction=editMiMemberApplyPwd&detailId=${miMemberApplyPwdVar.detailId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="detailId" title="miMemberApplyPwd.detailId" />
				<ec:column property="applyCode" title="miMemberApplyPwd.applyCode" />
				<ec:column property="pwdType" title="miMemberApplyPwd.pwdType" />
				<ec:column property="typeValue" title="miMemberApplyPwd.typeValue" />
				<ec:column property="repwd" title="miMemberApplyPwd.repwd" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiMemberApplyPwd(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkDetailId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miMemberApplyPwdFunctionForm;
	theForm.selectedDetailIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiMemberApplyPwd";
	
	showLoading();
	theForm.submit();
}
</script>