<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxNoticeTemplateDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxNoticeTemplateDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxNoticeTemplate" method="post" id="wxNoticeTemplateForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeTemplate.noticeType"/>:</th>
    		<td>${wxNoticeTemplate.noticeType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeTemplate.noticeTitle"/>:</th>
    		<td>${wxNoticeTemplate.noticeTitle }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeTemplate.templateId"/>:</th>
    		<td>${wxNoticeTemplate.templateId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeTemplate.templateSample"/>:</th>
    		<td>${wxNoticeTemplate.templateSample }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeTemplate.remark"/>:</th>
    		<td>${wxNoticeTemplate.remark }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='wxNoticeTemplates.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>