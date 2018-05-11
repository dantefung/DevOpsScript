<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="label.history.records"/></title>
    <meta name="heading" content="<fmt:message key="label.history.records"/>"/>
</head>


<ul class="nav nav-tabs">
	<win:power powerCode="memberEditFiAcApplToETB">
		<li><a href="${ctx }/member/editFiAcApplToETB.jhtml?strAction=memberEditFiAcApplToETB"><fmt:message key="menu.export.coin"/></a></li>
	</win:power>
    <win:power powerCode="memberListFiAcApplToETBs">
		<li class="active"><a href="${ctx }/member/fiAcApplToETBs.jhtml"><fmt:message key="label.history.records"/></a></li>
	</win:power>
</ul>

<br/>

<form name="fiAcApplFunctionForm" id="fiAcApplFunctionForm" action="editFiAcApplToETB.jhtml" method="post" >
	<%@ include file="/common/messages.jsp" %>

	<input type="hidden" name="selectedIds">
	<input type="hidden" name="strAction">
	<input type="hidden" name="_form_uniq_id" value="${form.token}" />
</form>

<%@ include file="/common/messages.jsp" %>
	
<c:forEach items="${fiAcAppls }" var="fiAcApplyVar">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="col-md-10">
					<p><fmt:message key="miMemberApalyCheck.askForNo"/>：<strong>${fiAcApplyVar.appl_no }</strong></p>
					<p><fmt:message key="miMemberApply.createTime"/>：${fiAcApplyVar.create_time }</p>
					<p><fmt:message key="member.sqje"/>：<strong><fmt:formatNumber value="${fiAcApplyVar.amount}" type="number" pattern="###,###,##0.00"/></strong></p>
					<p><fmt:message key="label.coin.address"/>：${fiAcApplyVar.c_address }</p>
					<p>
						<fmt:message key="member.stuts"/>：<win:code listCode="bonus_appl_status" value="${fiAcApplyVar.status}"/>
						<c:if test="${not empty fiAcApplyVar.false_reason }"> - ${fiAcApplyVar.false_reason }</c:if>
					</p>
				</div>
				<div class="col-md-2 text-right">
					<win:power powerCode="memberCancelFiAcApplyToETB">
						<c:if test="${fiAcApplyVar.status==0 }">
							<a class="btn btn-danger btn-xs" href="javascript:doCancelBdBonusApply('${fiAcApplyVar.id }')"><fmt:message key="member.qxsq"/></a>
						</c:if>
					</win:power>
				</div>
			</div>
			<c:if test="${not empty fiAcApplyVar.notes }">
				<pre>${fiAcApplyVar.notes }</pre>
			</c:if>
		</div>
	</div>

</c:forEach>

<win:page pageId="fiAcApplListPager" action="fiAcApplToETBs.jhtml" autoIncludeParameters="true"/>

	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function doCancelBdBonusApply(id){
	if(!confirm("<fmt:message key="info.sure.cancel.appl"/>?")){
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=id;
	theForm.strAction.value="memberCancelFiAcApplyToETB";
	
	showLoading();
	theForm.submit();
}
</script>