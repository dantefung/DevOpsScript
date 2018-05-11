<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.applyFor.modify.member.info"/></title>
    <meta name="heading" content="<fmt:message key="mi.applyFor.modify.member.info"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="miMemberApply" method="post" action="viewMiMemberApply.jhtml" id="miMemberApplyForm" onsubmit="return validateForm(this)">
    
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
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td colspan="2">${miMemberApply.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td colspan="2">${miMemberApply.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="csWarrantyCard.checkTime"/>:</th>
    		<td colspan="2">${miMemberApply.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td colspan="2"><win:code listCode="member_apply_status" value="${miMemberApply.status}"/></td>
    	</tr>
   	<c:set var="param1"  value="${miMemberApply.applyCode }"/>
	<c:set var="param3"  value="C"/>
   	<c:if test="${fn:startsWith(param1,param3) }">
     	<tr>
    		<th><fmt:message key="mi.synchro.C.order"/>:</th>
    		<td>${miMemberApply.applyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.createUser"/>:</th>
    		<td>${miMemberApply.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.synchro.netd"/>:</th>
    		<td colspan="2"><win:code listCode="yesno" value="1"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.chairman.check.lable"/>:</th>
    		<td colspan="2"><win:code listCode="yesno" value="${miMemberApply.isChairmanCheck }"/></td>
    	</tr>
     </c:if>
    	<tr>
    		<td colspan="3"><hr/></td>
    	</tr>
	    <c:if test="${not empty miApplyPwd}">
	    	<tr>
	    		<td colspan="3" class="title"><fmt:message key="mi.pwd.laber"/></td>
	    	</tr>
	    	<tr>
	    		<th><win:code listCode="mi.pwd.type.list" value="${miApplyPwd.pwdType }"/>:</th>
	    		<td><c:if test="${miApplyPwd.pwdType=='4' }">******</c:if><c:if test="${miApplyPwd.pwdType!='4' }">${miApplyPwd.typeValue }</c:if></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mi.choose.reset.pwd"/>:</th>
	    		<td><win:code listCode="mi.pwd.repeat.type.list" value="${miApplyPwd.repwd }"/></td>
	    	</tr>
	    </c:if>
    	<tr>
    		<td colspan="3" class="title"><fmt:message key="miMemberApalyCheck.relevance.remark"/></td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="miMemberApply.createRemark"/>:</th>
    		<td>${fn:replace(miMemberApply.applyRemark, vEnter, '<br>')}</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="miMember.remark"/>:</th>
    		<td>${fn:replace(miMemberApply.memberRemark, vEnter, '<br>')}</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="mi.accraditation.remark"/>:</th>
    		<td>${fn:replace(miMemberApply.checkRemark, vEnter, '<br>')}</td>
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
			    		<th valign="top"><win:code listCode="mi.check.step.list" value="${log.checkStep }"/>(${log.checkerName }):</th>
			    		<td colspan="2">${log.remark }&nbsp;[${log.checkTime }]</td>
				    </tr>
			    </c:if>
	    	</c:forEach>
    	</c:if>
    	<%-- <tr>
    		<td colspan="3">
    			<div class="buttonBar">
    				<form:hidden path="applyCode"/>
    				<input type="hidden" name="strAction" value="deleteMiMemberApply"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${miMemberApply.status=='0' }">
	    				<win:power powerCode="deleteMiMemberApply">
	    					<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiMemberApply')"><fmt:message key="operation.button.delete"/></button>
	    				</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miMemberApplys.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr> --%>
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