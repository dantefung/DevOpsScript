<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="lang.my.application" /></title>
	<meta name="heading" content="<fmt:message key="lang.my.application"/>" />
</head>

<ul class="nav nav-tabs">
	<win:power powerCode="memberAgentView">
		<li role="presentation">
			<a href="viewMiAgentsInMap.jhtml"><fmt:message key="lang.orderCenter.enquery"/></a>
		</li>
	</win:power>
	<win:power powerCode="memberMiAgents">
		<li role="presentation" class="active">
			<a href="miAgents.jhtml"><fmt:message key="lang.my.application"/></a>
		</li>
	</win:power>
</ul>

<br/>

<%@ include file="/common/messages.jsp"%>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th><fmt:message key="sysOperationLog.moduleName"/></th>
			<th><fmt:message key="address.area"/></th>
			<th><fmt:message key="lang.contract.date"/></th>
			<th><fmt:message key="miMember.delivery.moblie"/></th>
			<th><fmt:message key="mi.email"/></th>
			<th><fmt:message key="fi.status"/></th>
			<th><fmt:message key="lang.application.date"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${miAgents}" var="miAgentVar">
			<tr>
				<td>
					<nobr>
					<%-- <c:if test="${miAgentVar.status!=9 }">
						<win:power powerCode="memberAddMiAgent">
							<a class="btn btn-info btn-xs" href="editMiAgentFile.jhtml?agentId=${miAgentVar.agent_id }">上传文件</a>
						</win:power>
					</c:if> --%>
					<c:if test="${miAgentVar.status==0 }">
						<win:power powerCode="memberUncheckMiAgent">
							<a class="btn btn-danger btn-xs" href="javascript:uncheckMiAgent(${miAgentVar.agent_id })"><fmt:message key="operation.button.cancel"/></a>
						</win:power>
					</c:if>
					</nobr>
				</td>
				<td>${miAgentVar.region_name}</td>
				<td>${fn:substring(miAgentVar.start_date,0,10) } <fmt:message key="label.to"/>  ${fn:substring(miAgentVar.end_date,0,10) }</td>
				<td>${miAgentVar.mobile}</td>
				<td>${miAgentVar.email}</td>
				<td><win:code listCode="mi_agent_status" value="${miAgentVar.status }" /></td>
				<td>${fn:substring(miAgentVar.create_time,0,10) }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<win:page pageId="miAgentsPager" action="miAgents.jhtml" autoIncludeParameters="true"/>

<form name="miAgentFunctionForm" id="miAgentFunctionForm" method="post" action="editMiAgent.jhtml">
	<input type="hidden" name="strAction"/>
	<input type="hidden" name="agentId"/>
</form>

<script type="text/javascript">
$(document).ready(function(){
    
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function uncheckMiAgent(agentId){
	var theForm=document.miAgentFunctionForm;
	if(confirm("<fmt:message key='lang.confrim.cancel.curr.app'/>"+"？")){
		theForm.strAction.value="memberUncheckMiAgent";
		theForm.agentId.value=agentId;
		showLoading();
		theForm.submit();
	}
}

</script>