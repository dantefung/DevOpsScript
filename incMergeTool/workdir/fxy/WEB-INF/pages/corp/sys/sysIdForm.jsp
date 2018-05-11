<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.systemParameterManage.seqenceManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemParameterManage.seqenceManage"/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<div class="contentBody">
    <form:form commandName="sysId" method="post" action="editSysId.jhtml" onsubmit="return validateForm(this)" id="sysIdForm">
    
    <spring:bind path="sysId.*">
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
    		<th class="required"><fmt:message key="sysId.idCode"/>:</th>
    		<td>
    			<c:if test="${not empty sysId.id }">
			        <form:hidden path="idCode" id="idCode"/>${sysId.idCode }
			    </c:if>
			    <c:if test="${empty sysId.id }">
					<form:input path="idCode" id="idCode"/>
			    </c:if>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysId.idName"/>:</th>
    		<td><form:input path="idName" id="idName"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysId.idValue"/>:</th>
    		<td><form:input path="idValue" id="idValue"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="alCompany.dateFormat"/>:</th>
    		<td>
    			<spring:bind path="sysId.dateFormat">
					<win:list name="${status.expression}" listCode="date_format" value="${status.value}" defaultValue="0"/>
			    </spring:bind>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysId.prefix"/>:</th>
    		<td><form:input path="prefix" id="prefix"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysId.postfix"/>:</th>
    		<td><form:input path="postfix" id="postfix"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysId.idLength"/>:</th>
    		<td><form:input path="idLength" id="idLength"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysId.infix"/>:</th>
    		<td><form:input path="infix" id="infix"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sys.random.produce"/>:</th>
    		<td>
    			<spring:bind path="sysId.valueRandom">
					<win:list name="${status.expression}" listCode="sysid_random_type" value="${status.value}" defaultValue="0"/>
			    </spring:bind>
			    <br/><fmt:message key="sys.addOne.produce"/>
			    <br/><fmt:message key="sys.random.order.produce"/>
			    <br/><fmt:message key="sys.random"/>
    		</td>
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
    				<c:if test="${not empty sysId.id }">
    					<win:power powerCode="deleteSysId">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysId')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysIds.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.idCode.value==""){
		alert("<fmt:message key='sys.sequence.no.null.requie'/>！");
		theForm.idCode.focus();
		return false;
	}
	
	if(theForm.idName.value==""){
		alert("<fmt:message key='sys.sequenceName.null.requie'/>");
		theForm.idName.focus();
		return false;
	}
	
	if(theForm.idValue.value=="" || !isInteger(theForm.idValue.value)){
		alert("<fmt:message key='sys.sequenceStart.null.requie'/>");
		theForm.idValue.focus();
		return false;
	}

	if(theForm.idLength.value != "" && !isUnsignedInteger(theForm.idLength.value)){
		alert("<fmt:message key="sysId.idLength.required"/>");
		theForm.idLength.focus();
		return false;
	}
	
	showLoading();
	return true;
}
</script>