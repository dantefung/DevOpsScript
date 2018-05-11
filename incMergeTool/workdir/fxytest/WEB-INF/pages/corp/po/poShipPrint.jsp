<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="打印发货单"/></title>
    <meta name="heading" content="<fmt:message key="打印发货单"/>"/>
</head>

<style media="print">
.noPrint { 
	display: none;
}
.pageTag{
	page-break-after:always;
}
</style>
<style>
table.printTitle td{
	padding:2px;
}
table.printTitle th{
	font-weight: normal;
	text-align: left;
	padding:2px;
}
table.printBody{
	border:2px solid black;
	border-collapse: collapse;
}
table.printBody td{
	padding:0px;
	border:1px solid black;
	padding:2px;
}
</style>

<%
request.setAttribute("vEnter", "\n");
%>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="poShip" method="post" action="handlePoShip.jhtml" onsubmit="return validateForm(this)" id="poShipForm" name="poShipForm">
    
    <div align="center" style="padding:0px; padding:0px;font-size:16px;font-weight:bold;">
   		${alCompany.companyName }发货单
   	</div>
   	
   	<table width="100%" border="0" class="printTitle">
		<tr>
			<th nowrap="nowrap">发货单号：</th>
			<td width="33%">${poShip.siNo}</td>
			<th nowrap="nowrap">发货类型：</th>
			<td width="33%"><win:code listCode="poship.shiptype" value="${poShip.shipType }"/></td>
			<th nowrap="nowrap">发货仓：</th>
			<td width="33%">${stWarehouse.warehouseCode } - ${stWarehouse.warehouseName }</td>
		</tr>
		<tr>
			<th nowrap="nowrap">订单编号：</th>
			<td>${poOrder.orderNo}</td>
			<th nowrap="nowrap">销售日期：</th>
			<td>
				<fmt:parseDate value="${poOrder.checkTime}" var="checkTime" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${checkTime }"/>
			</td>
			<th nowrap="nowrap">发货日期：</th>
			<td>
				<fmt:parseDate value="${poShip.confirmTime}" var="confirmTime" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${confirmTime }"/>
			</td>
		</tr>
		<tr>
			<th nowrap="nowrap">收货人编号：</th>
			<td>${poShip.recptCode}</td>
			<th nowrap="nowrap">收货人姓名：</th>
			<td>${poShip.shipLastName }</td>
			<th nowrap="nowrap">收货人电话：</th>
			<td>${poShip.shipPhone } / ${poShip.shipMobile }</td>
		</tr>
		<tr>
			<th nowrap="nowrap">收货地址：</th>
			<td colspan="3">${fullRegionName }${poShip.shipAddress1 }</td>
			<th nowrap="nowrap">邮编：</th>
			<td>${poShip.shipZipCode }</td>
		</tr>
		<%-- <tr>
			<th nowrap="nowrap">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</th>
			<td colspan="5">${fn:replace(poShip.remark, vEnter, '<br>')}</td>
		</tr> --%>
	</table>
	
	<table width="100%" border="0" class="printBody">
		<tr>
			<td>商品编码</td>
			<td>商品名称</td>
			<td width="50">数量</td>
			<td width="50">单价</td>
			<td width="60">金额</td>
			<td width="60">备</td>
		</tr>
		<c:set var="totalAmount" value="0"/>
		<c:set var="totalQty" value="0"/>
		<c:forEach items="${poShipDetails }" var="pmProductVar">
			<c:set var="totalQty" value="${totalQty+pmProductVar.quantity}"/>
			<c:set var="totalAmount" value="${totalAmount+pmProductVar.unit_price*pmProductVar.quantity}"/>
			<tr>
				<td>${pmProductVar.product_no }</td>
				<td>${pmProductVar.product_name }</td>
				<td align="right">${pmProductVar.quantity }</td>
				<td align="right"><fmt:formatNumber pattern="###,##0.000">${pmProductVar.unit_price }</fmt:formatNumber></td>
				<td align="right"><fmt:formatNumber pattern="###,##0.000">${pmProductVar.unit_price*pmProductVar.quantity }</fmt:formatNumber></td>
				<td>&nbsp;</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2">总数量：</td>
			<td colspan="4">${totalQty }</td>
		</tr>
		<tr>
			<td colspan="2">总金额：</td>
			<td colspan="4"><fmt:formatNumber pattern="###,##0.000">${totalAmount}</fmt:formatNumber></td>
		</tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>注意 顾客：货物当面点清，并检查有无破损，事后概不负责！</td>
		</tr>
	</table>
	<table width="100%" border="0"<c:if test="${pageVar<totalPage}"> class="pageTag"</c:if> cellpadding="0" cellspacing="0">
		<tr>
			<td nowrap="nowrap">仓管员：</td>
			<td nowrap="nowrap">&nbsp;</td>
			<td nowrap="nowrap">送货人：</td>
			<td nowrap="nowrap">&nbsp;</td>
			<td nowrap="nowrap">收货人：</td>
			<td nowrap="nowrap">&nbsp;</td>
			<td nowrap="nowrap">收款人：</td>
			<td nowrap="nowrap">&nbsp;</td>
		</tr>
	</table>
    	
    <div id="titleBar" class="noPrint" style="text-align:center;">
		<button type="button" name="print" onclick="go_print()"><fmt:message key="button.print"/></button>
		<button type="button" name="cancel" onclick="window.location='poShips.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
	</div>
    
    </form:form>
</div>

<script type="text/javascript">
$(function() {
	$("button[name='print']").button({
        icons: {
            primary: "ui-icon-print"
        }
    });
});

function go_print () {
    //$('titleBar').style.visibility="hidden";
    window.print();
  }
</script>