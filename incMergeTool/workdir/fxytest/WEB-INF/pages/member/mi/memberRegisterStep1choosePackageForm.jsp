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

<form method="get" action="memberRegisterStep1choosePackage.jhtml" class="form-inline">
	<div class="form-group">
		<input type="text" class="form-control" name="productCode" id="productCode" value="${param.productCode }" placeholder="<fmt:message key="busi.product.productno"/>"/>
	</div>
	<div class="form-group">
		<input type="text" class="form-control" name="productName" id="productName" value="${param.productName }" placeholder="<fmt:message key="pmProduct.productName"/>"/>
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-info" name="search"><fmt:message key="operation.button.search"/></button>
		<input type="hidden" id="newMemberKey" name="newMemberKey" value="${newMemberKey}"/>
	</div>
</form>

<hr/>

<form name="pmProductFunctionForm" id="pmProductFunctionForm" action="editPmProduct.jhtml" method="post" >
	<%@ include file="/common/messages.jsp" %>
	<input type="hidden" name="selectedProductIds">
	<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
</form>
	

	
<form id="pmProductListTableForm" method="post" action="memberRegisterStep1choosePackage.jhtml">
<c:forEach begin="0" end="${listCnt-1 }" var="i">
	 <c:set  var="pmProducts" value="pmProducts${i }"/> 
	 <c:set  var="productPackageMsg" value="productPackageMsg${i }"/> 
	 <c:set var="productLimitMessages" value="productLimitMessages${i}" /> 
	 <c:if test="${not empty  requestScope[productLimitMessages]}">
		<br/>
		<fmt:message key="info.can.select.limit.product"/>
		<c:forEach items="${requestScope[productLimitMessages]}" var="productLimitMessageVar">
			<br/><b>${productLimitMessageVar.productName}（${productLimitMessageVar.productCode}）</b>【<span class="redFont">&nbsp;${productLimitMessageVar.qty}</span>】
		</c:forEach>
		<br/>
		<br/>
	</c:if> 
	<font color="red"><b>${requestScope[productPackageMsg] }</b></font>
	 <table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><fmt:message key="busi.product.productno"/></th>
				<th><fmt:message key="pmProduct.productName"/></th>
				<%-- <th><fmt:message key="label.unit.price"/></th>
				<th><fmt:message key="busi.pv"/></th>  --%>
				<th><fmt:message key="po.quantity"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope[pmProducts]}" var="pmProductVar">
				<c:set var="_name" value="${pmProductVar.product_code }qq"/>
				<c:set var="cntMap2" value="cntMap2${i }"/>
				<c:set var="productCnt" value="productCnt${i }"/>
				<c:if test="${newOrderMap[cntMap2][_name]>0 || pmProductVar.ec_quantity*requestScope[productCnt]>0 }">
				<tr>
					<td>
						<a name="viewProduct" href="viewProduct.jhtml?productCode=${pmProductVar.product_code }">${pmProductVar.product_code }</a>
					</td>
					<td>
						<a name="viewProduct" href="viewProduct.jhtml?productCode=${pmProductVar.ec_product_no }">${pmProductVar.product_name }</a>
					</td>
					<%-- <td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.first_price }"/></td>
					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.first_pv }"/></td>  --%>
					<td align="center">
						<c:choose>
							<c:when test="${not empty newOrderMap[cntMap2][_name] }">
								${newOrderMap[cntMap2][_name]}
								<input type="hidden" name="${pmProductVar.product_code }_quantity${i}" id="${pmProductVar.product_code }_quantity${i}" onchange="getTotal('${i}')" value="${newOrderMap[cntMap2][_name]}"/>
							</c:when>
							<c:otherwise>
								${pmProductVar.ec_quantity*requestScope[productCnt]}
								<input type="hidden" name="${pmProductVar.product_code }_quantity${i}" id="${pmProductVar.product_code }_quantity${i}" onchange="getTotal('${i}')" value="${pmProductVar.ec_quantity*requestScope[productCnt]}"/>
							</c:otherwise>
						</c:choose>
						
						<input type="hidden" name="${pmProductVar.product_code }_productNo${i}" id="${pmProductVar.product_code }_productNo${i}" value="${pmProductVar.product_code }"/>
						<input type="hidden" name="${pmProductVar.product_code }_productName${i}" id="${pmProductVar.product_code }_productName${i}" value="${pmProductVar.product_name }"/>
		
						<input type="hidden" name="${pmProductVar.product_code }_unitPrice${i}" id="${pmProductVar.product_code }_unitPrice${i}" value="${pmProductVar.first_price }"/>
						<input type="hidden" name="${pmProductVar.product_code }_unitPv${i}" id="${pmProductVar.product_code }_unitPv${i}" value="${pmProductVar.first_pv }"/> 
		
						<input type="hidden" name="_productId${i }" value="${pmProductVar.product_code }"/>
					</td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>

	 <table class="detail" width="100%" border="0" cellspacing="0" cellpadding="0">
	 	<tr style="display: none;">
	 		<td align="left" style="color: red">${gradeRemark }</td>
    		<td align="right" ><b><fmt:message key="po.price.total"/>: <span id="_totalPrice${i }" style="color: red"></span></b></td>
    	</tr>
    	<tr style="display: none;">
    		<td colspan="2" align="right" ><b><fmt:message key="busi.order.pv.total"/>: <span id="_totalPv${i }" style="color: red"></span></b></td>
    	</tr>
    </table>
    <input type="hidden" name="tprice${i }" id="tprice${i }"/>
	<input type="hidden" name="tpv${i }" id="tpv${i }"/>
	<input type="hidden" id="strAction" name="strAction" value="${param.strAction}"/>
 </c:forEach>
