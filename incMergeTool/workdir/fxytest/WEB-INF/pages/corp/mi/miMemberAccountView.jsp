<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberAccountDetail.title"/></title>
    <meta name="heading" content="银行账户详情"/>
</head>

<div class="contentBody">
    <form:form commandName="miMemberAccount" method="post" id="miMemberAccountForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th>会员编号:</th>
    		<td>${miMemberAccount.memberNo }</td>
    	</tr>
    	<tr>
    		<th>开户银行:</th>
    		<td>${miMemberAccount.openBank }</td>
    	</tr>
    	<%--<tr>--%>
    		<%--<th><fmt:message key="miMemberAccount.bcity"/>:</th>--%>
    		<%--<td>${miMemberAccount.bcity }</td>--%>
    	<%--</tr>--%>
    	<tr>
    		<th>开户人姓名:</th>
    		<td>${miMemberAccount.bname }</td>
    	</tr>
    	<tr>
    		<th>银行账号:</th>
    		<td>${miMemberAccount.bnum }</td>
    	</tr>

    	<%--<tr>--%>
    		<%--<th><fmt:message key="miMemberAccount.companyCode"/>:</th>--%>
    		<%--<td>${miMemberAccount.companyCode }</td>--%>
    	<%--</tr>--%>
    	<%--<tr>--%>
    		<%--<th><fmt:message key="miMemberAccount.bprovince"/>:</th>--%>
    		<%--<td>${miMemberAccount.bprovince }</td>--%>
    	<%--</tr>--%>
    	<tr>
    		<th>支行名称:</th>
    		<td>${miMemberAccount.bbranch }</td>
    	</tr>
		<tr>
			<th>最后修改人编号:</th>
			<td>${miMemberAccount.lastEditorCode }</td>
		</tr>
		<tr>
			<th>最后修改人姓名:</th>
			<td>${miMemberAccount.lastEditorName }</td>
		</tr>
		<tr>
			<th>最后修改时间:</th>
			<td>${miMemberAccount.lastEitTime }</td>
		</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="accId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='miMemberAccounts.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>