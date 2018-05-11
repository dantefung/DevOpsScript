<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdMonthStatusList.title"/></title>
    <meta name="heading" content="<fmt:message key="bdMonthStatusList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdMonthStatuss.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listBdMonthStatuss"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="bdMonthStatusFunctionForm" id="bdMonthStatusFunctionForm" action="editBdMonthStatus.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addBdMonthStatus">
				<a href="editBdMonthStatus.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteBdMonthStatus">
				<a href="javascript:multiDeleteBdMonthStatus()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedWmonths">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="bdMonthStatusListTableForm" method="get" >
		<ec:table 
			tableId="bdMonthStatusListTable"
			items="bdMonthStatuss"
			var="bdMonthStatusVar"
			action="bdMonthStatuss.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdMonthStatusListTableForm">
			<ec:row>
				<ec:column alias="chkWmonth" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkWmonth" value="${bdMonthStatusVar.wmonth}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editBdMonthStatus">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editBdMonthStatus.jhtml?strAction=editBdMonthStatus&wmonth=${bdMonthStatusVar.wmonth}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="wmonth" title="bdMonthStatus.wmonth" />
				<ec:column property="wyear" title="bdMonthStatus.wyear" />
				<ec:column property="startDate" title="bdMonthStatus.startDate" />
				<ec:column property="endDate" title="bdMonthStatus.endDate" />
				<ec:column property="bonusStart" title="bdMonthStatus.bonusStart" />
				<ec:column property="bonusConfirm" title="bdMonthStatus.bonusConfirm" />
				<ec:column property="status" title="bdMonthStatus.status" />
				<ec:column property="bonusSend" title="bdMonthStatus.bonusSend" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteBdMonthStatus(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkWmonth"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.bdMonthStatusFunctionForm;
	theForm.selectedWmonths.value=selectedValues;
	theForm.strAction.value="multiDeleteBdMonthStatus";
	
	showLoading();
	theForm.submit();
}
</script>