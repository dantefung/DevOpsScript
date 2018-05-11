<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.link.change.view"/></title>
    <meta name="heading" content="<fmt:message key="mi.link.change.view"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="miMemberApply" method="post" action="viewMiLinkChange.jhtml" id="miMemberApplyForm" onsubmit="return validateForm(this)">
    
   	<spring:bind path="miMemberApply.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
    <table class="detail" width="90%">
    	<tr>
    		<th><fmt:message key="miMemberApalyCheck.askForNo"/>:</th>
    		<td colspan="2">${miMemberApply.applyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.department.apply"/>:</th>
    		<td><win:code listCode="mi.department.list" value="${miMemberApply.applyDepartment }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td colspan="2">${miMemberApply.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.memberName"/>:</th>
    		<td colspan="2">${miMember.lastName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td colspan="2">${miMemberApply.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.createUser"/>:</th>
    		<td colspan="2">${miMemberApply.createrName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td colspan="2"><win:code listCode="member_apply_status" value="${miMemberApply.status}"/></td>
    	</tr>
    	<tr>
    		<td colspan="3"><hr/></td>
    	</tr>
    	<tr>
    		<td style="font-weight: bold;"><fmt:message key="bdBonusStatReport.item"/></th>
    		<td style="font-weight: bold;"><fmt:message key="miMemberApalyCheck.oldContent"/></td>
    		<td style="font-weight: bold;"><fmt:message key="miMemberApalyCheck.newContent"/></td>
    	</tr>
		<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER }">
	    	<tr>
	    		<td colspan="3" class="title"><fmt:message key="mi.lable.spacial.info"/></td>
	    	</tr>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.LINK_NO}">
	    	<tr>
	    		<th><fmt:message key="miMember.linkNo"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.LINK_NO.OLD_VALUE} (${miMemberApplyDetailMap.MI_MEMBER.LINK_NO.OLD_LINK_NAME})</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.LINK_NO.NEW_VALUE} (${miMemberApplyDetailMap.MI_MEMBER.LINK_NO.NEW_LINK_NAME})</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.LEAF_TYPE}">
	    	<tr>
	    		<th><fmt:message key="lang.leftRightZone"/>:</th>
	    		<td><win:code listCode="tree_left_right" value="${miMemberApplyDetailMap.MI_MEMBER.LEAF_TYPE.OLD_VALUE}"/></td>
	    		<td><win:code listCode="tree_left_right" value="${miMemberApplyDetailMap.MI_MEMBER.LEAF_TYPE.NEW_VALUE}"/></td>
	    	</tr>
	    	</c:if>
	    </c:if>
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
			    		<th valign="top"><win:code listCode="mi.check.step.list" value="${log.checkStep }"></win:code>&nbsp;(${log.checkerName }) :</th>
			    		<td colspan="2">${log.remark }&nbsp;[${log.checkTime }]</td>
				    </tr>
			    </c:if>
	    	</c:forEach>
    	</c:if>
    	<tr>
    		<th><fmt:message key="miMemberApply.checkerNo"/>:</th>
    		<td>${miMemberApply.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.checkUser"/>:</th>
    		<td>${miMemberApply.checkerName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="csWarrantyCard.checkTime"/>:</th>
    		<td colspan="2">${miMemberApply.checkTime }</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="pdSendApp.checkRemark"/>:</th>
    		<td>${fn:replace(miStateAdjust.checkRemark, vEnter, '<br>')}</td>
    	</tr>
    </table>
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}
 </script>