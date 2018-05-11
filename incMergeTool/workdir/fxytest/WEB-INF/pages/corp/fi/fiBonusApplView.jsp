<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusApplDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusApplDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusAppl" method="post" id="fiBonusApplForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.userCode"/>:</th>
    		<td>${fiBonusAppl.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.applType"/>:</th>
    		<td>${fiBonusAppl.applType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.amount"/>:</th>
    		<td>${fiBonusAppl.amount }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.createrCode"/>:</th>
    		<td>${fiBonusAppl.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.createrName"/>:</th>
    		<td>${fiBonusAppl.createrName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.createTime"/>:</th>
    		<td>${fiBonusAppl.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.status"/>:</th>
    		<td>${fiBonusAppl.status }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.checkerCode"/>:</th>
    		<td>${fiBonusAppl.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.checkerName"/>:</th>
    		<td>${fiBonusAppl.checkerName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.checkTime"/>:</th>
    		<td>${fiBonusAppl.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.operNo"/>:</th>
    		<td>${fiBonusAppl.operNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.companyCode"/>:</th>
    		<td>${fiBonusAppl.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.falseReason"/>:</th>
    		<td>${fiBonusAppl.falseReason }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.extApplyNo"/>:</th>
    		<td>${fiBonusAppl.extApplyNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.bonusType"/>:</th>
    		<td>${fiBonusAppl.bonusType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.openBank"/>:</th>
    		<td>${fiBonusAppl.openBank }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.bcity"/>:</th>
    		<td>${fiBonusAppl.bcity }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.bname"/>:</th>
    		<td>${fiBonusAppl.bname }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.bnum"/>:</th>
    		<td>${fiBonusAppl.bnum }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.sendAmt"/>:</th>
    		<td>${fiBonusAppl.sendAmt }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.fees"/>:</th>
    		<td>${fiBonusAppl.fees }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.property"/>:</th>
    		<td>${fiBonusAppl.property }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.fees1"/>:</th>
    		<td>${fiBonusAppl.fees1 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.fees2"/>:</th>
    		<td>${fiBonusAppl.fees2 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.fees3"/>:</th>
    		<td>${fiBonusAppl.fees3 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.bprovince"/>:</th>
    		<td>${fiBonusAppl.bprovince }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.bbranch"/>:</th>
    		<td>${fiBonusAppl.bbranch }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAppl.idNo"/>:</th>
    		<td>${fiBonusAppl.idNo }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="applNo"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiBonusAppls.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>