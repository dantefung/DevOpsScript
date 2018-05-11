<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@page import="java.util.List" %>
<%@page import="java.util.HashMap" %>
<%
com.cn1win.tjc.service.po.PoOrderDetailManager poOrderDetailManager=(com.cn1win.tjc.service.po.PoOrderDetailManager)request.getAttribute("poOrderDetailManager");
%>
<head>
    <title><fmt:message key="poOrder.orderQuery.title"/></title>
    <meta name="heading" content="<fmt:message key="poOrder.orderQuery.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poOrderSearch.jhtml" onsubmit="return validateSearch(this)">
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
			<dd><fmt:message key="poOrder.orderNo"/></dd>
			<dd><input type="text" name="orderNo" id="orderNo" value="${param.orderNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="miMember.memberNo"/></dd>
			<dd>
				<input type="text" name="userCode" id="userCode" value="${param.userCode }"/>
			</dd>
		</dl>
		<%-- <dl>
			<dd><fmt:message key="sys.agent.agentNo"/></dd>
			<dd>
				<input type="text" name="agentNo" id="agentNo" value="${param.agentNo }"/>
			</dd>
		</dl> --%>
		<dl>
			<dd><fmt:message key="poOrder.billFromPersonNo"/></dd>
			<dd>
				<input type="text" name="creatorCode" id="creatorCode" value="${param.creatorCode }"/>
			</dd>
		</dl>
		<dl>
			<dd>
				<!--<select name="dateType" id="dateType" style="width:120px;">
					<option value=""><fmt:message key="poOrder.chooseDateRange"/></option>
					<c:forEach items="${dateTypeMap }" var="var">
						<option value="${var.key }" <c:if test="${param.dateType == var.key }">selected="selected"</c:if>>${var.value }</option>
					</c:forEach>
				</select>
				--><win:list listCode="order_search_date_types" name="dateType" defaultValue="" value="${param.dateType }" showBlankLine="true"/>
			</dd>
			<dd>
				<fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="memberOrderSearchForm" id="memberOrderSearchForm" action="poOrderSearch.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
		</div>
		<input type="hidden" name="selectedOrderIds" id="selectedOrderIds">
		<input type="hidden" name="strAction" id="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poOrderListTableForm" method="get" >
		<ec:table 
			tableId="poOrderListTable"
			items="poOrders"
			var="poOrder"
			action="poOrderSearch.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" style="width:15px;">
					<a href="poOrderView.jhtml?orderId=${poOrder.order_id}" name="view"><fmt:message key="function.menu.view"/></a>
				</ec:column>
				<ec:column property="order_no" title="poOrder.orderNo" />
				<ec:column property="user_code" title="miMember.memberNo">
					${poOrder.user_code}
					<c:if test="${poOrder.is_credit==1 }"><span class="important">[<fmt:message key="lang.credit"/>]</span></c:if>
				</ec:column>
				<ec:column property="user_name" title="poOrder.memberName" />
				<%-- <ec:column property="agent_no" title="sys.agent.agentNo" /> --%>
				<ec:column property="total_amount" title="busi.order.amount" styleClass="numberColumn">
					<fmt:formatNumber pattern="##,##0.00" value="${poOrder.total_amount }"/>
				</ec:column>
				<ec:column property="total_pv" title="poSell.totalPv" cell="currency" format="###,##0.00" styleClass="numberColumn"/>
				<ec:column property="order_type" title="pd.orderType">
					<win:code listCode="po_order_type" value="${poOrder.order_type }"/>
				</ec:column>
				<ec:column property="payment_method" title="fiPayAdvice.dealType">
					<win:code listCode="order_payment_method" value="${poOrder.payment_method }"></win:code>
				</ec:column>
				<ec:column property="payment_status" title="poOrder.payStatus">
					<win:code listCode="po_order_status" value="${poOrder.status }"/>
				</ec:column>
				<ec:column property="generate_method" title="poOrder.billType">
					<win:code listCode="order_generate_method" value="${poOrder.generate_method }" />
				</ec:column>
				<ec:column property="creator_code" title="poOrder.billFromPersonNo" />
				<ec:column property="creator_name" title="poOrder.billFromPersonName" />
				<ec:column property="create_time" title="poOrder.billTime" >
					<c:if test="${poOrder.create_time!=null && poOrder.create_time!='' && fn:length(poOrder.create_time)>=19}">
						${fn:substring(poOrder.create_time,0,19)} 
					</c:if>
				</ec:column>
				<ec:column property="check_time" title="poOrder.payTime" />
				<ec:column property="calc_date" title="poOrder.calcDate" />
				<ec:column property="delivery_no" title="物流单号" />
			</ec:row>
			
			<c:if test="${ROWCOUNT>0}">
				<c:if test="${ROWCOUNT%2!=0}"><tr class="odd"></c:if>
				<c:if test="${ROWCOUNT%2==0}"><tr class="even"></c:if>
					<td align="right" valign="top">&nbsp;</td>
					<td colspan="15">
						<c:set var="orderId" value="${poOrder.order_id}" scope="request"/>
						<%
						Long orderId = new Long(request.getAttribute("orderId").toString());
						List poOrderDetails = poOrderDetailManager.getPoOrderDetailListBySql(orderId);
						
						if(poOrderDetails!=null && poOrderDetails.size()>0){
							for(int i=0;i<poOrderDetails.size();i++){
								if(i!=0){
									out.print("<br/>");
								}
								HashMap poOrderDetail=(HashMap)poOrderDetails.get(i);
								out.print("<font color=#888888>[<font color=green>"+poOrderDetail.get("quantity")+"</font>]"+poOrderDetail.get("product_no")+"/"+poOrderDetail.get("product_name")+"</font>");
							}
						}
						%>
					</td>
				</tr>
			</c:if>
			
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate" ).datepicker();
});

$(function() {
	$( "#endDate" ).datepicker();
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

</script>