<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="lang.market.research"/></title>
    <meta name="heading" content="<fmt:message key="lang.market.research"/>"/>
</head>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th><fmt:message key="miMember.memberNo"/></th>
			<th><fmt:message key="lang.nickname"/></th>
			<th><fmt:message key="lang.personal.consume"/></th>
			<th><fmt:message key="lang.dept.qualify.consume"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${plMemberOrders}" var="plMemberOrderVar">
			<tr>
				<td>${plMemberOrderVar.member_no}</td>
				<td>${plMemberOrderVar.pet_name}</td>
				<td>
					<fmt:formatNumber value="${plMemberOrderVar.total_pv}" type="number" pattern="###,###,##0.00"/>
				</td>
				<td>
					<fmt:formatNumber value="${plMemberOrderVar.group_pv}" type="number" pattern="###,###,##0.00"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<win:page pageId="plMemberOrderListPager" action="plMemberOrders.jhtml" autoIncludeParameters="true"/>
	
<script type="text/javascript">
$(function() {

});
function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>