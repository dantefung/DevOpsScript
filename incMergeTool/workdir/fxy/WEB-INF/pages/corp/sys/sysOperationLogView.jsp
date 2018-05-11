<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@page import="com.cn1win.tjc.service.sys.SysDataLogManager" %>
<%@page import="com.cn1win.tjc.model.sys.SysDataLog" %>
<%@page import="com.cn1win.tjc.model.sys.SysOperationLog" %>
<%@page import="java.util.List" %>
<%@page import="java.util.HashMap" %>
<%@page import="com.cn1win.tjc.web.util.LocaleUtil" %>
<%@page import="com.cn1win.tjc.web.util.ListUtil" %>
<%@page import="com.cn1win.tjc.web.util.SessionUtil"%>

<%
SysDataLogManager sysDataLogManager=(SysDataLogManager)request.getAttribute("sysDataLogManager");
%>
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
			
			<c:if test="${param.viewData=='postData'}">
			<tr>
				<th><fmt:message key="sysOperationLog.operateData" />:</th>
				<td>
	
				<%
				request.setAttribute("x_n", "\n");
				%>
				${fn:replace(sysOperationLog.operate_data, x_n, '<br/>')}
	
				</td>
			</tr>
			</c:if>
	
			<tr>
				<th><fmt:message key="comm.it.ip" />:</th>
				<td>${sysOperationLog.ip_addr }</td>
			</tr>
			
			<c:if test="${param.viewData=='changedData'}">
			<tr>
				<th valign="top"><fmt:message key="msgclassno.5" />:</th>
				<td>
				<%
				com.cn1win.util.web.ParameterMap paramMap = com.cn1win.util.web.RequestUtil.toParameterMap(request);
						HashMap sysOperationLog=(HashMap)request.getAttribute("sysOperationLog");
						List sysDataLogs=sysDataLogManager.getSysDataLogs(sysOperationLog.get("log_id").toString(),paramMap.getParameter("month"));
						if(sysDataLogs!=null && sysDataLogs.size()>0){
							String oldTableName="";
							String oldPIdName="";
							String oldPIdValue="";
							boolean showTitle=true;
							for(int i=0;i<sysDataLogs.size();i++){
								HashMap sysDataLog=(HashMap)sysDataLogs.get(i);
								if(i==0){
									oldTableName=(String)sysDataLog.get("table_name");
									oldPIdName=(String)sysDataLog.get("p_id_name");
									oldPIdValue=(String)sysDataLog.get("p_id_value");
								}
								if(showTitle){
									out.print("<font color=red>"+ListUtil.getListValue("change_type",(String)sysDataLog.get("change_type"),SessionUtil.getSessionLoginUser(request).getLocale())+"</font><br>");
									out.print(sysDataLogManager.getFieldComment((String)sysDataLog.get("table_name"), (String)sysDataLog.get("p_id_name")).toLowerCase()+" = [ "+(String)sysDataLog.get("p_id_value")+"]<br>");
								}
								
								showTitle=false;
								out.println(sysDataLogManager.getFieldComment((String)sysDataLog.get("table_name"), (String)sysDataLog.get("column_name")).toLowerCase()+ " = [ "+(sysDataLog.get("before_change")==null?"":(String)sysDataLog.get("before_change"))+" ] --> [ "+(sysDataLog.get("after_change")==null?"":(String)sysDataLog.get("after_change"))+" ]<br>");
								if(!oldTableName.equalsIgnoreCase((String)sysDataLog.get("table_name")) || !oldPIdName.equalsIgnoreCase((String)sysDataLog.get("p_id_name")) || !oldPIdValue.equalsIgnoreCase((String)sysDataLog.get("p_id_value"))){
									showTitle=true;
									out.println("<hr/>");
								}
								
								oldTableName=(String)sysDataLog.get("table_name");
								oldPIdName=(String)sysDataLog.get("p_id_name");
								oldPIdValue=(String)sysDataLog.get("p_id_value");
							}
						}
				%>
				</td>
			</tr>
			</c:if>
			
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