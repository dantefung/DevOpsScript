<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="申请调拨"/></title>
    <meta name="heading" content="<fmt:message key="申请调拨"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="pdAllotTran" method="post" action="handlePdAllotTran.jhtml" onsubmit="return validateForm(this)" id="pdAllotTranForm" name="pdAllotTranForm">
    
    <spring:bind path="pdAllotTran.*">
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
    		<td colspan="4" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="调拨单号"/>:</th>
    		<td colspan="3">
    			${pdAllotTran.tranNo }
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="出库仓"/>:</th>
    		<td>
    			${stWarehouseOut.warehouseCode } - ${stWarehouseOut.warehouseName }
    		</td>
    		<th class="required"><fmt:message key="入库仓"/>:</th>
    		<td>
    			${stWarehouseIn.warehouseCode } - ${stWarehouseIn.warehouseName }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td colspan="3">
    			${fn:replace(pdAllotTran.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title">商品信息</td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<ec:table 
					items="pdAllotTranDetails"
					var="pmProductVar" form="pdAllotTranForm" autoIncludeParameters="false"
					showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="product_code" title="busi.product.productno" />
						<ec:column property="product_name" title="pmProduct.productName"/>
						<ec:column property="price" title="label.unit.price" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.first_price }"/>
						</ec:column>
						<ec:column property="qty" title="调拨数量" styleClass="numberColumn"/>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td colspan="3">${pdAllotTran.creatorCode } - ${pdAllotTran.createTime }</td>
    	</tr>
    	<c:if test="${pdAllotTran.checkStatus==1 }">
	    	<tr>
	    		<th><fmt:message key="是否审核"/>:</th>
	    		<td><win:code listCode="yesno" value="${pdAllotTran.checkStatus }"/> </td>
	    		<th><fmt:message key="审核时间"/>:</th>
	    		<td>${pdAllotTran.checkerCode } - ${pdAllotTran.checkTime }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="审核备注"/>:</th>
	    		<td colspan="3">${fn:replace(pdAllotTran.checkRemark, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<c:if test="${pdAllotTran.outStatus==1 }">
	    	<tr>
	    		<th><fmt:message key="是否出库"/>:</th>
	    		<td><win:code listCode="yesno" value="${pdAllotTran.outStatus }"/> </td>
	    		<th><fmt:message key="出库确认时间"/>:</th>
	    		<td>${pdAllotTran.outUserCode } - ${pdAllotTran.outTime }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="出库确认备注"/>:</th>
	    		<td colspan="3">${fn:replace(pdAllotTran.outRemark, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<c:if test="${pdAllotTran.inStatus==1 }">
	    	<tr>
	    		<th><fmt:message key="是否入库"/>:</th>
	    		<td><win:code listCode="yesno" value="${pdAllotTran.inStatus }"/> </td>
	    		<th><fmt:message key="入库时间"/>:</th>
	    		<td>${pdAllotTran.inUserCode } - ${pdAllotTran.inTime }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="入库备注"/>:</th>
	    		<td colspan="3">${fn:replace(pdAllotTran.inRemark, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<c:if test="${param.strAction=='checkPdAllotTran' }">
	    	<tr>
	    		<th><fmt:message key="审核备注"/>:</th>
	    		<td colspan="3"><form:textarea path="checkRemark" id="checkRemark" cols="60" rows="6"/></td>
	    	</tr>
    	</c:if>
    	<c:if test="${param.strAction=='outPdAllotTran' }">
	    	<tr>
	    		<th><fmt:message key="出库确认备注"/>:</th>
	    		<td colspan="3"><form:textarea path="outRemark" id="outRemark" cols="60" rows="6"/></td>
	    	</tr>
    	</c:if>
    	<c:if test="${param.strAction=='inPdAllotTran' }">
	    	<tr>
	    		<th><fmt:message key="到库确认备注"/>:</th>
	    		<td colspan="3"><form:textarea path="inRemark" id="inRemark" cols="60" rows="6"/></td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<input type="hidden" name="selectedTranNos" id="selectedTranNos" value="${pdAllotTran.tranNo }"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${pdAllotTran.checkStatus==0}">
    						<!-- 未审核 -->
	    					<c:if test="${param.strAction=='checkPdAllotTran' }">
	    						<button type="submit" name="save" onclick="bCancel=false">审核</button>
	    					</c:if>
    					</c:if>
    					<c:if test="${pdAllotTran.checkStatus==1}">
    						<!-- 已审核 -->
    						<c:if test="${pdAllotTran.outStatus==0 }">
    							<!-- 未出库 -->
    							<c:if test="${param.strAction=='uncheckPdAllotTran' }">
		    						<button type="submit" name="save" onclick="bCancel=false">取消审核</button>
		    					</c:if>
		    					<c:if test="${param.strAction=='outPdAllotTran' }">
		    						<button type="submit" name="save" onclick="bCancel=false">出库确认</button>
		    					</c:if>
	    					</c:if>
	    					<c:if test="${pdAllotTran.outStatus==1 && pdAllotTran.inStatus==0}">
	    						<!-- 已出库未到库 -->
		    					<c:if test="${param.strAction=='inPdAllotTran' }">
		    						<button type="submit" name="save" onclick="bCancel=false">到库确认</button>
		    					</c:if>
	    					</c:if>
    					</c:if>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='pdAllotTrans.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<c:if test="${param.strAction=='checkPdAllotTran' }">
	<c:set var="confirmMsg">确认审核当前单据</c:set>
</c:if>
<c:if test="${param.strAction=='uncheckPdAllotTran' }">
	<c:set var="confirmMsg">确认取消审核当前单据</c:set>
</c:if>
<c:if test="${param.strAction=='outPdAllotTran' }">
	<c:set var="confirmMsg">确认出库</c:set>
</c:if>
<c:if test="${param.strAction=='inPdAllotTran' }">
	<c:set var="confirmMsg">确认到库</c:set>
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