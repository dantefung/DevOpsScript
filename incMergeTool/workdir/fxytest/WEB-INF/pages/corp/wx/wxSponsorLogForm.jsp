<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxSponsorLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxSponsorLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxSponsorLog" method="post" action="editWxSponsorLog.jhtml" onsubmit="return validateForm(this)" id="wxSponsorLogForm">
    
    <spring:bind path="wxSponsorLog.*">
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
    		<th class="required"><fmt:message key="wxSponsorLog.wxOpenid"/>:</th>
    		<td><form:input path="wxOpenid" id="wxOpenid"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxSponsorLog.oldSponsorId"/>:</th>
    		<td><form:input path="oldSponsorId" id="oldSponsorId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxSponsorLog.newSponsorId"/>:</th>
    		<td><form:input path="newSponsorId" id="newSponsorId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxSponsorLog.changeTime"/>:</th>
    		<td><form:input path="changeTime" id="changeTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxSponsorLog.sourceUrl"/>:</th>
    		<td><form:input path="sourceUrl" id="sourceUrl"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty wxSponsorLog.logId }">
    					<win:power powerCode="deleteWxSponsorLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'WxSponsorLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='wxSponsorLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
</script>