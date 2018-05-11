<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="label.history.records"/></title>
    <meta name="heading" content="<fmt:message key="label.history.records"/>"/>
</head>

<ul class="nav nav-tabs">
	<li role="presentation">
		<a href="editFiAcConvert.jhtml?strAction=memberEditFiAcConvert"><fmt:message key="menu.memberEditFiAcConvert"/></a>
	</li>
	<li role="presentation" class="active">
		<a href="fiAcConverts.jhtml"><fmt:message key="label.history.records"/></a>
	</li>
</ul>

<br/>

<form name="fiAcTransFunctionForm" id="fiAcTransFunctionForm" action="editFiAcConvert.jhtml" method="post" >
	<%@ include file="/common/messages.jsp" %>
	<input type="hidden" name="selectedIds">
	<input type="hidden" name="strAction">
	<input type="hidden" name="_form_uniq_id" value="${form.token}" />
</form>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th><fmt:message key="sysOperationLog.moduleName"/></th>
			<th><fmt:message key="stStockLog.sourceOrderNo"/></th>
			<th><fmt:message key="labe.in.and.or.account.type"/></th>
			<th><fmt:message key="label.fi.out.coin"/></th>
			<th><fmt:message key="label.fi.in.coin.amount"/></th>
			<th><fmt:message key="miMemberApply.createTime"/></th>
			<th><fmt:message key="fi.status"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${fiAcTranss}" var="fiAcTransVar">
			<tr>
				<td>
					<c:if test="${fiAcTransVar.is_bonus==0 && fiAcTransVar.status==1 && fiAcTransVar.order_type==2 && empty fiAcTransVar.order_no}">
						<a href="javascript:cancelFiAcConvert('${fiAcTransVar.id }');" class="btn btn-danger btn-xs"><fmt:message key="operation.button.cancel"/></a>
					</c:if>
				</td>
				<td nowrap="nowrap">
					<a href="viewFiAcConvert.jhtml?id=${fiAcTransVar.id }">${fiAcTransVar.tran_no}</a>
				</td>
				<td>
					<win:code listCode="bank_account_types" value="${fiAcTransVar.out_ac_type }"/>=><win:code listCode="bank_account_types" value="${fiAcTransVar.in_ac_type }"/>
				</td>
				<td>
					<fmt:formatNumber value="${fiAcTransVar.out_money}" pattern="###,###,##0.00"/>
				</td>
				<td>
					<fmt:formatNumber value="${fiAcTransVar.in_money}" pattern="###,###,##0.00"/>
				</td>
				<td>
					${fiAcTransVar.create_time}
				</td>
				<td>
					<c:if test="${fiAcTransVar.status==99 }"><span class="label label-default"><fmt:message key="pr.returned"/></span></c:if>
					<c:if test="${fiAcTransVar.status!=99 }">
						<c:if test="${fiAcTransVar.order_type==2}">
							<c:if test="${fiAcTransVar.is_bonus==2 }"><span class="label label-success"><fmt:message key="label.succed"/></span></c:if>
							<c:if test="${fiAcTransVar.is_bonus!=2 }"><span class="label label-primary"><fmt:message key="label.waiting"/></span></c:if>
						</c:if>
						<c:if test="${fiAcTransVar.order_type==0}">
							<c:if test="${fiAcTransVar.status==1 }"><span class="label label-success"><fmt:message key="label.succed"/></span></c:if>
						</c:if>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<win:page pageId="fiAcConvertsListPager" action="fiAcConverts.jhtml" autoIncludeParameters="true"/>

<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function cancelFiAcConvert(id){
	if(!confirm("<fmt:message key="info.confirm.cancel.this.convert"/>?")){
		return;
	}
	var theForm=document.fiAcTransFunctionForm;
	theForm.selectedIds.value=id;
	theForm.strAction.value="memberCancelFiAcConvert";
	
	showLoading();
	theForm.submit();
}
</script>