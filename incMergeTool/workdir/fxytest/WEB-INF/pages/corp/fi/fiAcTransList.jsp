<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="member.transfer.mgr"/></title>
    <meta name="heading" content="<fmt:message key="member.transfer.mgr"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiAcTranss.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="pd.orderNo"/></dd>
			<dd><input name="tranNo" type="text" value="${param.tranNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="label.fi.out.member.type"/></dd>
			<dd><input name="outMemberNo" type="text" value="${param.outMemberNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="label.fi.out.account"/></dd>
			<dd>
				<win:list name="outAcType" listCode="bank_account_types" defaultValue="" value="${param.outAcType }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="label.fi.in.member.type"/></dd>
			<dd><input name="inMemberNo" type="text" value="${param.inMemberNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="label.fi.in.account.type"/></dd>
			<dd>
				<win:list name="inAcType" listCode="bank_account_types" defaultValue="" value="${param.inAcType }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dt>
				<win:list name="timeRangeType" listCode="fi_ac_trans_date_range" defaultValue="" value="${param.timeRangeType }" showBlankLine="true"/>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12" />
				 - 
				 <input type="text"	name="endDate" id="endDate"	value="${param.endDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="fi.status"/></dd>
			<dd>
				<win:list name="status" listCode="fi_ac_tran_status" defaultValue="" value="${param.status }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="lang.bouns.cleared"/></dd>
			<dd>
				<win:list name="isBonus" listCode="yesno" defaultValue="" value="${param.isBonus }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listFiAcTranss"/>
			</dd>
		</dl>
	</form>
</div>

<%
request.setAttribute("vEnter", "\n");
%>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="3"><fmt:message key="report.allTotal"/>：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<fmt:formatNumber pattern="###,##0.00">${sumMap.tatal_out_money }</fmt:formatNumber>
			</b>
		</td>
		<td class="footer" align="right" colspan="9"></td>
	</tr>
</c:set>
	
<div class="contentBody">
	<form name="fiAcTransFunctionForm" id="fiAcTransFunctionForm" action="editFiAcTrans.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>

		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiAcTransListTableForm" method="get" >
		<ec:table 
			tableId="fiAcTransListTable"
			items="fiAcTranss"
			var="fiAcTransVar"
			action="fiAcTranss.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="fiAcTransListTableForm" footer="${footTotalVar }">
			<ec:exportXls fileName="fiAcTrans.xls"/>
			<ec:row>
				<ec:column property="tran_no" title="pd.orderNo" />
				<ec:column property="Out_ac_type" title="label.fi.out.account">
					<win:code listCode="bank_account_types" value="${fiAcTransVar.out_ac_type }"/>
				</ec:column>
				<ec:column property="Out_member_no" title="label.fi.out.member.type">
					${fiAcTransVar.out_member_no } - ${fiAcTransVar.out_member_name }
				</ec:column>
				<ec:column property="out_money" title="bvPointChange.updatePoint" styleClass="numberColumn"/>
				<ec:column property="In_ac_type" title="label.fi.in.account.type">
					<win:code listCode="bank_account_types" value="${fiAcTransVar.in_ac_type }"/>
				</ec:column>
				<ec:column property="In_member_no" title="label.fi.in.member.type">
					${fiAcTransVar.in_member_no } - ${fiAcTransVar.in_member_name }
				</ec:column>
				<ec:column property="Status" title="fi.status">
					<win:code listCode="fi_ac_tran_status" value="${fiAcTransVar.status }"/>
				</ec:column>
				<ec:column property="Is_bonus" title="lang.bouns.cleared">
					<win:code listCode="yesno" value="${fiAcTransVar.is_bonus }"/>
				</ec:column>
				<ec:column property="Creator_code" title="pd.createTime">
					${fiAcTransVar.creator_code } - ${fiAcTransVar.create_time }
				</ec:column>
				<ec:column property="Checker_code" title="icAnnounce.checkTime">
					${fiAcTransVar.checker_code } - ${fiAcTransVar.check_time }
				</ec:column>
				<ec:column property="Calc_date" title="lang.bd.calc.date">
					${fn:substring(fiAcTransVar.calc_date,0,10) }
				</ec:column>
				<ec:column property="memo" title="busi.common.remark">
					${fn:replace(fiAcTransVar.memo, vEnter, '<br>')}
				</ec:column>
				<ec:column property="remark" title="poSell.notes">
					${fn:replace(fiAcTransVar.remark, vEnter, '<br>')}
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiAcTrans(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiAcTransFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiAcTrans";
	
	showLoading();
	theForm.submit();
}
</script>