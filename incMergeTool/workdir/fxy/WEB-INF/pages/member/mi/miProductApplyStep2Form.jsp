<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.common.selectProduct"/></title>
    <meta name="heading" content="<fmt:message key="menu.common.selectProduct"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<form method="get" action="miProductApplyStep2.jhtml" class="form-inline">
	<div class="form-group">
		<input type="text" class="form-control" name="productCode" id="productCode" value="${param.productCode }" placeholder="<fmt:message key="busi.product.productno"/>"/>
	</div>
	<div class="form-group">
		<input type="text" class="form-control" name="productName" id="productName" value="${param.productName }" placeholder="<fmt:message key="pmProduct.productName"/>"/>
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-info" name="search"><fmt:message key="operation.button.search"/></button>
		<input type="hidden" id="strAction" name="strAction" value="${param.strAction}"/>
	</div>
</form>

<hr/>

<form name="pmProductFunctionForm" id="pmProductFunctionForm" action="editPmProduct.jhtml" method="post" >
	<%@ include file="/common/messages.jsp" %>
	<input type="hidden" name="selectedProductIds">
	<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
</form>
	
	<font color="red">${minRemark }</font>
<form id="pmProductListTableForm" method="post" action="miProductApplyStep2.jhtml">
	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><fmt:message key="busi.product.productno"/></th>
				<th><fmt:message key="pmProduct.productName"/></th>
				<th><fmt:message key="label.unit.price"/></th>
				<th><fmt:message key="busi.pv"/></th>
				<th><fmt:message key="po.quantity"/></th>
				<th><fmt:message key="member.stock.qty"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pmProducts}" var="pmProductVar">
				<c:set var="_name" value="${pmProductVar.product_id }q"/>
				<tr>
					<td>
						<a name="viewProduct" href="viewProduct.jhtml?productCode=${pmProductVar.product_code }">${pmProductVar.product_code }</a>
					</td>
					<td>
						<a name="viewProduct" href="viewProduct.jhtml?productCode=${pmProductVar.product_code }">${pmProductVar.product_name }</a>
					</td>
					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.first_price }"/></td>
					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.first_pv }"/></td>
					<td align="center">
						<input type="text" name="${pmProductVar.product_id }_quantity" id="${pmProductVar.product_id }_quantity"  value="${newOrderMap.cntMap[_name]}"/>
						<input type="hidden" name="${pmProductVar.product_id }_productNo" id="${pmProductVar.product_id }_productNo" value="${pmProductVar.product_code }"/>
						<input type="hidden" name="${pmProductVar.product_id }_productName" id="${pmProductVar.product_id }_productName" value="${pmProductVar.product_name }"/>
						<input type="hidden" name="${pmProductVar.product_id }_price" id="${pmProductVar.product_id }_price" value="${pmProductVar.first_price }"/>
						<input type="hidden" name="${pmProductVar.product_id }_pv" id="${pmProductVar.product_id }_pv" value="${pmProductVar.first_pv }"/>
						
						<input type="hidden" name="${pmProductVar.product_id }_limitQty" id="${pmProductVar.product_id }_limitQty" value="${pmProductVar.avail_qty }"/>
		
						<input type="hidden" name="_productId" value="${pmProductVar.product_id }"/>
					</td>
					<td align="right">${pmProductVar.avail_qty }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	 <table class="detail" width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
    				<button type="button" class="btn btn-default" name="previous" onclick="window.location='miProductApply.jhtml?strAction=${param.strAction }&newOrderKey=${newOrderKey }'"><fmt:message key="button.previous"/></button>
    				<button type="button" class="btn btn-success" name="next" onclick="bCancel=false;validate();"><fmt:message key="button.next"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    <input type="hidden" name="tprice" id="tprice"/>
	<input type="hidden" name="tpv" id="tpv"/>
	<input type="hidden" id="strAction" name="strAction" value="${param.strAction}"/>
</form>
	
<script type="text/javascript">
$(function() {
	$("a[name='viewProduct']").colorbox({width:"80%", height:"80%"});
});

function validate() {
	var cks = document.getElementsByName("_productId");
	var isFlag = false;
	for(var i=0;i<cks.length;i++){
		var quantity = $id(cks[i].value+"_quantity");
		var limitQty = $id(cks[i].value+"_limitQty");
		if(!isEmpty(quantity.value)){
			if(isNaN(quantity.value)){
				alert("<fmt:message key="register.us.select.number"/>");
				quantity.select();
				return;
			}else if(1 > parseInt(quantity.value)){
				alert("<fmt:message key="po.quantity.zero"/>");
				quantity.select();
				return;
			}else if(parseInt(quantity.value) > parseInt(limitQty.value)){
				alert("<fmt:message key="member.stock.qty.err"/>");
				quantity.select();
				return;
			}
			isFlag = true;
		}
	}

	if(isFlag){
		showLoading();
		document.getElementById("pmProductListTableForm").submit();
	}else{
		alert("<fmt:message key="po.selectProduct"/>");
	}
}

function getScroll(){
	var h = $id("div_tb").offsetHeight ;
	if(h > 300){
		$id("div_tb").style.height = "300px";
	}
}
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}
//控制只能输入数字
function checkNum(){
	if(event.keyCode < 48 || event.keyCode > 57) {
		event.returnValue=false; 
	}
}
function $id(tagId){
	return document.getElementById(tagId);
}

</script>