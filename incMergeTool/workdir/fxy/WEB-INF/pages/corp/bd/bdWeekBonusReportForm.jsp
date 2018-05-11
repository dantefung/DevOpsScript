<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="周结收益报表"/></title>
    <meta name="heading" content="<fmt:message key="周结收益报表"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysUser" method="post" action="bdWeekBonusReport.jhtml" onsubmit="return validateForm(this)" id="bdWeekBonusReportForm">
    
    <spring:bind path="sysUser.*">
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
    	<c:if test="${not empty alCompanys }">
	    	<tr>
	    		<th class="required"><fmt:message key="label.company"/>:</th>
	    		<td>
	    			<select name="companyCode">
						<option value=""></option>
						<c:forEach items="${alCompanys }" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }" <c:if test="${alCompanyVar.companyCode==param.companyCode }">selected</c:if> >${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th class="required"><fmt:message key="fiAwardTemp.week" />:</th>
    		<td>
    			<select name="wweek" id="wweek">
					<c:forEach items="${bdPeriods }" var="bdPeriodVar">
						<option value="${bdPeriodVar.wweek }"<c:if test="${param.wweek==bdPeriodVar.wweek }"> selected</c:if>>${bdPeriodVar.wweek }</option>
					</c:forEach>
				</select>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="bdWeekBonusReport"/>
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
	//其它验证
	showLoading();
	return true;
}

$(function() {
	$( "#startDate,#endDate" ).datepicker();
});
</script>