<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="rptRuleCheckDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="rptRuleCheckDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="rptRuleCheck" method="post" id="rptRuleCheckForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.memberNo"/>:</th>
    		<td>${rptRuleCheck.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c1"/>:</th>
    		<td>${rptRuleCheck.c1 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c2"/>:</th>
    		<td>${rptRuleCheck.c2 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c3"/>:</th>
    		<td>${rptRuleCheck.c3 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c4"/>:</th>
    		<td>${rptRuleCheck.c4 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c5"/>:</th>
    		<td>${rptRuleCheck.c5 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c6"/>:</th>
    		<td>${rptRuleCheck.c6 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c7"/>:</th>
    		<td>${rptRuleCheck.c7 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c8"/>:</th>
    		<td>${rptRuleCheck.c8 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c9"/>:</th>
    		<td>${rptRuleCheck.c9 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c10"/>:</th>
    		<td>${rptRuleCheck.c10 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c11"/>:</th>
    		<td>${rptRuleCheck.c11 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c12"/>:</th>
    		<td>${rptRuleCheck.c12 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c13"/>:</th>
    		<td>${rptRuleCheck.c13 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c14"/>:</th>
    		<td>${rptRuleCheck.c14 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c15"/>:</th>
    		<td>${rptRuleCheck.c15 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c16"/>:</th>
    		<td>${rptRuleCheck.c16 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c17"/>:</th>
    		<td>${rptRuleCheck.c17 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c18"/>:</th>
    		<td>${rptRuleCheck.c18 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c19"/>:</th>
    		<td>${rptRuleCheck.c19 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c20"/>:</th>
    		<td>${rptRuleCheck.c20 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c21"/>:</th>
    		<td>${rptRuleCheck.c21 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c22"/>:</th>
    		<td>${rptRuleCheck.c22 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c23"/>:</th>
    		<td>${rptRuleCheck.c23 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c24"/>:</th>
    		<td>${rptRuleCheck.c24 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c25"/>:</th>
    		<td>${rptRuleCheck.c25 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c26"/>:</th>
    		<td>${rptRuleCheck.c26 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c27"/>:</th>
    		<td>${rptRuleCheck.c27 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c28"/>:</th>
    		<td>${rptRuleCheck.c28 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c29"/>:</th>
    		<td>${rptRuleCheck.c29 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c30"/>:</th>
    		<td>${rptRuleCheck.c30 }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="checkId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='rptRuleChecks.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>