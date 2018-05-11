<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pd.merge.exchange.cargo.management"/></title>
    <meta name="heading" content="<fmt:message key="menu.pd.merge.exchange.cargo.management"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdMergeExchs.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd><fmt:message key="label.company"/></dd>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><%--换货单号--%><fmt:message key="busi.pdExchangeOrder.not"/></dt>
			<dd><input type="text" name="exchangeCode" value="${param.exchangeCode }"/></dd>
		</dl>
		<dl>
			<dt><%--原发货单号--%><fmt:message key="busi.original.invoice.number"/></dt>
			<dd><input type="text" name="oldSiNo" value="${param.oldSiNo }"/></dd>
		</dl>
		<dl>
			<dt><%--新发货单号--%><fmt:message key="busi.new.invoice.number"/></dt>
			<dd><input type="text" name="newSiNo" value="${param.newSiNo }"/></dd>
		</dl>
		<dl>
			<dt><%--收货人编号--%><fmt:message key="po.ship.recievedno.lable"/></dt>
			<dd><input type="text" name="userCode" value="${param.userCode }"/></dd>
		</dl>
		<dl>
			<dt><%--发货仓编号--%><fmt:message key="busi.delivery.bin.number"/></dt>
			<dd><input type="text" name="warehouseCode" value="${param.warehouseCode }"/></dd>
		</dl>
		<dl>
			<dt><win:list listCode="pd_merge_exch_time" name="searchTime" id="searchTime" defaultValue="" value="${param.searchTime }" showBlankLine="true"/></dt>
			<dd>
				<input type="text" name="startShipTime" id="startShipTime" value="${param.startShipTime }" size="10"/>
				 - <input type="text" name="endShipTime" id="endShipTime" value="${param.endShipTime }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt><%--已审核--%><fmt:message key="pd.checked"/></dt>
			<dd><win:list name="checkStatus" listCode="yesno" defaultValue="" value="${param.checkStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><%--搜索--%><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listPdMergeExchs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdMergeExchFunctionForm" id="pdMergeExchFunctionForm" action="editPdMergeExch.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPdMergeExch">
				<a href="editPdMergeExch.jhtml?strAction=addPdMergeExch" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkPdMergeExch">
				<a href="javascript:multiCheckPdMergeExch()" name="check">
					<%--审核--%><fmt:message key="po.lpstatus.2"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePdMergeExch">
				<a href="javascript:multiDeletePdMergeExch()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedExchangeCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pdMergeExchListTableForm" method="get" >
		<ec:table 
			tableId="pdMergeExchListTable"
			items="pdMergeExchs"
			var="pdMergeExchVar"
			action="pdMergeExchs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdMergeExchListTableForm">
			<ec:exportXls fileName="pdMergeExchs.xls"/>
			<ec:row>
				<ec:column alias="chkExchangeCode" headerCell="selectAll" style="width:5px;" viewsAllowed="html">  
					<c:if test="${pdMergeExchVar.check_status==0 }">
						<input type="checkbox" name="chkExchangeCode" value="${pdMergeExchVar.exchange_code}" class="checkbox"/>
					</c:if>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" viewsAllowed="html">
					<win:power powerCode="viewPdMergeExch">
						<a href="viewPdMergeExch.jhtml?strAction=viewPdMergeExch&exchangeCode=${pdMergeExchVar.exchange_code}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<c:if test="${pdMergeExchVar.check_status==0 }">
					<win:power powerCode="editPdMergeExch">
						<a href="editPdMergeExch.jhtml?strAction=editPdMergeExch&exchangeCode=${pdMergeExchVar.exchange_code}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					</c:if>
				</ec:column>
				<ec:column property="company_code" title="bdReconsumMoneyReport.company" />
				<ec:column property="exchange_code" title="busi.pdExchangeOrder.no" />
				<ec:column property="new_si_no" title="busi.new.invoice.number" />
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="warehouse_code" title="busi.warehouse.warehouseno" />
				<ec:column property="old_total_price" title="busi.total.price.original.commodity" styleClass="numberColumn"/>
				<ec:column property="new_total_price" title="busi.total.price.new.commodity" styleClass="numberColumn"/>
				<ec:column property="createTime" title="pd.createTime">
					${pdMergeExchVar.creator_code } - ${pdMergeExchVar.create_time }
				</ec:column>
				<ec:column property="check_status" title="pd.checked" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pdMergeExchVar.check_status }"/>
				</ec:column>
				<ec:column property="check_time" title="icAnnounce.checkTime">
					${pdMergeExchVar.checker_code } - ${pdMergeExchVar.check_time }
				</ec:column>
				
				<c:if test="${ROWCOUNT>0}">
					<c:if test="${ROWCOUNT%2!=0}"><tr class="odd"></c:if>
					<c:if test="${ROWCOUNT%2==0}"><tr class="even"></c:if>
						<td align="right" valign="top" colspan="3">&nbsp;</td>
						<td colspan="10">
							${pdMergeExchVar.region_name}${pdMergeExchVar.ship_address1} 【${pdMergeExchVar.ship_zip_code}】 / ${pdMergeExchVar.ship_last_name}&nbsp;${pdMergeExchVar.ship_mobile }<br />
							<c:forEach items="${pdMergeExchVar.pdMergeExchDetails}" var="pdMergeExchDetailVar" varStatus="status">
								<c:if test="${!status.first}"><br/></c:if>
								<font color=#888888>
								<c:if test="${pdMergeExchDetailVar.qty < 0}">
								<font color="red">[${pdMergeExchDetailVar.qty}]</font></c:if>
								<c:if test="${pdMergeExchDetailVar.qty > 0}">
								<font color="green">[${pdMergeExchDetailVar.qty}]</font></c:if>									
								&nbsp;${pdMergeExchDetailVar.product_code} / ${pdMergeExchDetailVar.product_name}
								</font>
							</c:forEach>
						</td>
					</tr>
				</c:if>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startShipTime,#endShipTime" ).datepicker();
	
	$("a[name='confirm']",".functionBar").button({
        icons: {
        	primary: "ui-icon-submit"
        }
    });
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePdMergeExch(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkExchangeCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdMergeExchFunctionForm;
	theForm.selectedExchangeCodes.value=selectedValues;
	theForm.strAction.value="multiDeletePdMergeExch";
	
	showLoading();
	theForm.submit();
}

function multiCheckPdMergeExch(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkExchangeCode"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectOrderToAudit'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.please.confirm.documents.audited'/>.")){
		return;
	}
	var theForm=document.pdMergeExchFunctionForm;
	theForm.selectedExchangeCodes.value=selectedValues;
	theForm.strAction.value="checkPdMergeExch";
	
	showLoading();
	theForm.submit();
}

function multiUncheckPdMergeExch(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkExchangeCode"));
	if(!selectedValues){
		alert("<fmt:message key='busi.please.select.documents.cancelled'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.confirm.documents.selected.cancellation.audit'/>.")){
		return;
	}
	var theForm=document.pdMergeExchFunctionForm;
	theForm.selectedExchangeCodes.value=selectedValues;
	theForm.strAction.value="uncheckPdMergeExch";
	
	showLoading();
	theForm.submit();
}

function multiConfirmPdMergeExch(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkExchangeCode"));
	if(!selectedValues){
		alert("<fmt:message key='busi.please.select.documents.confirmation'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.confirm.mark.selected.documents'/>.")){
		return;
	}
	var theForm=document.pdMergeExchFunctionForm;
	theForm.selectedExchangeCodes.value=selectedValues;
	theForm.strAction.value="confirmPdMergeExch";
	
	showLoading();
	theForm.submit();
}
</script>