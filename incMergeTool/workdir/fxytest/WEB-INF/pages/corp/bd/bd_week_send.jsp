<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="serviceName.BdWeekSend"/></title>
    <meta name="heading" content="<fmt:message key="serviceName.BdWeekSend"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdPeriod" method="post" action="bdWeekSend.jhtml" onsubmit="return validateForm(this)" id="bdBonusSubForm">
    <%@ include file="/common/messages.jsp" %>
    <spring:bind path="bdPeriod.*">
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
    <table class="detail">
    	<tr>
    		<th>结算周：</th>
    		<td>
    			${bdPeriod.wweek }<input type="hidden" name="fullWeek" value="${bdPeriod.wweek }"/>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="wweek"/>
    				<input type="hidden" name="strAction" value="bdWeekSend"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.confirm"/></button>
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
	if(!confirm("<fmt:message key='aiAgent.confirm'/>")){
		return false;
	}
	//其它验证
	showLoading();
	return true;
}
</script>