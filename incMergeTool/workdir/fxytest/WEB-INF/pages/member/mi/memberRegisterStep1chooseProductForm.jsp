<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="menu.common.selectProduct"/></title>
    <meta name="heading" content="<fmt:message key="menu.common.selectProduct"/>"/>
    <link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/ectable-member.css" />
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/SysIdAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>


<div class="contentBody">
    <form commandName="poOrder" method="post" action="memberRegisterStep1chooseProduct.jhtml" onsubmit="return validateForm(this)" name="productSearchForm" id="productSearchForm">
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
    
	<!--  -->
	<div class="alert alert-info alert-dismissible fade in notice">
		<ul>
	        <li><fmt:message key="lang.selected.lv"/>：<win:code listCode="member.card.type" value="${miMember.cardType }"/></li>
	        <li><fmt:message key="lang.required.pv"/>：<%-- 所需金额：--%>
	        	<span id="selectablePvMin">${selectablePvMin }</span>
			   <c:if test="${selectablePvMax!=null && selectablePvMax!=selectablePvMin }">
			    	&nbsp;-&nbsp;
			    	<span id="selectablePvMax">${selectablePvMax }</span>
			    </c:if> 
	        </li>
	        <c:if test="${not empty productLimitMessages}">
				<li>
					<fmt:message key="info.can.select.limit.product"/>
					<c:forEach items="${productLimitMessages}" var="productLimitMessageVar">
						<br/><b>${productLimitMessageVar.productName}（${productLimitMessageVar.productCode}）</b>【<span class="redFont">${productLimitMessageVar.qty}</span>】
					</c:forEach>
				</li>
			</c:if>
	    </ul>
    </div>
    
    
    
	<form method="post" action="memberRegisterStep1chooseProduct.jhtml" onsubmit="return validateForm(this)" name="memberRegisterForm" id="memberRegisterForm">
    <input type="hidden" name="newMemberKey" 	value="${newMemberKey}"/>
    
    <table class="table table-bordered table-striped">
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
				<tr>
					<td>
						<a name="viewProduct" href="viewProduct.jhtml?productCode=${pmProductVar.productCode }">${pmProductVar.productCode }</a>
					</td>
					<td>
						<a name="viewProduct" href="viewProduct.jhtml?productCode=${pmProductVar.productCode }">${pmProductVar.productName }</a>
					</td>
					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.firstPrice }"/></td>
					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.firstPv }"/></td>
					<td align="center">
						<input type="hidden"   name="productId" value="${pmProductVar.productId }" />
						<input type="hidden" name="productCode"  value="${pmProductVar.productCode }"/>
						<input type="hidden" name="productName"  value="${pmProductVar.productName }"/>
						<input type="hidden" name="productPrice" value="${pmProductVar.firstPrice }" id="price_${pmProductVar.productId }"/>
						<input type="hidden" name="productPv"	 value="${pmProductVar.firstPv }"    id="pv_${pmProductVar.productId }"/>
						<input type="text"   name="quantity"     id="quantity_${pmProductVar.productId }" 
		    			<c:if test="${pmProductVar.productCode== bindProduct }"> value="1" readonly="readonly" style="background-color: #ddd;" </c:if>
		    			<c:if test="${pmProductVar.productCode!= bindProduct }"> value="<fmt:formatNumber pattern="###0" value="${pmProductVar.quantityTran }"/>" </c:if> onchange="countPriceAndPv();"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<c:set var="countPriceShowStart" value="0"></c:set>
    <c:forEach items="${pmProducts }" var="pmProductVarPri">
    	<c:if test="${pmProductVarPri.productCode== bindProduct }">
    		<c:set var="countPriceShowStart" value="${pmProductVarPri.firstPrice }"></c:set>
    	</c:if>
    </c:forEach>
	<table class="detail" width="100%" border="0" cellspacing="0" cellpadding="0">

		<tr>
	 		<td align="right" colspan="2"><b><fmt:message key="po.price.total"/>:<span id="countPriceShow" style="color: red;">0</span></b></td>
	    </tr>
	    <tr>
	    	<td colspan="2" align="right" ><b><fmt:message key="busi.order.pv.total"/>:<span id="countPvShow" style="color: red;">0</span></b></td>
	    </tr>
		<tr>
	    	<td colspan="2">
	    		<div class="buttonBar">
	    			<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    			<button type="button" name="cancel" class="btn btn-danger" onclick="window.location='memberRegisterStep1enterRecptInfo.jhtml?newMemberKey=${newMemberKey}'"><fmt:message key="button.previous"/></button>
	    			<button type="button" name="save" class="btn btn-success" onclick="submitForm('${pmProductsSize}');"><fmt:message key="button.next"/></button>
	            </div>
	    	</td>
	    </tr>
	</table>
	<!--  -->
 </form>	   	
</div>

<script type="text/javascript">
$(function() {
	countPriceAndPv();
	
	$("a[name='viewProduct']").colorbox({width:"80%", height:"80%"});
});

//计算价格和PV(页面加载时和鼠标离开输入框时)
function countPriceAndPv(){
	var productIds = document.getElementsByName("productId");
	var countPrice = 0;
	var countPv = 0;
	
	for(var i=0; i<productIds.length; i++){
		if(getObj("quantity_"+productIds[i].value).value!=null && getObj("quantity_"+productIds[i].value).value!=''){
			if(isNum(getObj("quantity_"+productIds[i].value).value)){
				countPrice += parseInt(getObj("quantity_"+productIds[i].value).value)*parseInt(getObj("price_"+productIds[i].value).value);
				countPv += parseInt(getObj("quantity_"+productIds[i].value).value)*parseInt(getObj("pv_"+productIds[i].value).value);
			}else{
				document.getElementById("countPriceShow").innerHTML = "0";
				document.getElementById("countPvShow").innerHTML = "0";
				return false;
			}
		}
	}
	document.getElementById("countPriceShow").innerHTML = countPrice;
	document.getElementById("countPvShow").innerHTML = countPv;
	return true;
}

function submitForm(len){
	var productIds = document.getElementsByName("productId");
	if(countPriceAndPv()){
		var pvMinStr = getObj("selectablePvMin").innerHTML;
		var pvMaxStr = 0;
		if(getObj("selectablePvMax")) pvMaxStr = getObj("selectablePvMax").innerHTML;
		//var countPvStr = getObj("countPvShow").innerHTML;
		//把pv限制改为金额限制
		var countPvStr = getObj("countPvShow").innerHTML;
		if(pvMaxStr==null || pvMaxStr==''){
			if(parseFloat(pvMinStr)!=parseFloat(countPvStr)){
				alert("<fmt:message key="mi.register.1choose.chooseProduct.pvEqual"/>");
				return false;
			}
		}else{
			if(parseFloat(countPvStr)<parseFloat(pvMinStr) || parseFloat(countPvStr)>=parseFloat(pvMaxStr)){
				alert("<fmt:message key="mi.register.1choose.chooseProduct.pvRange"/>");
				return false;
			}
		}
		if(parseFloat(countPvStr)>parseFloat(${sysMaxPvStr})){
			alert("<fmt:message key="mi.register.1choose.chooseProduct.pvMax"/>");
			return false;
		}

		showLoading();
		document.getElementById("memberRegisterForm").submit();
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