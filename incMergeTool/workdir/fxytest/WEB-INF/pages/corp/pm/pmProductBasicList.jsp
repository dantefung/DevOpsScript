<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pm.listPmProducts"/></title>
    <meta name="heading" content="<fmt:message key="menu.pm.listPmProducts"/>"/>
</head>
 
<div class="searchBar">
	<form method="get" action="pmProductBasics.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="busi.product.productno"/></dt>
			<dd><input type="text" name="productCode" id="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pmProduct.productName"/></dt>
			<dd><input type="text" name="productName" id="productName" value="${param.productName }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pmProductBasic.productProp"/></dt>
			<dd><win:list listCode="pmproductbasic.productprop" id="productProp" name="productProp" value="${param.productProp }" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="piProductCategory.categoryNo"/></dt>
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
			<dt><fmt:message key="pmProductBasic.salesArea"/></dt>
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
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listPmProductBasics"/>
			</dd>
		</dl>	
	</form>
</div>

<div class="contentBody">
	<form name="pmProductBasicFunctionForm" id="pmProductBasicFunctionForm" action="editPmProductBasic.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPmProductBasic">
				<a href="editPmProductBasic.jhtml?strAction=addPmProductBasic" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedProductCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmProductBasicListTableForm" method="get" >
		<ec:table 
			tableId="pmProductBasicListTable"
			items="pmProductBasics"
			var="pmProductBasicVar"
			action="pmProductBasics.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmProductBasicListTableForm">
			<ec:row>
				<win:power powerCode="editPmProductBasic">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPmProductBasic.jhtml?strAction=editPmProductBasic&productCode=${pmProductBasicVar.product_code}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="product_code" title="busi.product.productno" />
				<ec:column property="product_name" title="pmProduct.productName" />
				<ec:column property="product_prop" title="pmProductBasic.productProp">
					<win:code listCode="pmproductbasic.productprop" value="${pmProductBasicVar.product_prop}"/>
				</ec:column>
				<ec:column property="type_name" title="piProductCategory.categoryNo"/>
				<ec:column property="isPackage" title="是否套餐" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pmProductBasicVar.isPackage}"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePmProductBasic(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkProductCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pmProductBasicFunctionForm;
	theForm.selectedProductCodes.value=selectedValues;
	theForm.strAction.value="multiDeletePmProductBasic";
	
	showLoading();
	theForm.submit();
}
</script>