<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="busi.inventory.adjustment "/></title>
    <meta name="heading" content="<fmt:message key="busi.inventory.adjustment"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="stStockAdjust" method="post" action="handleStStockAdjust.jhtml" onsubmit="return validateForm(this)" id="stStockAdjustForm" name="stStockAdjustForm">
    
    <spring:bind path="stStockAdjust.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><%--基本信息--%><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmLimitAdjust.adjustCode"/>:</th>
    		<td>
    			${stStockAdjust.adjustCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdAdjustStock.warehouseNo"/>:</th>
    		<td>
    			${stWarehouse.warehouseCode } - ${stWarehouse.warehouseName }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td>
    			${fn:replace(stStockAdjust.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title"><%--商品信息--%><fmt:message key="busi.commodity.information"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<ec:table 
					items="stStockAdjustDetails"
					var="pmProductVar" form="stStockAdjustForm" autoIncludeParameters="false"
					showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="product_code" title="busi.product.productno" />
						<ec:column property="product_name" title="pmProduct.productName"/>
						<ec:column property="stock_qty" title="busi.current.inventory" styleClass="numberColumn"/>
						<ec:column property="adjust_qty" title="pmLimitAdjust.adjustQty" styleClass="numberColumn"/>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title"><%--其它信息--%><fmt:message key="lang.other.msg"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td>${stStockAdjust.creatorCode } - ${stStockAdjust.createTime }</td>
    	</tr>
    	<c:if test="${stStockAdjust.status>0 }">
    		<tr>
	    		<td colspan="2"><hr/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
	    		<td>${stStockAdjust.checkerCode } - ${stStockAdjust.checkTime }</td>
	    	</tr>
    	</c:if>

    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="selectedAdjustCodes" id="selectedAdjustCodes" value="${stStockAdjust.adjustCode }"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${stStockAdjust.status==0}">
    						<!-- 未审核 -->
	    					<c:if test="${param.strAction=='checkStStockAdjust' }">
	    						<button type="submit" name="save" onclick="bCancel=false"><%--审核--%><fmt:message key="po.lpstatus.2"/></button>
	    					</c:if>
    					</c:if>
    					<c:if test="${stStockAdjust.status==1}">
    						<!-- 已审核 -->
    						<c:if test="${param.strAction=='uncheckStStockAdjust' }">
	    						<button type="submit" name="save" onclick="bCancel=false"><%--取消审核--%><fmt:message key="function.menu.order.cancel.cn"/></button>
	    					</c:if>
	    					<c:if test="${param.strAction=='confirmStStockAdjust' }">
	    						<button type="submit" name="save" onclick="bCancel=false"><%--确认--%><fmt:message key="operation.button.confirm"/></button>
	    					</c:if>
    					</c:if>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='stStockAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<c:if test="${param.strAction=='checkStStockAdjust' }">
	<c:set var="confirmMsg"><%--确认审核当前单据--%><fmt:message key="busi.confirm.current.audit.documents"/></c:set>
</c:if>
<c:if test="${param.strAction=='uncheckStStockAdjust' }">
	<c:set var="confirmMsg"><%--确认取消审核当前单据--%><fmt:message key="busi.confirm.cancellation.current.documents"/></c:set>
</c:if>
<c:if test="${param.strAction=='confirmStStockAdjust' }">
	<c:set var="confirmMsg"><%--确认执行此次调整--%><fmt:message key="busi.confirm.implementation.adjustment"/></c:set>
</c:if>
    	
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(!confirm("${confirmMsg}？")){
		return false;
	}
	showLoading();
	return true;
}
</script>