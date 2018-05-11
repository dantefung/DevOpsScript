<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title><fmt:message key="业绩查询"/></title>
<meta name="heading" content="<fmt:message key="业绩查询"/>" />
</head>

<style>
<!--
table.detail th{
	text-align: center;
}
-->
</style>

<form method="get" name="bdBonusRealTimeDataForm" action="bdYeJiList.jhtml" onsubmit="return validateSearch(this)" id="bdBonusRealTimeDataForm">
	<div class="searchBar">
		<c:if test="${sessionScope.sessionLoginUser.companyCode=='AA'}">
			<dl>
				<dt><fmt:message key="bdReconsumMoneyReport.company"/></dt>
				<dd>
					<select name="companyCode">
						<c:forEach items="${alCompanys}" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dd>日期</dd>
			<dd>
				<fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="firstMemberNo" value="${firstMiMember.memberNo }"/>
				<input type="hidden" name="strAction" value="bdBonusRealTimeData"/>
			</dd>
		</dl>
	</div>
</form>
		
<div class="contentBody">
	
	<table width="100%" border="0" cellspacing="1" cellpadding="0" class="detail">
		<thead>
			<tr>
			    <th bgcolor="#F0F0F0" width="16%"><fmt:message key="miMember.memberNo"/></th>
			    <th bgcolor="#F0F0F0" width="16%">姓名</th>
				<th bgcolor="#F0F0F0" width="22%"><fmt:message key="mi.money.score"/></th>
			    <th bgcolor="#F0F0F0" width="22%"><fmt:message key="mi.BV.score"/></th>
			</tr>
		</thead>
		<tbody>
			<c:set var="totalLastGroupPv" value="0"/>
			<c:set var="totalGroupPv" value="0"/>
			<c:if test="${bonusDataSmember==null}">
				<tr>
				    <td align="right">&nbsp;</td>
			    </tr>
			</c:if>
			<c:if test="${not empty bonusDataSmember }">
				<c:forEach items="${bonusDataSmember }" var="bonusDataSmemberVar">
					<tr>
					    <td align="center">
					    	<img src="${ctx}/themes/default/images/icons/memberCardTtype_${bonusDataSmemberVar.card_type}.gif" border=0 width=16 height=16 title="<win:code listCode="member.card.type" value="${bonusDataSmemberVar.card_type }"/>"/>
					    	${bonusDataSmemberVar.member_no }
					    </td>
					    <td align="center">${bonusDataSmemberVar.last_name }</td>
					    <td align="center"><fmt:formatNumber pattern="###,##0.00">${bonusDataSmemberVar.last_group_pv }</fmt:formatNumber></td>
					    <td align="center"><fmt:formatNumber pattern="###,##0.00">${bonusDataSmemberVar.group_pv }</fmt:formatNumber></td>
					    <c:set var="totalLastGroupPv" value="${totalLastGroupPv+bonusDataSmemberVar.last_group_pv }"/>
					    <c:set var="totalGroupPv" value="${totalGroupPv+bonusDataSmemberVar.group_pv }"/>
					</tr>
				</c:forEach>
			</c:if> 
			<tr>
				<td colspan="2" align="center"><strong>合计：</strong></td>
				<td align="center"><strong><fmt:formatNumber pattern="###,##0.00">${totalLastGroupPv}</fmt:formatNumber></strong></td>
				<td align="center"><strong><fmt:formatNumber pattern="###,##0.00">${totalGroupPv}</fmt:formatNumber></strong></td>
			</tr>
		</tbody>
	</table>
	
	<table width="100%" border="0" cellspacing="1" cellpadding="0" class="detail">
		<thead>
			<tr>
			   <th bgcolor="#F0F0F0" width="16%"><fmt:message key="miMember.memberNo"/></th>
			    <th bgcolor="#F0F0F0" width="16%">姓名</th>
				<th bgcolor="#F0F0F0" width="22%"><fmt:message key="mi.money.score"/></th>
			    <th bgcolor="#F0F0F0" width="22%"><fmt:message key="mi.BV.score"/></th>
			</tr>
		</thead>
		<tbody>
			<c:set var="totalLastGroupPv" value="0"/>
			<c:set var="totalGroupPv" value="0"/>
			<c:if test="${bonusDataList==null}">
				<tr>
					<td>&nbsp;</td>
				    <td>&nbsp;</td>
			    </tr>
			</c:if>
			<c:if test="${bonusDataList!=null}">
				<c:forEach items="${bonusDataList }" var="bonusDataVar">
					<tr>
					    <td align="center">
					    	<img src="${ctx}/themes/default/images/icons/memberCardTtype_${bonusDataVar.card_type}.gif" border=0 width=16 height=16 title="<win:code listCode="member.card.type" value="${bonusDataVar.card_type }"/>"/> 
					    	${bonusDataVar.member_no }
					    </td>
					    <td align="center">${bonusDataVar.last_name }</td>
					    <td align="center"><fmt:formatNumber pattern="###,##0.00">${bonusDataVar.last_group_pv }</fmt:formatNumber></td>
					    <td align="center"><fmt:formatNumber pattern="###,##0.00">${bonusDataVar.group_pv }</fmt:formatNumber></td>
					    <c:set var="totalLastGroupPv" value="${totalLastGroupPv+bonusDataVar.last_group_pv }"/>
					    <c:set var="totalGroupPv" value="${totalGroupPv+bonusDataVar.group_pv }"/>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="2" align="center"><strong>合计：</strong></td>
				<td align="center"><strong><fmt:formatNumber pattern="###,##0.00">${totalLastGroupPv}</fmt:formatNumber></strong></td>
				<td align="center"><strong><fmt:formatNumber pattern="###,##0.00">${totalGroupPv}</fmt:formatNumber></strong></td>
			</tr>
		</tbody>
	</table>
</div>




<script type="text/javascript">
function validateSearch(theForm) {
	if(theForm.memberNo.value==""){
		alert("<fmt:message key='bdBonus.tree.memberNo.required'/>");
		theForm.memberNo.focus();
		return false;
	}
	if(theForm.startDate.value=="" || theForm.endDate.value==""){
		alert("<fmt:message key='bdBonus.date.required'/>");
		theForm.currMonthSelect.focus();
		return false;
	}
	showLoading();
	return true;
}

$(function() {
	$( "#startDate,#endDate" ).datepicker();
});
</script>