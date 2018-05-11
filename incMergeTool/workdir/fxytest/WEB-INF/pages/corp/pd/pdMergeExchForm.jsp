<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="合并换货管理"/></title>
    <meta name="heading" content="<fmt:message key="合并换货管理"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/PdAjax.js"></script>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>

<style>
table.detail table.listTable{
}
table.detail table.listTable th{
	text-align: center;
	font-weight: bold;
	width: auto;
}
</style>

<div class="contentBody">
    <form:form commandName="pdMergeExch" method="post" action="editPdMergeExch.jhtml" onsubmit="return validateForm(this)" id="pdMergeExchForm">
    
    <spring:bind path="pdMergeExch.*">
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
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="4" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
		<c:if test="${empty pdMergeExch.exchangeCode }">
	    	<tr>
	    		<th class="required">收货人编号:</th>
	    		<td colspan="3"><form:input path="userCode" id="userCode"/></td>
	    	</tr>
	    	<tr>
	    		<th class="required">仓库:</th>
	    		<td colspan="3">
	    			<form:select path="warehouseCode">
	    				<c:forEach items="${stWarehouses }" var="stWarehouseVar">
	    					<form:option value="${stWarehouseVar.warehouseCode }">${stWarehouseVar.warehouseCode } - ${stWarehouseVar.warehouseName }</form:option>
	    				</c:forEach>
	    			</form:select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>备注:</th>
	    		<td colspan="3"><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
	    	</tr>
    	</c:if>
    	<c:if test="${not empty pdMergeExch.exchangeCode }">
    		<tr>
	    		<th>换货单号:</th>
	    		<td>${pdMergeExch.exchangeCode }</td>
	    		<th>收货人编号</th>
	    		<td>${pdMergeExch.userCode }</td>
	    	</tr>
    		<tr>
	    		<th>分公司:</th>
	    		<td>${stWarehouse.companyCode }</td>
	    		<th>发货仓:</th>
	    		<td>
	    			<form:hidden path="warehouseCode"/>
	    			${stWarehouse.warehouseCode } - ${stWarehouse.warehouseName }
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="4" class="title">收发货信息</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="mi.register.shipType"/>:</th>
	    		<td>
	    			<form:select path="shipType" onchange="changeShipType(this.value)">
	    				<c:forEach items="${shipTypes}" var="shipTypeVar">
	    					<form:option value="${shipTypeVar.key }"><fmt:message key="${shipTypeVar.value}"/></form:option>
	    				</c:forEach>
	    			</form:select>
	    		</td>
	    		<th class="required"><fmt:message key="pdSendInfo.recipientName"/>:</th>
	    		<td><form:input path="shipLastName" id="shipLastName"/></td>
	    	</tr>
	    	
	    	<tr class="shipType1TR" style="display:${shipType1Display};">
	    		<th class="required"><fmt:message key="miMember.delivery.moblie"/>:</th>
	    		<td><form:input path="shipMobile" id="shipMobile" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
	    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
	    		<td><form:input path="shipPhone" id="shipPhone" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
	    	</tr>
	    	
	    	<tr class="shipType1TR" style="display:${shipType1Display};">
	    		<th class="required"><fmt:message key="miMember.delivery.area"/>:</th>
	    		<td colspan="3">
	    			<div id="regionDiv"></div>
	    		</td>
	    	</tr>
	    	<tr class="shipType1TR" style="display:${shipType1Display};">
	    		<th class="required"><fmt:message key="mi.addrees.detail"/>:</th>
	    		<td>
	    			<form:input path="shipAddress1" id="shipAddress1" style="width:300px;"/>
	    			<%-- <br/><form:input path="address2" id="address2" style="width:200px;"/>--%>
	    		</td>
	    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
	    		<td><form:input path="shipZipCode" id="shipZipCode" maxlength="6"/></td>
	    	</tr>
    		<tr>
	    		<td colspan="4" class="title">原发货单</td>
	    	</tr>
	    	
	    	<tr>
	    		<td colspan="4">
	    			<table class="listTable" width="100%">
	    				<thead>
		    				<tr>
		    					<th width="24">操作</th>
		    					<th>发货单号</th>
		    					<th>所属会员</th>
		    					<th>订单编号</th>
		    					<th>商品总金额</th>		    					
		    				</tr>
	    				</thead>
	    				<tbody id="oldShipListBody">
	    					<c:forEach items="${pdMergeExchShips }" var="pdMergeExchShipVar">
	    						<tr id="tr_${pdMergeExchShipVar.id}">
	    							<td align="center"><a name="delete" href="javascript:removePoShipFromPdMergeExch('${pdMergeExchShipVar.exchange_code }','${pdMergeExchShipVar.id }')">删除</a></td>
	    							<td>${pdMergeExchShipVar.si_no }</td>
	    							<td>${pdMergeExchShipVar.user_code }</td>
	    							<td>${pdMergeExchShipVar.order_no }</td>
	    							<td align="right">${pdMergeExchShipVar.total_price }</td>
	    						</tr>
	    					</c:forEach>
	    				</tbody>
	    				<tfoot>
	    					<tr>
	    						<td colspan="4" align="right"><b>合计：</b></td>
	    						<td align="right"><span id="spnOldTotalPrice">${pdMergeExch.oldTotalPrice }</span></td>
	    					</tr>
	    				</tfoot>
	    			</table>
	    			需要合并的发货单号：<input type="text" name="oldSiNo" id="oldSiNo"/> <button name="add" type="button" onclick="addPoShipToPdMergeExch('${pdMergeExch.exchangeCode}')">增加发货单</button>
	    		</td>
	    	</tr>
	    	
	    	<tr>
	    		<td colspan="4" class="title">新商品信息</td>
	    	</tr>
	    	<tr>
	    		<td colspan="4">
	    			<ec:table 
						items="pmProducts"
						var="pmProductVar" form="pdMergeExchForm" autoIncludeParameters="false"
						showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
						<ec:row highlightRow="false">
							<ec:column property="product_code" title="busi.product.productno" />
							<ec:column property="product_name" title="pmProduct.productName"/>
							<ec:column property="first_price" title="label.unit.price" styleClass="numberColumn">
								<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.first_price }"/>
							</ec:column>
							<ec:column property="stock_qty" title="当前库存" styleClass="numberColumn"/>
							<ec:column property="qty" title="数量" styleClass="numberColumn">
								<input type="hidden" name="unitPrice" value="${pmProductVar.first_price}"/> 
								<input type="hidden" name="productId" value="${pmProductVar.product_id}"/> 
								<input type="text" name="qty" value="${pmProductVar.qty }" size="8" onchange="getTotal()"/>
							</ec:column>
						</ec:row>
					</ec:table>
					<table width="100%">
						<tr>
							<td align="right">
								<fmt:message key="poOrder.amtCount"/>：<strong><span id="newTotalPrice"></span></strong>
							</td>
						</tr>
					</table>
	    		</td>
	    	</tr>
	    	
	    	<tr>
	    		<td colspan="4" class="title">其它</td>
	    	</tr>
	    	<tr>
	    		<th>备注:</th>
	    		<td colspan="3"><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
	    	</tr>
    	</c:if>
    	
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<form:hidden path="exchangeCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${empty pdMergeExch.checkStatus || pdMergeExch.checkStatus==0}">
	    				<win:power powerCode="${param.strAction }">
	    					<c:if test="${empty pdMergeExch.exchangeCode }">
	    						<button type="submit" name="save" onclick="bCancel=false">下一步</button>
	    					</c:if>
	    					<c:if test="${not empty pdMergeExch.exchangeCode }">
	    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
	    					</c:if>
	    				</win:power>
    				</c:if>
    				<c:if test="${not empty pdMergeExch.exchangeCode && pdMergeExch.checkStatus==0}">
    					<win:power powerCode="deletePdMergeExch">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PdMergeExch')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pdMergeExchs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#regionDiv').regionSelector({
		'regionCode':'${pdMergeExch.shipAreaCode}'
	});
});

