<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="function.menu.memberRegister"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.memberRegister"/>"/>
</head>

<div class="contentBody">
    <table class="detail">
    	
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
    	</tr>

    	<tr>
    		<th><fmt:message key="mi.realname"/>:</th>
    		<td>${miMember.firstName}${miMember.lastName}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.register.petName"/>:</th>
    		<td>${miMember.petName}</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="miMember.certificateType"/>:</th>
    		<td><win:code listCode="member.cardtype" value="${miMember.idType }"/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="mi.lable.cardNo"/>:</th>
    		<td>${miMember.idNo}</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="miMember.delivery.moblie"/>:</th>
    		<td>${miMember.mobile}</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="mi.email"/>:</th>
    		<td>${miMember.email}</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="miMember.delivery.area"/>:</th>
    		<td>${addressInfo}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.addrees.detail"/>:</th>
    		<td>${miMember.address1}&nbsp;&nbsp;${miMember.address2}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
    		<td>${miMember.zipcode}</td>
    	</tr>
    	
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="mi.registplace"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.recommendNo"/>:</th>
    		<td>${miMember.recommendNo}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.joindate"/>:</th>
    		<td>${miMember.createTime}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.activity.time"/>:</th>
    		<td>${miMember.activeTime}</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<button type="button" name="cancel" onclick="window.location='memberRegisters.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
</div>