<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pd.allocation.management"/></title>
    <meta name="heading" content="<fmt:message key="menu.pd.allocation.management"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdAllotTrans.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="pdFlitWarehouseDetail.fwNo"/></dt>
			<dd><input type="text" name="tranNo" value="${param.tranNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.warehouse.outwatehouseno"/></dt>
			<dd><input type="text" name="outWarehouseNo" value="${param.outWarehouseNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.warehouse.inwatehouseno"/></dt>
			<dd><input type="text" name="inWarehouseNo" value="${param.inWarehouseNo }"/></dd>
		</dl>
		<dl>
			<dt><win:list name="dateRange" listCode="pd_tran_date_range" defaultValue="" value="${param.dateRange }" showBlankLine="true"/> </dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12"/>
				-
				<input type="text" name="endDate" id="endDate" value="${param.endDate }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="pd.checked"/></dt>
			<dd><win:list name="checkStatus" listCode="yesno" defaultValue="" value="${param.checkStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.list.confirm"/></dt>
			<dd><win:list name="outStatus" listCode="yesno" defaultValue="" value="${param.outStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pr.into2"/></dt>
			<dd><win:list name="inStatus" listCode="yesno" defaultValue="" value="${param.inStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pmEcProductItem.contain.ecProductNo"/></dt>
			<dd><input type="text" name="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listPdAllotTrans"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdAllotTranFunctionForm" id="pdAllotTranFunctionForm" action="editPdAllotTran.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPdAllotTran">
				<a href="editPdAllotTran.jhtml?strAction=addPdAllotTran" name="add">
					<fmt:message key="busi.apply.for.allocation"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedTranNos">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pdAllotTranListTableForm" method="get" >
		<ec:table 
			tableId="pdAllotTranListTable"
			items="pdAllotTrans"
			var="pdAllotTranVar"
			action="pdAllotTrans.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdAllotTranListTableForm">
			<ec:row>
				<%-- <ec:column alias="chkTranNo" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkTranNo" value="${pdAllotTranVar.tran_no}" class="checkbox"/>
		  		</ec:column> --%>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<nobr>
						<win:power powerCode="viewPdAllotTran">
							<a href="viewPdAllotTran.jhtml?strAction=viewPdAllotTran&tranNo=${pdAllotTranVar.tran_no}" name="view"><fmt:message key="function.menu.view"/></a>
						</win:power>
						<c:if test="${pdAllotTranVar.check_status==0}">
							<!-- 未审核 -->
							<win:power powerCode="editPdAllotTran">
								<a href="editPdAllotTran.jhtml?strAction=editPdAllotTran&tranNo=${pdAllotTranVar.tran_no}" name="edit"><fmt:message key="button.edit"/></a>
							</win:power>
							<win:power powerCode="checkPdAllotTran">
								<a href="handlePdAllotTran.jhtml?strAction=checkPdAllotTran&tranNo=${pdAllotTranVar.tran_no}" name="check"><fmt:message key="po.lpstatus.2"/></a>
							</win:power>
						</c:if>
						<c:if test="${pdAllotTranVar.check_status==1}">
							<!-- 已审核 -->
							<c:if test="${pdAllotTranVar.out_status==0 }">
								<!-- 未出库 -->
								<win:power powerCode="uncheckPdAllotTran">
									<a href="handlePdAllotTran.jhtml?strAction=uncheckPdAllotTran&tranNo=${pdAllotTranVar.tran_no}" name="uncheck"><fmt:message key="function.menu.order.cancel.cn"/></a>
								</win:power>
								<win:power powerCode="outPdAllotTran">
									<a href="handlePdAllotTran.jhtml?strAction=outPdAllotTran&tranNo=${pdAllotTranVar.tran_no}" name="out"><fmt:message key="busi.outwarehouse.confirm"/></a>
								</win:power>
							</c:if>
							<c:if test="${pdAllotTranVar.out_status==1 && pdAllotTranVar.in_status==0}">
								<!-- 已出库未到库 -->
								<win:power powerCode="inPdAllotTran">
									<a href="handlePdAllotTran.jhtml?strAction=inPdAllotTran&tranNo=${pdAllotTranVar.tran_no}" name="in"><fmt:message key="pdFlitWarehouse.arrivedPdFlitWarehouse"/></a>
								</win:power>
							</c:if>
						</c:if>
					</nobr>
				</ec:column>
				<ec:column property="company_code" title="bdReconsumMoneyReport.company" />
				<ec:column property="tran_no" title="pdFlitWarehouseDetail.fwNo" />
				<ec:column property="out_company_code" title="busi.outbound.branch.company" />
				<ec:column property="out_warehouse_no" title="pdOutWarehouse.warehouseNo" />
				<ec:column property="in_company_code" title="busi.inbound.branch.company" />
				<ec:column property="in_warehouse_no" title="busi.pd.enterWarehouseNo" />
				<ec:column property="creator_code" title="pd.createTime">
					${pdAllotTranVar.creator_code } - ${pdAllotTranVar.create_time }
				</ec:column>
				<ec:column property="check_status" title="po.lpstatus.2" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pdAllotTranVar.check_status }"/>
				</ec:column>
				<ec:column property="check_time" title="icAnnounce.checkTime">
					${pdAllotTranVar.checker_code } - ${pdAllotTranVar.check_time }
				</ec:column>
				<ec:column property="out_status" title="busi.list.confirm" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pdAllotTranVar.out_status }"/>
				</ec:column>
				<ec:column property="out_time" title="pd.okTime">
					${pdAllotTranVar.out_user_code } - ${pdAllotTranVar.out_time }
				</ec:column>
				<ec:column property="in_status" title="pdtostatus.2" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pdAllotTranVar.in_status }"/>
				</ec:column>
				<ec:column property="in_time" title="busi.warehouse.arrival.time">
					${pdAllotTranVar.in_user_code } - ${pdAllotTranVar.in_time }
				</ec:column>
				
				<c:if test="${ROWCOUNT>0}">
					<c:if test="${ROWCOUNT%2!=0}"><tr class="odd"></c:if>
					<c:if test="${ROWCOUNT%2==0}"><tr class="even"></c:if>
						<td align="right" valign="top" colspan="2">&nbsp;</td>
						<td colspan="12">
							<c:forEach items="${pdAllotTranVar.pdAllotTranDetails}" var="pdAllotTranDetailVar" varStatus="status">
								<c:if test="${!status.first}"><br/></c:if>
								<font color=#888888>
									<font color="green">[${pdAllotTranDetailVar.qty}]</font>
									&nbsp;${pdAllotTranDetailVar.product_code} / ${pdAllotTranDetailVar.product_name}
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
	$( "#startDate,#endDate" ).datepicker();
	
	$("a[name='out']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-out-right"
        },
        text: false
    });
	
	$("a[name='in']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-in-right"
        },
        text: false
    });
});
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiCheckPdAllotTran(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkTranNo"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdAllotTranFunctionForm;
	theForm.selectedTranNos.value=selectedValues;
	theForm.strAction.value="multiCheckPdAllotTran";
	
	showLoading();
	theForm.submit();
}
</script>