<table class="detail" width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
   		<td colspan="2">
   			<div class="buttonBar">
   				<input type="hidden" id="newMemberKey" name="newMemberKey" value="${newMemberKey}"/>
   				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
   				<button type="button" class="btn btn-default" name="previous" onclick="window.location='memberRegisterStep1chooseProduct.jhtml?newMemberKey=${newMemberKey }'"><fmt:message key="button.previous"/></button>
   				<button type="button" class="btn btn-success" name="next" onclick="bCancel=false;validate();"><fmt:message key="button.next"/></button>
               </div>
   		</td>
   	</tr>
   </table>
</form>
	
<script type="text/javascript">
$(function() {
	$("a[name='viewProduct']").colorbox({width:"80%", height:"80%"});
	for(var cnt=0;cnt<'${listCnt}';cnt++){
		getTotal(cnt);
	}
});

function validate() {
	var _isFlag = true;
	for(var cnt=0;cnt<'${listCnt}';cnt++){
		var isFlag = false;
		var cks = document.getElementsByName("_productId"+cnt);
		for(var i=0;i<cks.length;i++){
			var quantity = $id(cks[i].value+"_quantity"+cnt);
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
		if(!isFlag){
			alert("<fmt:message key="products.money.prompt"/>");
			_isFlag = false;
			break;
		}
	}
	if(_isFlag){
		showLoading();
		document.getElementById("pmProductListTableForm").submit();
	}/* else{
		alert("<fmt:message key="po.selectProduct"/>");
	} */
}
function getTotal(index){
	//var cks = document.getElementsByName("ck");
	var cks = document.getElementsByName("_productId"+index);
	var tprice = 0;
	var tpv = 0;
	for(var i=0;i<cks.length;i++){
		//if(cks[i].checked ){
		var quantity = $id(cks[i].value+"_quantity"+index).value;
		if(!isEmpty(quantity)){
			var price = $id(cks[i].value+"_unitPrice"+index).value;
			var pv = $id(cks[i].value+"_unitPv"+index).value;

			tprice = tprice + parseFloat(price)*parseFloat(quantity);
			tpv = tpv + parseFloat(pv)*parseFloat(quantity);
		}
	}
	if(tprice > -1 || tpv > -1){
		$id("_totalPrice"+index).innerHTML = tprice;
		$id("_totalPv"+index).innerHTML = tpv;
		$id("tprice"+index).value = tprice;
		$id("tpv"+index).value = tpv;
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