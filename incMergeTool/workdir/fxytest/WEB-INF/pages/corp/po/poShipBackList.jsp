<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pd.shipping.withdraw.management"/></title>
    <meta name="heading" content="<fmt:message key="menu.pd.shipping.withdraw.management"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poShipBacks.jhtml" onsubmit="return validateSearch(this)" name="poShipForm" id="poShipForm">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
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
			<dt><fmt:message key="return.odd.number"/></dt>
			<dd><input type="text" name="siNo" value="${param.siNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.original.invoice.number"/></dt>
			<dd><input type="text" name="oldSiNo" id="oldSiNo" value="${param.oldSiNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="po.ship.recievedno.lable"/></dt>
			<dd><input type="text" name="recptCode" value="${param.recptCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="returned.warehouse.number"/></dt>
			<dd><input type="text" name="warehouseNo" value="${param.warehouseNo }"/></dd>
		</dl>
		<dl>
			<dt><win:list listCode="po_ship_back_date_range" name="searchTime" id="searchTime" defaultValue="" value="${param.searchTime }" showBlankLine="true"/></dt>
			<dd>
				<input type="text" name="startShipTime" id="startShipTime" value="${param.startShipTime }" size="10"/>
				 - <input type="text" name="endShipTime" id="endShipTime" value="${param.endShipTime }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="pd.checked"/></dt>
			<dd><win:list name="checkStatus" listCode="yesno" defaultValue="" value="${param.checkStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="financial.audit"/></dt>
			<dd><win:list name="fiCheckStatus" listCode="yesno" defaultValue="" value="${param.fiCheckStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.list.confirm"/></dt>
			<dd><win:list name="confirmStatus" listCode="yesno" defaultValue="" value="${param.confirmStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pmEcProductItem.contain.ecProductNo"/></dt>
			<dd><input type="text" name="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listPoShipBacks"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poShipFunctionForm" id="poShipFunctionForm" action="handlePoShipBack.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoShipBack">
				<a href="editPoShipBack.jhtml?strAction=addPoShipBack" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkPoShipBack">
				<a href="javascript:multiCheckPoShipBack()" name="check">
					<fmt:message key="operation.button.check"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="fiCheckPoShipBack">
				<a href="javascript:multiFiCheckPoShipBack()" name="submit">
					<fmt:message key="button.finance"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="confirmPoShipBack">
				<a href="javascript:multiConfirmPoShipBack()" name="confirm">
					<fmt:message key="confirm.warehousing"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="shipBackProductsQtyReport">
				<a href="javascript:reportPoShip('shipBackProductsQtyReport.jhtml')" name="confirm">
					<fmt:message key="product.summary.report"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedShipIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poShipListTableForm" method="get" >
		<ec:table 
			tableId="poShipListTable"
			items="poShips"
			var="poShipVar"
			action="poShipBacks.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poShipListTableForm">
			<ec:row>
				<ec:column alias="chkShipId" headerCell="selectAll" style="width:5px;">
					<c:if test="${poShipVar.confirm_status==0 }">
						<input type="checkbox" name="chkShipId" value="${poShipVar.ship_id}" class="checkbox"/>
					</c:if>
					<c:if test="${poShipVar.confirm_status!=0 }">
						&nbsp;
					</c:if>
		  		</ec:column>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPoShipBack">
						<a href="viewPoShipBack.jhtml?strAction=viewPoShipBack&shipId=${poShipVar.ship_id}" name="view"><fmt:message key="function.menu.view"/></a>
					</win:power>
					<c:if test="${poShipVar.check_status==0 }">
						<!-- 未审核 -->
						<c:if test="${poShipVar.oi_type==2 && poShipVar.generate_method==1 }">
							<!-- 发货，并且是手工发货单才允许编辑 -->
							<win:power powerCode="editPoShipBack">
								<a href="editPoShipBack.jhtml?strAction=editPoShipBack&shipId=${poShipVar.ship_id}" name="edit"><fmt:message key="button.edit"/></a>
							</win:power>
						</c:if>
						<win:power powerCode="checkPoShipBack">
							<a href="handlePoShipBack.jhtml?strAction=checkPoShipBack&shipId=${poShipVar.ship_id}" name="check"><fmt:message key="operation.button.check"/></a>
						</win:power>
					</c:if>
					<c:if test="${poShipVar.check_status!=0 }">
						<!-- 已审核 -->
						<c:if test="${poShipVar.fi_check_status==0 }">
							<!-- 财务未确认 -->
							<win:power powerCode="uncheckPoShipBack">
								<a href="handlePoShipBack.jhtml?strAction=uncheckPoShipBack&shipId=${poShipVar.ship_id}" name="uncheck"><fmt:message key="function.menu.order.cancel.cn"/></a>
							</win:power>
							<win:power powerCode="fiCheckPoShipBack">
								<a href="handlePoShipBack.jhtml?strAction=fiCheckPoShipBack&shipId=${poShipVar.ship_id}" name="submit"><fmt:message key="button.finance"/></a>
							</win:power>
						</c:if>
						<c:if test="${poShipVar.fi_check_status!=0 }">
							<!-- 已审核 -->
							<c:if test="${poShipVar.confirm_status==0 }">
								<!-- 未入库 -->
								<win:power powerCode="confirmPoShipBack">
									<a href="handlePoShipBack.jhtml?strAction=confirmPoShipBack&shipId=${poShipVar.ship_id}" name="confirm"><fmt:message key="confirm.warehousing"/></a>
								</win:power>
							</c:if>
						</c:if>
					</c:if>
				</ec:column>
				<ec:column property="company_code" title="bdReconsumMoneyReport.company" />
				<ec:column property="si_no" title="return.odd.number" />
				<ec:column property="old_si_no" title="busi.original.invoice.number" />
				<ec:column property="recpt_code" title="po.ship.recievedno.lable" />
				<ec:column property="recpt_name" title="pdSendInfo.recipientName" />
				<ec:column property="warehouse_no" title="busi.pd.enterWarehouseNo" />
				<ec:column property="order_no" title="poOrder.orderNo" />
				<ec:column property="createTime" title="pd.createTime">
					${poShipVar.creator_code } - ${poShipVar.create_time }
				</ec:column>
				<ec:column property="check_status" title="pd.checked" styleClass="centerColumn">
					<win:code listCode="yesno" value="${poShipVar.check_status }"/>
				</ec:column>
				<ec:column property="check_time" title="icAnnounce.checkTime">
					${poShipVar.checker_code } - ${poShipVar.check_time }
				</ec:column>
				<ec:column property="check_status" title="financial.audit" styleClass="centerColumn">
					<win:code listCode="yesno" value="${poShipVar.fi_check_status }"/>
				</ec:column>
				<ec:column property="fi_check_time" title="csWarrantyCard.financeAuditDate">
					${poShipVar.fi_checker_code } - ${poShipVar.fi_check_time }
				</ec:column>
				<ec:column property="remark" title="busi.common.remark" />
				<ec:column property="confirm_status" title="busi.list.confirm" styleClass="centerColumn">
					<win:code listCode="yesno" value="${poShipVar.confirm_status }"/>
				</ec:column>
				<ec:column property="confirm_time" title="pd.okTime">
					${poShipVar.confirm_user_code } - ${poShipVar.confirm_time }
				</ec:column>
				
				<c:if test="${ROWCOUNT>0}">
					<c:if test="${ROWCOUNT%2!=0}"><tr class="odd"></c:if>
					<c:if test="${ROWCOUNT%2==0}"><tr class="even"></c:if>
						<td align="right" valign="top" colspan="3">&nbsp;</td>
						<td colspan="12">
							<c:forEach items="${poShipVar.shipDetails}" var="shipDetailVar" varStatus="status">
								<c:if test="${!status.first}"><br/></c:if>
								<font color=#888888>
								<c:if test="${shipDetailVar.quantity < 0}">
								<font color="red">[${shipDetailVar.quantity}]</font></c:if>
								<c:if test="${shipDetailVar.quantity > 0}">
								<font color="green">[${shipDetailVar.quantity}]</font></c:if>									
								&nbsp;${shipDetailVar.product_no} / ${shipDetailVar.product_name}
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
            primary: "ui-icon-in-right"
        }
    });
	
	$("a[name='confirm']",".eXtremeTable").button({
        icons: {
        	primary: "ui-icon-in-right"
        },
        text: false
    });
	
	$("a[name='submit']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-submit"
        },
        text: false
    });
});
function validateSearch(theForm) {
	showLoading();
	document.getElementById("poShipForm").setAttribute("action","poShipBacks.jhtml");
	return true;
}

