<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="function.menu.memberListMiMemberAccounts"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.memberListMiMemberAccounts"/>"/>
</head>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	
	<c:forEach items="${miMemberAccounts}" var="miMemberAccountVar">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="col-md-10">
						<p>${miMemberAccountVar.openBank }</p>
						<p>${miMemberAccountVar.bbranch }</p>
						<p>${miMemberAccountVar.bname }</p>
						<p style="font-size: 16px;">
							<strong>
							×××× ×××× ×××× ${fn:substring(miMemberAccountVar.bnum, fn:length(miMemberAccountVar.bnum)-4, fn:length(miMemberAccountVar.bnum))}
							</strong>
						</p>
					</div>
					<div class="col-md-2 text-right">
						<a href="editMiMemberAccount.jhtml?strAction=memberEditMiMemberAccount&accId=${miMemberAccountVar.accId}" class="btn btn-info btn-sm">
							<fmt:message key="button.edit"/>
						</a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="text-center">
		<win:power powerCode="memberAddMiMemberAccount">
			<a href="editMiMemberAccount.jhtml?strAction=memberAddMiMemberAccount" class="btn btn-info">
				<fmt:message key="menu.new.bank.account"/>
			</a>
			<span class="divider">&nbsp;</span>
		</win:power>
	</div>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiMemberAccount(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAccId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miMemberAccountFunctionForm;
	theForm.selectedAccIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiMemberAccount";
	
	showLoading();
	theForm.submit();
}
</script>