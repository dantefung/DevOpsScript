<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxFootBtnDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxFootBtnDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxFootBtn" method="post" id="wxFootBtnForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.parentId"/>:</th>
    		<td>${wxFootBtn.parentId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.buttonType"/>:</th>
    		<td>${wxFootBtn.buttonType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.buttonKey"/>:</th>
    		<td>${wxFootBtn.buttonKey }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.buttonTitle"/>:</th>
    		<td>${wxFootBtn.buttonTitle }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.navUrl"/>:</th>
    		<td>${wxFootBtn.navUrl }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.creatorCode"/>:</th>
    		<td>${wxFootBtn.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.createTime"/>:</th>
    		<td>${wxFootBtn.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.editorCode"/>:</th>
    		<td>${wxFootBtn.editorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.editorName"/>:</th>
    		<td>${wxFootBtn.editorName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxFootBtn.isVisible"/>:</th>
    		<td>${wxFootBtn.isVisible }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="buttonId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='wxFootBtns.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>