<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看收益来源明细"/></title>
    <meta name="heading" content="<fmt:message key="查看收益来源明细"/>"/>
</head>



<div class="contentBody">
	<form id="bdBonusSubDetailListTableForm" method="get" >
		<ec:table 
			tableId="bdBonusSubDetailListTable"
			items="bdBonusSubDetails"
			var="bdBonusSubDetailVar"
			action="bdBonusSubDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdBonusSubDetailListTableForm">
			<ec:row>
				<ec:column property="recommend_code" title="来源" />
				<ec:column property="money" title="金额" styleClass="numberColumn" />
				<ec:column property="pv" title="业绩" styleClass="numberColumn"/>
				<ec:column property="bonus_point" title="比例" styleClass="numberColumn">
					${bdBonusSubDetailVar.bonus_point }%
				</ec:column>
				<ec:column property="algebras" title="代数" styleClass="numberColumn" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteBdBonusSubDetail(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.bdBonusSubDetailFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteBdBonusSubDetail";
	
	showLoading();
	theForm.submit();
}
</script>