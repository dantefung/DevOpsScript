<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看会员累积消费调整单"/></title>
    <meta name="heading" content="<fmt:message key="查看会员累积消费调整单"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="poMemberPvAdjust" method="post" id="poMemberPvAdjustForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th>公司:</th>
    		<td>${poMemberPvAdjust.companyCode }</td>
    	</tr>
    	<tr>
    		<th>会员编号:</th>
    		<td>${poMemberPvAdjust.userCode }</td>
    	</tr>
    	<tr>
    		<th>调整额度:</th>
    		<td>${poMemberPvAdjust.adjustPv }</td>
    	</tr>
    	<tr>
    		<th>备注:</th>
    		<td><pre>${poMemberPvAdjust.remark }</pre></td>
    	</tr>
    	<tr>
    		<th>已审核:</th>
    		<td><win:code listCode="yesno" value="${poMemberPvAdjust.status }"/> </td>
    	</tr>
    	<tr>
    		<th>创建时间:</th>
    		<td>${poMemberPvAdjust.creatorCode } - ${poMemberPvAdjust.createTime }</td>
    	</tr>
    	<tr>
    		<th>审核时间:</th>
    		<td>${poMemberPvAdjust.checkerCode } - ${poMemberPvAdjust.checkTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='poMemberPvAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>