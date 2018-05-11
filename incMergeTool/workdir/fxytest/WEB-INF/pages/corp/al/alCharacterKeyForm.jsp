<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alCharacterKeyDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.basicDataManage.langValueManage"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="alCharacterKey" method="post" action="editAlCharacterKey.jhtml" onsubmit="return validateForm(this)" id="alCharacterKeyForm">
    
    <spring:bind path="alCharacterKey.*">
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
    		<th class="required"><fmt:message key="alCharacterKey.characterKey"/>:</th>
    		<td><c:if test="${not empty alCharacterKey.characterKey}"><form:input path="characterKey" id="characterKey"  readonly="true" size="60"/></c:if>
    			<c:if test="${empty alCharacterKey.characterKey}"><form:input path="characterKey" id="characterKey" size="60"/></c:if>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="alCharacterKey.keyDesc"/>:</th>
    		<td><form:input path="keyDesc" id="keyDesc" size="60"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty alCharacterKey.characterKey }">
    					<win:power powerCode="deleteAlCharacterKey">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'AlCharacterKey')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='alCharacterKeys.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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