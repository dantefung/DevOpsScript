<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sys.service.view"/></title>
    <meta name="heading" content="<fmt:message key="sys.service.view"/>"/>
</head>

<div class="contentBody">
	<form name="sysServiceFunctionForm" id="sysServiceFunctionForm" action="editSysService.jhtml" method="post" >
		<div class="functionBar">
				<a href="javascript:window.location.reload();" name="refresh">
                    <fmt:message key="button.refresh"/>
				</a>
		</div>
	</form>
	<c:if test="${not empty errMsgKey}">
		<br/>
    	<div class="error">
            <ul>
				<li><fmt:message key="${errMsgKey}"/></li>
            </ul>
        </div>
    </c:if>
	<c:if test="${not empty sysServices }">
		<form id="sysServiceListTableForm" method="get" >
			<ec:table 
				tableId="sysServiceListTable"
				items="sysServices"
				var="sysServiceVar"
				action="sysServices.jhtml"
				width="100%" method="get"
				autoIncludeParameters="true"
				sortable="false" form="sysServiceListTableForm" showPagination="false">
				<ec:row>
					<ec:column property="serviceName" title="service.title.serviceName">
						<fmt:message key="serviceName.${sysServiceVar.serviceName }"/>(${sysServiceVar.serviceName })
					</ec:column>
					<ec:column property="groupName" title="service.title.groupName">
						<fmt:message key="service.group.${sysServiceVar.groupName }"/>
					</ec:column>
					<ec:column property="activeCount" title="fi.status">
						<c:if test="${sysServiceVar.activeCount==0}"><fmt:message key="service.status.0"/></c:if>
						<c:if test="${sysServiceVar.activeCount>0}"><fmt:message key="service.status.1"/></c:if>
					</ec:column>
				</ec:row>
			</ec:table>
		</form>
	</c:if>
</div>