<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="menu.user.operater.log"/></title>
    <meta name="heading" content="<fmt:message key="menu.user.operater.log"/>"/>
</head>

<div class="contentBody">
	<form method="post" action="editSysOperationLog.html" onsubmit="return validateSysOperationLog(this)" id="sysOperationLogForm">
	
		<input type="hidden" name="strAction" value="${param.strAction }" />
	
		<table class='detail'>
			<tr>
				<th><fmt:message key="sysOperationLog.operateTime" />:</th>
				<td>${sysOperationLog.operate_time }</td>
			</tr>
			
			<tr>
				<th><fmt:message key="bdReconsumMoneyReport.company" />:</th>
				<td >${sysOperationLog.company_code }</td>
			</tr>
	
			<tr>
				<th><fmt:message key="sysUser.userCode" />:</th>
				<td>${sysOperationLog.user_code } / ${sysOperationLog.user_name }</td>
			</tr>		
			<tr>
				<th><fmt:message key="sysOperationLog.moduleName" />:</th>
				<td>
					[<win:code listCode="sysoperationlog.dotype" value="${sysOperationLog.do_type}" />]
					<fmt:message key="${sysOperationLog.module_name }" />
				</td>
			</tr>
	
			<tr>
				<th><fmt:message key="sysOperationLog.visitUrl" />:</th>
				<td>${sysOperationLog.visit_url }</td>
			</tr>
			<tr>
				<th><fmt:message key="sysOperationLog.operaterCode" />:</th>
				<td>${sysOperationLog.operater_code } ${sysOperationLog.operater_name }</td>
			</tr>
			
			<tr>
				<th valign="top"><fmt:message key="sysOperationLog.operateData" />:</th>
				<td>
	
				<%
				request.setAttribute("x_n", "\n");
				%>
				${fn:replace(sysOperationLog.operate_data, x_n, '<br/>')}
	
				</td>
			</tr>
	
			<tr>
				<th><fmt:message key="comm.it.ip" />:</th>
				<td>${sysOperationLog.ip_addr }</td>
			</tr>
			<tr>
	    		<td colspan="2">
	    			<div class="buttonBar">
	    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    				<button type="button" name="cancel" onclick="history.back();"><fmt:message key="operation.button.cancel"/></button>
	                </div>
	    		</td>
	    	</tr>
	
		</table>
	
	</form>
</div>