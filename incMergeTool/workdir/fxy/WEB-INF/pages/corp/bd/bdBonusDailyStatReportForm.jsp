<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>日结检查报表</title>
    <meta name="heading" content="日结检查报表"/>
</head>

<div class="contentBody">
    <form:form commandName="bdDailyCalc" method="post" action="bdBonusDailyStatReport.jhtml" onsubmit="return validateForm(this)" id="bdBonusDailyReportForm">
    
    <spring:bind path="bdDailyCalc.*">
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
    	<%-- <tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
    	</tr>
    	<c:if test="${not empty alCompanys}">
			<tr>
				<th><fmt:message key="label.company"/></th>
				<td>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</td>
			</tr>
		</c:if> --%>
    	<tr>
    		<th class="required">日期范围:</th>
    		<td> 
				<input type="text" name="startDate" id="startDate" value="${param.startDate }"/>
				-
				<input type="text" name="endDate" id="endDate" value="${param.endDate }"/>
    		</td>
    	</tr>
   
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="bdBonusDailyStatReport"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.report"/></button>
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
	if(theForm.startDate.value==""){
		alert("请选择开始日期");
		return false;
	}
	if(theForm.endDate.value==""){
		alert("请选择截止日期");
		return false;
	}
	//showLoading();
	return true;
}

$(function() {
	$( "#startDate,#endDate" ).datepicker();
});
</script>