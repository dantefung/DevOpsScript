<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.exchange.list"/></title>
    <meta name="heading" content="<fmt:message key="mi.exchange.list"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

   <table class="detail">
   	
   	<tr>
   		<td colspan="4" class="title"><fmt:message key="common.information"/></td>
   	</tr>

   <tr>
   		<th><fmt:message key="busi.pdExchangeOrder.no"/>:</th>
   		<td>
   			${pdExchange.exchangeCode }
   		</td>
   		<th><fmt:message key="发货方式"/>:</th>
   		<td>
   			<win:code listCode="poship.shiptype" value="${poShip.shipType }"/>
   		</td>
   	</tr>
   	 <tr>
   		<th><fmt:message key="mi.needmoney"/>:</th>
   		<td >
   			<fmt:formatNumber pattern="###,##0.00" value="${pdExchange.exchangeTotalAmount }"/>
   		</td>
   		<th><fmt:message key="poOrder.payStatus"/>:</th>
   		<td>
   			<win:code listCode="order_payment_status" value="${pdExchange.payStatus }"/>&nbsp;&nbsp;${pdExchange.exchangePayTime }
   		</td>
   	</tr>
   	<tr>
   		
   		<th><fmt:message key="发货单号"/>:</th>
   		<td>
   			${poShip.siNo }
   		</td>
   		<th><fmt:message key="收货人编号"/>:</th>
   		<td>
   			${poShip.recptCode }
   		</td>
   	</tr>
   	<c:if test="${poShip.shipType==1 }">
    	<tr>
    		<th valign="top"><fmt:message key="收货信息"/>:</th>
    		<td colspan="3">
    			${poShip.shipLastName }<br/>
    			${fullRegionName}${poShip.shipAddress1 }<br/>
    			邮编：${poShip.shipZipCode }<br/>
    			手机：${poShip.shipMobile }<br/>
    			电话：${poShip.shipPhone }
    		</td>
    	</tr>
   	</c:if>
   	<tr>
   		<th><fmt:message key="备注"/>:</th>
   		<td colspan="3">
   			${fn:replace(poShip.remark, vEnter, '<br>')}
   		</td>
   	</tr>
   	<!-- 订购商品start -->
   	<tr>
   		<td colspan="4" class="title">&nbsp;<fmt:message key="mi.exchange.goods"/></td>
   	</tr>
   	<tr>
   		<td colspan="4">
   			<table class="table table-bordered table-striped">
   				<thead>
    				<tr>
    					<th><fmt:message key="busi.product.productno"/></th>
    					<th><fmt:message key="pmProduct.productName"/></th>
    					<th><fmt:message key="label.unit.price"/></th>
    					<th><fmt:message key="pmProductForm.product-PV"/></th>
    					<th><fmt:message key="busi.pd.sendqty"/></th>
    				</tr>
   				</thead>
   				<tbody>
    				<c:forEach items="${exchangeDetails }" var="pmProductVar">
    					<tr>
	    					<td>${pmProductVar.product_code }</td>
	    					<td>${pmProductVar.product_name }</td>
	    					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_price }"/></td>
	    					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_pv }"/></td>
	    					<td align="right">${pmProductVar.qty}</td>
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
   				<button type="button" class="btn btn-default" name="previous" onclick="window.location='miExchangeList.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
            </div>
   		</td>
   	</tr>
</table>

<script type="text/javascript">

$(document).ready(function(){
	$("#btnView").colorbox({iframe:true, width:"500px", height:"400px"});
	$("a[name='view']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        }
    });

});
</script>