<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdMergeExchShipList.title"/></title>
    <meta name="heading" content="<fmt:message key="pdMergeExchShipList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdMergeExchShips.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPdMergeExchShips"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdMergeExchShipFunctionForm" id="pdMergeExchShipFunctionForm" action="editPdMergeExchShip.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPdMergeExchShip">
				<a href="editPdMergeExchShip.jhtml?strAction=addPdMergeExchShip" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePdMergeExchShip">
				<a href="javascript:multiDeletePdMergeExchShip()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pdMergeExchShipListTableForm" method="get" >
		<ec:table 
			tableId="pdMergeExchShipListTable"
			items="pdMergeExchShips"
			var="pdMergeExchShipVar"
			action="pdMergeExchShips.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdMergeExchShipListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${pdMergeExchShipVar.id}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPdMergeExchShip">
						<a href="viewPdMergeExchShip.jhtml?strAction=viewPdMergeExchShip&id=${pdMergeExchShipVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editPdMergeExchShip">
						<a href="editPdMergeExchShip.jhtml?strAction=editPdMergeExchShip&id=${pdMergeExchShipVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="id" title="pdMergeExchShip.id" />
				<ec:column property="exchangeCode" title="pdMergeExchShip.exchangeCode" />
				<ec:column property="userCode" title="pdMergeExchShip.userCode" />
				<ec:column property="siNo" title="pdMergeExchShip.siNo" />
				<ec:column property="orderNo" title="pdMergeExchShip.orderNo" />
				<ec:column property="totalPrice" title="pdMergeExchShip.totalPrice" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePdMergeExchShip(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdMergeExchShipFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeletePdMergeExchShip";
	
	showLoading();
	theForm.submit();
}
</script>