<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmProductBasicDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pmProductBasicDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pmProductBasic" method="post" action="editPmProductBasic.jhtml" onsubmit="return validateForm(this)" id="pmProductBasicForm">
    
    <spring:bind path="pmProductBasic.*">
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
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="busi.product.productno"/>:</th>
    		<td>
    			<c:if test="${strAction  == 'addPmProductBasic' }">
    			<form:input path="productCode" id="productCode"/>
    			</c:if>
    			<c:if test="${strAction  != 'addPmProductBasic' }">
    			${pmProductBasic.productCode }
    			<input type="hidden" name="productCode" value="${pmProductBasic.productCode }" />
    			</c:if>
    		</td>
    	</tr>
    	
    	<tr>
    		<th class="required"><fmt:message key="pmProduct.productName"/>:</th>
    		<td><form:input path="productName" id="productName" style="width:300px;"/></td>
    	</tr>
    	<!-- 商品属性分为直销品、辅销品、活动门票  -->
    	<tr>
	    	<th class="required"><fmt:message key="pmProductBasic.productProp"/>:</th>
	    	<td><win:list listCode="pmproductbasic.productprop" id="productProp" name="productProp" value="${pmProductBasic.productProp }" defaultValue="请选择" showBlankLine="true"/></td>
	    </tr>
	    
	    <tr>
	    	<th class="required"><fmt:message key="piProductCategory.categoryNo"/>:</th>
	    	<td>
	    		<select name="typeId">
					<c:forEach items="${pmProductTypes }" var="pmProductTypeVar">
						<c:if test="${pmProductTypeVar.parentTypeId==0 }">
							<optgroup label="${pmProductTypeVar.typeName }">
								${pmProductTypeVar.typeName }
								<c:forEach items="${pmProductTypes }" var="childPmProductTypeVar">
									<c:if test="${childPmProductTypeVar.parentTypeId==pmProductTypeVar.typeId }">
										<option value="${childPmProductTypeVar.typeId }"<c:if test="${childPmProductTypeVar.typeId==pmProductBasic.typeId }"> selected</c:if>>${childPmProductTypeVar.typeName }</option>
									</c:if>
								</c:forEach>
							</optgroup>
						</c:if>
					</c:forEach>
				</select>
	    	</td>
	    </tr>
	    <c:if test="${strAction=='addPmProductBasic' }">
	    	<tr>
	    		<th></th>
	    		<td><form:checkbox path="isPackage" value="1" id="isPackage"/><label for="isPackage">是否套餐包</label></td>
	    	</tr>
    	</c:if>
    	<c:if test="${strAction!='addPmProductBasic' }">
    		<tr>
	    		<th>是否套餐包:</th>
	    		<td><form:hidden path="isPackage"/><win:code listCode="yesno" value="${pmProductBasic.isPackage }"/> </td>
	    	</tr>
    	</c:if>
    	<tr>
			<th class="required"><fmt:message key="enable.branch.company"/>:</th>
			<td>
			  
			   <c:if test="${strAction  == 'addPmProductBasic' }">
			     <c:forEach items="${alcompanyList }" var="al">
				   <input type="checkbox" name="companyCode" id="companyCode_${al.companyCode}" value="${al.companyCode}" class="checkbox"/>
				   <label for="companyCode_${al.companyCode}">${al.companyCode } -- ${al.companyName }</label>
				   <br/>
				 </c:forEach>
			   </c:if>
    		   
    		    <c:if test="${strAction  != 'addPmProductBasic' }">
    			<c:forEach items="${alcompanyList }" var="al">
					<input type="checkbox" id="companyCodeShow_${al.companyCode}" value="${al.companyCode}" class="checkbox" onclick="clickCompanyCheckbox('${al.companyCode}');"
						<c:forEach items="${companyCodeList}" var="clShow">
							<c:if test="${al.companyCode==clShow.company_code }"> checked="checked" disabled="disabled"</c:if>
						</c:forEach>
					/>
					<input type="checkbox" name="companyCode" id="companyCode_${al.companyCode}" value="${al.companyCode}" class="checkbox" style="display: none;"
						<c:forEach items="${companyCodeList}" var="cl">
							<c:if test="${al.companyCode==cl.company_code }"> checked="checked" </c:if>
						</c:forEach>
					/>
					<label for="companyCode_${al.companyCode}">${al.companyCode } -- ${al.companyName }</label><br/>
				</c:forEach>
    		   </c:if>
    		   
    		  		
            </td>
		</tr>
		
		<tr>
			<th class="required"><fmt:message key="enable.country"/>:</th>
			<td>
			  
			   <c:if test="${strAction  == 'addPmProductBasic' }">
			     <c:forEach items="${alcountryList }" var="al">
				   <input type="checkbox" name="regionCode" id="regionCode_${al.regionCode}" value="${al.regionCode}" class="checkbox" readonly="readonly"/>
				   <label for="regionCode_${al.regionCode}">${al.regionCode } -- ${al.regionName }</label>
				   <br/>
				 </c:forEach>
			   </c:if>
			   		   
			   <c:if test="${strAction  != 'addPmProductBasic' }">
    			<c:forEach items="${alcountryList }" var="al">
					<input type="checkbox" name="regionCode" id="regionCode_${al.regionCode}" value="${al.regionCode}" class="checkbox" 
						<c:forEach items="${countryCodeList}" var="cl">
							<c:if test="${al.regionCode==cl.region_code }"> checked="checked" </c:if>
						</c:forEach>
					/>
					<label for="regionCode_${al.regionCode}">${al.regionCode } -- ${al.regionName }</label><br/>
				</c:forEach>
    		   </c:if>
    		  		
            </td>
		</tr>
		
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="remark" rows="6" style="width:300px;"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">				
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='pmProductBasics.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	showLoading();
	return true;
}

function clickCompanyCheckbox(companyCode){
	if(document.getElementById("companyCodeShow_"+companyCode).checked){
		document.getElementById("companyCode_"+companyCode).checked = true;
	}else {
		document.getElementById("companyCode_"+companyCode).checked = false;
	}
}
</script>