<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.common.selectProduct"/></title>
    <meta name="heading" content="<fmt:message key="po.fxProduct.order"/>-<fmt:message key="menu.common.selectProduct"/>" />
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<c:set var="leftNavVar" scope="request">
	<ul>
		<li>1.<fmt:message key="po.input.memberInfo"/></li>
		<li>2.<fmt:message key="po.input.address"/></li>
		<li><b>3.<fmt:message key="menu.common.selectProduct"/></b></li>
		<li>4.<fmt:message key="po.order.info.sure"/></li>
		<li>5.<fmt:message key="po.fxProduct.order.success"/></li>
	</ul>
</c:set>

<div class="searchBar">
	<form method="get" action="poFxProductSelectProduct.jhtml" >
		<table>
			<tr>
				<td><fmt:message key="busi.product.productno"/>:</td>
				<td><input type="text" name="productCode" id="productCode" value="${param.productCode }"/></td>
				<td><fmt:message key="pmProduct.productName"/>:</td>
				<td><input type="text" name="productName" id="productName" value="${param.productName }"/></td>
				<td><button type="submit" name="search"><fmt:message key="operation.button.search"/></td>
			</tr>
		</table>
		<input type="hidden" name="mtMemberKey" 	value="${mtMemberKey}"/>
    	<input type="hidden" name="newPoShipKey" 	value="${newPoShipKey}"/>
    	<input type="hidden" name="newPoOrderKey" 	value="${newPoOrderKey}"/>
		<input type="hidden" id="strAction" name="strAction" value="${strAction}"/>
	</form>
</div>

<div class="contentBody">
	
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
	
	<form method="post" action="poFxProductSelectProduct.jhtml" onsubmit="return validateForm(this)" name=mtOrderForm id="mtOrderForm">
    <input type="hidden" name="mtMemberKey" 	value="${mtMemberKey}"/>
    <input type="hidden" name="newPoShipKey" 	value="${newPoShipKey}"/>
    <input type="hidden" name="newPoOrderKey" 	value="${newPoOrderKey}"/>
	<ec:table 
		items="pmProducts"
		var="pmProductVar"
		showPagination="false"
		action="memberRegisterStep1chooseProduct.jhtml"
		width="100%"
		form="pmProductListTableForm">
		<ec:row>
			<ec:column property="productCode" title="busi.product.productno" >${pmProductVar.productCode }</ec:column>
			<ec:column property="productName" title="pmProduct.productName">${pmProductVar.productName }</ec:column>
			<ec:column property="couponsPrice" title="label.unit.price" styleClass="numberColumn"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.firstPrice }"/></ec:column>
			<ec:column property="2" title="po.quantity" styleClass="centerColumn">
				<input type="hidden" name="productId" 	 value="${pmProductVar.productId }" />
				<input type="hidden" name="productCode"  value="${pmProductVar.productCode }"/>
				<input type="hidden" name="productName"  value="${pmProductVar.productName }"/>
				<input type="hidden" name="productPrice" value="${pmProductVar.firstPrice }" id="price_${pmProductVar.productId }"/>
				<input type="text"   name="quantity"     id="quantity_${pmProductVar.productId }" value="${pmProductVar.quantityTran }" onchange="countPrice();"/>
			</ec:column>
		</ec:row>
	</ec:table>
	</form>
	
	<c:set var="countPriceShowStart" value="0"></c:set>
    <c:forEach items="${pmProducts }" var="pmProductVarPri">
    	<c:if test="${pmProductVarPri.productCode=='F000700CN0' }">
    		<c:set var="countPriceShowStart" value="${pmProductVarPri.firstPrice }"></c:set>
    	</c:if>
    </c:forEach>
	<table class="detail" width="100%" border="0" cellspacing="0" cellpadding="0">
		<c:if test="${isSessionUserIsMt }">
			<tr>
	    		<td align="center"><br/><font color="red">*</font><fmt:message key="busi.store.no"/>:<input type="text" name="agentNo" id="agentNo" onchange="getName(this.value)" value="${poOrder.agentNo }"/><span style="color: green" id="showNameDiv"></span></td>
	    	</tr>
		</c:if>
		<tr> 
	 		<td align="right" ><b><fmt:message key="po.price.total"/>:<span id="countPriceShow" style="color: red;">0</span></b></td>
	    </tr>
		<tr>
	    	<td colspan="2">
	    		<div class="buttonBar">
	    			<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    			<button type="button" name="cancel" onclick="window.location='poFxProductAcceptAddress.jhtml?mtMemberKey=${mtMemberKey}&newPoShipKey=${newPoShipKey}'"><fmt:message key="button.previous"/></button>
	    			<button type="button" name="save" onclick="submitForm('${pmProductsSize}');"><fmt:message key="button.next"/></button>
	            </div>
	    	</td>
	    </tr>
	</table>
</div>
	
<script type="text/javascript">
$(function() {
	countPrice();
});

//计算价格和PV(页面加载时和鼠标离开输入框时)
function countPrice(){
	var productIds = document.getElementsByName("productId");
	var countPrice = 0;
	
	for(var i=0; i<productIds.length; i++){
		if(getObj("quantity_"+productIds[i].value).value!=null && getObj("quantity_"+productIds[i].value).value!=''){
			if(isNum(getObj("quantity_"+productIds[i].value).value)){
				countPrice += parseInt(getObj("quantity_"+productIds[i].value).value)*parseInt(getObj("price_"+productIds[i].value).value);
			}else{
				document.getElementById("countPriceShow").innerHTML = "0";
				return false;
			}
		}
	}
	document.getElementById("countPriceShow").innerHTML = countPrice;
	return true;
}

function submitForm(len){
	var productIds = document.getElementsByName("productId");
	if(countPrice()){
		var cps = document.getElementById("countPriceShow").innerHTML;
		if(cps=="0"){
			alert("请选择您要订购的辅销品商品!");
			return false;	
		}
		if(confirm("<fmt:message key="mi.register.1choose.confirmChoose"/>?")){
			showLoading();
			document.getElementById("mtOrderForm").submit();
		}
	}else{
		alert("<fmt:message key="mi.register.1choose.chooseProductQuantity"/>!");	//请正确选择商品的订购数量
		return false;
	}
}

function getObj(id){
	return document.getElementById(id);
}
function isNum(num){
  var reNum=/^\d*$/;	//数字的正则表达式
  return(reNum.test(num));
}

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	
	if (theForm.shipLastName.value == null || theForm.shipLastName.value == '') {
		alert("<fmt:message key="pdSendInfo.recipientName.notNull"/>.");
		theForm.shipLastName.focus();
		return false;
	}

	if(confirm("<fmt:message key="mi.register.enter.confirm.msg"/>!."
				+"\n<fmt:message key="mi.register.shipType"/>:"+"***todo"
				+"\n<fmt:message key="pdSendInfo.recipientName"/>:"+theForm.shipLastName.value
				+"\n<fmt:message key="mi.register.mobil"/>:"+theForm.shipMobile.value)){
		//其它验证
		showLoading();
		return true;
	}else{
		return false;
	}
}
function getName(memberNo){
	if(memberNo==null || memberNo==''){
		document.getElementById("showNameDiv").innerHTML="";
		return;
	}
	MiMemberAjax.getMiMemberInfo(memberNo, function(data) {
		if (data != null) {
			document.getElementById("showNameDiv").innerHTML = data.lastName;
		} else {
			document.getElementById("showNameDiv").innerHTML = "<fmt:message key="busi.agent"/><fmt:message key="miMember.notFound"/>";
		}
		
	});
}
</script>