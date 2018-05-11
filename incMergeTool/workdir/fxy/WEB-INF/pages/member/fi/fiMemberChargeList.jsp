<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="fi.zhcz"/></title>
    <meta name="heading" content="<fmt:message key="fi.zhcz"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiMemberCharges.jhtml" onsubmit="return validateSearch(this)">
		<table class="detail" border="0" >
			<tr>
				<td><fmt:message key="poOrder.orderNo"/></td>
				<td><fmt:message key="fi.jyzh"/></td>
				<td><fmt:message key="fi.czsj"/></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="text" name="orderNo" id="orderNo" value="${param.orderNo }"/></td>
				<td><input type="text" name="tradeNo" id="tradeNo" value="${param.tradeNo }"/></td>
				<td><input type="hidden" name="dateType" id="dateType" value="create_time"/>
					<fmt:message key="ic.lable.from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
					<fmt:message key="ic.lable.to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
				</td>
				<td><button type="submit" name="search"><fmt:message key="operation.button.search"/></button></td>
			</tr>
		</table>
	</form>
</div>

<div class="contentBody">
	<form name="fiAlipayLogFunctionForm" id="fiAlipayLogFunctionForm" action="editFiAlipayLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		<div class="functionBar">
			<a href="editFiMemberCharge.jhtml" name="add" target="_blank"><fmt:message key="fi.wycz"/></a>			
		</div>
	</form>
	
	<form id="fiAlipayLogListTableForm" method="get" >
		<ec:table 
			tableId="fiAlipayLogListTable"
			items="fiAlipayLogs"
			var="fiAlipayLogVar"
			action="fiMemberCharges.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiAlipayLogListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${fiAlipayLogVar.id}" class="checkbox"/>
		  		</ec:column>
				<ec:column property="orderNo" title="poOrder.orderNo" />
				<ec:column property="tradeNo" title="fi.zfbjyh" />
				<ec:column property="totalFee" title="fi.czje" />
				<ec:column property="payResult" title="fi.fkzt">
				<c:if test="${fiAlipayLogVar.payResult == '0' }"><fmt:message key="operation.order.noPay"/></c:if>
				<c:if test="${fiAlipayLogVar.payResult == '1' }"><fmt:message key="operation.order.hasPay"/></c:if>
				</ec:column>
				<ec:column property="createTime" title="pd.createTime">
				<fmt:formatDate value="${fiAlipayLogVar.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
				</ec:column>
				<ec:column property="returnTime" title="fi.successtime">
				<fmt:formatDate value="${fiAlipayLogVar.returnTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
				</ec:column>
				<ec:column property="remark" title="busi.common.remark" />
			</ec:row>
		</ec:table>
	</form>
</div>

<script type="text/javascript">
$(function() {
	$( "#startDate" ).datepicker();
});
$(function() {
	$( "#endDate" ).datepicker();
});

function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>