<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="plMemberOrderDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="plMemberOrderDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="plMemberOrder" method="post" id="plMemberOrderForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.poPv"/>:</th>
    		<td>${plMemberOrder.poPv }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.poAmt"/>:</th>
    		<td>${plMemberOrder.poAmt }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.prPv"/>:</th>
    		<td>${plMemberOrder.prPv }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.prAmt"/>:</th>
    		<td>${plMemberOrder.prAmt }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.totalPv"/>:</th>
    		<td>${plMemberOrder.totalPv }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.avaluePv"/>:</th>
    		<td>${plMemberOrder.avaluePv }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.status"/>:</th>
    		<td>${plMemberOrder.status }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.hasPass"/>:</th>
    		<td>${plMemberOrder.hasPass }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.passTime"/>:</th>
    		<td>${plMemberOrder.passTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.groupPv"/>:</th>
    		<td>${plMemberOrder.groupPv }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="memberNo"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='plMemberOrders.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>