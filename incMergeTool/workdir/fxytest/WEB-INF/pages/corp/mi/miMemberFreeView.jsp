<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberFreeDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberFreeDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miMemberFree" method="post" id="miMemberFreeForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.memberNo"/>:</th>
    		<td>${miMemberFree.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.totalAmount"/>:</th>
    		<td>${miMemberFree.totalAmount }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.totalPv"/>:</th>
    		<td>${miMemberFree.totalPv }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.checkerCode"/>:</th>
    		<td>${miMemberFree.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.checkTime"/>:</th>
    		<td>${miMemberFree.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.creatorCode"/>:</th>
    		<td>${miMemberFree.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.createTime"/>:</th>
    		<td>${miMemberFree.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.status"/>:</th>
    		<td>${miMemberFree.status }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.cardType"/>:</th>
    		<td>${miMemberFree.cardType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.star"/>:</th>
    		<td>${miMemberFree.star }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.oldStar"/>:</th>
    		<td>${miMemberFree.oldStar }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberFree.orderNo"/>:</th>
    		<td>${miMemberFree.orderNo }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='miMemberFrees.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>