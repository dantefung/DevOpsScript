<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="function.menu.memberView"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.memberView"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <table class="detail">
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="common.information"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>
    			${miMember.memberNo }
    			<c:if test="${miMember.isOld==1 }"><span class="important">[<fmt:message key="lang.old"/>]</span></c:if>
    		</td>
    		<th><fmt:message key="miMember.old.memberNo"/>:</th>
			<td>${miMember.oldMemberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.register.petName"/>:</th>
    		<td>${miMember.petName }</td>
    		<th><fmt:message key="mi.register.sourceProp"/>:</th>
			<td><win:code listCode="mimember.registertype" value="${miMember.registerType }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.cardType"/>:</th>
    		<td><win:code listCode="member.card.type" value="${miMember.cardType }"></win:code></td>
    		<th></th>
    		<td></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.recommendNo"/>:</th>
    		<td>${miMember.recommendNo }</td>
    		<th><fmt:message key="mi.linkno.lable"/>:</th>
    		<td>${miMember.linkNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.activity.status"/>:</th>
    		<td>
    			<c:if test="${miMember.activeStatus=='1'}">
					<c:set var="stateColor" value="green"/>
				</c:if>
				<c:if test="${miMember.activeStatus=='0'}">
					<c:set var="stateColor" value="red"/>
				</c:if>
				<font color="${stateColor }"><win:code listCode="member.activestatus" value="${miMember.activeStatus }"/></font>
    		</td>
    		<th><fmt:message key="mi.freeze.accounts"/></th>
    		<td <c:if test="${sysUser.freezeMenuAccounts == '1' }">style="color: red"</c:if> <c:if test="${sysUser.freezeMenuAccounts == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.freezestatus" value="${sysUser.freezeMenuAccounts }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.freeze.bonus"/></th>
    		<td <c:if test="${sysUser.freezeMenuBonus == '1' }">style="color: red"</c:if> <c:if test="${sysUser.freezeMenuBonus == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.freezestatus" value="${sysUser.freezeMenuBonus }"/></td>
    		<th><fmt:message key="mi.userupdate"/></th>
    		<td <c:if test="${sysUser.freezeMenuInfo == '1' }">style="color: red"</c:if> <c:if test="${sysUser.freezeMenuInfo == '0' }">style="color: green"</c:if>><win:code listCode="sysuser.freezestatus" value="${sysUser.freezeMenuInfo }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.lable.limit.status"/>:</th>
    		<td>
    			<c:if test="${sysUser.suspendStatus=='0'}">
					<c:set var="stateColor" value="green"/>
				</c:if>
				<c:if test="${sysUser.suspendStatus=='1'}">
					<c:set var="stateColor" value="red"/>
				</c:if>
				<font color="${stateColor }"><win:code listCode="sysuser.suspendstatus" value="${sysUser.suspendStatus }"/></font>
    		</td>
    		<th><fmt:message key="mi.concle.status"/>:</th>
    		<td>
    			<c:if test="${miMember.exitStatus=='0'}">
					<c:set var="stateColor" value="green"/>
				</c:if>
				<c:if test="${miMember.exitStatus=='1'}">
					<c:set var="stateColor" value="red"/>
				</c:if>
				<font color="${stateColor }"><win:code listCode="mimember.exitstatus" value="${miMember.exitStatus }"/></font>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.lable.group"/>:</th>
    		<td>${sysRole.roleName }</td>
    		<th><fmt:message key="poOrder.billFromPersonNo"/>:</th>
    		<td>${creatorUser.userCode } (${creatorUser.userName })</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.joindate"/>:</th>
    		<td>${miMember.createTime }</td>
    		<th><fmt:message key="mi.activity.time"/></th>
    		<td>${miMember.activeTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.lable.exitTime"/>:</th>
    		<td>${miMember.exitTime }</td>
    		<th><fmt:message key="isNot.cancel"/>:</th>
    		<td><win:code listCode="yesno" value="${miMember.isRemove }"/> </td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="mi.lable.contact.info"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.memberName"/>:</th>
    		<td colspan="3">${miMember.lastName}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="list.sex"/>:</th>
    		<td><win:code listCode="sex" value="${miMember.sex}"></win:code></td>
    		<th><fmt:message key="gsMember.birthday"/>:</th>
    		<%-- <td>${birthDate}</td> --%>
    		<td>${miMember.birthDate}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.certificateType"/>:</th>
    		<td><win:code listCode="member.cardtype" value="${miMember.idType}"/></td>
    		<th><fmt:message key="mi.lable.cardNo"/>:</th>
    		<td>${miMember.idNo}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
    		<td>${miMember.telAreaCode } - ${miMember.telphone }</td>
    		<th><fmt:message key="miMember.delivery.moblie"/>:</th>
    		<td>${miMember.mobile }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.email"/>:</th>
    		<td>${miMember.email }</td>
    		<th><fmt:message key="miMember.delivery.area"/>:</th>
    		<td>${fullAddress}</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="miMember.delivery.addr"/>:</th>
    		<td>${miMember.address1 }${miMember.address2 }</td>
    		<th><fmt:message key="alCompany.zipCode"/>:</th>
    		<td>${miMember.zipcode }</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="busi.common.remark"/>:</th>
    		<td colspan="3">${fn:replace(miMember.remark, vEnter, '<br>')}</td>
    	</tr>
    	<%-- <tr>
    		<td colspan="4" class="title"><fmt:message key="mi.lable.spacial.info"/></td>
    	</tr>
		<tr>
    		<th>身份证扫描件(正面):</th>
    		<td>
    			<c:if test="${empty miMember.idPhotoFront }">无</c:if>
    			<c:if test="${not empty miMember.idPhotoFront }"><a href="${miMember.idPhotoFront }" target="_blank">查看</a></c:if>
			</td>
    		<th>身份证扫描件(反面):</th>
    		<td>
    			<c:if test="${empty miMember.idPhotoBack }">无</c:if>
    			<c:if test="${not empty miMember.idPhotoBack }"><a href="${miMember.idPhotoBack }" target="_blank">查看</a></c:if>
    		</td>
    	</tr>
    	<tr>
    		<th>营业执照号码:</th>
    		<td>${miMember.blCode }</td>
    		<th>营业执照文件:</th>
    		<td>
    			<c:if test="${empty miMember.blFile }">无</c:if>
    			<c:if test="${not empty miMember.blFile }"><a href="${miMember.blFile }" target="_blank">查看</a></c:if>
    		</td>
    	</tr> --%>
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="busi.common.bankAcc"/></td>
    	</tr>
    	
    	<tr>
    		<td colspan="4">
    			<ec:table 
					tableId="miMemberAccountListTable"
					items="miMemberAccounts"
					var="miMemberAccountVar"
					action="miMemberAccounts.jhtml"
					width="100%" method="get"
					autoIncludeParameters="true"
					retrieveRowsCallback="limit"
					rowsDisplayed="20" sortable="false" form="miMemberAccountListTableForm" showPagination="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="openBank" title="bdSendRemittanceReport.openBankCH" />
						<ec:column property="bbranch" title="busi.common.bankBranch" />
						<ec:column property="bname" title="	bdOutwardBank.name" />
						<ec:column property="bnum" title="busi.common.account" />
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<c:if test="${empty param.viewType }">
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<button type="button" name="cancel" onclick="javascript:setReturn(${source});"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    	</c:if>
    </table>
</div>

<script type="text/javascript">
function setReturn(source) {
	
	if (source == '1') {
		window.location='miMembers.jhtml?needReload=1';
	} else if (source == '2') {
		window.location='miMemberFreeRegisters.jhtml?needReload=1';
	} else if (source == '3') {
		window.location='miMemberSearchs.jhtml?needReload=1';
	} 
}


</script>