$(function() {
	// 搜索栏
	$("button[name='add']").button({
        icons: {
            primary: "ui-icon-add"
        }
    });
	$("a[name='delete']").button({
		icons: {
            primary: "ui-icon-trash"
        },
        text: false
    });
});
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	<c:if test="${not empty pdMergeExch.exchangeCode }">
	if (theForm.shipType.value == null || theForm.shipType.value == '') {
		alert("<fmt:message key='info.select.shipment.type'/>.");
		theForm.shipType.focus();
		return false;
	}
	
	if (theForm.shipLastName.value == null || theForm.shipLastName.value == '') {
		alert("<fmt:message key='po.ship.lastName.null.require'/>.");
		theForm.shipLastName.focus();
		return false;
	}
	if (theForm.shipMobile.value == null || theForm.shipMobile.value == '') {
		alert("<fmt:message key='mi.telephone.null.requie'/>.");
		theForm.shipMobile.focus();
		return false;
	}
	
	if (theForm.district.value == null || theForm.district.value == '' || theForm.district.value == '-1') {
		alert("<fmt:message key='mi.area.null.requie'/>.");
		//alert("所在地区-区/县不能为空");
		theForm.district.focus();
		return false;
	}
	
	var shipAddress1 = theForm.shipAddress1.value; 
	if (shipAddress1 == null || shipAddress1 == '') {
		alert("<fmt:message key='mi.addrees.nul.requie'/>.");
		theForm.shipAddress1.focus();
		return false;
	}
	var quantitys=document.getElementsByName("qty");
	if(quantitys!=undefined){
		for(var i=0;i<quantitys.length;i++){
			if(quantitys[i].value!="" && !isUnsignedInteger(quantitys[i].value)){
				alert("请输入正确的需要换货的商品数量");
				quantitys[i].focus();
				return false;
			}
		}
	}
	</c:if>
	showLoading();
	return true;
}

