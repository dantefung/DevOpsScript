<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fi.member.e.account.search"/></title>
    <meta name="heading" content="<fmt:message key='fi.member.e.account.search'/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiAcBalanceItems.jhtml" onsubmit="return validateSearch(this)">
	    <c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="title.accout.type"/></dt>
			<dd>
				<win:list name="acType" listCode="bank_account_types" defaultValue="" value="${param.acType }"/>
			</dd>
		</dl>
		
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input name="memberNo" type="text" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="bd.credit.date"/></dt>
			<dd>
				<input name="startDate" id="startDate" type="text" value="${param.startDate }" size="14" class="readonly" readonly/>
				-
				<input name="endDate" id="endDate" type="text" value="${param.endDate }" size="14" class="readonly" readonly/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="poSell.notes"/></dt>
			<dd><input name="memo" type="text" value="${param.memo }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listFiAcBalanceItems"/>
			</dd>
		</dl>
	</form>
</div>

<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
	
	<form id="fiAcBalanceItemListTableForm" method="get" >
		<ec:table 
			tableId="fiAcBalanceItemListTable"
			items="fiAcBalanceItems"
			var="fiAcBalanceItemVar"
			action="fiAcBalanceItems.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiAcBalanceItemListTableForm">
			<ec:row>
				<win:power powerCode="editFiAcBalanceItem">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="viewFiAcBalanceItem.jhtml?strAction=viewFiAcBalanceItem&journalId=${fiAcBalanceItemVar.journalId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="company_code" 	title="bdReconsumMoneyReport.company" />
				<ec:column property="ac_type" 	title="title.accout.type">
					<win:code listCode="bank_account_types" value="${fiAcBalanceItemVar.ac_type }"/>
				</ec:column>
				<ec:column property="member_no" 	title="miMember.memberNo">
					${fiAcBalanceItemVar.member_no}
					<c:if test="${fiAcBalanceItemVar.is_credit==1 }"><span class="important">[<fmt:message key="lang.credit"/>]</span></c:if>
				</ec:column>
				<ec:column property="user_name" 	title="poOrder.memberName" />
				<ec:column property="order_type" 	title="<fmt:message key='fiAwardTemp.dealType'/>">
					<win:code listCode="fi_ac_order_types" value="${fiAcBalanceItemVar.order_type }"/>
				</ec:column>
				<ec:column property="reason" 	title="lang.reasonOfDeduction">
					<win:code listCode="fi_ac_change_reason" value="${fiAcBalanceItemVar.reason }"/>
				</ec:column>
				<ec:column property="create_time" 	title="bd.trade.date" />
				<ec:column property="create_time" 	title="bd.credit.date" />
				<ec:column property="money" 		title="fibankbooktemp.dealtype.A" styleClass="numberColumn">
					<c:if test="${fiAcBalanceItemVar.money>=0.00}"><fmt:formatNumber value="${fiAcBalanceItemVar.money}" type="number" pattern="###,###,##0.00"/></c:if>
					<c:if test="${fiAcBalanceItemVar.money<0.00}">&nbsp;</c:if>
				</ec:column>
				<ec:column property="money" 		title="fibankbooktemp.dealtype.D" styleClass="numberColumn">
					<c:if test="${fiAcBalanceItemVar.money>=0.00}">&nbsp;</c:if>
					<c:if test="${fiAcBalanceItemVar.money<0.00}"><fmt:formatNumber value="${-fiAcBalanceItemVar.money}" type="number" pattern="###,###,##0.00"/></c:if>
				</ec:column>
				<ec:column property="balance" 		title="fiBankbookJournal.balance" styleClass="numberColumn">
					<fmt:formatNumber value="${fiAcBalanceItemVar.balance}" type="number" pattern="###,###,##0.00"/>
				</ec:column>
				<ec:column property="creater_code" 	title="title.operator" />
				<ec:column property="memo" 		title="poSell.notes" >
					${fn:replace(fiAcBalanceItemVar.memo, vEnter, '<br>')}
				</ec:column>
				<ec:column property="remark" 		title="busi.common.remark" sortable="false">
					${fn:replace(fiAcBalanceItemVar.remark, vEnter, '<br>')}
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiAcBalanceItem(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkJournalId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiAcBalanceItemFunctionForm;
	theForm.selectedJournalIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiAcBalanceItem";
	
	showLoading();
	theForm.submit();
}

$(function() {
	$( "#startDate,#endDate" ).datepicker();
});


</script>