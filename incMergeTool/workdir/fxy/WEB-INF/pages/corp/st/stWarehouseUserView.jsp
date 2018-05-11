<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="stWarehouseUserDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="stWarehouseUserDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="stWarehouseUser" method="post" id="stWarehouseUserForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stWarehouseUser.waId"/>:</th>
    		<td>${stWarehouseUser.waId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stWarehouseUser.userCode"/>:</th>
    		<td>${stWarehouseUser.userCode }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='stWarehouseUsers.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>