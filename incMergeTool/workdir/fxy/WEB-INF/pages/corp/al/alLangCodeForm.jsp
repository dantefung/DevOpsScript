<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alCharacterCodingDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.al.alLanguageManagement"/> >> <fmt:message key="menu.basicDataManage.langCodeManage"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="alLangCode" method="post" action="editAlLangCode.jhtml" onsubmit="return validateForm(this)" id="alLangCodeForm">
    
    <spring:bind path="alLangCode.*">
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
	    	<th><fmt:message key="alCharacterValue.langCode"/>:</th>
	        <td width="100%">
	        <c:if test="${not empty alLangCode.langCode}">
	        <form:input path="langCode" id="langCode" size="8" readonly="true" cssClass="readonly"/>
	        </c:if>
	        <c:if test="${empty alLangCode.langCode}">
		        <select name="langCode" id="langCode">
			        <c:forEach items="${languageMap}" var="lanVar">
			        	<option value="${lanVar.key }"<c:if test="${lanVar.key==alLangCode.langCode}"> selected</c:if>>${lanVar.key } - ${lanVar.value }</option>
			        </c:forEach>
		        </select>
	        </c:if>
	
	        </td>
	    </tr>
    	<tr>
    		<th class="required"><fmt:message key="alCharacterCoding.characterName"/>:</th>
    		<td><form:input path="langName" id="langName" /></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="login.userType.console"/>:</th>
    		<td><form:input path="allowedUser" id="allowedUser" size="100"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty alLangCode.langCode }">
    					<win:power powerCode="deleteAlLangCode">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'AlLangCode')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='alLangCodes.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(theForm.langName.value==""){
		alert("<fmt:message key="alCharacterValue.langCode.notNull"/>");
		theForm.configCode.focus();
		return false;
	}
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}
</script>