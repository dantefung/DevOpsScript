<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<script language="javascript" src="${ctx }/scripts/validate.js"></script>
<head>
    <title><fmt:message key="mi.update.memberStatus"/></title>
    <meta name="heading" content="<fmt:message key="mi.update.memberStatus"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="miStateAdjust" method="post" action="checkMiStateAdjust.jhtml" onsubmit="return validateForm(this)" id="miStateAdjustForm">
    
    <spring:bind path="miStateAdjust.*">
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
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="labe.application.info"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="csServiceCenter.appCode"/>:</th>
    		<td>${miStateAdjust.adjustCode }</td>
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
			    		<th valign="top"><win:code listCode="mi.check.step.list" value="${log.checkStep }"/>(${log.checkerName }):</th>
			    		<td colspan="2">${log.remark }&nbsp;[${log.checkTime }]</td>
				    </tr>
			    </c:if>
	    	</c:forEach>
    	</c:if>
    	<tr>
    		<th valign="top"><fmt:message key="pdSendApp.checkRemark"/>:</th>
    		<td><form:textarea path="checkRemark" id="checkRemark" rows="6" cssStyle="width:400px;"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value="checkMiStateAdjust"/>
    				<input type="hidden" name="checkStep" />
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${(miStateAdjust.status==3 || miStateAdjust.status==5 || miStateAdjust.status==1 || miStateAdjust.status==7)  && miStateAdjust.isFinished=='0'}">
    					<c:set var="isIn" value="true"/>
    					<c:forEach items="${checkLogMap }" var="ck">
    						<win:power powerCode="${ck.key }">
    							<c:if test="${isIn &&  miStateAdjust.status!=7}">
	    							<c:set var="isIn" value="false"/>
	    							<button type="submit" name="uncheck" onclick="return confirmReturn(this.form,'${ck.value.checkStep }','${ck.key }')"><fmt:message key="mi.return.applyFor"/></button>
	    						</c:if>
	    						<c:if test="${not empty	ck.value.checkerCode }">
	    							<button type="button" name="check" style="color: gray;"><win:code listCode="mi.check.step.list" value="${ck.value.checkStep }"/>(${ck.value.checkerName })</button>
	    						</c:if>
	    						<c:if test="${empty	ck.value.checkerCode }">
	    							<button type="submit" name="check" onclick="return confirmAgree(this.form,'${ck.value.checkStep }','${ck.key }')"><win:code listCode="mi.check.step.list" value="${ck.value.checkStep }"/></button>
	    						</c:if>
    						</win:power>
    					</c:forEach>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miStateAdjustChecks.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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

function confirmAgree(theForm,checkStep,limt){
	if(confirm("<fmt:message key='mi.agree.sure'/>")){
		theForm.checkStep.value=checkStep;
		theForm.strAction.value=limt;
		return true;
	}
	return false;
}
function confirmReturn(theForm,checkStep,limt){
	if(trim(theForm.checkRemark.value)==""){
		alert("<fmt:message key='mi.remark.return.reason'/>");
		return false;
	}
	if(confirm("<fmt:message key='mi.return.applyFor.sure'/>")){
		theForm.checkStep.value=checkStep;
		theForm.strAction.value=limt;
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
</script>