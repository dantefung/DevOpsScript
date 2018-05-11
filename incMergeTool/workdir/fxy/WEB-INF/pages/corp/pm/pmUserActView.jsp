<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmUserActDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pmUserActDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pmUserAct" method="post" id="pmUserActForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmUserAct.productId"/>:</th>
    		<td>${pmUserAct.productId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmUserAct.sessionId"/>:</th>
    		<td>${pmUserAct.sessionId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmUserAct.userCode"/>:</th>
    		<td>${pmUserAct.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmUserAct.actType"/>:</th>
    		<td>${pmUserAct.actType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmUserAct.createTime"/>:</th>
    		<td>${pmUserAct.createTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="actId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pmUserActs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>