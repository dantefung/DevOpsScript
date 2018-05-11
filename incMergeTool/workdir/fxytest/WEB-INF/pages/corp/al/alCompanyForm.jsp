<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<script language="javascript" src="${ctx }/scripts/validate.js"></script>
<script type="text/javascript" src="<c:url value="/dwr/interface/AlRegionAjax.js"/>"></script>
<script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
<script type="text/javascript" src="<c:url value="/dwr/util.js"/>"></script>
<head>
    <title><fmt:message key="alCompanyDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="alCompanyDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="alCompany" method="post" action="editAlCompany.jhtml" onsubmit="return validateForm(this)" id="alCompanyForm">
    
    <spring:bind path="alCompany.*">
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
    	<th><fmt:message key="alCompany.companyCode"/></th>
        <td>
        <c:if test="${not empty alCompany.companyId}">
        <form:input path="companyCode" id="companyCode" size="4" readonly="readonly" cssClass="readonly"/>
        </c:if>
        <c:if test="${empty alCompany.companyId}">
        <form:input path="companyCode" id="companyCode" size="4"/>
        </c:if>
        </td>
    </tr>

    <tr>
        <th><fmt:message key="alCompany.companyName"/></th>
        <td width="100%"><form:input path="companyName" id="companyName" size="60"/></td>
    </tr>

	 <tr>
        <th><fmt:message key="alCompany.characterCode"/></th>
        <td>
        <select name="characterCode" id="characterCode" >
        	<c:forEach items="${alCharacterCodings}" var="cc">
        		<option value="${cc.langCode }">${cc.langName }</option>
        	</c:forEach>
        </select>
        </td>
    </tr>
    <tr>
        <th><fmt:message key="alCompany.currencyCode"/></th>
        <td><form:input path="currencyCode" id="currencyCode" size="6"/></td>
    </tr>
	<%--  <tr>
        <th><wecs:label key="alCompany.preAgentCode"/></th>
        <td><form:input path="preAgentCode" id="preAgentCode"/></td>
    </tr> --%>
    <tr>
        <th><fmt:message key="alCompany.regName"/></th>
        <td><form:input path="regName" id="regName" size="60"/></td>
    </tr>

    <tr>
        <th><fmt:message key="alCompany.taxRate"/></th>
        <td><form:input path="taxRate" id="taxRate"/></td>
    </tr>
    
    <tr>
        <th><fmt:message key="bdNetWorkCostReport.rateCH"/></th>
        <td><form:input path="exchangeRate" id="exchangeRate"/></td>
    </tr>

    <tr>
        <th><fmt:message key="alCompany.taxType"/></th>
        <td>
        <win:list listCode="tax_type" name="taxType" value="${alCompany.taxType}" defaultValue="1"/>
        </td>
    </tr>

    <tr>
        <th><fmt:message key="alCompany.zipCode"/></th>
        <td><form:input path="zipCode" id="zipCode"/></td>
    </tr>

    <tr>
        <th><fmt:message key="alCompany.countryCode"/></th>
        <td>
       	 <select name="countryCode" id="countryCode" onchange="changeCountry(this.form);">
        	<option value=""></option>
        	 <c:forEach items="${alCountrys}" var="alCountryVar">
        		<option value="${alCountryVar.regionCode }"<c:if test="${alCountryVar.regionCode==alCompany.countryCode}"> selected</c:if>>[${alCountryVar.regionCode}] <fmt:message key="${alCountryVar.regionName}"/></option>
        	</c:forEach> 
        </select>
        </td>
    </tr>

    <tr>
        <th><fmt:message key="alCompany.stateProvinceCode"/></th>
        <td>
        <select name="stateProvinceCode">
        	<option value=""></option>
        	<c:forEach items="${alStateProvinces}" var="alStateProvinceVar">
        		<option value="${alStateProvinceVar.regionCode }"<c:if test="${alStateProvinceVar.regionCode==alCompany.stateProvinceCode}"> selected</c:if>><fmt:message key="${alStateProvinceVar.regionName}"/></option>
        	</c:forEach>
        </select>
        </td>
    </tr>

    <tr>
        <th><fmt:message key="alCompany.city"/></th>
        <td><form:input path="city" id="city"/></td>
    </tr>

    <tr>
        <th><fmt:message key="alCompany.address"/></th>
        <td><form:input path="address" id="address" size="60"/></td>
    </tr>

    <tr>
        <th><fmt:message key="alCompany.phone"/></th>
        <td><form:input path="phone" id="phone"/></td>
    </tr>
    
    <tr>
        <th><fmt:message key="alCompany.isActive"/></th>
        <td>
        <win:list listCode="yesno" name="isActive" id="isActive" value="${alCompany.isActive}" defaultValue="1"/>
        </td>
    </tr>
    
    <c:if test="${empty alCompany.companyId}">
	    <tr>
	    	<th><fmt:message key="alCompany.module.refrence"/></th>
	    	<td>
	    	<select name="refCompanyCode">
	    		<option value=""></option>
	    		<c:forEach items="${refCompanys}" var="refCompanyVar">
	    			<option value="${refCompanyVar.companyCode }">[${refCompanyVar.companyCode }] ${refCompanyVar.companyName }</option>
	    		</c:forEach>
	    	</select>
	    	<br>
	    	<fmt:message key="alCompany.module.refrence.remark"/></td>
	    </tr>
    </c:if>
    
    <tr>
    	<th><fmt:message key="busi.common.remark"/></th>
    	<td>
    	<fmt:message key="alCompanyFrom.common.remark"/>
    	<br><fmt:message key="alCompanyFrom.common.remark1"/>
    	<br><fmt:message key="alCompanyFrom.common.remark2"/>
    	<br><fmt:message key="alCompanyFrom.common.remark3"/>
    	</td>
    </tr>
    
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="companyId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty alCompany.companyId }">
    					<win:power powerCode="deleteAlCompany">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'AlCompany')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='alCompanys.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
Form.focusFirstElement($('alCompanyForm'));
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.companyCode.value!="" && theForm.companyCode.value.length!=2 && !isAllUpperLetter(theForm.companyCode.value)){
		alert("<fmt:message key="error.alCompany.companyCode.length"/>");
		theForm.companyCode.focus();
		return false;
	}
	if(theForm.taxRate.value!="" && !isUnsignedNumeric(theForm.taxRate.value)){
		alert("<fmt:message key="alcompany.taxRate.invalidate"/>");
		theForm.taxRate.focus();
		return false;
	}
	if(theForm.exchangeRate.value!="" && !isUnsignedNumeric(theForm.exchangeRate.value)){
		alert("<fmt:message key="alcompany.exchangeRate.invalidate"/>");
		theForm.taxRate.focus();
		return false;
	}
	
	showLoading();
	return true;
}
function changeCountry(theForm){
	dwr.util.removeAllOptions("stateProvinceCode");
	AlRegionAjax.getAlRegionMapByCountry(theForm.countryCode.value,{
	  	callback: getDataFromServerCallBack
	  });
}
function getDataFromServerCallBack(dataFromServer) {
	dwr.util.addOptions("stateProvinceCode", dataFromServer);
}
</script>
