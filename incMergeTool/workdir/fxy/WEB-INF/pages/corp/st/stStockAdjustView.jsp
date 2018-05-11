<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看库存调整单 "/></title>
    <meta name="heading" content="<fmt:message key="查看库存调整单"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="stStockAdjust" method="post" id="stStockAdjustForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
	    	<th>单号:</th>
	    		<td>
    				${stStockAdjust.adjustCode }
	    		</td>
	    	</tr>
    	<tr>
    		<th><fmt:message key="分公司"/>:</th>
    		<td>${stStockAdjust.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="仓库"/>:</th>
    		<td>${stStockAdjust.warehouseCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockAdjust.changeReason"/>:</th>
    		<td><win:code listCode="st_stock_adjust_change_reason" value="${stStockAdjust.changeReason }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td>${stStockAdjust.creatorCode } - ${stStockAdjust.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="审核时间"/>:</th>
    		<td>${stStockAdjust.checkerCode } - ${stStockAdjust.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="确认时间"/>:</th>
    		<td>${stStockAdjust.confirmCode } - ${stStockAdjust.confirmTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="状态"/>:</th>
    		<td><win:code listCode="st_stock_adjust_status" value="${stStockAdjust.status }"/> </td>
    	</tr>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td><pre>${stStockAdjust.remark }</pre></td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">商品</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<ec:table 
					items="stStockAdjustDetails"
					var="pmProductVar" form="stStockAdjustForm" autoIncludeParameters="false"
					showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="product_code" title="busi.product.productno" />
						<ec:column property="product_name" title="pmProduct.productName"/>
						<ec:column property="adjust_qty" title="调整数量" styleClass="numberColumn"/>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" name="cancel" onclick="window.location='stStockAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>