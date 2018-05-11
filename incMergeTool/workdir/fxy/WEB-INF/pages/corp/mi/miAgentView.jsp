<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看报单中心"/></title>
    <meta name="heading" content="<fmt:message key="查看报单中心"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="miAgent" method="post" id="miAgentForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="公司"/>:</th>
    		<td>
    			${miAgent.companyCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="会员编号"/>:</th>
    		<td>
    			${miAgent.userCode }
    		</td>
    	</tr>
    	<%-- <tr>
    		<th><fmt:message key="区域"/>:</th>
    		<td>
    			${fullRegionName}
    		</td>
    	</tr> --%>
    	<tr>
    		<th>合同日期有效日期:</th>
    		<td>
    			${fn:substring(miAgent.startDate,0,10)}
				 至
				${fn:substring(miAgent.endDate,0,10)}
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td>
    			${fn:replace(miAgent.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td>${miAgent.creatorCode } - ${miAgent.createTime }</td>
    	</tr>
    	<%-- <tr>
    		<th><fmt:message key="审核时间"/>:</th>
    		<td>${miAgent.checkerCode } - ${miAgent.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="取消时间"/>:</th>
    		<td>${miAgent.cancleCode } - ${miAgent.cancleTime }</td>
    	</tr> --%>
    	<tr>
    		<th>状态:</th>
    		<td><win:code listCode="mi_agent_status" value="${miAgent.status }" /></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="agentId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='miAgents.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>