<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="label.history.records"/></title>
    <meta name="heading" content="<fmt:message key="label.history.records"/>"/>
</head>

<ul class="nav nav-tabs">
	<li role="presentation">
		<a href="editFiAcConvert.jhtml?strAction=memberEditFiAcConvert"><fmt:message key="menu.memberEditFiAcConvert"/></a>
	</li>
	<li role="presentation" class="active">
		<a href="fiAcConverts.jhtml"><fmt:message key="label.history.records"/></a>
	</li>
</ul>

<br/>

<form:form commandName="fiAcTrans" method="post" id="fiAcTransForm">
    
    <table class="detail">
    	<tr>
    		<th><fmt:message key="stStockLog.sourceOrderNo"/>:</th>
    		<td>${fiAcTrans.tranNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="labe.in.and.or.account.type"/>:</th>
    		<td><win:code listCode="bank_account_types" value="${fiAcTrans.outAcType }"/>=><win:code listCode="bank_account_types" value="${fiAcTrans.inAcType }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.fi.out.coin"/>:</th>
    		<td>${fiAcTrans.outMoney }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.fi.in.coin.amount"/>:</th>
    		<td>${fiAcTrans.inMoney }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td>
    			<c:if test="${fiAcTrans.status==99 }"><span class="label label-default"><fmt:message key="pr.returned"/></span></c:if>
				<c:if test="${fiAcTrans.status!=99 }">
					<c:if test="${fiAcTrans.orderType==2}">
						<c:if test="${fiAcTrans.isBonus==2 }"><span class="label label-success"><fmt:message key="label.succed"/></span></c:if>
						<c:if test="${fiAcTrans.isBonus!=2 }"><span class="label label-primary"><fmt:message key="label.waiting"/></span></c:if>
					</c:if>
					<c:if test="${fiAcTrans.orderType==0}">
						<c:if test="${fiAcTrans.status==1 }"><span class="label label-success"><fmt:message key="label.succed"/></span></c:if>
					</c:if>
				</c:if>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberApply.createTime"/>:</th>
    		<td>${fiAcTrans.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><pre>${fiAcTrans.memo }</pre></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" class="btn btn-default" name="return" onclick="window.location='fiAcConverts.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>

</form:form>

<script type="text/javascript">
//
</script>