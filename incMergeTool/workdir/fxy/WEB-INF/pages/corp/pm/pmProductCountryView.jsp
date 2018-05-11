<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmProductCountryDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pmProductCountryDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pmProductCountry" method="post" id="pmProductCountryForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductCountry.productCode"/>:</th>
    		<td>${pmProductCountry.productCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductCountry.regionCode"/>:</th>
    		<td>${pmProductCountry.regionCode }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pmProductCountrys.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>