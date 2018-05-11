<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="common.information"/></title>
    <meta name="heading" content="<fmt:message key='common.information'/>"/>
</head>

<div class="contentBody">
    <table class="detail">
    	
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
    	</tr>

    	<tr>
    		<th><fmt:message key="label.company"/>:</th>
    		<td>${icAnnounce.companyCode}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="menu.am.browserAmAnnounceF"/>:</th>
    		<td>
    		  <c:forEach items="${icAnnouncePermitList}" var="icAnnouncePermitVar">
    		     <win:code listCode="user_type" value="${icAnnouncePermitVar.userType }"/> &nbsp&nbsp&nbsp	     
    		  </c:forEach>
    		</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="icAnnounce.title"/>:</th>
    		<td>${icAnnounce.title}</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="icAnnounce.content"/>:</th>
    		<td>${icAnnounce.content}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.activeDate"/>:</th>
    		<td><fmt:formatDate value="${icAnnounce.activeDate}" pattern="yyyy-MM-dd"/> </td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.expireDate"/>:</th>
    		<td><fmt:formatDate value="${icAnnounce.expireDate}" pattern="yyyy-MM-dd"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.isTop"/>:</th>
    		<td>${icAnnounce.isTop==0?"否":"是"}</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<button type="button" name="cancel" onclick="window.location='icAnnounces.jhtml?strAction=icAnnounceList&needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
</div>









