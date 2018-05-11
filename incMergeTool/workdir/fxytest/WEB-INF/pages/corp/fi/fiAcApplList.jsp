<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="lang.cashWithdrawAppMgr" /></title>
	<meta name="heading" content="<fmt:message key="lang.cashWithdrawAppMgr"/>" />
</head>

<div class="searchBar">
	<form method="get" action="fiAcAppls.jhtml"
		onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd>
					<fmt:message key="label.company" />
				</dd>
				<dd>
					<select name="companyCode" id="companyCode">
						<option value=""></option>
						<c:forEach items="${alCompanys}" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }" <c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode} - ${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="miMemberApalyCheck.askForNo" /></dt>
			<dd>
				<input type="text" name="applNo" value="${param.applNo }" />
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo" /></dt>
			<dd>
				<input type="text" name="memberNo" value="${param.memberNo }" />
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="lang.withDraw.Acc" /></dt>
			<dd>
				<select name="acType">
					<option value=""></option>
					<c:forEach items="${acTypes }" var="acTypeVar">
						<c:if test="${acTypeVar.key=='A0' || acTypeVar.key=='B1' }">
							<option value="${acTypeVar.key }"<c:if test="${acTypeVar.key==param.acType }"> selected</c:if>><fmt:message key="${acTypeVar.value }"/></option>
						</c:if>
					</c:forEach>
				</select>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="bdSendRemittanceReport.openBankCH" /></dd>
			<dd><win:list name="openBank" listCode="bankcodes" defaultValue="" value="${param.openBank }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>
				<win:list name="dateType" listCode="fi_ac_appl_date" defaultValue="" value="${param.dateType }" showBlankLine="true"/>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12" />
				 - 
				 <input type="text"	name="endDate" id="endDate"	value="${param.endDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status" /></dt>
			<dd>
				<win:list name="status" listCode="bonus_appl_status" defaultValue="" value="${param.status }" showBlankLine="true" />
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search" /></button>
				<input type="hidden" name="strAction" value="listFiAcAppls" />
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="6"><fmt:message key="poOrder.amtCount"/>：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					${sumMap.total_amount }
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					${sumMap.total_fees }
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					${sumMap.total_send_amt }
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" align="right" colspan="9"></td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="fiAcApplFunctionForm" id="fiAcApplFunctionForm" action="handleFiAcAppl.jhtml" method="post">
		<%@ include file="/common/messages.jsp"%>

		<div class="functionBar">
			<%-- <win:power powerCode="addFiAcAppl">
				<a href="editFiAcAppl.jhtml?strAction=addFiAcAppl" name="add">
					<fmt:message key="operation.button.add" />
				</a>
				<span class="divider">&nbsp;</span>
			</win:power> --%>
			<win:power powerCode="checkFiAcAppl">
				<a href="javascript:multiCheckFiAcAppl()" name="check"><fmt:message key="po.lpstatus.2" /></a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="returnFiAcAppl">
				<a href="javascript:multiReturnFiAcAppl()" name="uncheck"><fmt:message key="lang.return" /></a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="successFiAcAppl">
				<a href="javascript:multiSuccessFiAcAppl()" name="submit"><fmt:message key="label.handle.success" /></a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="failFiAcAppl">
				<a href="javascript:multiFailFiAcAppl()" name="nosubmit"><fmt:message key="label.handle.failed" /></a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>

	<form id="fiAcApplListTableForm" method="get">
		<ec:table tableId="fiAcApplListTable" items="fiAcAppls"
			var="fiAcApplVar" action="fiAcAppls.jhtml" width="100%"
			method="get" autoIncludeParameters="true"
			retrieveRowsCallback="limit" rowsDisplayed="20" sortable="false"
			form="fiAcApplListTableForm" footer="${footTotalVar }">
			<ec:exportXls fileName="fiAcApps.xls"/>
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${fiAcApplVar.status==0 || fiAcApplVar.status==1}">
						<input type="checkbox" name="chkId" value="${fiAcApplVar.id}" class="checkbox" />
					</c:if>
				</ec:column>

				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" viewsAllowed="html">
					<win:power powerCode="viewFiAcAppl">
						<a href="viewFiAcAppl.jhtml?strAction=viewFiAcAppl&id=${fiAcApplVar.id}" name="view"><fmt:message key="button.view" /></a>
					</win:power>
					<c:if test="${fiAcApplVar.status==0 }">
						<%-- <win:power powerCode="editFiAcAppl">
							<a href="editFiAcAppl.jhtml?strAction=editFiAcAppl&id=${fiAcApplVar.id}" name="edit"><fmt:message key="button.edit" /></a>
						</win:power> --%>
						<win:power powerCode="checkFiAcAppl">
							<a href="handleFiAcAppl.jhtml?strAction=checkFiAcAppl&id=${fiAcApplVar.id}" name="check"><fmt:message key="po.lpstatus.2" /></a>
						</win:power>
						<win:power powerCode="returnFiAcAppl">
							<a href="handleFiAcAppl.jhtml?strAction=returnFiAcAppl&id=${fiAcApplVar.id}" name="uncheck"><fmt:message key="operation.button.cancel" /></a>
						</win:power>
					</c:if>
					<c:if test="${fiAcApplVar.status==1 }">
						<win:power powerCode="successFiAcAppl">
							<a href="handleFiAcAppl.jhtml?strAction=successFiAcAppl&id=${fiAcApplVar.id}" name="submit"><fmt:message key="label.handle.success" /></a>
						</win:power>
						<win:power powerCode="failFiAcAppl">
							<a href="handleFiAcAppl.jhtml?strAction=failFiAcAppl&id=${fiAcApplVar.id}" name="nosubmit"><fmt:message key="label.handle.failed" /></a>
						</win:power>
					</c:if>
				</ec:column>
				<ec:column property="appl_no" title="miMemberApalyCheck.askForNo" />
				<ec:column property="member_no" title="miMember.memberNo">
					${fiAcApplVar.member_no}
					<c:if test="${fiAcApplVar.is_credit==1 }"><span class="important">[<fmt:message key="label.company" />贷]</span></c:if>
				</ec:column>
				<ec:column property="last_name" title="poOrder.memberName" />
				<ec:column property="Ac_type" title="lang.withDraw.Acc">
					<win:code listCode="bank_account_types" value="${fiAcApplVar.ac_type }" />
				</ec:column>
				<ec:column property="amount" title="member.sqje" styleClass="numberColumn"/>
				<ec:column property="fees" title="mem.bd.charge" styleClass="numberColumn"/>
				<ec:column property="send_amt" title="lang.real.amt" styleClass="numberColumn"/>
				<ec:column property="open_bank" title="bdSendRemittanceReport.openBankCH">
					<win:code listCode="bankcodes" value="${fiAcApplVar.open_bank }"/>
				</ec:column>
				<ec:column property="b_branch" title="lang.bank.branch"/>
				<ec:column property="b_name" title="lang.bankAcc.name"/>
				<ec:column property="b_num" title="busi.common.account" viewsAllowed="html"/>
				<ec:column property="b_num2" title="busi.common.account" viewsAllowed="xls">`${fiAcApplVar.b_num }</ec:column>
				<ec:column property="Status" title="fi.status">
					<win:code listCode="bonus_appl_status" value="${fiAcApplVar.status }" />
				</ec:column>
				<ec:column property="create_time" title="pd.createTime">
					${fiAcApplVar.creater_code }<br/> ${fiAcApplVar.create_time }
				</ec:column>
				<ec:column property="check_time" title="icAnnounce.checkTime">
					${fiAcApplVar.checker_code }<br/>${fiAcApplVar.check_time }
				</ec:column>
				<%-- <ec:column property="return_code" title="退回/取消时间">
					${fiAcApplVar.return_code } - ${fiAcApplVar.return_time }
				</ec:column> --%>
				<ec:column property="send_time" title="lang.deal.time">
					${fiAcApplVar.send_code }<br/>${fiAcApplVar.send_time }
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>

<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
	$("button[name='export']",".searchBar").button({
        icons: {
            primary: "ui-icon-report"
        }
    });
	$("a[name='submit']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-submit"
        },
        text: false
    });
	$("a[name='nosubmit']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-nosubmit"
        },
        text: false
    });
});
$(document).ready(function(){
    
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiCheckFiAcAppl(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectAppToAudit'/>.");//请选择需要审核的申请单
		return;
	}
	if(!confirm("<fmt:message key='lang.plsConfirmSelectedAppToAudit'/>.")){//确认审核当前所选择的申请单
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="checkFiAcAppl";
	
	showLoading();
	theForm.submit();
}

function multiReturnFiAcAppl(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectAppToReturn'/>.");//请选择需要退回的申请单
		return;
	}
	if(!confirm("<fmt:message key='lang.plsConfirmSelectedAppToReturn'/>.")){//确认退回当前所选择的申请单
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="returnFiAcAppl";
	
	showLoading();
	theForm.submit();
}

function multiSuccessFiAcAppl(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectAppToNoteAsSuccess'/>.");//请选择需要标为处理成功的申请单
		return;
	}
	if(!confirm("<fmt:message key='lang.plsConfirmSelectedAppToNoteAsSuccess'/>?")){//确认将当前所选择的申请单标为处理成功
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="successFiAcAppl";
	
	showLoading();
	theForm.submit();
}

function multiFailFiAcAppl(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectAppToNoteAsfail'/>.");//请选择需要标为处理失败的申请单
		return;
	}
	if(!confirm("<fmt:message key='lang.plsConfirmSelectedAppToNoteAsfail'/>?")){//确认将当前所选择的申请单标为处理失败
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="failFiAcAppl";
	
	showLoading();
	theForm.submit();
}
</script>