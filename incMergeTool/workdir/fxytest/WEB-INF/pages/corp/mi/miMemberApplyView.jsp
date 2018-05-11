<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
	 <c:if test="${param.strAction=='viewFreezeAmtApply' }">
	    <title><fmt:message key="mi.freezeAmt.add"/></title>
	    <meta name="heading" content="<fmt:message key="mi.freezeAmt.add"/>"/>
   </c:if><c:if test="${param.strAction !='viewFreezeAmtApply' }">
	    <title><fmt:message key="mi.applyFor.modify.member.info"/></title>
	    <meta name="heading" content="<fmt:message key="mi.applyFor.modify.member.info"/>"/>
    </c:if>
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
    	<tr>
    		<td style="font-weight: bold;"><fmt:message key="bdBonusStatReport.item"/></th>
    		<td style="font-weight: bold;"><fmt:message key="miMemberApalyCheck.oldContent"/></td>
    		<td style="font-weight: bold;"><fmt:message key="miMemberApalyCheck.newContent"/></td>
    	</tr>
    	<c:if test="${not empty miMemberApplyDetailMap.FI_BANKBOOK_BALANCE}">
    		<tr>
	    		<th><fmt:message key="mi.freezeAmt.yesno.lable"/>:</th>
	    		<td><win:code listCode="yesno" value="${miMemberApplyDetailMap.FI_BANKBOOK_BALANCE.FREEZE_AMT.OLD_VALUE=='0'?'0':'1' }"/> </td>
	    		<td><win:code listCode="yesno" value="${miMemberApplyDetailMap.FI_BANKBOOK_BALANCE.FREEZE_AMT.NEW_VALUE=='0'?'0':'1' }"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="fiBankbookBalance.freezeAmt"/><c:if test="${not empty miMemberApply.accountType }">&nbsp;&nbsp;<b>(<win:code listCode="bank_account_types"  value="${miMemberApply.accountType }" />)</b></c:if>:</th>
	    		<td>${miMemberApplyDetailMap.FI_BANKBOOK_BALANCE.FREEZE_AMT.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.FI_BANKBOOK_BALANCE.FREEZE_AMT.NEW_VALUE }</td>
	    	</tr>
    	</c:if>
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
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.SEX}">
	    	<tr>
	    		<th><fmt:message key="list.sex"/>:</th>
		    	  <td><win:code listCode="sex" value="${miMemberApplyDetailMap.MI_MEMBER.SEX.OLD_VALUE }"/></td>
	    		  <td><win:code listCode="sex" value="${miMemberApplyDetailMap.MI_MEMBER.SEX.NEW_VALUE }"/></td>
	    	</tr>
	    	</c:if>
	    	<!-- 越南系统，出生日期，个人税号 -->
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.BIRTH_DATE}">
	    	<tr>
	    		<th><fmt:message key="gsMember.birthday"/>:</th>
		    	  <td>${miMemberApplyDetailMap.MI_MEMBER.BIRTH_DATE.OLD_VALUE }</td>
	    		  <td>${miMemberApplyDetailMap.MI_MEMBER.BIRTH_DATE.NEW_VALUE }</td>
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
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.AGENT_NO}">
		    	<tr>
		    		<tr>
		    		<th><fmt:message key="attach.order.center"/>:</th>
		    		<td>${miMemberApplyDetailMap.MI_MEMBER.AGENT_NO.OLD_VALUE }</td>
		    		<td>${miMemberApplyDetailMap.MI_MEMBER.AGENT_NO.NEW_VALUE }</td>
		    	</tr>
		    	</c:if>
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
	    		<th>证件类型:</th>
	    		<td>
			        <win:code listCode="member.cardtype" value="${miMemberApplyDetailMap.MI_MEMBER.ID_TYPE.OLD_VALUE}"/>
	    		</td>
	    		<td>
			        <win:code listCode="member.cardtype" value="${miMemberApplyDetailMap.MI_MEMBER.ID_TYPE.NEW_VALUE}"/>
	    		</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.PROPERTY}">
	    	<tr>
	    		<th><fmt:message key="mi.property.lable"/>:</th>
	    		<td><win:code listCode="mi.property.list" value="${miMemberApplyDetailMap.MI_MEMBER.PROPERTY.OLD_VALUE }" /></td>
	    		<td><win:code listCode="mi.property.list" value="${miMemberApplyDetailMap.MI_MEMBER.PROPERTY.NEW_VALUE }" /></td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.ID_NO}">
	    	<tr>
	    		<th><fmt:message key="mi.lable.cardNo"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.ID_NO.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.ID_NO.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>
			<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.SHOW_PERCENT}">
	    	<tr>
	    		<th><fmt:message key="member.show.percent"/>:</th>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.SHOW_PERCENT.OLD_VALUE }</td>
	    		<td>${miMemberApplyDetailMap.MI_MEMBER.SHOW_PERCENT.NEW_VALUE }</td>
	    	</tr>
	    	</c:if>
			<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.STAR}">
	    	<tr>
	    		<th><fmt:message key="mi.starType"/>:</th>
	    		<td><win:code listCode="stars_level"  value="${miMemberApplyDetailMap.MI_MEMBER.STAR.OLD_VALUE }"/></td>
	    		<td><win:code listCode="stars_level"  value="${miMemberApplyDetailMap.MI_MEMBER.STAR.NEW_VALUE }"/></td>
	    	</tr>
	    	</c:if>
		    	
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.IS_CREDIT}">
	    	<tr>
	    		<th><fmt:message key="lang.isLoan"/>:</th>
	    		<td><win:code listCode="yesno" value="${miMemberApplyDetailMap.MI_MEMBER.IS_CREDIT.OLD_VALUE }"/></td>
	    		<td><win:code listCode="yesno" value="${miMemberApplyDetailMap.MI_MEMBER.IS_CREDIT.NEW_VALUE }"/></td>
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
	    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.IS_AGENT}">
		    	<tr>
		    		<th><fmt:message key="busi.is.agent"/>:</th>
		    		<td><win:code listCode="yesno" value="${miMemberApplyDetailMap.MI_MEMBER.IS_AGENT.OLD_VALUE}"/></td>
		    		<td><win:code listCode="yesno" value="${miMemberApplyDetailMap.MI_MEMBER.IS_AGENT.NEW_VALUE}"/></td>
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
   					<button type="button" name="cancel" onclick="window.location='miMemberApplys.jhtml?needReload=1'"><fmt:message key="operation.button.close"/></button>
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