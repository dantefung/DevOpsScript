<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>收益发放导出</title>
    <meta name="heading" content="收益发放导出"/>
</head>

<div class="searchBar">
	<form method="get" action="fiBonusSends.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>发放计划编号</dt>
			<dd><input name="operNo" type="text" value="${param.operNo}" size="16"/></dd>
		</dl>
		<dl>
			<dt>建立者账号</dt>
			<dd><input name="operCode" type="text" value="${param.operCode }" size="16"/></dd>
		</dl>
		<dl>
			<dt>计划状态</dt>
			<dd><win:list listCode="bonus_send_status" name="status" value="${param.status}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>建立日期</dt>
			<dd>
				<input name="startOperDate" id="startOperDate" type="text" value="${param.startOperDate }" size="12" class="readonly" readonly/>
				 - 
				<input name="endOperDate" id="endOperDate" type="text" value="${param.endOperDate }" size="12" class="readonly" readonly/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiBonusSends"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiBonusSendFunctionForm" id="fiBonusSendFunctionForm" action="editFiBonusSend.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
	</form>
	
	<c:set var="footTotalVar">
		<tr>
			<td align="right" class="footer" colspan="3"><fmt:message key="report.allTotal"/></td>
			<td align="left" class="footer" style="text-align: left;"><b>
				<c:if test="${not empty totalSuccessAmount.amount_sum}">
					<fmt:formatNumber pattern="###,##0.00">${totalSuccessAmount.amount_sum}</fmt:formatNumber>
				</c:if>
				<c:if test="${empty totalSuccessAmount.amount_sum}">
					0.00
				</c:if></b>
			</td>
			<td align="left" class="footer" style="text-align: left;"><b>
				<c:if test="${not empty totalSuccessAmount.fees_sum}">
					<fmt:formatNumber pattern="###,##0.00">${totalSuccessAmount.fees_sum}</fmt:formatNumber>
				</c:if>
				<c:if test="${empty totalSuccessAmount.fees_sum}">
					0.00
				</c:if></b>
			</td>
			<td align="left" class="footer" style="text-align: left;"><b>
				<c:if test="${not empty totalSuccessAmount.send_amt_sum}">
					<fmt:formatNumber pattern="###,##0.00">${totalSuccessAmount.send_amt_sum}</fmt:formatNumber>
				</c:if>
				<c:if test="${empty totalSuccessAmount.send_amt_sum}">
					0.00
				</c:if></b>
			</td>
			<td class="footer" colspan="6">&nbsp;</td>
		</tr>
	</c:set>
	
	<form id="fiBonusSendListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusSendListTable"
			items="fiBonusSends"
			var="fiBonusSendVar"
			action="fiBonusSends.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusSendListTableForm" footer="${footTotalVar}">
			<ec:row>
				<ec:column property="1" title="title.operation" sortable="false" style="width:60px;">
					<nobr>
			  			<win:power powerCode="viewFiBonusSend">
							<a href="viewFiBonusSend.jhtml?strAction=viewFiBonusSend&operNo=${fiBonusSendVar.oper_no}&bonusType=${fiBonusSendVar.bonus_type }" name="view">查看</a>
						</win:power>
						<win:power powerCode="editFiBonusSend">
							<a href="editFiBonusSend.jhtml?operNo=${fiBonusSendVar.oper_no}&strAction=editFiBonusSend&bonusType=${fiBonusSendVar.bonus_type }" name="edit">编辑</a>
						</win:power>
					</nobr>
				</ec:column>
				
				<ec:column property="oper_no" 		title="发放计划编号" />
				<ec:column property="bonus_type" 	title="收益类型" >
					<win:code listCode="bonus.type" value="${fiBonusSendVar.bonus_type }"/>
				</ec:column>
				<ec:column property="succ_amount" 	title="发放成功金额" />
				<ec:column property="succ_fees" 	title="手续费" />
				<ec:column property="succ_send_amt" 	title="实发金额" />
				<ec:column property="last_send_date" title="最后发放日期" />
				<ec:column property="oper_code" 	title="建立者账号" />
				<ec:column property="oper_name" 	title="建立者名称" />
				<ec:column property="oper_date" 	title="建立日期" />
				<ec:column property="amount_low" 	title="bdSendRecord.remittanceMoneyScope" styleClass="centerColumn">
					${fiBonusSendVar.amount_low} - ${fiBonusSendVar.amount_up}
				</ec:column>
				<ec:column property="status" title="计划状态" styleClass="centerColumn">
					<win:code listCode="bonus_send_status" value="${fiBonusSendVar.status}"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startOperDate, #endOperDate" ).datepicker();
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiBonusSend(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkOperNo"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiBonusSendFunctionForm;
	theForm.selectedOperNos.value=selectedValues;
	theForm.strAction.value="multiDeleteFiBonusSend";
	
	showLoading();
	theForm.submit();
}
</script>