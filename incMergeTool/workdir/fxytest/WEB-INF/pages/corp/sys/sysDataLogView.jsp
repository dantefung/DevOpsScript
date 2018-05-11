<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message  key="sys.dataLog.update.view"/></title>
    <meta name="heading" content="<fmt:message  key="sys.dataLog.update.view"/>"/>
</head>

<div class="contentBody">
    <form method="post" onsubmit="return validateForm(this)" id="sysDataLogForm">
    <table class="detail">
    	<tr>
		    <th><fmt:message  key="sysDataLog.changeType"/>：</th>
		    <td><win:code listCode="change_type" value="${sysDataLog.change_type}"/></td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysDataLog.tableName"/>：</th>
		    <td>${sysDataLog.table_name }</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysDataLog.columnName"/>：</th>
		    <td>${sysDataLog.column_name }</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysDataLog.pidName"/>：</th>
		    <td>${sysDataLog.p_id_name }</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysDataLog.pidValue"/>：</th>
		    <td>${sysDataLog.p_id_value }</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysDataLog.beforeChange"/>：</th>
		    <td>${fn:replace(sysDataLog.before_change, vEnter, '<br>')}</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysDataLog.afterChange"/>：</th>
		    <td>${fn:replace(sysDataLog.after_change, vEnter, '<br>')}</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysUser.userCode"/>：</th>
		    <td>${sysDataLog.operator_person }</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysDataLog.operatorTime"/>：</th>
		    <td>${sysDataLog.operator_time }</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysDataLog.moduleName"/>：</th>
		    <td>${sysDataLog.module_name }</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysClickLog.hostName"/>：</th>
		    <td>${sysDataLog.host_name }</td>
		    </tr>
		
		    <tr>
		    <th><fmt:message  key="sysDataLog.ipAddress"/>：</th>
		    <td>${sysDataLog.ip_address }</td>
		    </tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" name="cancel" onclick="window.location='sysDataLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}
</script>