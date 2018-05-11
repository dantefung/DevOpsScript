<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="busi.pdExchangeOrderManage"/></title>
    <meta name="heading" content="<fmt:message key="busi.pdExchangeOrderManage"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdExchanges.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><%--换货单号--%><fmt:message key="busi.pdExchangeOrder.no"/></dt>
			<dd><input type="text" name="exchangeCode" value="${param.exchangeCode }"/></dd>
		</dl>
		<dl>
			<dt><%--发货单号--%><fmt:message key="busi.pdExchangeOrder.no"/></dt>
			<dd><input type="text" name="siNo" value="${param.siNo }"/></dd>
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
			<dt><win:list listCode="st.senttime.list" name="searchTime" id="searchTime" defaultValue="" value="${param.searchTime }" showBlankLine="true"/></dt>
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
			<dt><%--已确认--%><fmt:message key="busi.list.confirm"/></dt>
			<dd><win:list name="confirmStatus" listCode="yesno" defaultValue="" value="${param.confirmStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><%--搜索--%><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listPdExchanges"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdExchangeFunctionForm" id="pdExchangeFunctionForm" action="editPdExchange.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPdExchange">
				<a href="editPdExchange.jhtml?strAction=addPdExchange" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkPdExchange">
				<a href="javascript:multiCheckPdExchange()" name="check">
					<%--审核--%><fmt:message key="po.lpstatus.2"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="uncheckPdExchange">
				<a href="javascript:multiUncheckPdExchange()" name="uncheck">
					<%--取消审核--%><fmt:message key="function.menu.order.cancel.cn"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="confirmPdExchange">
				<a href="javascript:multiConfirmPdExchange()" name="confirm">
					<%--确认--%><fmt:message key="operation.button.confirm"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePdExchange">
				<a href="javascript:multiDeletePdExchange()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedExchangeCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pdExchangeListTableForm" method="get" >
		<ec:table 
			tableId="pdExchangeListTable"
			items="pdExchanges"
			var="pdExchangeVar"
			action="pdExchanges.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdExchangeListTableForm">
			<ec:row>
				<ec:column alias="chkExchangeCode" headerCell="selectAll" style="width:5px;">
					<c:if test="${pdExchangeVar.confirm_status!=1 }">
						<input type="checkbox" name="chkExchangeCode" value="${pdExchangeVar.exchange_code}" class="checkbox"/>
					</c:if>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<nobr>
						<win:power powerCode="viewPdExchange">
							<a href="viewPdExchange.jhtml?strAction=viewPdExchange&exchangeCode=${pdExchangeVar.exchange_code}" name="view"><fmt:message key="button.view"/></a>
						</win:power>
						<c:if test="${pdExchangeVar.check_status!=1 }">
							<win:power powerCode="editPdExchange">
								<a href="editPdExchange.jhtml?strAction=editPdExchange&exchangeCode=${pdExchangeVar.exchange_code}" name="edit"><fmt:message key="button.edit"/></a>
							</win:power>
						</c:if>
					</nobr>
				</ec:column>
				<ec:column property="company_code" title="bdReconsumMoneyReport.company" />
				<ec:column property="exchange_code" title="busi.pdExchangeOrder.no" />
				<ec:column property="si_no" title="pdSendInfo.siNo" />
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="warehouse_code" title="busi.warehouse.warehouseno" />
				<ec:column property="createTime" title="pd.createTime">
					${pdExchangeVar.creator_code } - ${pdExchangeVar.create_time }
				</ec:column>
				<ec:column property="check_status" title="pd.checked" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pdExchangeVar.check_status }"/>
				</ec:column>
				<ec:column property="check_time" title="icAnnounce.checkTime">
					${pdExchangeVar.checker_code } - ${pdExchangeVar.check_time }
				</ec:column>
				<ec:column property="confirm_status" title="busi.list.confirm" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pdExchangeVar.confirm_status }"/>
				</ec:column>
				<ec:column property="confirm_time" title="pd.okTime">
					${pdExchangeVar.confirm_user_code } - ${pdExchangeVar.confirm_time }
				</ec:column>
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

function multiDeletePdExchange(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkExchangeCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdExchangeFunctionForm;
	theForm.selectedExchangeCodes.value=selectedValues;
	theForm.strAction.value="multiDeletePdExchange";
	
	showLoading();
	theForm.submit();
}

function multiCheckPdExchange(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkExchangeCode"));
	if(!selectedValues){
		alert("<fmt:message key='busi.please.select.documents.audited'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.please.confirm.documents.audited'/>.")){
		return;
	}
	var theForm=document.pdExchangeFunctionForm;
	theForm.selectedExchangeCodes.value=selectedValues;
	theForm.strAction.value="checkPdExchange";
	
	showLoading();
	theForm.submit();
}

function multiUncheckPdExchange(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkExchangeCode"));
	if(!selectedValues){
		alert("<fmt:message key='busi.please.select.documents.cancelled'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.confirm.documents.selected.cancellation.audit'/>.")){
		return;
	}
	var theForm=document.pdExchangeFunctionForm;
	theForm.selectedExchangeCodes.value=selectedValues;
	theForm.strAction.value="uncheckPdExchange";
	
	showLoading();
	theForm.submit();
}

function multiConfirmPdExchange(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkExchangeCode"));
	if(!selectedValues){
		alert("<fmt:message key='busi.please.select.documents.confirmation'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.confirm.mark.selected.documents'/>.")){
		return;
	}
	var theForm=document.pdExchangeFunctionForm;
	theForm.selectedExchangeCodes.value=selectedValues;
	theForm.strAction.value="confirmPdExchange";
	
	showLoading();
	theForm.submit();
}
</script>