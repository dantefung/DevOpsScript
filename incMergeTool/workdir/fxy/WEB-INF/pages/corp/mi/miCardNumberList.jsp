<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="证件号数量查询"/></title>
    <meta name="heading" content="<fmt:message key="证件号数量查询"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miCardNumbers.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>证件号</dt>
			<dd><input type="text" name="idNo" value="${param.idNo }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listMiCardNumbers"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miCardNumberFunctionForm" id="miCardNumberFunctionForm" action="editMiCardNumber.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<%-- <div class="functionBar">
			<win:power powerCode="addMiCardNumber">
				<a href="editMiCardNumber.jhtml?strAction=addMiCardNumber" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiCardNumber">
				<a href="javascript:multiDeleteMiCardNumber()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div> --%>
		<input type="hidden" name="selectedIdNos">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miCardNumberListTableForm" method="get" >
		<ec:table 
			tableId="miCardNumberListTable"
			items="miCardNumbers"
			var="miCardNumberVar"
			action="miCardNumbers.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miCardNumberListTableForm">
			<ec:row>
				<ec:column property="id_no" title="证件号" />
				<ec:column property="member_count" title="当前会员数量" styleClass="numberColumn"/>
				<ec:column property="id_num" title="剩余可用数量" styleClass="numberColumn" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiCardNumber(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkIdNo"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miCardNumberFunctionForm;
	theForm.selectedIdNos.value=selectedValues;
	theForm.strAction.value="multiDeleteMiCardNumber";
	
	showLoading();
	theForm.submit();
}
</script>