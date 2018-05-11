<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看交易盘代理申请"/></title>
    <meta name="heading" content="<fmt:message key="查看交易盘代理申请"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="miTradeAgent" method="post" id="miTradeAgentForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="公司"/>:</th>
    		<td>
    			${miTradeAgent.companyCode }
    		</td>
    	</tr>
    	<tr>
    		<th>申请单号:</th>
    		<td>
    			${miTradeAgent.applCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="会员编号"/>:</th>
    		<td>
    			${miTradeAgent.userCode }
    		</td>
    	</tr>
    	<tr>
    		<th>交易盘用户名:</th>
    		<td>
    			${miTradeAgent.tradeUserName }
    		</td>
    	</tr>
    	<tr>
    		<th>交易盘ID:</th>
    		<td>
    			${miTradeAgent.tradeId }
    		</td>
    	</tr>
    	<tr>
    		<th>交易盘姓名:</th>
    		<td>
    			${miTradeAgent.tradeTrueName }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td>
    			${fn:replace(miTradeAgent.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td>${miTradeAgent.creatorCode } - ${miTradeAgent.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="审核时间"/>:</th>
    		<td>${miTradeAgent.checkerCode } - ${miTradeAgent.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="取消时间"/>:</th>
    		<td>${miTradeAgent.cancleCode } - ${miTradeAgent.cancleTime }</td>
    	</tr>
    	<tr>
    		<th>状态:</th>
    		<td><win:code listCode="mi_agent_status" value="${miTradeAgent.status }" /></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="applCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='miTradeAgents.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>