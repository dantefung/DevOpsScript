<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="rptTeamSalesList.title"/></title>
    <meta name="heading" content="<fmt:message key="rptTeamSalesList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="rptTeamSaless.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listRptTeamSaless"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="rptTeamSalesFunctionForm" id="rptTeamSalesFunctionForm" action="editRptTeamSales.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addRptTeamSales">
				<a href="editRptTeamSales.jhtml?strAction=addRptTeamSales" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteRptTeamSales">
				<a href="javascript:multiDeleteRptTeamSales()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedSalesIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="rptTeamSalesListTableForm" method="get" >
		<ec:table 
			tableId="rptTeamSalesListTable"
			items="rptTeamSaless"
			var="rptTeamSalesVar"
			action="rptTeamSaless.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="rptTeamSalesListTableForm">
			<ec:row>
				<ec:column alias="chkSalesId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkSalesId" value="${rptTeamSalesVar.salesId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editRptTeamSales">
						<a href="editRptTeamSales.jhtml?strAction=editRptTeamSales&salesId=${rptTeamSalesVar.salesId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewRptTeamSales">
						<a href="viewRptTeamSales.jhtml?strAction=viewRptTeamSales&salesId=${rptTeamSalesVar.salesId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="salesId" title="rptTeamSales.salesId" />
				<ec:column property="memberNo" title="rptTeamSales.memberNo" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteRptTeamSales(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkSalesId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.rptTeamSalesFunctionForm;
	theForm.selectedSalesIds.value=selectedValues;
	theForm.strAction.value="multiDeleteRptTeamSales";
	
	showLoading();
	theForm.submit();
}
</script>