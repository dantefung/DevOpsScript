<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pd.pdWarehousesManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.pd.pdWarehousesManage"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="stWarehouse" method="post" action="editStWarehouse.jhtml" onsubmit="return validateForm(this)" id="stWarehouseForm">
    
    <spring:bind path="stWarehouse.*">
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
    	<c:if test="${not empty alCompanys && empty stWarehouse.waId}">
	    	<tr>
	    		<th class="required"><fmt:message key="label.company"/>:</th>
	    		<td>
	    			<form:select path="companyCode">
	    				<c:forEach items="${alCompanys}" var="alCompanyVar">
	    					<form:option value="${alCompanyVar.companyCode }">${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</form:option>
			    		</c:forEach>
	    			</form:select>
			    </td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th class="required"><fmt:message key="busi.warehouse.warehouseno"/>:</th>
    		<td>
    			<c:if test="${not empty stWarehouse.waId }">
    				${stWarehouse.warehouseCode }
    				<form:hidden path="warehouseCode" id="warehouseCode"/>
    			</c:if>
    			<c:if test="${empty stWarehouse.waId }">
    				<form:input path="warehouseCode" id="warehouseCode"/>
    			</c:if>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdWarehouse.warehouseName"/>:</th>
    		<td><form:input path="warehouseName" id="warehouseName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="alCompany.address"/>:</th>
    		<td><form:input path="address" id="address" size="60"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
    		<td><form:input path="zipcode" id="zipcode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="alCompany.phone"/>:</th>
    		<td><form:input path="phone" id="phone"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysModule.isActive"/>:</th>
    		<td>
    			<win:list name="isActive" listCode="yesno" defaultValue="1" value="${stWarehouse.isActive }"></win:list>
    		</td>
    	</tr>
    	<tr>
    		<th class="required">允许自提:</th>
    		<td>
    			<win:list name="isPickup" listCode="yesno" defaultValue="1" value="${stWarehouse.isPickup }"></win:list>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="waId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty stWarehouse.waId }">
    					<win:power powerCode="deleteStWarehouse">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'StWarehouse')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='stWarehouses.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.warehouseCode.value==""){
		alert("请输入仓库编号");
		theForm.warehouseCode.focus();
		return false;
	}
	if(theForm.warehouseName.value==""){
		alert("请输入仓库名称");
		theForm.warehouseName.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>