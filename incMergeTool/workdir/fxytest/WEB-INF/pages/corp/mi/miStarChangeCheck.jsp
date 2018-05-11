<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<script language="javascript" src="${ctx }/scripts/validate.js"></script>
<head>
    <title><fmt:message key="mi.star.menu.check.title"/></title>
    <meta name="heading" content="<fmt:message key="mi.star.menu.check.title"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody" >
    <form:form commandName="miMemberApply" method="post" action="checkMiStarChange.jhtml" id="miMemberApplyForm" onsubmit="return validateForm(this)">
    
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
    <table class="detail">
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
    		<td colspan="2">${_miMember.lastName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.member.createTime.lable"/>:</th>
    		<td colspan="2">${_miMember.activeTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td colspan="2">${miMemberApply.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.createUser"/>:</th>
    		<td>${miMemberApply.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="csWarrantyCard.checkTime"/>:</th>
    		<td colspan="2">${miMemberApply.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td colspan="2"><win:code listCode="member_apply_status" value="${miMemberApply.status}"/></td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="miMemberApalyCheck.relevance.file"/>:</th>
    		<td colspan="2">
    			<c:forEach items="${miMemberApplyFiles }" var="miMemberApplyFileVar">
    				<img src="${ctx}/themes/${theme }/images/attach/${miMemberApplyFileVar.suffixName}.gif" border="0" width="16" height="16"/>
					<a href="<c:url value="${miMemberApplyFileVar.fileUrl}"/>" target="_blank">${miMemberApplyFileVar.fileName }</a>
					<br/>
    			</c:forEach>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="3"><hr/></td>
    	</tr>
    	<tr>
    		<td style="font-weight: bold;"><fmt:message key="bdBonusStatReport.item"/></th>
    		<td style="font-weight: bold;"><fmt:message key="miMemberApalyCheck.oldContent"/></td>
    		<td style="font-weight: bold;"><fmt:message key="miMemberApalyCheck.newContent"/></td>
    	</tr>
	    <c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER}">
	    	<tr>
	    		<td colspan="3" class="title"><fmt:message key="common.information"/></td>
	    	</tr>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.STAR}">
	    	<tr>
	    		<th><fmt:message key="mi.starType"/>:</th>
	    		<td><win:code listCode="stars_level" value="${miMemberApplyDetailMap.MI_MEMBER.STAR.OLD_VALUE }" /></td>
	    		<td><win:code listCode="stars_level" value="${miMemberApplyDetailMap.MI_MEMBER.STAR.NEW_VALUE }" /></td>
	    	</tr>
	    	</c:if>
	    </c:if>
    	<tr>
    		<td colspan="3" class="title"><fmt:message key="miMemberApalyCheck.relevance.remark"/></td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="miMemberApply.createRemark"/>:</th>
    		<td colspan="2" style="word-wrap : break-word;word-break: break-all; padding-right:500px;">${fn:replace(miMemberApply.applyRemark, vEnter, '<br>')}</td>
    	</tr>
    	<c:if test="${not empty checkLogList }">
	    	<c:forEach items="${checkLogList }" var="log">
	    	 	<c:if test="${log.checkStep == '-1' }">
		    	 	<tr>
			    		<th valign="top"><fmt:message key="mi.return.applyFor"/>(${log.checkerName }):</th>
			    		<td colspan="2" style="word-wrap : break-word;word-break: break-all; padding-right:500px;">${log.remark }&nbsp;[${log.checkTime }]</td>
				    </tr>
	    	 	</c:if>
	    	 	<c:if test="${log.checkStep != '-1' }">
		    		<tr>
			    		<th valign="top"><win:code listCode="mi.check.step.list" value="${log.checkStep }"/>(${log.checkerName }):</th>
			    		<td colspan="2" style="word-wrap : break-word;word-break: break-all; padding-right:500px;">${log.remark }&nbsp;[${log.checkTime }]</td>
				    </tr>
			    </c:if>
	    	</c:forEach>
    	</c:if>
    	<c:if test="${miMemberApply.status=='7' }">
    		<tr>
	    		<th valign="top"><fmt:message key="pdSendApp.checkRemark"/>:</th>
	    		<td colspan="2" style="word-wrap : break-word;word-break: break-all; padding-right:500px;">${fn:replace(miMemberApply.checkRemark, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="3"><hr/></td>
    	</tr>
    	<c:if test="${miMemberApply.status==3}">
	    	<tr>
	    		<th valign="top"><fmt:message key="pdSendApp.checkRemark"/>:</th>
	    		<td colspan="2">
	    			<textarea rows="6" cols="80" name="checkRemark" id="checkRemark"></textarea>
	    		</td>
		    </tr>
	    </c:if>
    	<tr>
    		<td colspan="3">
    			<div class="buttonBar">
    				<form:hidden path="applyCode"/>
    				<input type="hidden" name="strAction" value="miStarChangeCheck"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${miMemberApply.status==3 }">
    					 <win:power powerCode="miStarChangeReturn"> 
    						<button type="submit" name="uncheck" onclick="return confirmReturn(this.form)"><fmt:message key="mi.return.applyFor"/></button>
    					 </win:power>
    					<win:power powerCode="miStarChangeCheck"> 
    						<button type="submit" name="check" onclick="return confirmAgree(this.form)"><fmt:message key="po.lpstatus.2"/></button>
    				    </win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miStarChangeChks.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("button[name='check']").button({
        icons: {
            primary: "ui-icon-check"
        }
    });
	$("button[name='uncheck']").button({
        icons: {
            primary: "ui-icon-uncheck"
        }
    });

});
function confirmAgree(theForm){
	if(isEmpty(theForm.checkRemark.value)){
		alert("<fmt:message key='ic.remark.null.requie'/>！");
		theForm.checkRemark.focus();
		return false;
	}
	if(confirm("<fmt:message key='mi.agree.sure'/>")){
		theForm.strAction.value="miStarChangeCheck";
		return true;
	}
	return false;
}
function confirmReturn(theForm){
	if(isEmpty(theForm.checkRemark.value)){
		alert("<fmt:message key='ic.remark.null.requie'/>！");
		theForm.checkRemark.focus();
		return false;
	}
	if(trim(theForm.checkRemark.value)==""){
		alert("<fmt:message key='mi.remark.return.reason'/>");
		return false;
	}
	if(confirm("<fmt:message key='mi.return.applyFor.sure'/>")){
		theForm.strAction.value="miStarChangeReturn";
		return true;
	}
	return false;
}
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}
 </script>