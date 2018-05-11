<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="lang.money.wiring.mgr" /></title>
	<meta name="heading" content="<fmt:message key="lang.money.wiring.mgr"/>" />
</head>

<div class="searchBar">
	<form method="get" action="fiPayAdvices.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="pd.orderNo" /></dt>
			<dd>
				<input type="text" name="adviceCode" value="${param.adviceCode }" />
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo" /></dt>
			<dd>
				<input type="text" name="userCode" value="${param.userCode }" />
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.remit.orderNo" /></dt>
			<dd>
				<input type="text" name="remitNo" value="${param.remitNo }" />
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="alCompany.phone" /></dt>
			<dd>
				<input type="text" name="mobile" value="${param.mobile }" />
			</dd>
		</dl>
		<dl>
			<dt>
				<win:list name="dateType" listCode="pay_advice_search_time" defaultValue="" value="${param.dateType }" showBlankLine="true"/>
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
				<win:list name="status" listCode="pay_advice_status" defaultValue="" value="${param.status }" showBlankLine="true" />
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search" /></button>
				<input type="hidden" name="strAction" value="listFiPayAdvices" />
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="6"><fmt:message key="report.allTotal" />：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					<fmt:formatNumber pattern="###,##0.00">${sumMap.total_pay_amount }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer"></td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					<fmt:formatNumber pattern="###,##0.00">${sumMap.total_sc_qty }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" align="right" colspan="8"></td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="fiPayAdviceFunctionForm" id="fiPayAdviceFunctionForm"
		action="handleFiPayAdvice.jhtml" method="post">
		<%@ include file="/common/messages.jsp"%>

		<div class="functionBar">
			<%-- <win:power powerCode="addFiPayAdvice">
				<a href="editFiPayAdvice.jhtml?strAction=addFiPayAdvice" name="add">
					<fmt:message key="operation.button.add" />
				</a>
				<span class="divider">&nbsp;</span>
			</win:power> --%>
			<win:power powerCode="checkFiPayAdvice">
				<a href="javascript:multiCheckFiPayAdvice()" name="check"><fmt:message key="pd.orderNo" /><fmt:message key="po.lpstatus.2" /></a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="calcelFiPayAdvice">
				<a href="javascript:multiUncheckFiPayAdvice()" name="uncheck"><fmt:message key="pd.orderNo" /><fmt:message key="operation.button.cancel" /></a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedAdviceCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>

	<%
	request.setAttribute("vEnter", "\n");
	%>

	<form id="fiPayAdviceListTableForm" method="get">
		<ec:table tableId="fiPayAdviceListTable" items="fiPayAdvices"
			var="fiPayAdviceVar" action="fiPayAdvices.jhtml" width="100%"
			method="get" autoIncludeParameters="true"
			retrieveRowsCallback="limit" rowsDisplayed="20" sortable="false"
			form="fiPayAdviceListTableForm" footer="${footTotalVar }">
			<ec:exportXls fileName="fiPayAdvices.xls"></ec:exportXls>
			<ec:row>
				<ec:column alias="chkAdviceCode" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${fiPayAdviceVar.status==0 }">
						<input type="checkbox" name="chkAdviceCode" value="${fiPayAdviceVar.advice_code}" class="checkbox" viewsAllowed="html" />
					</c:if>
				</ec:column>

				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" viewsAllowed="html">
					<win:power powerCode="viewFiPayAdvice">
						<a href="viewFiPayAdvice.jhtml?strAction=viewFiPayAdvice&adviceCode=${fiPayAdviceVar.advice_code}" name="view"><fmt:message key="button.view" /></a>
					</win:power>
					<c:if test="${fiPayAdviceVar.status==0 }">
						<%-- <win:power powerCode="editFiPayAdvice">
							<a href="editFiPayAdvice.jhtml?strAction=editFiPayAdvice&adviceCode=${fiPayAdviceVar.advice_code}" name="edit"><fmt:message key="button.edit" /></a>
						</win:power> --%>
						<win:power powerCode="checkFiPayAdvice">
							<a href="handleFiPayAdvice.jhtml?strAction=checkFiPayAdvice&adviceCode=${fiPayAdviceVar.advice_code}" name="check"><fmt:message key="po.lpstatus.2" /></a>
						</win:power>
						<win:power powerCode="calcelFiPayAdvice">
							<a href="handleFiPayAdvice.jhtml?strAction=calcelFiPayAdvice&adviceCode=${fiPayAdviceVar.advice_code}" name="uncheck"><fmt:message key="operation.button.cancel" /></a>
						</win:power>
					</c:if>
				</ec:column>
				<ec:column property="company_code" title="label.company" />
				<ec:column property="advice_code" title="pd.orderNo">
					${fiPayAdviceVar.advice_code }
					<c:if test="${not empty fiPayAdviceVar.file_url }">
						&nbsp;<a title="mimember.uploadfile.files" href="<c:url value="${fiPayAdviceVar.file_url}"/>" target="_blank" name="attachment"><fmt:message key="mimember.uploadfile.files" /></a>
					</c:if>
				</ec:column>
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="pay_amount" title="bdSendRecord.remittanceMoney" styleClass="numberColumn">
					${fiPayAdviceVar.currency }&nbsp;<fmt:formatNumber pattern="###,##0.00">${fiPayAdviceVar.pay_amount }</fmt:formatNumber>
				</ec:column>
				<%-- <ec:column property="sc_value" title="汇率" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${fiPayAdviceVar.sc_value }</fmt:formatNumber>
				</ec:column>
				<ec:column property="sc_qty" title="入账金额" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${fiPayAdviceVar.sc_qty }</fmt:formatNumber>
				</ec:column> --%>
				<ec:column property="pay_date" title="fiPayAdvice.send.date">
					${fn:substring(fiPayAdviceVar.pay_date,0,10)}
				</ec:column>
				<ec:column property="remit_no" title="fi.remit.orderNo"/>
				<ec:column property="Bank_code" title="lang.money.wiring.acc">
					${fiPayAdviceVar.bank_code }<br/>
					${fiPayAdviceVar.bank_branch }<br/>
					${fiPayAdviceVar.account_name }<br/>
					${fiPayAdviceVar.account_no }
				</ec:column>
				<ec:column property="Pay_date" title="label.recieve.money.account">
					${fiPayAdviceVar.target_bank_code }<br/>
					${fiPayAdviceVar.target_bank_branch }<br/>
					${fiPayAdviceVar.target_account_no }
				</ec:column>
				<ec:column property="Remark" title="busi.common.remark">
					${fn:replace(fiPayAdviceVar.remark, vEnter, '<br>')}
				</ec:column>
				<ec:column property="Status" title="fi.status">
					<win:code listCode="pay_advice_status" value="${fiPayAdviceVar.status }" />
				</ec:column>
				<ec:column property="Creator_code" title="pd.createTime">
					${fiPayAdviceVar.creator_code } <br/> ${fiPayAdviceVar.create_time }
				</ec:column>
				<ec:column property="Checker_code" title="icAnnounce.checkTime">
					${fiPayAdviceVar.checker_code } <br/> ${fiPayAdviceVar.check_time }
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
	$("a[name='view']",".searchBar").button({
        icons: {
            primary: "ui-icon-search"
        }
    });
});
$(document).ready(function(){
    <c:if test="${not empty district}">
		refreshChildRegions("${province.regionId}","2860","province");
		refreshChildRegions("${city.regionId}","${province.regionId}","city");
		refreshChildRegions("${district.regionId}","${city.regionId}","district");
		
	</c:if>
	<c:if test="${not empty city && empty district }">
		refreshChildRegions("${province.regionId}","2860","province");
		refreshChildRegions("${city.regionId}","${province.regionId}","city");
		refreshChildRegions("-1","${city.regionId}","district");
		
	</c:if>
	<c:if test="${not empty province && empty city }">
		refreshChildRegions("${province.regionId}","2860","province");
		refreshChildRegions("-1","${province.regionId}","city");
		
	</c:if>
	<c:if test="${empty province}">
		 refreshChildRegions("-1","2860","province");
	</c:if>
	
	 $('#country').change(function(){
    	refreshChildRegions("-1",$(this).children('option:selected').val(),"province");
    	refreshChildRegions("-1","-1","city");
    	refreshChildRegions("-1","-1","district");
    });
    $('#province').change(function(){
    	refreshChildRegions("-1",$(this).children('option:selected').val(),"city");
    	refreshChildRegions("-1","-1","district");
    });
    $('#city').change(function(){
    	refreshChildRegions("-1",$(this).children('option:selected').val(),"district");
    });
  //如果分公司是中国，则可以选择国家
    if('${companyCode}'=="AA"){
    	document.getElementById("country").style.display = "";
    }	
})
function refreshChildRegions(selectedValue, regionId, targetObjId){
	dwr.util.removeAllOptions(targetObjId);
	AlRegionAjax.getChildRegionsToMap(regionId,'${companyCode}', function(data){
 		dwr.util.addOptions(targetObjId, data);
 		document.getElementById(targetObjId).value = selectedValue;
	});
}
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiPayAdvice(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdviceCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiPayAdviceFunctionForm;
	theForm.selectedAdviceCodes.value=selectedValues;
	theForm.strAction.value="multiDeleteFiPayAdvice";
	
	showLoading();
	theForm.submit();
}

function multiCheckFiPayAdvice(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdviceCode"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plzSelectRemittanceToAudit'/>.");//请选择需要审核的汇款通知单
		return;
	}
	if(!confirm("<fmt:message key='lang.plzConfirmSelectedRemittanceToAudit'/>.")){//确认审核当前所选择的汇款通知单
		return;
	}
	var theForm=document.fiPayAdviceFunctionForm;
	theForm.selectedAdviceCodes.value=selectedValues;
	theForm.strAction.value="checkFiPayAdvice";
	
	showLoading();
	theForm.submit();
}

function multiUncheckFiPayAdvice(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdviceCode"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plzSelectRemittanceToCancel'/>.");//请选择需要取消的汇款通知单
		return;
	}
	if(!confirm("<fmt:message key='lang.plzConfirmSelectedRemittanceToCancel'/>.")){//确认取消当前所选择的汇款通知单
		return;
	}
	var theForm=document.fiPayAdviceFunctionForm;
	theForm.selectedAdviceCodes.value=selectedValues;
	theForm.strAction.value="calcelFiPayAdvice";
	
	showLoading();
	theForm.submit();
}
</script>