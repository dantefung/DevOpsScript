<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="会员查询"/></title>
    <meta name="heading" content="<fmt:message key="会员查询"/>"/>
</head>
<%@ include file="/common/messages.jsp" %>
<div class="searchBar">
	<form method="get" action="memberSearchList.jhtml" onsubmit="return validateSearch(this)" class="form-inline">	
		<input type="text" name="memberNo" id="memberNo" class="form-control input-sm" value="${param.memberNo }" placeholder="<fmt:message key="miMember.memberNo"/>"/>
		<input type="text" name="username" id="username" class="form-control" value="${param.username }" placeholder="会员姓名或昵称"/>
		<button type="submit" name="search" class="btn btn-info"><fmt:message key="operation.button.search"/></button>
	</form>
</div>

<hr/>
<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><fmt:message key="miMember.memberNo"/></th>
				<th><fmt:message key="mi.register.petName"/></th>
				<th><fmt:message key="miMember.cardType"/></th>
				<th><fmt:message key="mi.recommendNo"/></th>
				<th><fmt:message key="推荐人昵称"/></th>
				<th><fmt:message key="mi.linkno.lable"/></th>
				<th><fmt:message key="安置人昵称"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${miMembers}" var="miMember">
				<tr>
					<td>${miMember.member_no }</td>
					<td>${miMember.pet_name }</td>
					<td><win:code listCode="member.card.type" value="${miMember.card_type }" /></td>
					<td>${miMember.recommend_no } </td>
					<td>${miMember.recommend_pet_name }</td>
					<td>${miMember.link_no }</td>
					<td>${miMember.link_pet_name } </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

<%-- <win:page pageId="memberListPager" action="memberSearchList.jhtml" autoIncludeParameters="true"/> --%>
	
<form action="memberOrderRecieve.jhtml" method="post" name="recieveFrm" id="recieveFrm">
	<input type="hidden" name="orderId" id="orderId">
	<input type="hidden" name="orderNo" id="orderNo">
	<input type="hidden" name="userCode" id="userCode">
	<input type="hidden" name="strAction" id="strAction" value="memberOrderReceived">
</form>	



<script type="text/javascript">
$(function() {
	//$( "#startDate,#endDate" ).datepicker();
});
function recieve(orderId,orderNo,userCode){
	if(confirm("<fmt:message key="mi.recieve.sure.prompt"/>?")){
		document.recieveFrm.orderId.value= orderId;
		document.recieveFrm.orderNo.value= orderNo;
		document.recieveFrm.userCode.value= userCode;
		document.recieveFrm.submit();
	}
}
function validateSearch(theForm) {
	showLoading();
	return true;
}

function confirmRemove(){
	if(confirm("<fmt:message key="mi.button.cancle.sure"/>?")){
		return true;
	}
	return false;
}
</script>