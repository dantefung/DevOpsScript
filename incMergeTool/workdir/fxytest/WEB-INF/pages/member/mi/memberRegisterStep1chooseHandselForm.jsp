<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.register.chooseProduct.title"/></title>
    <meta name="heading" content="<fmt:message key="mi.register.chooseProduct.title"/>"/>
</head>

<c:set var="leftNavVar" scope="request">
	<ul>
		<li>1.<fmt:message key="mi.registmember"/></li>
		<li style="padding-left: 10px;">1.0<fmt:message key="mi.register.enterRecptInfo.title"/></li>
		<li style="padding-left: 10px;"><b>1.2<fmt:message key="mi.register.chooseProduct.title"/></b></li>
		<li>2.<fmt:message key="mi.suremember"/></li>
		<li>3.<fmt:message key="mi.submitmemberorder"/></li>
	</ul>
</c:set>


<div class="contentBody">
	<font style="color: RED;"><fmt:message key="mem.reg.choose1"/>  <fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalMtPrice }"/> <fmt:message key="mem.reg.choose2"/>  <fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalMtPrice/2 }"/> <fmt:message key="mem.reg.choose3"/> </font>
    <form commandName="poOrder" method="post" action="memberRegisterStep1chooseHandsel.jhtml" name="productSearchForm" id="productSearchForm">
    <input type="hidden" name="newMemberKey" 	value="${newMemberKey}"/>
    <input type="hidden" name="newPoShipKey" 	value="${newPoShipKey}"/>
    <input type="hidden" name="newPoOrderKey" 	value="${newPoOrderKey}"/>
    <spring:bind path="miMember.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
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
	
	<!--  -->
	<span style="display: none;" >
	    <span id="selectablePvMin">${selectablePvMin }</span>
	    <c:if test="${selectablePvMax!=null && selectablePvMax!='' }">-</c:if>
	   	<span id="selectablePvMax"><c:if test="${selectablePvMax!=null && selectablePvMax!='' }">${selectablePvMax }</c:if></span>
   	</span>
    
    
	<form method="post" action="memberRegisterStep1chooseHandsel.jhtml" name="memberRegisterForm" id="memberRegisterForm">
    <input type="hidden" name="newMemberKey" 	value="${newMemberKey}"/>
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
			<ec:column property="returnPrice" title="label.unit.price" styleClass="numberColumn"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.firstPrice }"/></ec:column>
			<ec:column property="returnPv" title="PV" styleClass="numberColumn">0.00</ec:column>
			<ec:column property="2" title="po.quantity" styleClass="centerColumn">
				<input type="hidden"   name="productId" value="${pmProductVar.productId }" />
				<input type="hidden" name="productCode"  value="${pmProductVar.productCode }"/>
				<input type="hidden" name="productName"  value="${pmProductVar.productName }"/>
				<input type="hidden" name="productPrice" value="${pmProductVar.firstPrice }" id="price_${pmProductVar.productId }"/>
				<input type="hidden" name="productPv"	 value="${pmProductVar.firstPv }"    id="pv_${pmProductVar.productId }"/>
				<input type="text"   name="handsel_quantity"     id="handsel_quantity_${pmProductVar.productId }" value="${pmProductVar.quantityTran }" onchange="countPriceAndPv();"/>
			</ec:column>
		</ec:row>
	</ec:table>
	
	<table class="detail" width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th style="text-align: left;color: RED;">&nbsp;</th>
	 		<td align="right" ><b><fmt:message key="po.price.total"/>:<span id="countPriceShow" style="color: red;">0</span></b></td>
	    </tr>
	</table>
	<br/>
	<table class="detail" width="100%">
		<%-- <c:if test="${isSessionUserIsMt }">
			<tr>
	    		<th class="required" width="100"><font color="red">*</font><fmt:message key="busi.store.no"/>:</th>
	    		<td><input type="text" name="agentNo" id="agentNo" value="${poOrder.agentNo }"/></td>
	    	</tr>
		</c:if>
		<c:if test="${!isSessionUserIsMt }">
			<tr>
	    		<th width="100"><fmt:message key="busi.store.no"/>:</th>
	    		<td><input type="text" name="agentNo" id="agentNo" value="${poOrder.agentNo }"/></td>
	    	</tr>
		</c:if> --%>
    	
    	<tr>
	    	<td colspan="2">
	    		<div class="buttonBar">
	    			<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    			<button type="button" name="cancel" onclick="window.location='memberRegisterStep1chooseProduct.jhtml?newMemberKey=${newMemberKey}&newPoShipKey=${newPoShipKey}&newPoOrderKey=${newPoOrderKey }'"><fmt:message key="button.previous"/></button>
	    			<button type="button" name="save" onclick="submitForm('${pmProductsSize}');"><fmt:message key="button.next"/></button>
	            </div>
	    	</td>
	    </tr>
    </table>
    </form>
	<!--  -->
    	
</div>

<script type="text/javascript">
$(function() {
	countPriceAndPv();
});

//计算价格和PV(页面加载时和鼠标离开输入框时)
function countPriceAndPv(){
	var productIds = document.getElementsByName("productId");
	var countPrice = 0;
	
	for(var i=0; i<productIds.length; i++){
		if(getObj("handsel_quantity_"+productIds[i].value).value!=null && getObj("handsel_quantity_"+productIds[i].value).value!=''){
			if(isNum(getObj("handsel_quantity_"+productIds[i].value).value)){
				countPrice += parseInt(getObj("handsel_quantity_"+productIds[i].value).value)*parseInt(getObj("price_"+productIds[i].value).value);
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
	var theForm=document.getElementById("memberRegisterForm");
	if(countPriceAndPv()){
		var countPriceStr = getObj("countPriceShow").innerHTML;

		if(parseFloat(countPriceStr)!=${poOrder.totalMtPrice/2}){
			alert("<fmt:message key="mi.register.1choose.chooseProductQuantity"/>!");	//请正确选择商品的订购数量
			return false;
		}
		
		/* <c:if test="${isSessionUserIsMt }">
			if (theForm.agentNo.value == null || theForm.agentNo.value == '') {
				alert("<fmt:message key='mi.recptCode.notNull'/>.");
				theForm.agentNo.focus();
				return false;
			}
		</c:if> */
		
		if(confirm("<fmt:message key="mi.register.1choose.confirmChoose"/>?")){
			showLoading();
			theForm.submit();
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
</script>