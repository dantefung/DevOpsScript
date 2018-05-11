<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看调拨单"/></title>
    <meta name="heading" content="<fmt:message key="查看调拨单"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdAllotTran" method="post" id="pdAllotTranForm">
    
    <table class="detail">
    	<tr>
    		<th class="required"><fmt:message key="调拨单号"/>:</th>
    		<td>
    			${pdAllotTran.tranNo }
    		</td>
    		<th class="required"><fmt:message key="分公司"/>:</th>
    		<td>
    			${pdAllotTran.companyCode }
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="出库仓"/>:</th>
    		<td>
    			${stWarehouseOut.warehouseCode } - ${stWarehouseOut.warehouseName }
    		</td>
    		<th class="required"><fmt:message key="入库仓"/>:</th>
    		<td>
    			${stWarehouseIn.warehouseCode } - ${stWarehouseIn.warehouseName }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td colspan="3">
    			${fn:replace(pdAllotTran.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title">商品信息</td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<ec:table 
					items="pdAllotTranDetails"
					var="pmProductVar" form="pdAllotTranForm" autoIncludeParameters="false"
					showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="product_code" title="busi.product.productno" />
						<ec:column property="product_name" title="pmProduct.productName"/>
						<ec:column property="price" title="label.unit.price" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.first_price }"/>
						</ec:column>
						<ec:column property="qty" title="调拨数量" styleClass="numberColumn"/>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td colspan="3">${pdAllotTran.creatorCode } - ${pdAllotTran.createTime }</td>
    	</tr>
    	<c:if test="${pdAllotTran.checkStatus==1 }">
    		<tr>
	    		<td colspan="4"><hr/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="是否审核"/>:</th>
	    		<td><win:code listCode="yesno" value="${pdAllotTran.checkStatus }"/> </td>
	    		<th><fmt:message key="审核时间"/>:</th>
	    		<td>${pdAllotTran.checkerCode } - ${pdAllotTran.checkTime }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="审核备注"/>:</th>
	    		<td colspan="3">${fn:replace(pdAllotTran.checkRemark, vEnter, '<br>')} </td>
	    	</tr>
    	</c:if>
    	<c:if test="${pdAllotTran.outStatus==1 }">
    		<tr>
	    		<td colspan="4"><hr/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="是否出库"/>:</th>
	    		<td><win:code listCode="yesno" value="${pdAllotTran.outStatus }"/> </td>
	    		<th><fmt:message key="出库确认时间"/>:</th>
	    		<td>${pdAllotTran.outUserCode } - ${pdAllotTran.outTime }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="出库确认备注"/>:</th>
	    		<td colspan="3">${fn:replace(pdAllotTran.outRemark, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<c:if test="${pdAllotTran.inStatus==1 }">
    		<tr>
	    		<td colspan="4"><hr/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="是否入库"/>:</th>
	    		<td><win:code listCode="yesno" value="${pdAllotTran.inStatus }"/> </td>
	    		<th><fmt:message key="入库时间"/>:</th>
	    		<td>${pdAllotTran.inUserCode } - ${pdAllotTran.inTime }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="入库备注"/>:</th>
	    		<td colspan="3">${fn:replace(pdAllotTran.inRemark, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<form:hidden path="tranNo"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdAllotTrans.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>