<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdAllotTranDetailList.title"/></title>
    <meta name="heading" content="<fmt:message key="pdAllotTranDetailList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdAllotTranDetails.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPdAllotTranDetails"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdAllotTranDetailFunctionForm" id="pdAllotTranDetailFunctionForm" action="editPdAllotTranDetail.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPdAllotTranDetail">
				<a href="editPdAllotTranDetail.jhtml?strAction=addPdAllotTranDetail" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePdAllotTranDetail">
				<a href="javascript:multiDeletePdAllotTranDetail()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedDetailIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pdAllotTranDetailListTableForm" method="get" >
		<ec:table 
			tableId="pdAllotTranDetailListTable"
			items="pdAllotTranDetails"
			var="pdAllotTranDetailVar"
			action="pdAllotTranDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdAllotTranDetailListTableForm">
			<ec:row>
				<ec:column alias="chkDetailId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkDetailId" value="${pdAllotTranDetailVar.detailId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPdAllotTranDetail">
						<a href="viewPdAllotTranDetail.jhtml?strAction=viewPdAllotTranDetail&detailId=${pdAllotTranDetailVar.detailId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editPdAllotTranDetail">
						<a href="editPdAllotTranDetail.jhtml?strAction=editPdAllotTranDetail&detailId=${pdAllotTranDetailVar.detailId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="detailId" title="pdAllotTranDetail.detailId" />
				<ec:column property="tranNo" title="pdAllotTranDetail.tranNo" />
				<ec:column property="productCode" title="pdAllotTranDetail.productCode" />
				<ec:column property="qty" title="pdAllotTranDetail.qty" />
				<ec:column property="price" title="pdAllotTranDetail.price" />
				<ec:column property="transferPrice" title="pdAllotTranDetail.transferPrice" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePdAllotTranDetail(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkDetailId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdAllotTranDetailFunctionForm;
	theForm.selectedDetailIds.value=selectedValues;
	theForm.strAction.value="multiDeletePdAllotTranDetail";
	
	showLoading();
	theForm.submit();
}
</script>