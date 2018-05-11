<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="货币管理" /></title>
	<meta name="heading" content="<fmt:message key="货币管理"/>" />
</head>

<div class="contentBody">
<form:form commandName="alCurrency"
	method="post" action="editAlCurrency.jhtml"
	onsubmit="return validateForm(this)" id="alCurrencyForm">

	<spring:bind path="alCurrency.*">
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
	<span class="form-tips"><fmt:message key="item.in.bold.required" /></span>
	<table class="detail">
		<tr>
			<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
		</tr>
		<tr>
			<th class="required">货币编码:</th>
			<td>
				<c:if test="${param.strAction=='editAlCurrency' }"><form:hidden path="currencyCode"/>${alCurrency.currencyCode}</c:if>
				<c:if test="${param.strAction=='addAlCurrency' }"><form:input path="currencyCode" id="currencyCode" /></c:if>
			</td>
		</tr>
		<tr>
			<th class="required">货币名称:</th>
			<td><form:input path="currencyName" id="currencyName" /></td>
		</tr>
		
		<tr>
			<th>使用此货币的公司:</th>
			<td>
				<table>
					<tr>
						<td>分公司</td>
						<td>是否使用</td>
						<td>默认货币</td>
					</tr>
					<c:forEach items="${alCompanys}" var="alCompanyVar">
						<c:set var="isChecked" value="false"/>
						<c:set var="isDefault" value="false"/>
			    		<c:forEach items="${alCompanyCurrencys}" var="alCompanyCurrencyVar">
			    			<c:if test="${alCompanyCurrencyVar.companyCode==alCompanyVar.companyCode}">
			    				<c:set var="isChecked" value="true"/>
			    			</c:if>
			    			<c:if test="${alCompanyCurrencyVar.companyCode==alCompanyVar.companyCode && alCompanyCurrencyVar.isDefault=='1'}">
			    				<c:set var="isDefault" value="true"/>
			    			</c:if>
			    		</c:forEach>
						<tr>
							<td><label for="companyCode_${alCompanyVar.companyCode }">${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</label></td>
							<td>
								<c:if test="${isChecked=='true'}">
					    			<input type="checkbox" name="companyCode" value="${alCompanyVar.companyCode }" class="checkbox" id="companyCode_${alCompanyVar.companyCode }" checked="checked"/>
					    		</c:if>
					    		<c:if test="${isChecked=='false'}">
					    			<input type="checkbox" name="companyCode" value="${alCompanyVar.companyCode }" class="checkbox" id="companyCode_${alCompanyVar.companyCode }"/>
					    		</c:if>
							</td>
							<td>
								<c:if test="${isDefault=='true'}">
					    			<input type="checkbox" name="isDefault" value="${alCompanyVar.companyCode }" class="checkbox" checked="checked"/>
					    		</c:if>
					    		<c:if test="${isDefault=='false'}">
					    			<input type="checkbox" name="isDefault" value="${alCompanyVar.companyCode }" class="checkbox"/>
					    		</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<div class="buttonBar">
				<input type="hidden" name="strAction" value="${param.strAction }" /> 
				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
				<win:power powerCode="${param.strAction }">
					<button type="submit" name="save" onclick=bCancel=false;>
						<fmt:message key="button.save"/>
					</button>
				</win:power> 
				<c:if test="${not empty alCurrency.currencyCode }">
					<win:power powerCode="deleteAlCurrency">
						<button type="submit" name="delete" onclick="bCancel=true; return confirmDelete(this.form,'AlCurrency');">
						<fmt:message key="operation.button.delete" />
						</button>
					</win:power>
				</c:if>
				<button type="button" name="cancel" onclick="window.location='alCurrencys.jhtml?needReload=1'";>
					<fmt:message key="operation.button.cancel" />
				</button>
			</div>
			</td>
		</tr>
	</table>

</form:form></div>
<script type="text/javascript">
	function validateForm(theForm) {
		if (bCancel) {
			showLoading();
			return true;
		}
		//其它验证
		if(theForm.currencyCode.value==""){
			alert("<fmt:message key="error.currencyCode.required" />");
			theForm.currencyCode.focus();
			return false;
		}
		if(theForm.currencyName.value==""){
			alert("<fmt:message key="error.currencyName.required" />");
			theForm.currencyName.focus();
			return false;
		}
		showLoading();
		return true;
	}
</script>