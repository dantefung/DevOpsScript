<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poOrderExtraList.title"/></title>
    <meta name="heading" content="<fmt:message key="poOrderExtraList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poOrderExtras.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPoOrderExtras"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poOrderExtraFunctionForm" id="poOrderExtraFunctionForm" action="editPoOrderExtra.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoOrderExtra">
				<a href="editPoOrderExtra.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoOrderExtra">
				<a href="javascript:multiDeletePoOrderExtra()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedOrderIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poOrderExtraListTableForm" method="get" >
		<ec:table 
			tableId="poOrderExtraListTable"
			items="poOrderExtras"
			var="poOrderExtraVar"
			action="poOrderExtras.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderExtraListTableForm">
			<ec:row>
				<ec:column alias="chkOrderId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkOrderId" value="${poOrderExtraVar.orderId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editPoOrderExtra">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPoOrderExtra.jhtml?strAction=editPoOrderExtra&orderId=${poOrderExtraVar.orderId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="orderId" title="poOrderExtra.orderId" />
				<ec:column property="ecUserCode" title="poOrderExtra.ecUserCode" />
				<ec:column property="ecFirstName" title="poOrderExtra.ecFirstName" />
				<ec:column property="ecLastName" title="poOrderExtra.ecLastName" />
				<ec:column property="newCardType" title="poOrderExtra.newCardType" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePoOrderExtra(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkOrderId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poOrderExtraFunctionForm;
	theForm.selectedOrderIds.value=selectedValues;
	theForm.strAction.value="multiDeletePoOrderExtra";
	
	showLoading();
	theForm.submit();
}
</script>