function addPoShipToPdMergeExch(exchangeCode) {
	var oldSiNo = $("#oldSiNo").val();
	PdAjax.addPoShipToPdMergeExch(exchangeCode,oldSiNo,function(data) {
		if(data.id==0){
			alert(data.msg);
		}else{
			var totalPrice=$("#spnOldTotalPrice").html();
			if(totalPrice=="") totalPrice=0;
			totalPrice=parseFloat(totalPrice)+parseFloat(data.totalPrice);
			$("#spnOldTotalPrice").html(totalPrice);
			var appendHtml="<tr>";
			appendHtml+="<td><a name=\"delete\" href=\"javascript:removePoShipFromPdMergeExch('"+exchangeCode+"','"+data.id+"')\">删除</a></td>";
			appendHtml+="<td>"+data.siNo+"</td>";
			appendHtml+="<td>"+data.userCode+"</td>";
			appendHtml+="<td>"+data.orderNo+"</td>";
			appendHtml+="<td align=\"right\">"+data.totalPrice+"</td>";
			appendHtml+="</tr>";
			$("#oldShipListBody").append(appendHtml);
			
			$("a[name='delete']").button({
				icons: {
		            primary: "ui-icon-trash"
		        },
		        text: false
		    });
		}
	});
}

function removePoShipFromPdMergeExch(exchangeCode,id) {
	PdAjax.removePoShipFromPdMergeExch(exchangeCode,id,function(data) {
		if(data.id==0){
			alert(data.msg);
		}else{
			var totalPrice=$("#spnOldTotalPrice").html();
			if(totalPrice=="") totalPrice=0;
			totalPrice=totalPrice-parseFloat(data.totalPrice);
			$("#spnOldTotalPrice").html(totalPrice);
			$("#tr_"+id).remove();
		}
	});
}

function getTotal(){
	var unitPrices=document.getElementsByName("unitPrice");
	var qtys=document.getElementsByName("qty");
	var totalPrice=0;
	for(var i=0;i<unitPrices.length;i++){
		if(qtys[i].value!="" && isUnsignedInteger(qtys[i].value)){
			totalPrice+=unitPrices[i].value*qtys[i].value;
		}
	}
	$("#newTotalPrice").text(totalPrice);
}
</script>