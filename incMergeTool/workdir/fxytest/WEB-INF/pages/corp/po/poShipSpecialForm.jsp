<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="发货管理"/></title>
    <meta name="heading" content="<fmt:message key="发货管理"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<c:choose>
   	<c:when test="${poShip.shipType=='1' }">
   		<c:set var="shipType1Display" value=""/>
   		<c:set var="shipType2Display" value="none"/>
   	</c:when>
   	<c:when test="${poShip.shipType=='2' }">
   		<c:set var="shipType1Display" value="none"/>
   		<c:set var="shipType2Display" value=""/>
   	</c:when>
</c:choose>
    
<div class="contentBody">
    <form:form commandName="poShip" method="post" action="editPoShipSpecial.jhtml" onsubmit="return validateForm(this)" id="poShipForm">
    
    <spring:bind path="poShip.*">
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
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>

    		<tr>
	    		<th class="required">分公司:</th>
	    		<td>${poShip.companyCode }</td>
	    	</tr>
	    	<tr>
	    		<th>发货单号:</th>
	    		<td>${poShip.siNo }</td>
	    	</tr>
	    	<tr>
	    		<th class="required">收货人编号:</th>
	    		<td>
	    			<form:hidden path="recptCode"/>
	    			${poShip.recptCode }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required">发货仓:</th>
	    		<td>
	    			${stWarehouse.warehouseCode } - ${stWarehouse.warehouseName }
	    		</td>
	    	</tr>
	    	<win:power powerCode="editPoShipRemark">
		    	<tr>
		    		<th>备注:</th>
		    		<td><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
		    	</tr>
	    	</win:power>
    		
    		<win:power powerCode="editPoShipAddress">
	    		<tr>
		    		<td colspan="2" class="title">收发货信息</td>
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
		    	</tr>
		    	<tr class="shipType1TR" style="display:${shipType1Display};">
		    		<th class="required"><fmt:message key="pdSendInfo.recipientName"/>:</th>
		    		<td><form:input path="shipLastName" id="shipLastName"/></td>
		    	</tr>
		    	
		    	<tr class="shipType1TR" style="display:${shipType1Display};">
		    		<th class="required"><fmt:message key="miMember.delivery.moblie"/>:</th>
		    		<td><form:input path="shipMobile" id="shipMobile" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
		    	</tr>
		    	
		    	<tr class="shipType1TR" style="display:${shipType1Display};">
		    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
		    		<td><form:input path="shipPhone" id="shipPhone" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
		    	</tr>
		    	
		    	<tr class="shipType1TR" style="display:${shipType1Display};">
		    		<th class="required"><fmt:message key="miMember.delivery.area"/>:</th>
		    		<td>
		    			<select name="country" id="country" style="width:135px;"></select>
		    			<select name="province" id="province" style="width:135px"><option value=""><fmt:message key="list.please.select"/></option></select>
		    			<select name="city" id="city" style="width:135px"><option value=""><fmt:message key="list.please.select"/></option></select>
		    			<select name="district" id="district" style="width:135px"><option value=""><fmt:message key="list.please.select"/></option></select>
		    		</td>
		    	</tr>
		    	<tr class="shipType1TR" style="display:${shipType1Display};">
		    		<th class="required"><fmt:message key="mi.addrees.detail"/>:</th>
		    		<td>
		    			<form:input path="shipAddress1" id="shipAddress1" style="width:300px;"/>
		    			<%-- <br/><form:input path="address2" id="address2" style="width:200px;"/>--%>
		    		</td>
		    	</tr>
		    	
		    	<tr class="shipType1TR" style="display:${shipType1Display};">
		    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
		    		<td><form:input path="shipZipCode" id="shipZipCode" maxlength="6"/></td>
		    	</tr>
	    	</win:power>
	    	<win:power powerCode="editPoShipLogi">
	    		<tr>
		    		<td colspan="2" class="title">物流信息</td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="物流公司"/>:</th>
		    		<td><win:list name="shipOrgCode" listCode="pd.express.name" defaultValue="" value="${poShip.shipOrgCode }" showBlankLine="true"/></td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="物流单号"/>:</th>
		    		<td><form:input path="shipInvoiceNo" id="shipInvoiceNo"/></td>
		    	</tr>
	    	</win:power>

	    	<tr>
	    		<td colspan="2" class="title">商品信息</td>
	    	</tr>
    	
	    	<tr>
	    		<td colspan="2">
	    			<ec:table 
					items="poShipDetails"
					var="pmProductVar" form="poShipForm" autoIncludeParameters="false"
					showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
						<ec:row highlightRow="false">
							<ec:column property="product_no" title="busi.product.productno" />
							<ec:column property="product_name" title="pmProduct.productName"/>
							<ec:column property="unit_price" title="label.unit.price" styleClass="numberColumn">
								<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_price }"/>
							</ec:column>
							<ec:column property="quantity" title="发货数量" styleClass="numberColumn"/>
						</ec:row>
					</ec:table>
	    		</td>
	    	</tr>

    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="shipId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
   					<button type="button" name="cancel" onclick="window.location='poShips.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	<win:power powerCode="editPoShipRemark">
    refreshChildRegions("${country.regionId}","0","country");
	<c:if test="${not empty district}">
		refreshChildRegions("${province.regionId}","${country.regionId}","province");
		refreshChildRegions("${city.regionId}","${province.regionId}","city");
		refreshChildRegions("${district.regionId}","${city.regionId}","district");
	</c:if>

	 $('#country').change(function(){
    	refreshChildRegions("",$(this).children('option:selected').val(),"province");
    	refreshChildRegions("","-1","city");
    	refreshChildRegions("","-1","district");
    });
    $('#province').change(function(){
    	refreshChildRegions("",$(this).children('option:selected').val(),"city");
    	refreshChildRegions("","-1","district");
    });
    $('#city').change(function(){
    	refreshChildRegions("",$(this).children('option:selected').val(),"district");
    });
    </win:power>
});

function refreshChildRegions(selectedValue, regionId, targetObjId){
	dwr.util.removeAllOptions(targetObjId);
	AlRegionAjax.getChildRegionsToMap(regionId,'${companyCode}', function(data){
 		dwr.util.addOptions(targetObjId, data);
 		document.getElementById(targetObjId).value = selectedValue;
	});
}

function validateForm(theForm) {
	
	if(bCancel){
		showLoading();
		return true;
	}
	
	<win:power powerCode="editPoShipAddress">
		if(theForm.shipType.value=='1'){
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
			
			if (theForm.province.value == null || theForm.province.value == '' || theForm.province.value == '-1') {
				alert("<fmt:message key='mi.province.null.requie'/>.");
				theForm.province.focus();
				return false;
			}
			
			if (theForm.city.value == null || theForm.city.value == '' || theForm.city.value == '-1') {
				alert("<fmt:message key='mi.city.null.requie'/>.");
				//alert("所在地区-城市不能为空");
				theForm.city.focus();
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
		}
	</win:power>
	//其它验证
	showLoading();
	return true;
}

function changeShipType(newShipType){
	if(newShipType==1){
		$(".shipType1TR").css("display","");
		$(".shipType2TR").css("display","none");
	}else if(newShipType==2){
		$(".shipType1TR").css("display","none");
		$(".shipType2TR").css("display","");
	}
}
</script>