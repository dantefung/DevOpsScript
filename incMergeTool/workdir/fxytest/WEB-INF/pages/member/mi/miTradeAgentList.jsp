<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="apply.proxy.plate" /></title>
	<meta name="heading" content="<fmt:message key="apply.proxy.plate"/>" />
</head>

<ul class="nav nav-tabs">
	<li role="presentation">
		<a href="editMiTradeAgent.jhtml?strAction=memberAddMiTradeAgent"><fmt:message key="apply.proxy.plate"/></a>
	</li>
	<li role="presentation" class="active">
		<a href="miTradeAgents.jhtml">以往的申请</a>
	</li>
</ul>

<br/>

<%@ include file="/common/messages.jsp" %>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th></th>
			<th><fmt:message key="miMemberApalyCheck.askForNo" /></th>
			<th><fmt:message key="lang.plate.username" /></th>
			<th><fmt:message key="lang.plate.id" /></th>
			<th><fmt:message key="lang.plate.realname" /></th>
			<th><fmt:message key="miMemberApply.createTime" /></th>
			<th><fmt:message key="fi.status" /></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${miTradeAgents}" var="miTradeAgentVar">
			<tr>
				<td>
					<c:if test="${miTradeAgentVar.status==0 }">
						<win:power powerCode="memberReturnMiTradeAgent">
							<a href="javascript:returnMiTradeAgent('${miTradeAgentVar.appl_code}');" class="btn btn-danger btn-xs"><fmt:message key="申请交易盘代理" />取消</a>
						</win:power>
					</c:if>
				</td>
				<td>
					<%-- <a href="viewMiTradeAgent.jhtml?strAction=memberViewMiTradeAgent&applCode=${miTradeAgentVar.appl_code}" name="view"> --%>
					${miTradeAgentVar.appl_code}
					<!-- </a> -->
				</td>
				<td>${miTradeAgentVar.trade_user_name}</td>
				<td>${miTradeAgentVar.trade_id}</td>
				<td>${miTradeAgentVar.trade_true_name}</td>
				<td>${miTradeAgentVar.create_time}</td>
				<td>
					<win:code listCode="mi_trade_agent_status" value="${miTradeAgentVar.status }"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<win:page pageId="miTradeAgentsPager" action="miTradeAgents.jhtml" autoIncludeParameters="true"/>

<form action="editMiTradeAgent.jhtml" name="miTradeAgentFunctionForm" id="miTradeAgentFunctionForm" method="post">
	<input type="hidden" name="strAction" value=""/>
	<input type="hidden" name="applCode" value=""/>
</form>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
function returnMiTradeAgent(applCode){
	if(confirm("<fmt:message key='sure.cancel.cur.app' />？")){//确认取消当前申请
		var theForm=document.miTradeAgentFunctionForm;
		theForm.strAction.value="memberReturnMiTradeAgent";
		theForm.applCode.value=applCode;
		theForm.submit();
	}
}
</script>