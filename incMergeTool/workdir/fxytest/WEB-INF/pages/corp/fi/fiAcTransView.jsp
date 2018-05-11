<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiAcTransDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiAcTransDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAcTrans" method="post" id="fiAcTransForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.tranNo"/>:</th>
    		<td>${fiAcTrans.tranNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.outAcType"/>:</th>
    		<td>${fiAcTrans.outAcType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.outCompanyCode"/>:</th>
    		<td>${fiAcTrans.outCompanyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.outMemberNo"/>:</th>
    		<td>${fiAcTrans.outMemberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.outCurrency"/>:</th>
    		<td>${fiAcTrans.outCurrency }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.outRate"/>:</th>
    		<td>${fiAcTrans.outRate }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.outMoney"/>:</th>
    		<td>${fiAcTrans.outMoney }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.handlingFee"/>:</th>
    		<td>${fiAcTrans.handlingFee }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.inAcType"/>:</th>
    		<td>${fiAcTrans.inAcType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.inCompanyCode"/>:</th>
    		<td>${fiAcTrans.inCompanyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.inMemberNo"/>:</th>
    		<td>${fiAcTrans.inMemberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.inCurrency"/>:</th>
    		<td>${fiAcTrans.inCurrency }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.inRate"/>:</th>
    		<td>${fiAcTrans.inRate }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.inMoney"/>:</th>
    		<td>${fiAcTrans.inMoney }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.status"/>:</th>
    		<td>${fiAcTrans.status }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.creatorCode"/>:</th>
    		<td>${fiAcTrans.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.createTime"/>:</th>
    		<td>${fiAcTrans.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.checkerCode"/>:</th>
    		<td>${fiAcTrans.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.checkTime"/>:</th>
    		<td>${fiAcTrans.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.memo"/>:</th>
    		<td>${fiAcTrans.memo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.remark"/>:</th>
    		<td>${fiAcTrans.remark }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiAcTranss.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>