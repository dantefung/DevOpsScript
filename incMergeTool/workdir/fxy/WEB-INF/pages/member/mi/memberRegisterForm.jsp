<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="function.menu.memberRegister"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.memberRegister"/>"/>
</head>

<c:set var="leftNavVar" scope="request">
	<ul>
		<li>1.<fmt:message key="mi.registmember"/></li>
		<li><b>2.<fmt:message key="mi.suremember"/></b></li>
		<li>3.<fmt:message key="mi.submitmemberorder"/></li>
	</ul>
</c:set>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="memberRegister.jhtml" onsubmit="return validateForm(this)" name="memberRegisterForm" id="memberRegisterForm">
    
    <spring:bind path="miMember.*">
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
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="poOrder.basicInformation "/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdReconsumMoneyReport.company"/>:</th>
    		<td>
    			<form:select path="companyCode" id="companyCode" cssStyle="width:135px;">
					<c:forEach items="${alCompanyMap }" var="var">
    				<form:option value="${var.key }">${var.value }</form:option>
    				</c:forEach>    			
    			</form:select>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pl.plate.recommend "/>:</th>
    		<td><form:input path="recommendNo" id="recommendNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysUser.shippingLastName"/>:</th>
    		<td><form:input path="firstName" id="firstName"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miMember.firstName"/>:</th>
    		<td><form:input path="lastName" id="lastName"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.register.petName"/>:</th>
    		<td><form:input path="petName" id="petName"/></td>
    	</tr>
    	
    	<tr>
    		<th class="required"><fmt:message key="miMember.certificateType"/>:</th>
    		<td><win:list listCode="member.cardtype" name="idType" value="${miMember.idType }" defaultValue="0" style="width:135px;"/></td>
    	</tr>
    	
    	<tr>
    		<th class="required"><fmt:message key="miMember.cardNo"/>:</th>
    		<td><form:input path="idNo" id="idNo" maxlength="18"/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="mi.phoneplace"/>:</th>
    		<td><form:input path="telAreaCode" id="telAreaCode"/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="mi.phonenumber"/>:</th>
    		<td><form:input path="telphone" id="telphone"/></td>
    	</tr>
    	
    	<tr>
    		<th class="required"><fmt:message key="miMember.delivery.moblie"/>:</th>
    		<td><form:input path="mobile" id="mobile" maxlength="11"/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="sys.email"/>:</th>
    		<td><form:input path="email" id="email"/></td>
    	</tr>
    	
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="mi.address "/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="sys.state"/>:</th>
    		<td><form:input path="areaCode" id="areaCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.city"/>:</th>
    		<td><form:input path="address1" id="address1"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poscore.address"/>:</th>
    		<td><form:input path="address2" id="address2"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poscore.zip"/>:</th>
    		<td><form:input path="zipcode" id="zipcode" maxlength="6"/></td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="memberNo"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty miMember.memberNo }">
    					<win:power powerCode="deleteMiMember">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiMember')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='memberRegisters.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
</script>