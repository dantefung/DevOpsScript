<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
    <title><fmt:message key="alCharacterValueList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.basicDataManage.langValueManage"/>"/>
</head>

<div class="contentBody">
	<form:form commandName="alCharacterValue" method="post" action="editAlCharacterValue.jhtml" onsubmit="return validateForm(this)" id="alCharacterValueForm">
		<%@ include file="/common/messages.jsp" %>
		<ec:table 
			items="alCharacterValues"
			var="alCharacterValueVar"
			action="sysConfigValues.jhtml"
			showPagination="false"
			width="100%" sortable="false"
			form="alCharacterValueListTableForm" autoIncludeParameters="false">
			<ec:row>
				<ec:column property="lang_code" title="alCharacterValue.langCode" />
				<ec:column property="lang_name" title="alCharacterCoding.characterName" />
				<ec:column property="character_value" title="alCharacterCoding.characterValue">
	         		 <c:choose>
	         		 	<c:when test="${isAdminFlag == true || fn:contains(alCharacterValueVar.allowed_user,userCode)}">
	         		 		<input type="text" name="character_value" value="${alCharacterValueVar.character_value}" size="60" />
	         		 	</c:when>
	         		 	<c:otherwise>
	         		 		<input type="text" name="character_value" value="${alCharacterValueVar.character_value}" size="60" readonly="readonly" class="readonly"/>
	         		 	</c:otherwise>
	         		 </c:choose>
	         		<input type="hidden" name="valueId1" value="${alCharacterValueVar.value_id }" />
	         		<input type="hidden" name="characterCode" value="${alCharacterValueVar.lang_code }" />
				</ec:column>
			</ec:row>
		</ec:table>
		
		<c:if test="${not empty alCharacterValues }">
			<div class="buttonBar" style="width: 100%;" align="center">
				<input type="hidden" name="keyId" value="${param.keyId }" />
				<win:power powerCode="editAlCharacterValue">
					<input type="hidden" name=strAction value="editAlCharacterValue" />
					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
				</win:power>
			</div>	
		</c:if>
	 </form:form>
 
 </div>
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>