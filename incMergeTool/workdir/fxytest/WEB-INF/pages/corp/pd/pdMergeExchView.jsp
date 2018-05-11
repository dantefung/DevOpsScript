<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看合并换货单"/></title>
    <meta name="heading" content="<fmt:message key="查看合并换货单"/>"/>
</head>

<style>
table.detail table.listTable{
}
table.detail table.listTable th{
	text-align: center;
	font-weight: bold;
	width: auto;
}
</style>

<div class="contentBody">
    <form:form commandName="pdMergeExch" method="post" id="pdMergeExchForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="4" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th>换货单号:</th>
    		<td>${pdMergeExch.exchangeCode }</td>
    		<th>收货人编号</th>
    		<td>${pdMergeExch.userCode }</td>
    	</tr>
   		<tr>
    		<th>分公司:</th>
    		<td>${stWarehouse.companyCode }</td>
    		<th>发货仓:</th>
    		<td>
    			<form:hidden path="warehouseCode"/>
    			${stWarehouse.warehouseCode } - ${stWarehouse.warehouseName }
    		</td>
    	</tr>
    	<tr>
    		<th>新发货单编号:</th>
    		<td colspan="3">${pdMergeExch.newSiNo }</td>
    	</tr>
    	<tr>
    		<th>备注:</th>
    		<td colspan="3"><pre>${pdMergeExch.remark }</pre></td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title">收发货信息</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.register.shipType"/>:</th>
    		<td>
    			<win:code listCode="poship.shiptype" value="${pdMergeExch.shipType }"></win:code>
    		</td>
    		<th class="required"><fmt:message key="pdSendInfo.recipientName"/>:</th>
    		<td>${pdMergeExch.shipLastName }</td>
    	</tr>
    	
    	<tr class="shipType1TR">
    		<th class="required"><fmt:message key="miMember.delivery.moblie"/>:</th>
    		<td>${pdMergeExch.shipMobile }</td>
    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
    		<td>${pdMergeExch.shipPhone }</td>
    	</tr>

    	<tr class="shipType1TR">
    		<th class="required"><fmt:message key="mi.addrees.detail"/>:</th>
    		<td>${fullRegionName }${pdMergeExch.shipAddress1 }</td>
    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
    		<td>${pdMergeExch.shipZipCode }</td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title">原发货单</td>
    	</tr>
    	
    	<tr>
    		<td colspan="4">
    			<table class="listTable" width="100%">
    				<thead>
	    				<tr>
	    					<th>发货单号</th>
	    					<th>所属会员</th>
	    					<th>订单编号</th>
	    					<th>商品总金额</th>		    					
	    				</tr>
    				</thead>
    				<tbody id="oldShipListBody">
    					<c:forEach items="${pdMergeExchShips }" var="pdMergeExchShipVar">
    						<tr id="tr_${pdMergeExchShipVar.id}">
    							<td>${pdMergeExchShipVar.si_no }</td>
    							<td>${pdMergeExchShipVar.user_code }</td>
    							<td>${pdMergeExchShipVar.order_no }</td>
    							<td align="right">${pdMergeExchShipVar.total_price }</td>
    						</tr>
    					</c:forEach>
    				</tbody>
    				<tfoot>
    					<tr>
    						<td colspan="3" align="right"><b>合计：</b></td>
    						<td align="right"><span id="spnOldTotalPrice">${pdMergeExch.oldTotalPrice }</span></td>
    					</tr>
    				</tfoot>
    			</table>
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="4" class="title">新商品信息</td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<ec:table 
					items="pdMergeExchDetails"
					var="pmProductVar" form="pdMergeExchForm" autoIncludeParameters="false"
					showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="product_code" title="busi.product.productno" />
						<ec:column property="product_name" title="pmProduct.productName"/>
						<ec:column property="unit_price" title="label.unit.price" styleClass="numberColumn"/>
						<ec:column property="qty" title="数量" styleClass="numberColumn"/>
					</ec:row>
				</ec:table>
				<table width="100%">
					<tr>
						<td align="right">
							<fmt:message key="poOrder.amtCount"/>：<strong>${pdMergeExch.newTotalPrice }</strong>
						</td>
					</tr>
				</table>
    		</td>
    	</tr>
    	
    	<tr>
    		<th>创建时间:</th>
    		<td>${pdMergeExch.creatorCode } - ${pdMergeExch.createTime }</td>
    		<th>审核时间:</th>
    		<td>${pdMergeExch.checkerCode } - ${pdMergeExch.checkTime }</td>
    	</tr>
    	
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<form:hidden path="exchangeCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdMergeExchs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>