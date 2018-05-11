<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>列表值编辑</title>
    <meta name="heading" content="列表值编辑"/>
</head>

<div class="contentBody">
    <form:form commandName="sysListValue" method="post" action="editSysListValue.jhtml"  id="sysListValueForm" name="sysListValueForm">
    
    <spring:bind path="sysListValue.*">
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
    		<th class="required"><fmt:message key="sysListValue.valueCode"/>:</th>
    		<td><form:input path="valueCode" id="valueCode" size="40"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysListValue.valueTitle"/>:</th>
    		<td><form:input path="valueTitle" id="valueTitle" size="40"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysListValue.exCompanyCode"/>:</th>
    		<td>
    			<c:forEach items="${alCompanys}" var="alCompanyVar">
		    		<c:set var="isChecked" value="false"/>
		    		<c:forEach items="${exCompanyCodes}" var="exCompanyCodeVar">
		    			<c:if test="${exCompanyCodeVar==alCompanyVar.companyCode}">
		    				<c:set var="isChecked" value="true"/>
		    			</c:if>
		    		</c:forEach>
		    		<c:if test="${isChecked=='true'}">
		    		<input type="checkbox" name="companyCode" value="${alCompanyVar.companyCode }" checked="checked" class="checkbox" id="companyCode_${alCompanyVar.companyCode }"/>
		    		</c:if>
		    		<c:if test="${isChecked=='false'}">
		    		<input type="checkbox" name="companyCode" value="${alCompanyVar.companyCode }" class="checkbox" id="companyCode_${alCompanyVar.companyCode }"/>
		    		</c:if>    	
		    		<label for="companyCode_${alCompanyVar.companyCode }">${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</label>
		    		<br>
		    	</c:forEach>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysListValue.orderNo"/>:</th>
    		<td><form:input path="orderNo" id="orderNo"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="valueId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" name="keyId" value="${param.keyId}">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="button" name="save" onclick="_validateForm()"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysListValue.valueId }">
    					<win:power powerCode="deleteSysListValue">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysListValue')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysListValues.jhtml?needReload=1&keyId=${param.keyId}'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function _validateForm() {
	if($id('valueCode').value==""){
		alert("<fmt:message key="sysListValue.valueCode.required"/>");
		$id('valueCode').focus();
		return ;
	}else if($id('valueTitle').value==""){
		alert("<fmt:message key="sysListValue.valueTitle.required"/>");
		$id('valueTitle').focus();
		return ;
	}
	//else if($id('orderNo').value!="" && !isInteger($id('orderNo').value)){
	//	alert("<wecs:locale key="sysListValue.orderNo.mustBeInt"/>");
	//	$id('orderNo').focus();
	//	return false;
	//}
	//其它验证
	//showLoading();
	$id("sysListValueForm").submit();
}
function $id(id){
	return document.getElementById(id);
}
</script>