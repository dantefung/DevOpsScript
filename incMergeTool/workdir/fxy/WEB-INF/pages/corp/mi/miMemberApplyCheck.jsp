<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<script language="javascript" src="${ctx }/scripts/validate.js"></script>
<head>
<c:if test="${applyType=='1' }">
    <title><fmt:message key="miMemberApalyCheck.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberApalyCheck.title"/>"/>
</c:if>
<c:if test="${applyType=='2' }">
    <title><fmt:message key="mi.check.point.title"/></title>
    <meta name="heading" content="<fmt:message key="mi.check.point.title"/>"/>
</c:if>
<c:if test="${applyType=='3' }">
    <title><fmt:message key="mi.check.pwd.title"/></title>
    <meta name="heading" content="<fmt:message key="mi.check.pwd.title"/>"/>
</c:if>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="miMemberApply" method="post" action="checkMiMemberApply.jhtml" id="miMemberApplyForm" onsubmit="return validateForm(this)">
    
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
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td colspan="2">${miMemberApply.userCode }</td>
    	</tr>
    	<c:if test="${miMemberApply.applyType =='3'}">
    		<tr>
	    		<th><fmt:message key="poOrder.memberName"/>:</th>
	    		<td colspan="2">${_miMember.lastName }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mi.lable.cardNo"/>:</th>
	    		<td colspan="2">${_miMember.idNo }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="alCompany.phone"/>:</th>
	    		<td colspan="2">${_miMember.mobile }</td>
	    	</tr>
    	</c:if>
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
    	<c:if test="${miMemberApply.applyType =='2'}">
    		<%-- <tr>
	    		<th><fmt:message key="mi.member.binding"/></th>
	    		<td><win:code listCode="mi.binding.list" value="${bind}" /></td>
	    	</tr>
	    	 <tr>
	    		<th><fmt:message key="mi.remove.ornot.binding"/></th>
	    		<td><win:code listCode="yesno"  value="${miMemberApply.isRemoveBinding }"/></td>
	    	</tr>
	    	 <tr>
	    		<th><fmt:message key="mi.member.orderGoods.status"/></th>
	    		<td><win:code listCode="mi.ordergoods.list" value="${orderGoods }"/></td>
	    	</tr> --%>
	    	<tr>
	    		<th><fmt:message key="mi.recommander"/>:</th>
	    		<td colspan="2">${miMemberApply.recommandName }</td>
	    	</tr>
	    	 <tr>
	    		<th><fmt:message key="mi.transferFee"/>:</th>
	    		<td>
	    			${miMemberApply.transferFee }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mi.point.remark"/>:</th>
	    		<td>${miMemberApply.transferRemark }
	    		</td>
	    	</tr>
    	</c:if>
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
    	<c:if test="${miMemberApply.applyType !='1'}">
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
    	<c:if test="${miMemberApply.applyType !='3' }">
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
		    		<th><fmt:message key="miMember.certificateType"/>:</th>
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
		   <c:if test="${not empty miMemberApplyDetailMap.SYS_USER || not empty miMemberApplyDetailMap.SYS_USER_ROLE || not empty miMemberApplyDetailMap.MI_MEMBER}">
		    	<tr>
		    		<td colspan="3" class="title"><fmt:message key="miMemberApalyCheck.logionStatus.power"/></td>
		    	</tr>
		    	<c:if test="${not empty miMemberApplyDetailMap.MI_MEMBER.IS_AGENT}">
			    	<tr>
			    		<th><fmt:message key="is.community.store"/>:</th>
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
	    </c:if>
    <c:set var="param1"  value="${miMemberApply.applyCode }"/>
	<c:set var="param2"  value="D"/>
	<c:set var="param3"  value="C"/>
    <c:if test="${fn:startsWith(param1,param2) }">
	    <tr>
    		<td colspan="3" class="title"><fmt:message key="sys.user.state"/></td>
    	</tr>
    	<tr><th><fmt:message key="mi.activity.status"/></th>
    		<td <c:if test="${memberStatus.ACTIVE_STATUS == '0' }">style="color: red"</c:if> <c:if test="${memberStatus.ACTIVE_STATUS == '1' }">style="color: green"</c:if>><win:code listCode="member.activestatus" value="${memberStatus.ACTIVE_STATUS }"/> </td>
    	</tr>
    	<%-- <tr>
    		<th><fmt:message key="mi.congelation.status"/></th>
    		<td <c:if test="${memberStatus.FREEZE_STATUS == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.FREEZE_STATUS == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.freezestatus" value="${memberStatus.FREEZE_STATUS }"/></td>
    	</tr> --%>
    	<tr>
    		<th>账户(<fmt:message key="mi.new.frost.status"/>)</th>
    		<td <c:if test="${memberStatus.FREEZE_MENU_ACCOUNTS == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.FREEZE_MENU_ACCOUNTS == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.freezestatus" value="${memberStatus.FREEZE_MENU_ACCOUNTS }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.userupdate"/>(<fmt:message key="mi.new.frost.status"/>)</th>
    		<td <c:if test="${memberStatus.FREEZE_MENU_INFO == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.FREEZE_MENU_INFO == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.freezestatus" value="${memberStatus.FREEZE_MENU_INFO }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.lable.limit.status"/></th>
    		<td <c:if test="${memberStatus.SUSPEND_STATUS == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.SUSPEND_STATUS == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.suspendstatus" value="${memberStatus.SUSPEND_STATUS }"/></td>
    	</tr>
    	<tr><th><fmt:message key="mi.concle.status"/></th>
    		<td <c:if test="${memberStatus.EXIT_STATUS == '1' }">style="color: red"</c:if> <c:if test="${memberStatus.EXIT_STATUS == '0' }">style="color: green"</c:if>><win:code listCode="member.exitstatus" value="${memberStatus.EXIT_STATUS }"/></td>
    	</tr>
    </c:if>
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
    	<c:if test="${miMemberApply.status=='7' }">
    		<tr>
	    		<th valign="top"><fmt:message key="pdSendApp.checkRemark"/>:</th>
	    		<td>${fn:replace(miMemberApply.checkRemark, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="3"><hr/></td>
    	</tr>
    	<c:if test="${(miMemberApply.status==0 || miMemberApply.status==5 || miMemberApply.status==1 || miMemberApply.status==7) && miMemberApply.isFinished=='0'}">
	    	<tr>
	    		<th valign="top"><fmt:message key="pdSendApp.checkRemark"/>:</th>
	    		<td colspan="2">
	    			<textarea rows="6" cols="80" name="checkRemark" id="checkRemark"></textarea>
	    		</td>
		    </tr>
	    </c:if>
	    <tr>
    		<th valign="top"><fmt:message key="mi.current.step.lable"/>:</th>
    		<td colspan="2"><c:if test="${miMemberApply.currentStep == '-1' }"><fmt:message key="mi.return.applyFor"/></c:if><c:if test="${miMemberApply.currentStep != '-1' }"><win:code listCode="mi.check.step.list" value="${miMemberApply.currentStep }"/></c:if></td>
	    </tr>

    	<tr>
    		<td colspan="3">
    			<div class="buttonBar">
    				<form:hidden path="applyCode"/>
    				<input type="hidden" name="strAction" value="checkMiMemberApply"/>
    				<input type="hidden" name="checkStep" />
    				<input type="hidden" name="applyType" value="${miMemberApply.applyType }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${(miMemberApply.status==0 || miMemberApply.status==5 || miMemberApply.status==1 || miMemberApply.status==7) && miMemberApply.isFinished=='0'}">
    					<c:set var="isIn" value="true"/>
    					<c:forEach items="${checkLogMap }" var="ck">
    						<win:power powerCode="${ck.key }">
    							<c:if test="${isIn && miMemberApply.status!=7}">
	    							<c:set var="isIn" value="false"/>
	    							<button type="submit" name="uncheck" onclick="return confirmReturn(this.form,'${ck.value.checkStep }','${ck.key }')"><fmt:message key="mi.return.applyFor"/></button>
	    							<button type="submit" name="remark" onclick="return confirmRemark(this.form)"><fmt:message key="mi.return.applyremark"/></button>
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
    				<button type="button" name="cancel" onclick="window.location='miMemberApplyChks.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	$("button[name='remark']").button({
        icons: {
            primary: "ui-icon-check"
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
function confirmRemark(theForm){
	if(confirm("<fmt:message key='mi.return.applyremark.sure'/>")){
		return true;
	}
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