<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alCharacterCodingDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.al.alLanguageManagement"/> >> <fmt:message key="menu.al.clone.language"/>"/>
</head>
<form:form commandName="alLangCode" method="post" action="alLanguageUpdate.jhtml" id="alCharacterCodingForm" onsubmit="return validateOthers(this)">

<table class="detail">
    <tr>
        <th><fmt:message key="al.ref.language"/>:</th>
        <td width="100%">
         <form:select path="langCode" items="${alLangCodeList}" itemLabel="langName" itemValue="langCode"></form:select> 
        </td>
    </tr>

    <tr>
        <th><fmt:message key="al.update.language"/>:</th>
        <td>
        <select name="updateCharacterCode">
        	<c:forEach items="${alLangCodeList}" var="alCharacterCodingVar">
        		<option value="${alCharacterCodingVar.langCode }">${alCharacterCodingVar.langName }</option>
        	</c:forEach>
        </select>
        </td>
    </tr>
    
    <tr>
		<th class="command"><fmt:message key="sysOperationLog.moduleName" /></th>
		<td class="command">
			 <win:power powerCode="alLanguageUpdate">
			 	<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
			 </win:power>
			<input type="hidden" name="strAction" value="alLanguageUpdate"/>
		</td>
	</tr>
</table>

</form:form>

<script type="text/javascript">
Form.focusFirstElement($('fiPayAdviceForm'));

function validateOthers(theForm){
	if(!confirm("<wecs:locale key="confirm.clone.language"/>")){
		return false;
	}
	showLoading();
	return true;
}
</script>

<v:javascript formName="alCountry" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript"  src="<c:url value="/scripts/validator.jsp"/>"></script>
