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
    	<tr>
    		<th><fmt:message key="mi.recommander"/>:</th>
    		<td colspan="2">${miMemberApply.recommandName }</td>
    	</tr>
    	 <tr>
    		<th><fmt:message key="mi.transferFee"/>:</th>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00" value="${miMemberApply.transferFee }" />
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.point.remark"/>:</th>
    		<td>${miMemberApply.transferRemark }</td>
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
    	<c:if test="${not empty miApplyPwd}">
	    	<tr>
	    		<td colspan="3"><hr/></td>
	    	</tr>
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
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.PET_NAME}">
	    	<tr>
	    		<th><fmt:message key="mi.register.petName"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.PET_NAME.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.PET_NAME.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.MARKET_NAME}">
	    	<tr>
	    		<th><fmt:message key="mi.lable.market.name"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.MARKET_NAME.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.MARKET_NAME.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>
	    	<tr>
	    		<td colspan="3" class="title"><fmt:message key="mi.lable.contact.info"/></td>
	    	</tr>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.TEL_AREA_CODE || not empty miMemberApplyDetailMap.MI_MEMBER.TELPHONE}">
	    	<tr>
	    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.TEL_AREA_CODE.OLD_VALUE } - ${miMemberApplyDetailMap.MI_MEMBER.TELPHONE.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.TEL_AREA_CODE.NEW_VALUE } - ${miMemberApplyDetailMap.MI_MEMBER.TELPHONE.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.MOBILE}">
	    	<tr>
	    		<th><fmt:message key="miMember.delivery.moblie"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.MOBILE.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.MOBILE.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.EMAIL}">
	    	<tr>
	    		<th><fmt:message key="miMember.email"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.EMAIL.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.EMAIL.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.AREA_CODE}">
	    	<tr>
	    		<th><fmt:message key="miMember.delivery.area"/>:</th>
	    		<td>${oldCountry.regionName }${oldProvince.regionName }${oldCity.regionName }${oldDistrict.regionName }</td>
	    		<td>${newCountry.regionName }${newProvince.regionName }${newCity.regionName }${newDistrict.regionName }</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.ADDRESS1 || not empty miMemberApplyDetailMap.MI_MEMBER.ADDRESS2}">
	    	<tr>
	    		<th valign="top"><fmt:message key="miMember.delivery.addr"/>:</th>
	    		<td>
	    			${miMemberApplyDetailMap.MI_MEMBER.ADDRESS1.OLD_VALUE } ${miMemberApplyDetailMap.MI_MEMBER.ADDRESS2.OLD_VALUE }
	    		</td>
	    		<td>
	    			${miMemberApplyDetailMap.MI_MEMBER.ADDRESS1.NEW_VALUE } ${miMemberApplyDetailMap.MI_MEMBER.ADDRESS2.NEW_VALUE }
	    		</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.ZIPCODE}">
	    	<tr>
	    		<th><fmt:message key="alCompany.zipCode"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.ZIPCODE.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.ZIPCODE.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>
	    	<tr>
	    		<td colspan="3" class="title"><fmt:message key="mi.lable.spacial.info"/></td>
	    	</tr>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.LAST_NAME}">
	    	<tr>
	    		<tr>
	    		<th><fmt:message key="poOrder.memberName"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.LAST_NAME.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.LAST_NAME.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.ID_TYPE}">
	    	<tr>
	    		<th><fmt:message key="poOrder.memberName"/>:</th>
	    		<td>
			        <win:code listCode="member.cardtype" value="${miMemberApplyDetailMap.MI_MEMBER.ID_TYPE.OLD_VALUE}"/>
	    		</td>
	    		<td>
			        <win:code listCode="member.cardtype" value="${miMemberApplyDetailMap.MI_MEMBER.ID_TYPE.NEW_VALUE}"/>
	    		</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.ID_NO}">
	    	<tr>
	    		<th><fmt:message key="mi.lable.cardNo"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.ID_NO.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.ID_NO.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>

	    </c:if>
	   <c:if test="${not empty miMemberApplyDetailMap.SYS_USER || not empty miMemberApplyDetailMap.SYS_USER_ROLE}">
	    	<tr>
	    		<td colspan="3" class="title"><fmt:message key="miMemberApalyCheck.logionStatus.power"/></td>
	    	</tr>
	    	<c:if test="${not empty miMemberApplyDetailMap.SYS_USER.STATE}">
	    	<tr>
	    		<th><fmt:message key="mi.login.status"/>:</th>
	    		<td>
			        <win:code listCode="prohibit" value="${miMemberApplyDetailMap.SYS_USER.STATE.OLD_VALUE}"/>
	    		</td>
	    		<td>
			        <win:code listCode="prohibit" value="${miMemberApplyDetailMap.SYS_USER.STATE.NEW_VALUE}"/>
	    		</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.SYS_USER.ADV_STATE}">
	    	<tr>
	    		<th><fmt:message key="mi.second.login"/>:</th>
	    		<td>
			        <win:code listCode="prohibit" value="${miMemberApplyDetailMap.SYS_USER.ADV_STATE.OLD_VALUE}"/>
	    		</td>
	    		<td>
			        <win:code listCode="prohibit" value="${miMemberApplyDetailMap.SYS_USER.ADV_STATE.NEW_VALUE}"/>
	    		</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.SYS_USER_ROLE.ROLE_ID}">
	    	<tr>
	    		<th><fmt:message key="mi.lable.group"/>:</th>
	    		<td>${oldSysRole.roleName }</td>
	    		<td>${newSysRole.roleName }</td>
	    	</tr>
	    	</c:if>
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