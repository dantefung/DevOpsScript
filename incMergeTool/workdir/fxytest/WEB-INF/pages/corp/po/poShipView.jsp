<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="发货管理"/></title>
    <meta name="heading" content="<fmt:message key="发货管理"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="contentBody">
    <form:form commandName="poShip" method="post" action="handlePoShip.jhtml" onsubmit="return validateForm(this)" id="poShipForm" name="poShipForm">
    
    <spring:bind path="poShip.*">
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
    		<th><fmt:message key="发货单号"/>:</th>
    		<td>
    			${poShip.siNo }
    		</td>
    		<th><fmt:message key="收货人编号"/>:</th>
    		<td>
    			${poShip.recptCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="发货仓"/>:</th>
    		<td>
    			${stWarehouse.warehouseCode } - ${stWarehouse.warehouseName }
    		</td>
    		<th><fmt:message key="发货方式"/>:</th>
    		<td>
    			<win:code listCode="poship.shiptype" value="${poShip.shipType }"/>
    		</td>
    	</tr>
    	<c:if test="${poShip.shipType==1 }">
	    	<tr>
	    		<th valign="top"><fmt:message key="收货信息"/>:</th>
	    		<td colspan="3">
	    			${poShip.shipLastName }<br/>
	    			${fullRegionName}${poShip.shipAddress1 }<br/>
	    			邮编：${poShip.shipZipCode }<br/>
	    			手机：${poShip.shipMobile }<br/>
	    			电话：${poShip.shipPhone }
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td colspan="3">
    			${fn:replace(poShip.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title">商品信息</td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<ec:table 
					items="poShipDetails"
					var="pmProductVar" form="poShipForm" autoIncludeParameters="false"
					showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="product_no" title="busi.product.productno" />
						<ec:column property="product_name" title="pmProduct.productName"/>
						<ec:column property="unit_price" title="label.unit.price" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_price }"/>
						</ec:column>
						<ec:column property="quantity" title="发货数量" styleClass="numberColumn"/>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="4" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td colspan="3">${poShip.creatorCode } - ${poShip.createTime }</td>
    	</tr>
    	<c:if test="${poShip.checkStatus==1 }">
    		<tr>
	    		<td colspan="4"><hr/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="是否审核"/>:</th>
	    		<td><win:code listCode="yesno" value="${poShip.checkStatus }"/> </td>
	    		<th><fmt:message key="审核时间"/>:</th>
	    		<td>${poShip.checkerCode } - ${poShip.checkTime }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="审核备注"/>:</th>
	    		<td colspan="3">${fn:replace(poShip.checkRemark, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<c:if test="${poShip.pickupStatus==1 }">
    		<tr>
	    		<td colspan="4"><hr/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="是否拣货"/>:</th>
	    		<td><win:code listCode="yesno" value="${poShip.pickupStatus }"/> </td>
	    		<th><fmt:message key="拣货时间"/>:</th>
	    		<td>${poShip.pickupCode } - ${poShip.pickupTime }</td>
	    	</tr>
    	</c:if>
    	<c:if test="${poShip.confirmStatus==1 }">
    		<tr>
	    		<td colspan="4"><hr/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="是否发货"/>:</th>
	    		<td><win:code listCode="yesno" value="${poShip.confirmStatus }"/> </td>
	    		<th><fmt:message key="发货确认时间"/>:</th>
	    		<td>${poShip.confirmUserCode } - ${poShip.confirmTime }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="发货确认备注"/>:</th>
	    		<td colspan="3">${fn:replace(poShip.confirmRemark, vEnter, '<br>')}</td>
	    	</tr>
	    	<tr>
	    		<td colspan="4" class="title">物流跟踪</td>
	    	</tr>
	    	<tr>
	    		<th>物流公司:</th>
	    		<td>${poShip.shipOrgCode }</td>
	    		<th>物流单号:</th>
	    		<td>${poShip.shipInvoiceNo }</td>
	    	</tr>
	    	<tr>
	    		<th></th>
	    		<td colspan="3">
	    			<c:if test="${isUrl == 'no'}">
						<b><win:code listCode="pd.express.name" value="${shNo}" />&nbsp;&nbsp;&nbsp;${expressInfo}</b>
					</c:if>
					<c:if test="${isUrl == 'yes'}">
						 <c:if test="${not empty kaidiUrl}">
						 	<c:if test="${kaidiUrl == '0'}">searchkuaiDiInfo exception</c:if>
						 	<c:if test="${kaidiUrl != '0'}">
						 		<a href="${kaidiUrl}" name="view" id="btnView">查看物流</a>
						 	</c:if>
						 </c:if>   
					</c:if>
	    		</td>
	    	</tr>
    	</c:if>
    	
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<input type="hidden" name="selectedShipIds" id="selectedShipIds" value="${poShip.shipId }"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" name="cancel" onclick="window.location='poShips.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

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

$(document).ready(function(){
	$("#btnView").colorbox({iframe:true, width:"500px", height:"400px"});
	$("a[name='view']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        }
    });

});
</script>