function multiCheckPoShipBack(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkShipId"));
	if(!selectedValues){
		alert("<fmt:message key='busi.please.select.documents.audited'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.please.confirm.documents.audited'/>.")){
		return;
	}

	var theForm=document.poShipFunctionForm;
	theForm.selectedShipIds.value=selectedValues;
	theForm.strAction.value="checkPoShipBack";
	
	showLoading();
	theForm.submit();
}
function multiFiCheckPoShipBack(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkShipId"));
	if(!selectedValues){
		alert("<fmt:message key='please.select.documents.that.need.financial.verification'/>.");
		return;
	}
	if(!confirm("<fmt:message key='confirm.documents.selected.financial.audit'/>.")){
		return;
	}

	var theForm=document.poShipFunctionForm;
	theForm.selectedShipIds.value=selectedValues;
	theForm.strAction.value="fiCheckPoShipBack";
	
	showLoading();
	theForm.submit();
}
function confirmPoShipBack(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkShipId"));
	if(!selectedValues){
		alert("<fmt:message key='busi.please.select.documents.confirmation'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.confirm.mark.selected.documents'/>.")){
		return;
	}
	
	var theForm=document.poShipFunctionForm;
	theForm.selectedShipIds.value=selectedValues;
	theForm.strAction.value="confirmPoShipBack";
	
	showLoading();
	theForm.submit();
}
//导出报表
function reportPoShip(actionstr){
	document.getElementById("poShipForm").setAttribute("action",actionstr);
	document.poShipForm.submit();
}
</script>