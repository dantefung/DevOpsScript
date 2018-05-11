<%@ page language="java"  errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@page import="java.util.List" %>
<%@page import="java.util.HashMap" %>
<%@ include file="/common/taglibs.jsp"%>
<%
com.cn1win.tjc.service.sys.SysDataLogManager sysDataLogManager=(com.cn1win.tjc.service.sys.SysDataLogManager)request.getAttribute("sysDataLogManager");
%>
<head>
    <title><fmt:message key="menu.user.operater.log"/></title>
    <meta name="heading" content="<fmt:message key="menu.user.operater.log"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysOperationLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="label.month"/></dd>
			<dd>
				<select name="month">
					<c:forEach items="${dates }" var="dateVar">
						<option value="${dateVar }"<c:if test="${dateVar==param.month}"> selected</c:if>>${dateVar}</option>
					</c:forEach>
				</select>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysOperationLog.operaterCode"/></dd>
			<dd><input name="userCode" type="text" value="${param.userCode }" size="16"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sys.handler.no"/></dd>
			<dd><input name="operaterCode" type="text" value="${param.operaterCode }" size="16"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="comm.it.ip"/></dd>
			<dd><input name="ipAddr" type="text" value="${param.ipAddr }" size="16"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysOperationLog.operateTime"/></dd>
			<dd>
				<input name="startOperateTime" id="startOperateTime" type="text" value="${param.startOperateTime }" size="14"/> - 
				<input name="endOperateTime" id="endOperateTime" type="text" value="${param.endOperateTime }" size="14"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="desc.key.value"/></dd>
			<dd><input name="keyValue" type="text" value="${param.keyValue }" size="16"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysOperationLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	<form action="" method="get" name="sysOperationLogForm" id="sysOperationLogForm">
	<ec:table 
		tableId="sysOperationLogListTable" 
		items="sysOperationLogs" 
		var="sysOperationLog" 
		autoIncludeParameters="true"
		retrieveRowsCallback="limit"
		form="sysOperationLogForm"
		action="${pageContext.request.contextPath}/sysOperationLogs.html" 
		width="100%" rowsDisplayed="20" 
		sortable="false" 
		imagePath="/wecs/images/extremetable/*.gif">
		<ec:row highlightRow="false">
			<ec:column property="log_id" title="title.view" sortable="false" style="white-space: nowrap;width:5px;">
	  			<win:power powerCode="viewSysOperationLog">
					<a href="viewSysOperationLog.jhtml?strAction=viewSysOperationLog&logId=${sysOperationLog.log_id}&viewData=changedData&month=${param.month }" name="view">
					<fmt:message key="function.menu.view"/></a>
				</win:power>
			</ec:column>
			<ec:column property="operate_time" title="sysOperationLog.operateTime" />
			<ec:column property="operater_code" title="title.operator" >
				${sysOperationLog.operater_code }&nbsp;${sysOperationLog.operater_name }
			</ec:column>
			<ec:column property="ip_addr" title="comm.it.ip" />
			<ec:column property="module_name" title="sysOperationLog.moduleName" >
				[<win:code listCode="sysoperationlog.dotype" value="${sysOperationLog.do_type}"/>]
				<fmt:message key="${sysOperationLog.module_name }"/>
			</ec:column>
			<ec:column property="company_code" title="bdReconsumMoneyReport.company" />
		</ec:row>
		
		<c:if test="${ROWCOUNT>0}">
			<c:if test="${ROWCOUNT%2!=0}"><tr class="odd"></c:if>
			<c:if test="${ROWCOUNT%2==0}"><tr class="even"></c:if>
				<td colspan="4">&nbsp;</td>
				<td colspan="2">
				<c:set var="operationLogId" value="${sysOperationLog.log_id}" scope="request"/>
				<font color="#888888">
				<%
				com.cn1win.util.web.ParameterMap paramMap = com.cn1win.util.web.RequestUtil.toParameterMap(request);
						String logId=request.getAttribute("operationLogId").toString();
						List sysDataLogs=sysDataLogManager.getSysDataLogs(logId,paramMap.getParameter("month"));
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
									out.print("<font color=red>"+com.cn1win.tjc.web.util.ListUtil.getListValue("change_type",(String)sysDataLog.get("change_type"),com.cn1win.tjc.web.util.SessionUtil.getSessionLoginUser(request).getLocale())+"</font><br>");
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
				</font>
				</td>
			</tr>
		</c:if>
		
	</ec:table>
</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

$(function() {
	$( "#startOperateTime,#endOperateTime" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});
</script>