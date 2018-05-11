<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="member.txsqdcx"/></title>
    <meta name="heading" content="<fmt:message key="member.txsqdcx"/>"/>
</head>


<ul class="nav nav-tabs">
	<win:power powerCode="memberEditFiAcAppl">
		<li><a href="${ctx }/member/editFiAcAppl.jhtml?strAction=memberEditFiAcAppl"><fmt:message key="fi.cash.withdraw"/></a></li>
	</win:power>
    <win:power powerCode="memberListFiAcAppls">
		<li class="active"><a href="${ctx }/member/fiAcAppls.jhtml"><fmt:message key="member.txsqdcx"/></a></li>
	</win:power>
</ul>

<br/>

<form name="fiAcApplFunctionForm" id="fiAcApplFunctionForm" action="editFiAcAppl.jhtml" method="post" >
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
					<p>
						<fmt:message key="member.sqje"/>：<strong><fmt:formatNumber value="${fiAcApplyVar.amount}" type="number" pattern="###,###,##0.00"/></strong>
						<span class="label label-info"><win:code listCode="bank_account_types" value="${fiAcApplyVar.ac_type }"/></span>
					</p>
					<p><fmt:message key="lang.rec.bankAccNo"/>：${fiAcApplyVar.open_bank } ${fiAcApplyVar.b_branch } - ${fiAcApplyVar.b_name }（×××× ×××× ×××× ${fn:substring(fiAcApplyVar.b_num, fn:length(fiAcApplyVar.b_num)-4, fn:length(fiAcApplyVar.b_num))}）</p>
					<p>
						<fmt:message key="member.stuts"/>：<win:code listCode="bonus_appl_status" value="${fiAcApplyVar.status}"/>
						<c:if test="${not empty fiAcApplyVar.false_reason }"> - ${fiAcApplyVar.false_reason }</c:if>
					</p>
				</div>
				<div class="col-md-2 text-right">
					<win:power powerCode="memberCancelFiAcApply">
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

<win:page pageId="fiAcApplListPager" action="fiAcAppls.jhtml" autoIncludeParameters="true"/>

	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function doCancelBdBonusApply(id){
	if(!confirm("<fmt:message key='member.checkyjsq'/>?")){
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=id;
	theForm.strAction.value="memberCancelFiAcApply";
	
	showLoading();
	theForm.submit();
}
</script>