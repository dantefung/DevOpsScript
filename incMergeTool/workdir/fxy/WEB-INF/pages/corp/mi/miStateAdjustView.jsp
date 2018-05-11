<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.applyFor.memberStatus.view"/></title>
    <meta name="heading" content="<fmt:message key="mi.applyFor.memberStatus.view"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="miStateAdjust" method="post" action="editMiStateAdjust.jhtml" onsubmit="return validateForm(this)" id="miStateAdjustForm">
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="labe.application.info"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="csServiceCenter.appCode"/>:</th>
    		<td>${miStateAdjust.adjustCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.department.apply"/>:</th>
    		<td><win:code listCode="mi.department.list" value="${miStateAdjust.applyDepartmemt }"/></td>
    	</tr>
    	<tr>
    		<th>生成方式:</th>
    		<td><win:code listCode="member_status_apply_method" value="${miStateAdjust.createMethod}"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.askFor.status"/>:</th>
    		<td><win:code listCode="member_apply_status" value="${miStateAdjust.status}"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${miStateAdjust.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.adjust.team"/>:</th>
    		<td><win:code listCode="yesno" value="${miStateAdjust.changeTeam }"/></td>
    	</tr>
    	<c:if test="${miStateAdjust.changeSuspendStatus==1}">
	    	<tr>
	    		<th><fmt:message key="mi.new.limitStatus"/>:</th>
	    		<td>
	    			<span class="important"><win:code listCode="sysuser.suspendstatus" value="${miStateAdjust.newSuspendStatus }"/></span>
	    		</td>
	    	</tr>
    	</c:if>
    	
    	<c:if test="${miStateAdjust.changeFreezeStatus==1}">
	    	<%-- <tr>
	    		<th><fmt:message key="mi.new.frost.status"/>:</th>
	    		<td>
	    			<span class="important"><win:code listCode="sysuser.freezestatus" value="${miStateAdjust.newFreezeStatus }"/></span>
	    		</td>
	    	</tr> --%>
	    	<tr>
	    		<th><fmt:message key="mi.freeze.accounts"/>(<fmt:message key="mi.new.frost.status"/>):</th>
	    		<td>
	    			<c:if test="${miStateAdjust.freezeMenuAccounts=='1'}">
	    				<span class="important"><win:code listCode="sysuser.freezestatus" value="${miStateAdjust.freezeMenuAccounts }"/></span>
	    			</c:if>
	    			<c:if test="${miStateAdjust.freezeMenuAccounts=='0'}">
	    				<span style="color: green;"><win:code listCode="sysuser.freezestatus" value="${miStateAdjust.freezeMenuAccounts }"/></span>
	    			</c:if>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mi.freeze.bonus"/>(<fmt:message key="mi.new.frost.status"/>):</th>
	    		<td>
	    			<c:if test="${miStateAdjust.freezeMenuBonus=='1'}">
	    				<span class="important"><win:code listCode="sysuser.freezestatus" value="${miStateAdjust.freezeMenuBonus }"/></span>
    				</c:if>
    				<c:if test="${miStateAdjust.freezeMenuBonus=='0'}">
	    				<span style="color: green;"><win:code listCode="sysuser.freezestatus" value="${miStateAdjust.freezeMenuBonus }"/></span>
    				</c:if>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mi.userupdate"/>(<fmt:message key="mi.new.frost.status"/>):</th>
	    		<td>
	    			<c:if test="${miStateAdjust.freezeMenuInfo=='1'}">
	    				<span class="important"><win:code listCode="sysuser.freezestatus" value="${miStateAdjust.freezeMenuInfo }"/></span>
	    			</c:if>
	    			<c:if test="${miStateAdjust.freezeMenuInfo=='0'}">
	    				<span style="color: green;"><win:code listCode="sysuser.freezestatus" value="${miStateAdjust.freezeMenuInfo }"/></span>
	    			</c:if>
	    		</td>
	    	</tr>
	    </c:if>
    	<c:if test="${miStateAdjust.changeExitStatus==1}">
	    	<tr>
	    		<th><fmt:message key="mi.new.exitStatus"/>:</th>
	    		<td>
	    			<span class="important"><win:code listCode="member.exitstatus" value="${miStateAdjust.newExitStatus }"/></span>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th><fmt:message key="miMemberApply.creatorNo"/>:</th>
    		<td>${miStateAdjust.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberApply.createTime"/>:</th>
    		<td>${miStateAdjust.createTime }</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="miMemberApply.createRemark"/>:</th>
    		<td>${fn:replace(miStateAdjust.adjustRemark, vEnter, '<br>')}</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="miMemberApalyCheck.relevance.file"/>:</th>
    		<td colspan="2">
    			<c:forEach items="${miStateFiles }" var="miStateFileVar">
    				<img src="${ctx}/themes/${theme }/images/attach/${miStateFileVar.suffixName}.gif" border="0" width="16" height="16"/>
					<a href="<c:url value="${miStateFileVar.fileUrl}"/>">${miStateFileVar.fileName }</a>
					<br/>
    			</c:forEach>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="mi.examine.info"/></td>
    	</tr>
    	<c:if test="${not empty checkLogList }">
	    	<c:forEach items="${checkLogList }" var="log">
	    		<c:if test="${log.checkStep == '-1' }">
		    	 	<tr>
			    		<th valign="top"><fmt:message key="mi.return.applyFor"/>(${log.checkerName }):</th>
			    		<td colspan="2">${log.remark }&nbsp;[${log.checkTime }]</td>
				    </tr>
	    	 	</c:if>
	    	 	<c:if test="${log.checkStep != '-1' }">
		    		<tr>
			    		<th valign="top"><win:code listCode="mi.status.check.step.list" value="${log.checkStep }"></win:code>&nbsp;(${log.checkerName }) :</th>
			    		<td colspan="2">${log.remark }&nbsp;[${log.checkTime }]</td>
				    </tr>
			    </c:if>
	    	</c:forEach>
    	</c:if>
    	<tr>
    		<th><fmt:message key="miMemberApply.checkerNo"/>:</th>
    		<td>${miStateAdjust.approverCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
    		<td>${miStateAdjust.approveTime }</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="pdSendApp.checkRemark"/>:</th>
    		<td>${fn:replace(miStateAdjust.checkRemark, vEnter, '<br>')}</td>
    	</tr>
    </table>
    
    </form:form>
</div>