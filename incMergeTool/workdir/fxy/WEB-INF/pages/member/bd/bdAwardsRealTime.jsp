<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="menu.memberBdAwardsRealTime"/></title>
	<meta name="heading" content="<fmt:message key="menu.memberBdAwardsRealTime"/>" />
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/awards.css" />

<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th><fmt:message key="bdAwardBonus.awardNameNm"/></th>
		    <th><fmt:message key="po.usertype.m"/></th>
		    <th><fmt:message key="label.total.personal.awards.pv"/></th>
		    <th><fmt:message key="label.team.pv"/></th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${realTimeDatas==null}">
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			    <td align="right">&nbsp;</td>
			    <td>&nbsp;</td>
		    </tr>
		</c:if>
		<c:set var="totalGrouPv" value="0"/>
		<c:set var="totalPrePv" value="0"/>
		<c:if test="${realTimeDatas!=null}">
			<c:forEach items="${realTimeDatas }" var="bonusDataVar">
				<tr>
					<td>
						<c:if test="${not empty bonusDataVar.new_num && bonusDataVar.new_num!=0 }">
							<div class="awards awards-xs awards-xs-${bonusDataVar.new_num}" title="<win:code listCode="member_awards" value="${bonusDataVar.new_num }"/>"></div>
						</c:if>
					</td>
				    <td>
				    	${bonusDataVar.member_no } - ${bonusDataVar.pet_name }
				    	<c:set var="totalGrouPv" value="${totalGrouPv+bonusDataVar.group_pv}"/>
				    	<c:set var="totalPrePv" value="${totalPrePv+bonusDataVar.pre_pv}"/>
				    </td>
				    <td align="right">
				    	<fmt:formatNumber pattern="###,##0.00">${bonusDataVar.pre_pv }</fmt:formatNumber>
				    </td>
				    <td align="right">
				    	<fmt:formatNumber pattern="###,##0.00">${bonusDataVar.group_pv }</fmt:formatNumber>
				    </td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td>&nbsp;</td>
			<td>
				<strong><fmt:message key="poOrder.amtCount"/>：</strong>
			</td>
			<td align="right">
				<strong><fmt:formatNumber pattern="###,##0.00">${totalPrePv}</fmt:formatNumber></strong>
			</td>
			<td align="right">
				<strong><fmt:formatNumber pattern="###,##0.00">${totalGrouPv}</fmt:formatNumber></strong>
			</td>
		</tr>
	</tfoot>
</table>


<script type="text/javascript">
function validateSearch(theForm) {
	if(theForm.memberNo.value==""){
		alert("<fmt:message key='bdBonus.tree.memberNo.required'/>");
		theForm.memberNo.focus();
		return false;
	}
	if(theForm.currMonthSelect.value==""){
		alert("<fmt:message key='bdBonus.currMonthSelect.required'/>");
		theForm.currMonthSelect.focus();
		return false;
	}
	showLoading();
	return true;
}

$(function() {
});
</script>