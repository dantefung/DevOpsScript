<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.basicDataManage.countryManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.basicDataManage.countryManage"/>"/>
</head>

<div class="contentBody">
	<form name="alRegionFunctionForm" id="alRegionFunctionForm" action="editAlRegion.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addAlRegion">
				<a href="editAlRegion.jhtml?strAction=addAlRegion&parentRegionId=${param.parentRegionId}" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			
		</div>
		<input type="hidden" name="selectedRegionIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="alRegionListTableForm" method="get" >
		<ec:table 
			tableId="alRegionListTable"
			items="alRegions"
			var="alRegionVar"
			action="alRegions.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="alRegionListTableForm">
			<ec:row>
				 
				<win:power powerCode="editAlRegion">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editAlRegion.jhtml?strAction=editAlRegion&regionId=${alRegionVar.regionId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				 
				<ec:column property="regionCode" title="alRegion.regionCode" />
				<ec:column property="regionName" title="alRegion.regionName" />
				<ec:column property="companyCode" title="sys.common.companyCode" />
				<ec:column property="warehouseNo" title="发货仓" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteAlRegion(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkRegionId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.alRegionFunctionForm;
	theForm.selectedRegionIds.value=selectedValues;
	theForm.strAction.value="multiDeleteAlRegion";
	
	showLoading();
	theForm.submit();
}
</script>