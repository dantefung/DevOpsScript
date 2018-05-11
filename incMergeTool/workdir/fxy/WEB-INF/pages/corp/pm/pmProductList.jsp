<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmProductList.productList.title"/></title>
    <meta name="heading" content="<fmt:message key="pmProductList.productList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pmProducts.jhtml" onsubmit="return validateSearch(this)">
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
			<dd><fmt:message key="busi.product.productno"/></dd>
			<dd><input type="text" name="productCode" id="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="pmProduct.productName"/></dd>
			<dd><input type="text" name="productName" id="productName" value="${param.productName }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="pmProductList.salesState"/></dd>
			<dd><win:list listCode="pmproduct.status" id="status" name="status" value="${param.status }" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="pmProductBasic.productProp"/></dd>
			<dd><win:list listCode="pmproductbasic.productprop" id="productProp" name="productProp" value="${param.productProp }" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="piProductCategory.categoryNo"/></dd>
			<dd>
				<select name="typeId">
					<option value=""></option>
					<c:forEach items="${pmProductTypes }" var="pmProductTypeVar">
						<c:if test="${pmProductTypeVar.parentTypeId==0 }">
							<optgroup label="${pmProductTypeVar.typeName }">
								<fmt:message key="${pmProductTypeVar.typeName }"/>
								<c:forEach items="${pmProductTypes }" var="childPmProductTypeVar">
									<c:if test="${childPmProductTypeVar.parentTypeId==pmProductTypeVar.typeId }">
										<option value="${childPmProductTypeVar.typeId }"<c:if test="${childPmProductTypeVar.typeId==param.typeId }"> selected</c:if>><fmt:message key="${childPmProductTypeVar.typeName }"/></option>
									</c:if>
								</c:forEach>
							</optgroup>
						</c:if>
					</c:forEach>
				</select>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="是否套餐"/></dt>
			<dd><win:list listCode="yesno" id="isPackage" name="isPackage" value="${param.isPackage }" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="pmProductBasic.salesArea"/></dd>
			<dd>
				<select name="countryCode">
					<option value=""></option>
					<c:forEach items="${alcountryList }" var="alVar">
						<option value="${alVar.regionCode }" <c:if test="${param.countryCode==alVar.regionCode }"> selected="selected" </c:if> >${alVar.regionName }</option>
					</c:forEach>
				</select>
			</dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
			</dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="save"><fmt:message key="button.report"/></button>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pmProductFunctionForm" id="pmProductFunctionForm" action="editPmProduct.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		<input type="hidden" name="selectedProductIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmProductListTableForm" method="get" >
		<ec:table 
			tableId="pmProductListTable"
			items="pmProducts"
			var="pmProductVar"
			action="pmProducts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="pmProductListTableForm">
			<ec:row>
				<c:set var="firstCss" value="important"/>
				<c:if test="${pmProductVar.isFirst==1}">
					<c:set var="firstCss" value="green"/>
				</c:if>
				<c:set var="upgradeCss" value="important"/>
				<c:if test="${pmProductVar.isUpgrade==1}">
					<c:set var="upgradeCss" value="green"/>
				</c:if>
				<c:set var="returnCss" value="important"/>
				<c:if test="${pmProductVar.isReturn==1}">
					<c:set var="returnCss" value="green"/>
				</c:if>
				<c:set var="couponsCss" value="important"/>
				<c:if test="${pmProductVar.isCoupons==1}">
					<c:set var="couponsCss" value="green"/>
				</c:if>
				<c:set var="turnoverCss" value="important"/>
				<c:if test="${pmProductVar.isTurnover==1}">
					<c:set var="turnoverCss" value="green"/>
				</c:if>
				<c:set var="statusCss" value="important"/>
				<c:if test="${pmProductVar.status==1}">
					<c:set var="statusCss" value="green"/>
				</c:if>

				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" style="width:15px;">
					<nobr>
					<win:power powerCode="editPmProduct">
					<a href="editPmProduct.jhtml?strAction=editPmProduct&productId=${pmProductVar.productId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="editPmProductExtra">
						<a href="editPmProductExtra.jhtml?strAction=editPmProductExtra&productId=${pmProductVar.productId}" name="profile"><fmt:message key="menu.editPmProductExtra"/></a>
					</win:power>
					<win:power powerCode="listPmProductPics">
						<a href="pmProductPics.jhtml?strAction=listPmProductPics&productId=${pmProductVar.productId}" name="picture"><fmt:message key="pmProductPic.manager"/></a>
					</win:power>
					<c:if test="${pmProductVar.pmProductBasic.isPackage==1 }">
						<win:power powerCode="listPmEcProductItems">
							<a href="pmEcProductItems.jhtml?strAction=listPmEcProductItems&productId=${pmProductVar.productId}" name="ecDetail"><fmt:message key="menu.pm.listPmEcProductItems"/></a>
						</win:power>
					</c:if>
					</nobr>
				</ec:column>
				
				<ec:column property="companyCode" title="sys.company.code"/>
				<ec:column property="productCode" title="busi.product.productno" />
				<ec:column property="productName" title="pmProduct.productName"/>
				<ec:column property="isPackage" title="是否套餐" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pmProductVar.pmProductBasic.isPackage}"/>
				</ec:column>
				<ec:column property="firstPrice" title="busi.direct.price.first.purchase" styleClass="numberColumn">
					<span class="${firstCss}">
						<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.firstPrice }"/>
					</span>
				</ec:column>
				<ec:column property="firstPv" title="busi.pv" styleClass="numberColumn">
					<span class="${firstCss}">
						<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.firstPv }"/>
					</span>
				</ec:column>
				<ec:column property="upgradePrice" title="busi.upgrade.unit.price" styleClass="numberColumn">
					<span class="${upgradeCss}">
						<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.upgradePrice }"/>
					</span>
				</ec:column>
				<ec:column property="upgradePv" title="member.upgrade.pv" styleClass="numberColumn">
					<span class="${upgradeCss}">
						<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.upgradePv }"/>
					</span>
				</ec:column>
				<ec:column property="returnPrice" title="busi.return.unit.price" styleClass="numberColumn">
					<span class="${returnCss}">
						<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.returnPrice }"/>
					</span>
				</ec:column>
				<ec:column property="returnPv" title="busi.return.unit.pv" styleClass="numberColumn">
					<span class="${returnCss}">
						<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.returnPv }"/>
					</span>
				</ec:column>
				<ec:column property="turnoverPrice" title="兑换价格" styleClass="numberColumn">
					<span class="${turnoverCss}">
						<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.turnoverPrice }"/>
					</span>
				</ec:column>
				<%-- <ec:column property="turnoverPrice" title="turnover.of.the.price" styleClass="numberColumn">
					<span class="${turnoverCss}">
						<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.turnoverPrice }"/>
					</span>
				</ec:column>
				<ec:column property="giveShopAmont" title="po.shop.amout" styleClass="numberColumn"/> --%>
				<ec:column property="status" title="fi.status" styleClass="centerColumn">
					<span class="${statusCss}">
						<win:code listCode="pmproduct.status" value="${pmProductVar.status }"/>
					</span>
				</ec:column>
				<ec:column property="orderNo" title="sysModule.orderNo" styleClass="numberColumn"/>
				<%-- <ec:column property="orderNo" title="remaining.qty" styleClass="numberColumn">
					<c:if test="${empty pmProductVar.limitBuy || pmProductVar.limitBuy==0}"><fmt:message key="no.limit"/></c:if>
					<c:if test="${pmProductVar.limitBuy==1}">
						<c:if test="${empty pmProductVar.pmProductExtra}">
							<span class="important">0</span>
						</c:if>
						<c:if test="${not empty pmProductVar.pmProductExtra}">
							<c:if test="${pmProductVar.pmProductExtra.leftLimitQty>0}">
								<span class="green">${pmProductVar.pmProductExtra.leftLimitQty}</span>
							</c:if>
							<c:if test="${pmProductVar.pmProductExtra.leftLimitQty<=0}">
								<span class="important">${pmProductVar.pmProductExtra.leftLimitQty}</span>
							</c:if>
						</c:if>
					</c:if>
				</ec:column> --%>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$("a[name='picture']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-picture"
        },
        text: false
    });
	
	$("a[name='ecDetail']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-ec-detail"
        },
        text: false
    });
});

function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>