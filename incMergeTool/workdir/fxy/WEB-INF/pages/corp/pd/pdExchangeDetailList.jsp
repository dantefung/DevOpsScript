<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdExchangeDetailList.title"/></title>
    <meta name="heading" content="<fmt:message key="pdExchangeDetailList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdExchangeDetails.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPdExchangeDetails"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdExchangeDetailFunctionForm" id="pdExchangeDetailFunctionForm" action="editPdExchangeDetail.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPdExchangeDetail">
				<a href="editPdExchangeDetail.jhtml?strAction=addPdExchangeDetail" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePdExchangeDetail">
				<a href="javascript:multiDeletePdExchangeDetail()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedDetailIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pdExchangeDetailListTableForm" method="get" >
		<ec:table 
			tableId="pdExchangeDetailListTable"
			items="pdExchangeDetails"
			var="pdExchangeDetailVar"
			action="pdExchangeDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdExchangeDetailListTableForm">
			<ec:row>
				<ec:column alias="chkDetailId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkDetailId" value="${pdExchangeDetailVar.detailId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPdExchangeDetail">
						<a href="viewPdExchangeDetail.jhtml?strAction=viewPdExchangeDetail&detailId=${pdExchangeDetailVar.detailId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editPdExchangeDetail">
						<a href="editPdExchangeDetail.jhtml?strAction=editPdExchangeDetail&detailId=${pdExchangeDetailVar.detailId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="detailId" title="pdExchangeDetail.detailId" />
				<ec:column property="exchangeCode" title="pdExchangeDetail.exchangeCode" />
				<ec:column property="productId" title="pdExchangeDetail.productId" />
				<ec:column property="unitPrice" title="pdExchangeDetail.unitPrice" />
				<ec:column property="unitPv" title="pdExchangeDetail.unitPv" />
				<ec:column property="qty" title="pdExchangeDetail.qty" />
				<ec:column property="isOld" title="pdExchangeDetail.isOld" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePdExchangeDetail(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkDetailId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdExchangeDetailFunctionForm;
	theForm.selectedDetailIds.value=selectedValues;
	theForm.strAction.value="multiDeletePdExchangeDetail";
	
	showLoading();
	theForm.submit();
}
</script>