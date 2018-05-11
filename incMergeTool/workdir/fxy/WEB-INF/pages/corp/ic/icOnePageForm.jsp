<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.listIcOnePages"/></title>
    <meta name="heading" content="<fmt:message key="menu.listIcOnePages"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="icOnePage" method="post" action="editIcOnePage.jhtml" onsubmit="return validateForm(this)" id="icOnePageForm">
    
    <spring:bind path="icOnePage.*">
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
    		<th class="required"><fmt:message key="icOnePage.pageCode"/>:</th>
    		<td><win:list name="pageCode" listCode="one_page_codes" defaultValue="" value="${icOnePage.pageCode }"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="alCharacterValue.langCode"/>:</th>
    		<td>
    			<form:select path="langCode" items="${alLangCodeList}" itemLabel="langName" itemValue="langCode"/>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icInformation.title"/>:</th>
    		<td><form:input path="pageTitle" id="pageTitle" cssStyle="width:600px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.content"/>:</th>
    		<td><form:textarea path="pageText" id="pageText" rows="20" cssStyle="width:600px;"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="pageId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty icOnePage.pageId }">
    					<win:power powerCode="deleteIcOnePage">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'IcOnePage')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='icOnePages.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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