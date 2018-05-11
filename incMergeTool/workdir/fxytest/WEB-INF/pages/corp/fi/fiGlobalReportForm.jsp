<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.fiGlobalReport"/></title>
    <meta name="heading" content="<fmt:message key="menu.fiGlobalReport"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAlipayAccount" method="post" action="" onsubmit="return validateForm(this)" id="fiAlipayLogForm">
    
    <spring:bind path="fiAlipayAccount.*">
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
		<c:if test="${not empty alCompanys}">
    	  <tr>
    		<th class="required"><fmt:message key="label.company"/>:</th>
    		<td>
    		  <form:select path="companyCode" id="companyCode"> 
                 <form:option value="" label=""/>
                 <form:options items="${alCompanys}" itemValue="companyCode" itemLabel="companyName"/>
              </form:select> 	
    		</td>
    	  </tr>
    	</c:if>
    	<tr>
    		<th class="required"><fmt:message key="pdProductsMain.pdBeginDate"/>:</th>
    		<td><input type="text" id="startDate" name="startDate"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiBankbookBalance.endDate"/>:</th>
    		<td><input type="text" id="endDate" name="endDate"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="fiGlobalReport"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="fiGlobalReport">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='fiGlobalReport.jhtml'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    </form:form>
</div>
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	if(theForm.startDate.value=="" || theForm.endDate.value==""){
		alert("<fmt:message key="poOrder.chooseDateRange"/>");
		return false;
	}
	//其它验证
	//showLoading();
	return true;
}
</script>