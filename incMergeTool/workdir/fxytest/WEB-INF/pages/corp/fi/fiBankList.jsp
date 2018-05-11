<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="lang.rec.bankAcc.mgr"/></title>
    <meta name="heading" content="<fmt:message key="lang.rec.bankAcc.mgr"/>"/>
</head>

<div class="contentBody">
	<form name="fiBankFunctionForm" id="fiBankFunctionForm" action="editFiBank.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiBank">
				<a href="editFiBank.jhtml?strAction=addFiBank" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteFiBank">
				<a href="javascript:multiDeleteFiBank()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiBankListTableForm" method="get" >
		<ec:table 
			tableId="fiBankListTable"
			items="fiBanks"
			var="fiBankVar"
			action="fiBanks.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBankListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<%-- <win:power powerCode="viewFiBank">
						<a href="viewFiBank.jhtml?strAction=viewFiBank&id=${fiBankVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power> --%>
					<win:power powerCode="editFiBank">
						<a href="editFiBank.jhtml?strAction=editFiBank&id=${fiBankVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="companyCode" title="lang.belong.company" />
				<ec:column property="bankCode" title="bdSendRemittanceReport.openBankCH" />
				<ec:column property="bankBranch" title="lang.regist.bank.branch" />
				<ec:column property="accountNo" title="busi.common.account" />
				<ec:column property="accountName" title="lang.bankAcc.name" />
				<ec:column property="remark" title="busi.common.remark" />
				<ec:column property="isActive" title="sysModule.isActive" styleClass="centerColumn">
					<win:code listCode="yesno" value="${fiBankVar.isActive }"/>
				</ec:column>
				<ec:column property="creatorCode" title="pd.createTime">
					${fiBankVar.creatorCode } - ${fiBankVar.createTime }
				</ec:column>
				<ec:column property="editorCode" title="lang.last.edit.time">
					${fiBankVar.editorCode } - ${fiBankVar.editTime }
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

function multiDeleteFiBank(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiBankFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiBank";
	
	showLoading();
	theForm.submit();
}
</script>