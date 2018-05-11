<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="bdBonusRealTimeData.title"/></title>
	<meta name="heading" content="<fmt:message key="bdBonusRealTimeData.title"/>" />
</head>

<ul class="nav nav-tabs">
	<li<c:if test="${empty param.linkType || param.linkType=='0' }"> class="active"</c:if>>
		<a href="bdBonusRealTimeData.jhtml?linkType=0"><i class="fa fa-cubes" aria-hidden="true"></i> 按推荐关系</a>
	</li>
	<li<c:if test="${param.linkType=='1' }"> class="active"</c:if>>
		<a href="bdBonusRealTimeData.jhtml?linkType=1"><i class="fa fa-cubes" aria-hidden="true"></i> 按接点关系</a>
	</li>
</ul>

<br/>

<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th><fmt:message key="mi.starType"/></th>
		    <th><fmt:message key="po.usertype.m"/></th>
		    <th>个人业绩PV</th>
		    <th>个人业绩金额</th>
		    <th>团队业绩PV</th>
		    <th>团队业绩金额</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${realTimeDatas==null}">
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			    <td align="right">&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
		    </tr>
		</c:if>
		<c:set var="totalWebSalePv" value="0"/>
		<c:set var="totalPrePv" value="0"/>
		<c:set var="totalKeepPv" value="0"/>
		<c:set var="totalGroupPv" value="0"/>
		<c:if test="${realTimeDatas!=null}">
			<c:forEach items="${realTimeDatas }" var="bonusDataVar" varStatus="varStatus">
				<tr>
					<td>
						<win:code listCode="stars_level" value="${bonusDataVar.new_num }"/>
					</td>
				    <td>
				    	${bonusDataVar.member_no } - ${bonusDataVar.pet_name }
				    </td>
				    <td align="right">
				    	<fmt:formatNumber pattern="###,##0.00">${bonusDataVar.web_sale_pv }</fmt:formatNumber>
				    </td>
				    <td align="right">
				    	<fmt:formatNumber pattern="###,##0.00">${bonusDataVar.pre_pv }</fmt:formatNumber>
				    </td>
				    <td align="right">
				    	<fmt:formatNumber pattern="###,##0.00">${bonusDataVar.keep_pv }</fmt:formatNumber>
				    </td>
				    <td align="right">
				    	<fmt:formatNumber pattern="###,##0.00">${bonusDataVar.group_pv }</fmt:formatNumber>
				    </td>
				</tr>
				<c:if test="${varStatus.index==0}">
					<tr>
						<td colspan="6"></td>
					</tr>
				</c:if>
				<c:if test="${varStatus.index>0}">
					<c:set var="totalWebSalePv" value="${totalWebSalePv+bonusDataVar.web_sale_pv}"/>
					<c:set var="totalPrePv" value="${totalPrePv+bonusDataVar.pre_pv}"/>
					<c:set var="totalKeepPv" value="${totalKeepPv+bonusDataVar.keep_pv}"/>
				    <c:set var="totalGroupPv" value="${totalGroupPv+bonusDataVar.group_pv}"/>
				</c:if>
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
				<strong><fmt:formatNumber pattern="###,##0.00">${totalWebSalePv}</fmt:formatNumber></strong>
			</td>
			<td align="right">
				<strong><fmt:formatNumber pattern="###,##0.00">${totalPrePv}</fmt:formatNumber></strong>
			</td>
			<td align="right">
				<strong><fmt:formatNumber pattern="###,##0.00">${totalKeepPv}</fmt:formatNumber></strong>
			</td>
			<td align="right">
				<strong><fmt:formatNumber pattern="###,##0.00">${totalGroupPv}</fmt:formatNumber></strong>
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