<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="notice.select.user"/></title>
    <meta name="heading" content="<fmt:message key="notice.select.user"/>"/>
</head>

<form name="frm" action="<c:url value='/corp/sysUserSelect.jhtml'/>" target="_self">
	<div id="titleBar">
		<table width="100%" border="0">
			<tr>
				<td>
					<input type="hidden" id="selectControl" name="selectControl" value="${param.selectControl}"/>
					<input type="hidden" id="strAction" name="strAction" value="${param.strAction}"/>
					<input type="hidden" id="userCodeElementId" name="userCodeElementId" value="${param.userCodeElementId}"/>
					<input type="hidden" id="userNameElementId" name="userNameElementId" value="${param.userNameElementId}"/>
					
					 <fmt:message  key="fiPayAdvice.userCode"/>:
					<input name="userCode" id="userCode" value="<c:out value='${param.userCode}'/>" cssClass="text medium"/>
				
					<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				</td>
			</tr>
		</table>
	</div>
</form>

<form id="poOrderListTableForm" method="get" >
	<ec:table tableId="sysUserListTable"
		items="sysUserList"
		var="sysUser"
		action="sysUserSelect.jhtml"
		method="get"
		retrieveRowsCallback="limit"
		width="100%"
		form="poOrderListTableForm"
		autoIncludeParameters="true"
		rowsDisplayed="20" sortable="false">
			<ec:row onclick="javascript:selectSysUser('${sysUser.userCode}','${sysUser.userName}')">
			
   			<ec:column property="userCode" title="fiPayAdvice.userCode" />
   			<ec:column property="userName" title="sys.user.username" />
   			
			</ec:row>
	
	</ec:table>
</form>


<script type="text/javascript">
    function selectSysUser(userCode,userName){
   
    	var ret = new Object();
    	ret['userCode']=userCode;
    	ret['userName']=userName;
    	 
    	parent.window.returnValue=ret;
    	parent.window.close();
 
		}
    
		
</script>
