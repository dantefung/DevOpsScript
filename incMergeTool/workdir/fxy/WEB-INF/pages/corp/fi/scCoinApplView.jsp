<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看启动积分申请"/></title>
    <meta name="heading" content="<fmt:message key="查看启动积分申请"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="scCoinAppl" method="post" id="scCoinApplForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th>申请单号:</th>
    		<td>
    			${scCoinAppl.applCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="公司"/>:</th>
    		<td>
    			${scCoinAppl.companyCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="会员编号"/>:</th>
    		<td>
    			${scCoinAppl.userCode }
    		</td>
    	</tr>
    	<tr>
    		<th>申请导出的启动积分值:</th>
    		<td>${scCoinAppl.applAmount }</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th>当前状态:</th>
    		<td>
    			<win:code listCode="coin2kmc_appl_status" value="${scCoinAppl.status }"/>
    		</td>
    	</tr>
    	<c:if test="${not empty scCoinAppl.remark }">
	    	<tr>
	    		<th>备注:</th>
	    		<td>${fn:replace(scCoinAppl.remark, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td>${scCoinAppl.creatorCode } - ${scCoinAppl.createTime }</td>
    	</tr>
    	<c:if test="${scCoinAppl.status==1 || scCoinAppl.status==2 || scCoinAppl.status==3}">
	    	<tr>
	    		<th><fmt:message key="审核时间"/>:</th>
	    		<td>${scCoinAppl.checkerCode } - ${scCoinAppl.checkTime }</td>
	    	</tr>
    	</c:if>
    	<c:if test="${scCoinAppl.status==9}">
	    	<tr>
	    		<th>退回时间:</th>
	    		<td>${scCoinAppl.returnCode } - ${scCoinAppl.returnTime }</td>
	    	</tr>
	    	<c:if test="${not empty scCoinAppl.returnRemark }">
		    	<tr>
		    		<th>退回备注:</th>
		    		<td>${fn:replace(scCoinAppl.returnRemark, vEnter, '<br>')}</td>
		    	</tr>
	    	</c:if>
    	</c:if>
    	<c:if test="${scCoinAppl.status==2 || scCoinAppl.status==3}">
	    	<tr>
	    		<th>处理时间:</th>
	    		<td>${scCoinAppl.handlerCode } - ${scCoinAppl.handleTime }</td>
	    	</tr>
	    	<c:if test="${not empty scCoinAppl.handleRemark }">
		    	<tr>
		    		<th>处理备注:</th>
		    		<td>${fn:replace(scCoinAppl.handleRemark, vEnter, '<br>')}</td>
		    	</tr>
	    	</c:if>
    	</c:if>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='scCoinAppls.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>