<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pd.shipping.management"/></title>
    <meta name="heading" content="<fmt:message key="menu.pd.shipping.management"/>"/>

</head>

<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>

<div class="searchBar">
	<form id="poShippFrom" name="poShippFrom" method="get" action="poShips.jhtml" onsubmit="return validateSearch(this)" >
		<%--<c:if test="${not empty alCompanys}">--%>
			<%--<dl>--%>
				<%--<dd><fmt:message key="label.company"/></dd>--%>
				<%--<dd>--%>
					<%--<select name="companyCode" id="companyCode">--%>
			        	<%--<option value=""></option>--%>
			        	<%--<c:forEach items="${alCompanys}" var="alCompanyVar">--%>
		        			<%--<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>--%>
			    		<%--</c:forEach>--%>
			        <%--</select>--%>
				<%--</dd>--%>
			<%--</dl>--%>
		<%--</c:if>--%>
		<%--<dl>--%>
			<%--<dt><fmt:message key="pdSendInfo.siNo"/></dt>--%>
			<%--<dd><input type="text" name="siNo" value="${param.siNo }"/></dd>--%>
		<%--</dl>--%>
		<dl>
			<dt><fmt:message key="poOrder.orderNo"/></dt>
			<dd><input type="text" name="orderNo" id="orderNo" value="${param.orderNo }"/></dd>
		</dl>
		<%--<dl>--%>
			<%--<dt><fmt:message key="busi.delivery.bin.number"/></dt>--%>
			<%--<dd><input type="text" name="warehouseNo" value="${param.warehouseNo }"/></dd>--%>
		<%--</dl>--%>
		<dl>
			<dt><fmt:message key="po.ship.recievedno.lable"/></dt>
			<dd><input type="text" name="recptCode" value="${param.recptCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pdSendInfo.recipientName"/></dt>
			<dd><input type="text" name="shipLastName" value="${param.shipLastName }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="poOrder.memberName"/></dt>
			<dd><input type="text" name="userName" value="${param.userName }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.receiver.phone.number"/></dt>
			<dd><input type="text" name="shipPhone" value="${param.shipPhone }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.sysUser.userArea"/></dt>
			<dd>
				<div id="regionDiv"></div>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.shippingAddress"/></dt>
			<dd><input type="text" name="shipAddress1" value="${param.shipAddress1 }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="po.shipment.type"/></dt>
			<dd><win:list listCode="poship.shiptype" name="shipType" defaultValue="" value="${param.shipType }" showBlankLine="true"/></dd>
		</dl>
            <dl>
                <dt>发货状态</dt>
                <dd><win:list listCode="poship.shipstatus" name="shipstatus" defaultValue="" value="${param.shipstatus }" showBlankLine="true"/></dd>
            </dl>
		<dl>
			<dt><select name=""><option value="createTime">创建时间</option> </select></dt>
			<dd>
				<input type="text" name="startShipTime" id="startShipTime" value="${param.startShipTime }" size="10"/>
				 - <input type="text" name="endShipTime" id="endShipTime" value="${param.endShipTime }" size="10"/>
			</dd>
		</dl>

		<dl>
			<dt><fmt:message key="pd.shno"/></dt>
			<dd><input type="text" name="shipOrgCode" id="shipOrgCode" value="${param.shipOrgCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pd.traceNo"/></dt>
			<dd><input type="text" name="shipInvoiceNo" id="shipInvoiceNo" value="${param.shipInvoiceNo }"/></dd>
		</dl>
		<%--<dl>--%>
			<%--<dt><fmt:message key="pd.checked"/></dt>--%>
			<%--<dd><win:list name="checkStatus" listCode="yesno" defaultValue="" value="${param.checkStatus }" showBlankLine="true"/></dd>--%>
		<%--</dl>--%>
		<%--<dl>--%>
			<%--<dt><fmt:message key="busi.po.picked.goods"/></dt>--%>
			<%--<dd><win:list name="pickupStatus" listCode="yesno" defaultValue="" value="${param.pickupStatus }" showBlankLine="true"/></dd>--%>
		<%--</dl>--%>
		<%--<dl>--%>
			<%--<dt><fmt:message key="busi.list.confirm"/></dt>--%>
			<%--<dd><win:list name="confirmStatus" listCode="yesno" defaultValue="" value="${param.confirmStatus }" showBlankLine="true"/></dd>--%>
		<%--</dl>--%>
		<%--<dl>--%>
			<%--<dt><fmt:message key="busi.po.had.merged"/></dt>--%>
			<%--<dd><win:list name="isMergeExch" listCode="yesno" defaultValue="" value="${param.isMergeExch }" showBlankLine="true"/></dd>--%>
		<%--</dl>--%>
		<%--<dl>--%>
			<%--<dt><fmt:message key="po.generateMethod"/></dt>--%>
			<%--<dd><win:list name="generateMethod" listCode="po_ship_generate_method" defaultValue="" value="${param.generateMethod }" showBlankLine="true"/></dd>--%>
		<%--</dl>--%>
		<%--<dl>--%>
			<%--<dt><fmt:message key="busi.is.shipment.returned"/></dt>--%>
			<%--<dd><win:list listCode="yesno" defaultValue="" name="isBack" value="${param.isBack }" showBlankLine="true"/></dd>--%>
		<%--</dl>--%>
		<dl>
			<dt><fmt:message key="pmEcProductItem.contain.ecProductNo"/></dt>
			<dd><input type="text" name="productCode" value="${param.productCode }"/></dd>
		</dl>
		<%--<dl>--%>
			<%--<dt><fmt:message key="busi.shipping.confirmation.note"/></dt>--%>
			<%--<dd><input type="text" name="confirmRemark" value="${param.confirmRemark }"/></dd>--%>
		<%--</dl>--%>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search" onclick="javascript:this.form.action='poShips.jhtml';"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listPoShips"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poShipFunctionForm" id="poShipFunctionForm" action="handlePoShip.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>

		<div class="functionBar">
			<win:power powerCode="selfPickupPoShip">
				<a href="javascript:multiSelfPickupPoShip()" name="check">
					已自提
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="addPoShip">
				<a href="editPoShip.jhtml?strAction=addPoShip" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<%--<win:power powerCode="checkPoShip">--%>
				<%--<a href="javascript:multiCheckPoShip()" name="check">--%>
					<%--<fmt:message key="po.lpstatus.2"/>--%>
				<%--</a>--%>
				<%--<span class="divider">&nbsp;</span>--%>
			<%--</win:power>--%>
			<%--<win:power powerCode="pickupPoShip">--%>
				<%--<a href="javascript:multiPickupPoShip()" name="pickup">--%>
					<%--&lt;%&ndash;拣货&ndash;%&gt;<fmt:message key="busi.po.picked.goods"/>--%>
				<%--</a>--%>
				<%--<span class="divider">&nbsp;</span>--%>
			<%--</win:power>--%>
			<%--<win:power powerCode="confirmPoShip">--%>
				<%--<a href="javascript:multiConfirmPoShip()" name="confirm">--%>
					<%--&lt;%&ndash;确认发货&ndash;%&gt;<fmt:message key="operation.confirm.shipping"/>--%>
				<%--</a>--%>
				<%--<span class="divider">&nbsp;</span>--%>
			<%--</win:power>--%>
			<win:power powerCode="importPoShipLogistics">
				<a href="importOrder.jhtml" name="submit">
					<%--导入物流发货数据--%><fmt:message key="busi.import.logistics.delivery.data"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="shipInfoReport">
				<a href="javascript:reportPoShip('shipInfoReport.jhtml')" name="confirm">
					<%--导出收货信息汇总报表--%><fmt:message key="busi.export.receipt.information.summary.report"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="shipOrderReport">
				<a href="javascript:reportPoShip('shipOrderReport.jhtml')" name="confirm">
					<%--导出货单汇总报表--%><fmt:message key="busi.export.invoice.summary.report"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="shipProductsReport">
				<a href="javascript:reportPoShip('shipProductsReport.jhtml')" name="confirm">
					<%--提货产品汇总报表--%><fmt:message key="busi.pick.up.product.summary.report"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="shipProductsQtyReport">
				<a href="javascript:reportPoShip('shipProductsQtyReport.jhtml')" name="confirm">
					<%--产品汇总报表--%><fmt:message key="busi.product.summary.report"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedShipIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>

	<c:set var="footTotalVar">
		<tr>
			<td class="footer" align="right" colspan="9"><fmt:message key="总计"/>：</td>
			<td class="footer" style="text-align: center;">
				<b>
					<c:if test="${not empty poShipSumMap}">
						<fmt:formatNumber pattern="###,##0.00">${poShipSumMap.total_price }</fmt:formatNumber>
					</c:if>
					<c:if test="${empty poShipSumMap}">
						0.00
					</c:if>
				</b>
			</td>
			<td class="footer" align="right" colspan="5"></td>
		</tr>
	</c:set>

	<form id="poShipListTableForm" method="get" >
		<ec:table
			tableId="poShipListTable"
			items="poShips"
			var="poShipVar"
			action="poShips.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poShipListTableForm" footer="${footTotalVar }">
			<ec:row>
				<ec:column alias="chkShipId" headerCell="selectAll" style="width:5px;">
					<c:if test="${poShipVar.confirm_status==0 }">
						<input type="checkbox" name="chkShipId" value="${poShipVar.ship_id}" class="checkbox"/>
					</c:if>
					<c:if test="${poShipVar.confirm_status!=0 }">
						&nbsp;
					</c:if>
		  		</ec:column>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" styleClass="centerColumn">
					<win:power powerCode="viewPoShip">
						<a href="viewPoShip.jhtml?strAction=viewPoShip&shipId=${poShipVar.ship_id}" name="view"><fmt:message key="function.menu.view"/></a>
					</win:power>
					<%--<c:if test="${poShipVar.check_status==0 }">--%>
						<%--<!-- 未审核 -->--%>
						<%--<c:if test="${poShipVar.oi_type==0}">--%>
							<%--<!-- 发货，并且是手工发货单才允许编辑 -->--%>
							<win:power powerCode="editPoShip">
								<a href="editPoShip.jhtml?strAction=editPoShip&shipId=${poShipVar.ship_id}&step=1" name="edit"><fmt:message key="button.edit"/></a>
							</win:power>
						<%--</c:if>--%>
						<%--<win:power powerCode="checkPoShip">--%>
							<%--<a href="handlePoShip.jhtml?strAction=checkPoShip&shipId=${poShipVar.ship_id}" name="check"><fmt:message key="po.lpstatus.2"/></a>--%>
						<%--</win:power>--%>
					<%--</c:if>--%>
					<%--<c:if test="${poShipVar.check_status!=0 }">--%>
						<%--<win:power powerCode="printPoShip">--%>
							<%--<a href="printPoShip.jhtml?strAction=printPoShip&shipId=${poShipVar.ship_id}" name="print">&lt;%&ndash;打印&ndash;%&gt;<fmt:message key="button.print"/></a>--%>
						<%--</win:power>--%>
						<%--<!-- 已审核 -->--%>
						<%--<c:if test="${poShipVar.pickup_status==0 }">--%>
							<%--<!-- 未拣货 -->--%>
							<%--<win:power powerCode="uncheckPoShip">--%>
								<%--<a href="handlePoShip.jhtml?strAction=uncheckPoShip&shipId=${poShipVar.ship_id}" name="uncheck">&lt;%&ndash;取消审核&ndash;%&gt;<fmt:message key="function.menu.order.cancel.cn"/></a>--%>
							<%--</win:power>--%>
							<%--<win:power powerCode="pickupPoShip">--%>
								<%--<a href="handlePoShip.jhtml?strAction=pickupPoShip&shipId=${poShipVar.ship_id}" name="pickup">&lt;%&ndash;拣货&ndash;%&gt;<fmt:message key="busi.po.picked.goods"/></a>--%>
							<%--</win:power>--%>
						<%--</c:if>--%>
						<%--<c:if test="${poShipVar.pickup_status==1 }">--%>
							<%--<c:if test="${poShipVar.confirm_status==0 }">--%>
								<%--<win:power powerCode="unpickupPoShip">--%>
									<%--<a href="handlePoShip.jhtml?strAction=unpickupPoShip&shipId=${poShipVar.ship_id}" name="uncheck">&lt;%&ndash;取消拣货&ndash;%&gt;<fmt:message key="busi.cancel.order"/></a>--%>
								<%--</win:power>--%>
								<%--<win:power powerCode="confirmPoShip">--%>
									<%--<a href="handlePoShip.jhtml?strAction=confirmPoShip&shipId=${poShipVar.ship_id}" name="confirm">&lt;%&ndash;确认发货&ndash;%&gt;<fmt:message key="operation.confirm.shipping"/></a>--%>
								<%--</win:power>--%>
							<%--</c:if>--%>
							<%--<c:if test="${poShipVar.confirm_status==1 }">--%>
								<%--<win:power powerCode="editPoShipSpecial">--%>
									<%--<a href="editPoShipSpecial.jhtml?strAction=editPoShipSpecial&shipId=${poShipVar.ship_id}" name="edit"><fmt:message key="button.edit"/></a>--%>
								<%--</win:power>--%>
								<%--<c:if test="${poShipVar.receive_status==0 }">--%>
									<%--<!-- 已发货未收货 -->--%>
									<%--<win:power powerCode="addPoShipBack">--%>
										<%--<!-- 退回 -->--%>
										<%--<a href="editPoShipBack.jhtml?strAction=addPoShipBack&oldSiNo=${poShipVar.si_no}" name="previous">&lt;%&ndash;发货退回&ndash;%&gt;<fmt:message key="ps.rejected"/></a>--%>
									<%--</win:power>--%>
								<%--</c:if>--%>
							<%--</c:if>--%>
						<%--</c:if>--%>
					<%--</c:if>if--%>
				</ec:column>
				<%--<ec:column property="company_code" title="bdReconsumMoneyReport.company" />--%>
				<%--<ec:column property="si_no" title="pdSendInfo.siNo" />--%>
				<ec:column property="order_no" title="订单号"/>
				<ec:column property="recpt_code" title="miMember.memberNo" styleClass="centerColumn"/>
				<ec:column property="recpt_name" title="poOrder.memberName" styleClass="centerColumn"/>
				<ec:column property="ship_type" title="po.shipment.type" styleClass="centerColumn">
					<win:code listCode="poship.shiptype" value="${poShipVar.ship_type }"/>
				</ec:column>
				<ec:column property="is_sent" title="发货状态" styleClass="centerColumn">
					<c:if test="${poShipVar.ship_type == '1'}"><c:if test="${poShipVar.is_sent == '0'}"><span style="color: red">待发货</span></c:if><c:if test="${poShipVar.is_sent == '1'}"><span class="green">已发货</span></c:if></c:if>
					<c:if test="${poShipVar.ship_type == '2'}"><c:if test="${poShipVar.is_sent == '0'}"><span style="color: red">待提货</span></c:if><c:if test="${poShipVar.is_sent == '1'}"><span class="green">已自提</span></c:if></c:if>
				</ec:column>

				<%--<ec:column property="warehouse_no" title="pdSendInfo.sendWarehouseNo" />--%>
				<%--<ec:column property="order_no" title="poOrder.orderNo" />--%>
                <ec:column property="ship_org_code" title="物流公司" styleClass="centerColumn"/>
                <ec:column property="ship_invoice_no" title="物流单号" styleClass="centerColumn"/>
				<ec:column property="total_price" title="busi.order.amount" styleClass="numberColumn centerColumn" >
					<fmt:formatNumber pattern="###,##0.00">${poShipVar.total_price }</fmt:formatNumber>
				</ec:column>
				<ec:column property="create_code" title="创建人" styleClass="centerColumn">
					${poShipVar.creator_code }
				</ec:column>
				<ec:column property="createTime" title="pd.createTime" styleClass="centerColumn">
				 ${poShipVar.create_time }
				</ec:column>
				<%--<ec:column property="check_status" title="pd.checked" styleClass="centerColumn">--%>
					<%--<win:code listCode="yesno" value="${poShipVar.check_status }"/>--%>
				<%--</ec:column>--%>
				<%--<ec:column property="check_time" title="icAnnounce.checkTime">--%>
					<%--${poShipVar.checker_code } - ${poShipVar.check_time }--%>
				<%--</ec:column>--%>
				<%--<ec:column property="pickup_status" title="busi.po.picked.goods" styleClass="centerColumn">--%>
					<%--<win:code listCode="yesno" value="${poShipVar.pickup_status }"/>--%>
				<%--</ec:column>--%>
				<%--<ec:column property="pickup_time" title="busi.picking.time">--%>
					<%--${poShipVar.pickup_code } - ${poShipVar.pickup_time }--%>
				<%--</ec:column>--%>
				<%--<ec:column property="confirm_status" title="busi.list.confirm" styleClass="centerColumn">--%>
					<%--<win:code listCode="yesno" value="${poShipVar.confirm_status }"/>--%>
				<%--</ec:column>--%>
				<%--<ec:column property="confirm_time" title="pd.okTime">--%>
					<%--${poShipVar.confirm_user_code } - ${poShipVar.confirm_time }--%>
				<%--</ec:column>--%>
				<%--<ec:column property="is_merge_exch" title="busi.po.had.merged" styleClass="centerColumn">--%>
					<%--<win:code listCode="yesno" value="${poShipVar.is_merge_exch }"/>--%>
				<%--</ec:column>--%>
				<%--<ec:column property="remark" title="busi.common.remark" />--%>

				<c:if test="${ROWCOUNT>0}">
					<c:if test="${ROWCOUNT%2!=0}"><tr class="odd"></c:if>
					<c:if test="${ROWCOUNT%2==0}"><tr class="even"></c:if>
						<td align="right" valign="top" colspan="2">&nbsp;</td>
						<td colspan="10">
							<c:if test="${poShipVar.ship_type==1 }">
							${poShipVar.region_name}${poShipVar.ship_address1}  / ${poShipVar.ship_last_name}&nbsp;${poShipVar.ship_mobile }<br />
							</c:if>
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
            primary: "ui-icon-out-right"
        }
    });
	$("a[name='pickup']",".functionBar").button({
        icons: {
            primary: "ui-icon-in-right"
        }
    });

	$("a[name='confirm']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-out-right"
        },
        text: false
    });
	$("a[name='pickup']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-in-right"
        },
        text: false
    });
	$("a[name='print']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-print"
        },
        text: false
    });
	$("a[name='previous']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-previous"
        },
        text: false
    });

	$('#regionDiv').regionSelector({
		companyCode:'${sessionScope.sessionLoginUser.companyCode}',
		regionCode:'${regionCode}'
	});

});
function validateSearch(theForm) {
	showLoading();
	return true;
}
//导出报表
function reportPoShip(actionstr){
	//document.getElementById("poShippFrom").setAttribute("method","post");
	document.getElementById("poShippFrom").setAttribute("action",actionstr);
	document.poShippFrom.submit();
}
function searchPoShip(){
	//document.getElementById("poShippFrom").setAttribute("method","get");
	document.getElementById("poShippFrom").setAttribute("action","poShips.jhtml");
	document.poShippFrom.submit();
}
function multiCheckPoShip(){
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
	theForm.strAction.value="checkPoShip";

	showLoading();
	theForm.submit();
}

function multiSelfPickupPoShip(){
    var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkShipId"));
    if(!selectedValues){
        alert("请选择您要操作的数据");
        return;
    }
    if(!confirm("确认操作？")){
        return;
    }
    var theForm=document.poShipFunctionForm;
    theForm.selectedShipIds.value=selectedValues;
    theForm.strAction.value="selfPickupPoShip";

    showLoading();
    theForm.submit();
}
function multiPickupPoShip(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkShipId"));
	if(!selectedValues){
		alert("<fmt:message key='busi.please.select.documents.picked.up'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.identified.document.selected.goods'/>.")){
		return;
	}
	var theForm=document.poShipFunctionForm;
	theForm.selectedShipIds.value=selectedValues;
	theForm.strAction.value="pickupPoShip";

	showLoading();
	theForm.submit();
}

function multiConfirmPoShip(){
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
	theForm.strAction.value="confirmPoShip";

	showLoading();
	theForm.submit();
}

</script>