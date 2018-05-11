<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看换货单"/></title>
    <meta name="heading" content="<fmt:message key="查看换货单"/>"/>
</head>

<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="pdExchange" method="post" id="pdExchangeForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="4" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th>换货单号:</th>
    		<td colspan="3">${pdExchange.exchangeCode }</td>
    	</tr>
   		<tr>
    		<th class="required">分公司:</th>
    		<td>${stWarehouse.companyCode }</td>
    		<th class="required">发货仓:</th>
    		<td>
    			<form:hidden path="warehouseCode"/>
    			${stWarehouse.warehouseCode } - ${stWarehouse.warehouseName }
    		</td>
    	</tr>
   		<tr>
    		<td colspan="4" class="title">原商品信息</td>
    	</tr>
   	
    	<tr>
    		<td colspan="4">
    			<ec:table 
					items="oldPdExchangeDetails"
					var="pmProductVar" form="pdExchangeForm" autoIncludeParameters="false"
					showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="product_code" title="busi.product.productno" />
						<ec:column property="product_name" title="pmProduct.productName"/>
						<ec:column property="unit_price" title="label.unit.price" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_price }"/>
						</ec:column>
						<ec:column property="qty" title="数量" styleClass="numberColumn">
							${pmProductVar.qty }
						</ec:column>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="4" class="title">新商品信息</td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<ec:table 
					items="newPdExchangeDetails"
					var="pmProductVar" form="pdExchangeForm" autoIncludeParameters="false"
					showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="product_code" title="busi.product.productno" />
						<ec:column property="product_name" title="pmProduct.productName"/>
						<ec:column property="unit_price" title="label.unit.price" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_price }"/>
						</ec:column>
						<ec:column property="qty" title="数量" styleClass="numberColumn">
							${pmProductVar.qty }
						</ec:column>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td colspan="3">${pdExchange.creatorCode } - ${pdExchange.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td colspan="3">
    			${fn:replace(pdExchange.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<c:if test="${pdExchange.checkStatus==1 }">
    		<tr>
	    		<td colspan="4"><hr/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="是否审核"/>:</th>
	    		<td><win:code listCode="yesno" value="${pdExchange.checkStatus }"/> </td>
	    		<th><fmt:message key="审核时间"/>:</th>
	    		<td>${pdExchange.checkerCode } - ${pdExchange.checkTime }</td>
	    	</tr>
    	</c:if>
    	<c:if test="${pdExchange.confirmStatus==1 }">
    		<tr>
	    		<td colspan="4"><hr/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="是否发货"/>:</th>
	    		<td><win:code listCode="yesno" value="${pdExchange.confirmStatus }"/> </td>
	    		<th><fmt:message key="确认时间"/>:</th>
	    		<td>${pdExchange.confirmCode } - ${pdExchange.confirmTime }</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<form:hidden path="exchangeCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdExchanges.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>