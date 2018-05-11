<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="导出FCF管理"/></title>
    <meta name="heading" content="<fmt:message key="导出FCF管理"/>"/>
</head>

<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="fiAcAppl" method="post" id="fiAcApplForm">
    
	    <table class="detail">
	    	<tr>
	    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
	    	</tr>
	    	<tr>
	    		<th>申请单号:</th>
	    		<td>
	    			${fiAcAppl.applNo }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="公司"/>:</th>
	    		<td>
	    			${fiAcAppl.companyCode }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="会员编号"/>:</th>
	    		<td>
	    			${fiAcAppl.memberNo }
	    		</td>
	    	</tr>
	    	<tr>
    		<th>申请导出积分:</th>
	    		<td>${fiAcAppl.amount }</td>
	    	</tr>
	    	<tr>
	    		<th>FCF账户地址:</th>
	    		<td>${fiAcAppl.caddress }</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2" class="title">其它信息</td>
	    	</tr>
	    	<tr>
	    		<th>当前状态:</th>
	    		<td>
	    			<win:code listCode="bonus_appl_status" value="${fiAcAppl.status }"/>
	    		</td>
	    	</tr>
	    	<c:if test="${not empty fiAcAppl.memo }">
		    	<tr>
		    		<th>备注:</th>
		    		<td>${fn:replace(fiAcAppl.memo, vEnter, '<br>')}</td>
		    	</tr>
	    	</c:if>
	    	<tr>
	    		<th><fmt:message key="创建时间"/>:</th>
	    		<td>${fiAcAppl.createrCode } - ${fiAcAppl.createTime }</td>
	    	</tr>
	    	<c:if test="${fiAcAppl.status==1 || fiAcAppl.status==3 || fiAcAppl.status==4}">
		    	<tr>
		    		<th><fmt:message key="审核时间"/>:</th>
		    		<td>${fiAcAppl.checkerCode } - ${fiAcAppl.checkTime }</td>
		    	</tr>
	    	</c:if>
	    	<c:if test="${fiAcAppl.status==9}">
		    	<tr>
		    		<th>退回时间:</th>
		    		<td>${fiAcAppl.returnCode } - ${fiAcAppl.returnTime }</td>
		    	</tr>
		    	<c:if test="${not empty fiAcAppl.returnRemark }">
			    	<tr>
			    		<th>退回备注:</th>
			    		<td>${fn:replace(fiAcAppl.returnRemark, vEnter, '<br>')}</td>
			    	</tr>
		    	</c:if>
	    	</c:if>
	    	<c:if test="${fiAcAppl.status==3 || fiAcAppl.status==4}">
		    	<tr>
		    		<th>处理时间:</th>
		    		<td>${fiAcAppl.sendCode } - ${fiAcAppl.sendTime }</td>
		    	</tr>
		    	<c:if test="${not empty fiAcAppl.falseReason }">
			    	<tr>
			    		<th>失败原因:</th>
			    		<td>${fn:replace(fiAcAppl.falseReason, vEnter, '<br>')}</td>
			    	</tr>
		    	</c:if>
	    	</c:if>
	    	<c:if test="${param.strAction=='failFiAcAppl' }">
	    	<tr>
	    		<th>失败原因:</th>
	    		<td><form:textarea path="falseReason" cols="60" rows="4"/></td>
	    	</tr>
	    	</c:if>
	    	
	    	<tr>
	    		<td colspan="2">
	    			<div class="buttonBar">
	    				<button type="button" name="cancel" onclick="window.location='fiAcApplToETBs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
	                </div>
	    		</td>
	    	</tr>
	    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>