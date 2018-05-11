<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miPlateSelectLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="miPlateSelectLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miPlateSelectLog" method="post" action="editMiPlateSelectLog.jhtml" onsubmit="return validateForm(this)" id="miPlateSelectLogForm">
    
    <spring:bind path="miPlateSelectLog.*">
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
    		<th class="required"><fmt:message key="miPlateSelectLog.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miPlateSelectLog.plateModel"/>:</th>
    		<td><form:input path="plateModel" id="plateModel"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miPlateSelectLog.linkNo"/>:</th>
    		<td><form:input path="linkNo" id="linkNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miPlateSelectLog.status"/>:</th>
    		<td><form:input path="status" id="status"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miPlateSelectLog.inTime"/>:</th>
    		<td><form:input path="inTime" id="inTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miPlateSelectLog.comeTime"/>:</th>
    		<td><form:input path="comeTime" id="comeTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miPlateSelectLog.lastUpUser"/>:</th>
    		<td><form:input path="lastUpUser" id="lastUpUser"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miPlateSelectLog.lastUpDate"/>:</th>
    		<td><form:input path="lastUpDate" id="lastUpDate"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty miPlateSelectLog.id }">
    					<win:power powerCode="deleteMiPlateSelectLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiPlateSelectLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miPlateSelectLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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