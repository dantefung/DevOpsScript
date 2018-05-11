<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdMergeExchDetailList.title"/></title>
    <meta name="heading" content="<fmt:message key="pdMergeExchDetailList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdMergeExchDetails.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPdMergeExchDetails"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdMergeExchDetailFunctionForm" id="pdMergeExchDetailFunctionForm" action="editPdMergeExchDetail.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPdMergeExchDetail">
				<a href="editPdMergeExchDetail.jhtml?strAction=addPdMergeExchDetail" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePdMergeExchDetail">
				<a href="javascript:multiDeletePdMergeExchDetail()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedDetailIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pdMergeExchDetailListTableForm" method="get" >
		<ec:table 
			tableId="pdMergeExchDetailListTable"
			items="pdMergeExchDetails"
			var="pdMergeExchDetailVar"
			action="pdMergeExchDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdMergeExchDetailListTableForm">
			<ec:row>
				<ec:column alias="chkDetailId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkDetailId" value="${pdMergeExchDetailVar.detailId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPdMergeExchDetail">
						<a href="viewPdMergeExchDetail.jhtml?strAction=viewPdMergeExchDetail&detailId=${pdMergeExchDetailVar.detailId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editPdMergeExchDetail">
						<a href="editPdMergeExchDetail.jhtml?strAction=editPdMergeExchDetail&detailId=${pdMergeExchDetailVar.detailId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="detailId" title="pdMergeExchDetail.detailId" />
				<ec:column property="exchangeCode" title="pdMergeExchDetail.exchangeCode" />
				<ec:column property="productId" title="pdMergeExchDetail.productId" />
				<ec:column property="unitPrice" title="pdMergeExchDetail.unitPrice" />
				<ec:column property="unitPv" title="pdMergeExchDetail.unitPv" />
				<ec:column property="qty" title="pdMergeExchDetail.qty" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePdMergeExchDetail(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkDetailId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdMergeExchDetailFunctionForm;
	theForm.selectedDetailIds.value=selectedValues;
	theForm.strAction.value="multiDeletePdMergeExchDetail";
	
	showLoading();
	theForm.submit();
}
</script>