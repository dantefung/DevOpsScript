<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdWshareListDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdWshareListDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdWshareList" method="post" id="bdWshareListForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWshareList.shareLevel"/>:</th>
    		<td>${bdWshareList.shareLevel }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWshareList.perSell"/>:</th>
    		<td>${bdWshareList.perSell }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWshareList.bonus"/>:</th>
    		<td>${bdWshareList.bonus }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="memberNo"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='bdWshareLists.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>