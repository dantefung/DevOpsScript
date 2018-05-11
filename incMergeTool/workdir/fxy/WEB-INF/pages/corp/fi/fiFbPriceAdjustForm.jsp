<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="FCF收盘价管理"/></title>
    <meta name="heading" content="<fmt:message key="FCF收盘价管理"/>"/>
</head>

<script type="text/javascript" src="${ctx }/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="fiFbPriceAdjust" method="post" action="editFiFbPriceAdjust.jhtml" onsubmit="return validateForm(this)" id="fiFbPriceAdjustForm">
    
    <spring:bind path="fiFbPriceAdjust.*">
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
    		<td>
    			<c:if test="${not empty alCompanys}">
					<select name="companyCode" id="companyCode">
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==fiFbPriceAdjust.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</c:if>
    		</td>
    	</tr>
    	<tr>
    		<th class="required">收盘日期:</th>
    		<td><form:input path="scDate" id="scDate"/></td>
    	</tr>
    	<tr>
    		<th class="required">收盘价:</th>
    		<td><form:input path="fbPrice" id="fbPrice"/></td>
    	</tr>
    	
    	<tr>
    		<th>备注:</th>
    		<td><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
    	</tr>

    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty fiFbPriceAdjust.adjustCode && fiFbPriceAdjust.status==0}">
    					<win:power powerCode="deleteFiFbPriceAdjust">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiFbPriceAdjust')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiFbPriceAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(function() {
	$( "#scDate" ).datepicker({
		maxDate:-1
	});
});
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.scDate.value==""){
		alert("请选择正确的收盘日期");
		theForm.scDate.focus();
		return false;
	}
	if(theForm.fbPrice.value=="" || !isUnsignedNumeric(theForm.fbPrice.value)){
		alert("请输入正确的币值");
		theForm.fbPrice.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>