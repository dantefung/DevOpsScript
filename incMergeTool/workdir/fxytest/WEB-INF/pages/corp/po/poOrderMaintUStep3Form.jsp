<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.common.selectProduct"/></title>
    <meta name="heading" content="<fmt:message key="menu.common.selectProduct"/>"/>
</head>

<style>
table.detail th{
	text-align: center;
	background-color: #F0F0F0;
	border: 1px solid #fff;
}
table.detail td{
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
	
<form name="pmProductFunctionForm" id="pmProductFunctionForm" action="editPmProduct.jhtml" method="post" >
	<%@ include file="/common/messages.jsp" %>
	<input type="hidden" name="selectedProductIds">
	<input type="hidden" name="strAction">
	<input type="hidden" name="_form_uniq_id" value="${form.token}" />
</form>

<c:if test="${not empty productLimitMessages}">
	<br/>
	<fmt:message key="info.can.select.limit.product"/>
	<c:forEach items="${productLimitMessages}" var="productLimitMessageVar">
		<br/><b>${productLimitMessageVar.productName}（${productLimitMessageVar.productCode}）</b>【<span class="redFont">&nbsp;${productLimitMessageVar.qty}</span>】
	</c:forEach>
	<br/>
	<br/>
</c:if>

<form id="pmProductListTableForm" method="post" action="poOrderMaintUStep3.jhtml">
	<table class="detail">
		<thead>
			<tr>
				<th><fmt:message key="busi.product.productno"/></th>
				<th><fmt:message key="pmProduct.productName"/></th>
				<th><fmt:message key="label.unit.price"/></th>
				<th><fmt:message key="busi.pv"/></th>
				<th><fmt:message key="po.quantity"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pmProducts}" var="pmProductVar">
				<c:set var="_name" value="${pmProductVar.productId }q"/>
				<tr>
					<td>
						${pmProductVar.productCode }
					</td>
					<td>
						${pmProductVar.productName }
					</td>
					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.upgradePrice }"/></td>
					<td align="right"><fmt:formatNumber pattern="###,##0" value="${pmProductVar.upgradePv }"/></td>
					<td align="center">
						<input type="text" name="${pmProductVar.productId }_quantity" id="${pmProductVar.productId }_quantity" onchange="getTotal()" value="${newOrderMap.cntMap[_name]}"/>
						<input type="hidden" name="${pmProductVar.productId }_productNo" id="${pmProductVar.productId }_productNo" value="${pmProductVar.productCode }"/>
						<input type="hidden" name="${pmProductVar.productId }_productName" id="${pmProductVar.productId }_productName" value="${pmProductVar.productName }"/>
		
						<input type="hidden" name="${pmProductVar.productId }_unitPrice" id="${pmProductVar.productId }_unitPrice" value="${pmProductVar.upgradePrice }"/>
						<input type="hidden" name="${pmProductVar.productId }_unitPv" id="${pmProductVar.productId }_unitPv" value="${pmProductVar.upgradePv }"/>
		
						<input type="hidden" name="_productId" value="${pmProductVar.productId }"/>
					</td>
				</tr>
			</c:forEach>
			
			<tr>
	 			<td align="left" style="color: red" colspan="4">
	 				您需要购买 ${pvTipsText } PV的商品才能升级至 <win:code listCode="member.card.type" value="${newOrderMap.newCardType }"/>
	 			</td>
    			<td align="right" ><b><fmt:message key="po.price.total"/>:<span id="_totalPrice" style="color: red"></span></b></td>
    		</tr>
    		<tr>
    			<td colspan="5" align="right" ><b><fmt:message key="busi.order.pv.total"/>:<span id="_totalPv" style="color: red"></span></b></td>
    		</tr>
			<tr>
	    		<td colspan="5">
	    			<div class="buttonBar">
	    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    				<button type="button" class="btn btn-default" name="previous" onclick="window.location='poOrderMaintUStep2.jhtml?strAction=${param.strAction }'"><fmt:message key="button.previous"/></button>
	    				<button type="button" class="btn btn-success" name="next" onclick="bCancel=false;validate();"><fmt:message key="button.next"/></button>
	                </div>
	    		</td>
	    	</tr>
		</tbody>
	</table>

	 <table class="detail" border="0" cellspacing="0" cellpadding="0">
	 		
    </table>
    <input type="hidden" name="tprice" id="tprice"/>
	<input type="hidden" name="tpv" id="tpv"/>
	<input type="hidden" id="strAction" name="strAction" value="${param.strAction}"/>
