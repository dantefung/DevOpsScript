<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="poship.view.leble"/></title>
    <meta name="heading" content="<fmt:message key="poship.view.leble"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<form action="miExchangeGoodsStep1.jhtml" method="post">
   <table class="detail">
   	<!-- 订购商品start -->
   	<tr>
   		<td colspan="4" class="title">&nbsp;<fmt:message key="poship.send.goods.lable"/></td>
   	</tr>
   	<tr>
   		<td colspan="4">
   			<table class="table table-bordered table-striped">
   				<thead>
    				<tr>
    					<th><fmt:message key="busi.product.productno"/></th>
    					<th><fmt:message key="pmProduct.productName"/></th>
    					<th><fmt:message key="label.unit.price"/></th>
    					<th><fmt:message key="busi.pv"/></th>
    					<th><fmt:message key="busi.pd.sendqty"/></th>
    				</tr>
   				</thead>
   				<tbody>
    				<c:forEach items="${poShipDetails }" var="pmProductVar">
    					<tr>
	    					<td>${pmProductVar.product_no }</td>
	    					<td>${pmProductVar.product_name }</td>
	    					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_price }"/></td>
	    					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_pv }"/></td>
	    					<td align="right">${pmProductVar.quantity}</td>
	    				</tr>
    				</c:forEach>
   				</tbody>
   			</table>	
   		</td>
   	</tr>
   	<tr>
   		<td colspan="2">
   			<div class="buttonBar">
   				<!-- 来源属性  默认为  新加入会员 -->
   				<input type="hidden" value="${strAction }" name="strAction" />
   				<input type="hidden" value="${poShip.shipId }" name="shipId" />
   				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
   				<input type="hidden" id="newChangeKey" name="newChangeKey" value="${newChangeKey}"/>
   				<button type="button" class="btn btn-default" name="previous" onclick="window.location='miExchangeGoodsList.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
   				<button type="submit" name="save" class="btn btn-success" onclick="bCancel=false"><fmt:message key="button.next"/></button>
            </div>
   		</td>
   	</tr>
</table>
</form>
