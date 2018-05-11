<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmProductForm.addOrDelete.product.title"/></title>
    <meta name="heading" content="<fmt:message key='pmProductForm.addOrDelete.product.title'/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="pmProduct" method="post" action="editPmProduct.jhtml" onsubmit="return validateForm(this)" id="pmProductForm">
    
    <spring:bind path="pmProduct.*">
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
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
			<th class="required"><fmt:message key="sys.common.companyCode"/>:</th>
			<td >${pmProduct.companyCode }</td>
		</tr>
    	<tr>
    		<th class="required"><fmt:message key="busi.product.productno"/>:</th>
    		<td>${pmProduct.productCode }</td>
    	</tr>
    	
    	<!-- 增加一个编辑商品名称的权限-->
    	<win:power powerCode="editPmProductName">
    	 <tr>
    	    <th class="required"><fmt:message key="pmProduct.productName"/>:</th>
    		<td><form:input path="productName" id="productName" style="width:300px;"/></td>
    	 </tr>
    	</win:power>
    	
    	<!-- 增加一个编辑商品销售状态的权限-->
    	<win:power powerCode="editPmProductSalesState">
	     	<tr>
	    		<th class="required"><fmt:message key="pmProductList.salesState"/>:</th>
	    		<td><win:list listCode="pmproduct.status" id="status" name="status" value="${pmProduct.status }" defaultValue="请选择" showBlankLine="true"/></td>
	    	</tr>
    	</win:power>
	   	<!-- 增加一个编辑商品资料维护的权限-->
	   	<win:power powerCode="editDetailPmProduct">
	   		<!-- 首购 -->
	   		<tr>
   				<th><form:checkbox path="isFirst" value="1" id="isFirst"/></th>
	    		<td><label for="isFirst">是否允许首购订购</label></td>
	    	</tr>
	    	<tr>
	    		<th class="required">首购价:</th>
	    		<td>
	    			<form:input path="firstPrice" id="firstPrice"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="busi.pv"/>:</th>
	    		<td><form:input path="firstPv" id="firstPv"/></td>
	    	</tr>
	    	<%-- <tr>
	    		<th class="required">赠送荣衔积分:</th>
	    		<td><form:input path="giveShopAmont" id="giveShopAmont"/></td>
	    	</tr> --%>
	    	
	    	<tr>
	    		<th><form:checkbox path="isUpgrade" value="1" id="isUpgrade"/></th>
	    		<td><label for="isUpgrade">是否允许升级订购</label></td>
	    	</tr>
	    	<tr>
				<th class="required"><fmt:message key="busi.upgrade.unit.price"/>:</th>
				<td><form:input path="upgradePrice" id="upgradePrice"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="member.upgrade.pv"/>:</th>
	    		<td><form:input path="upgradePv" id="upgradePv"/></td>
	    	</tr>
	    					
	    	<tr>
	    		<th><form:checkbox path="isReturn" value="1" id="isReturn"/></th>
	    		<td><label for="isReturn">是否允许重消订购</label></td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="busi.return.unit.price"/>:</th>
	    		<td><form:input path="returnPrice" id="returnPrice"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="busi.return.unit.pv"/>:</th>
	    		<td><form:input path="returnPv" id="returnPv"/></td>
	    	</tr>

	    	<tr>
	    		<th><form:checkbox path="isTurnover" value="1" id="isTurnover"/></th>
	    		<td><label for="isTurnover">是否允许兑换订购</label></td>
	    	</tr>
	    	<tr>
	    		<th class="required">兑换价格:</th>
	    		<td><form:input path="turnoverPrice" id="turnoverPrice"/></td>
	    	</tr>
			<%--
	    	<tr>
	    		<th><form:checkbox path="isFront" value="1" id="isFront"/></th>
	    		<td><label for="isFront">是否允许前台订购</label></td>
	    	</tr>
	    	<tr>
	    		<th class="required">前台销售价格:</th>
	    		<td><form:input path="frontPrice" id="frontPrice"/></td>
	    	</tr>
	    	<tr>
	    		<th><form:checkbox path="isO2o" value="1" id="isO2o"/></th>
	    		<td><label for="isFront">是否允许O2O订购</label></td>
	    	</tr>
	    	<tr>
	    		<th class="required">O2O价格:</th>
	    		<td><form:input path="o2oPrice" id="o2oPrice"/></td>
	    	</tr>
	    	<tr>
	    		<th class="required">O2O订单PV:</th>
	    		<td><form:input path="o2oPv" id="o2oPv"/></td>
	    	</tr>
	    	<tr>
	    		<th><form:checkbox path="isStock" value="1" id="isStock"/></th>
	    		<td><label for="isFront">允许财富订单订购</label></td>
	    	</tr>
	    	<tr>
	    		<th class="required">财富订单订购单价:</th>
	    		<td><form:input path="stockPrice" id="stockPrice"/></td>
	    	</tr>
	    	<tr>
	    		<th><form:checkbox path="limitBuy" value="1" id="limitBuy"/></th>
	    		<td><label for="limitBuy">限制总体订购数量</label></td>
	    	</tr>
	    	<tr>
	    		<th><form:checkbox path="limitPersonBuy" value="1" id="limitPersonBuy"/></th>
	    		<td><label for="limitPersonBuy">限制个人订购数量</label></td>
	    	</tr> --%>
	    	<tr>
	    		<th><fmt:message key="sysModule.orderNo"/>:</th>
	    		<td><form:input path="orderNo" id="orderNo"/></td>
	    	</tr>
   		</win:power>
    
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="remark" rows="6" style="width:300px;"/></td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="productId"/>
    				<input type="hidden" name="strAction" id="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty pmProduct.productId }">
    					<win:power powerCode="delPmProduct">
    						<button type="button" name="delete" onclick="delPmProduct(this.form);"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pmProducts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    </form:form>
</div>
<script type="text/javascript">
$(function() {
	$("a[name='add']",".detail").button({
	    icons: {
	        primary: "ui-icon-add"
	    }
	});
});

function add(){
	var row=document.getElementById("tr").cloneNode(true);
	//(不用tbody的情况) 加firstChild
	document.getElementById("tb").appendChild(row);
	row.style.display="block";
}
function del(){
	var index=event.srcElement.parentElement.parentElement.rowIndex;
	document.getElementById("tab").deleteRow(index);
}

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}

function delPmProduct(theForm) {
	if (confirm("<fmt:message key='pmProductForm.comfireDeleteProduct'/>")) {
		theForm.strAction.value = "delPmProduct";
		theForm.submit();	
	}
}
//控制手机号码只能输入数字
function checkNum(){
	if(event.keyCode < 48 || event.keyCode > 57) {
		event.returnValue=false; 
	}
}
</script>