</form>
	
<script type="text/javascript">
$(function() {
	$("button[name='next']").button({
        icons: {
            primary: "ui-icon-next"
        }
    });
	$("button[name='previous']").button({
        icons: {
            primary: "ui-icon-previous"
        }
    });
	
	getTotal();
	
	//$("a[name='viewProduct']").colorbox({width:"80%", height:"80%"});
});

function validate() {
	var cks = document.getElementsByName("_productId");
	var isFlag = false;
	for(var i=0;i<cks.length;i++){
		var quantity = $id(cks[i].value+"_quantity");
		if(!isEmpty(quantity.value)){
			if(isNaN(quantity.value)){
				alert("<fmt:message key="register.us.select.number"/>");
				quantity.select();
				return;
			}else if(1 > quantity.value){
				alert("<fmt:message key="po.quantity.zero"/>");
				quantity.select();
				return;
			}
			isFlag = true;
		}
	}
	var gradePv = '${gradePv}';
	var mostPv = '${mostPv}';
    var arrayPv = gradePv.split("-");
    if(arrayPv.length == 1){
		if(parseFloat($id("tpv").value) != parseFloat(gradePv) ){
			alert("<fmt:message key="mi.register.1choose.chooseProduct.pvEqual"/>");
			return;
		}else if(!isEmpty(mostPv) && parseFloat($id("tpv").value) > parseFloat(mostPv)){
			alert("<fmt:message key="mi.register.1choose.chooseProduct.pvMax"/>");
			return;
		}
    }else if(arrayPv.length == 2){
    	if(parseFloat($id("tpv").value) < parseFloat(arrayPv[0])){
			alert("<fmt:message key="mi.register.1choose.chooseProduct.pvRange"/>");
			return;
		}else if (arrayPv[1]!="max" && parseFloat($id("tpv").value) >= parseFloat(arrayPv[1])){
			alert("<fmt:message key="mi.register.1choose.chooseProduct.pvRange"/>");
			return;
		}else if(!isEmpty(mostPv) && parseFloat($id("tpv").value) > parseFloat(mostPv)){
			alert("<fmt:message key="mi.register.1choose.chooseProduct.pvMax"/>");
			return;
		}
    }

	if(isFlag){
		if(isEmpty(mostPv)){
			alert("<fmt:message key="po.pv.most.zero"/>");
		}
		showLoading();
		document.getElementById("pmProductListTableForm").submit();
	}else{
		alert("<fmt:message key="mi.register.1choose.chooseProduct.pvRturn"/>");
	}
}
function getTotal(){
	//var cks = document.getElementsByName("ck");
	var cks = document.getElementsByName("_productId");
	var tprice = 0;
	var tpv = 0;
	for(var i=0;i<cks.length;i++){
		//if(cks[i].checked ){
		var quantity = $id(cks[i].value+"_quantity").value;
		if(!isEmpty(quantity)){
			var price = $id(cks[i].value+"_unitPrice").value;
			var pv = $id(cks[i].value+"_unitPv").value;
			
			tprice = tprice + parseFloat(price)*parseFloat(quantity);
			tpv = tpv + parseFloat(pv)*parseFloat(quantity);
		}
	}
	if(tprice > -1 || tpv > -1){
		$id("_totalPrice").innerHTML = tprice;
		$id("_totalPv").innerHTML = tpv;
		$id("tprice").value = tprice;
		$id("tpv").value = tpv;
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