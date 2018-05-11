<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.zero.register"/></title>
    <meta name="heading" content="<fmt:message key="mi.zero.register"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/SysIdAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="addMemberFreeRegister.jhtml" onsubmit="return validateForm(this)" name="memberRetailRegisterForm" id="memberRetailRegisterForm">   
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
    		<td colspan="2" class="title">&nbsp;<fmt:message key="mi.freeRegister.remark"/></td>
    	</tr>
    	
    	<tr>
    		<th width="50px;"><fmt:message key="miMember.memberNo"/>:</th>
    		<td>
    			<span id="memberNoLabel">${miMember.memberNo }</span>
    			<form:hidden path="memberNo" id="memberNo"/>
    			<button type="button" name="refresh" onclick="javascript:changeMemberNo();"><fmt:message key="mi.exchange"/></button>
    		</td>
    	</tr>
    	<tr>
    		<th></th>
    		<td><font color="red"><fmt:message key="mi.inni.pwd.lable"/></font><br/><fmt:message key="mi.freeRegister.explain"/></td>
    	</tr>
    	
    	<tr>
    		<th class="required"><fmt:message key="poOrder.memberName"/>:</th>
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
    		<td>
    			<form:input path="idNo" id="idNo" maxlength="18"/>
    		</td>
    	</tr>
    	
    	<tr>
    		<th class="required"><fmt:message key="mi.register.mobil"/>:</th>
    		<td><form:input path="mobile" id="mobile" maxlength="11"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
    		<td>
    			<form:input path="telAreaCode" id="telAreaCode" maxlength="4" style="width:30px;"/>
    			<form:input path="telphone" id="telphone" maxlength="8" style="width:90px;"/>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.email"/>:</th>
    		<td><form:input path="email" id="email"/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="miMember.delivery.area"/>:</th>
    		<td>
    			<div id="regionDiv"></div>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.addrees.detail"/>:</th>
    		<td>
    			<form:input path="address1" id="address1" style="width:200px;"/><br/>
    			<%--<form:input path="address2" id="address2" style="width:200px;"/> --%>
    		</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
    		<td><form:input path="zipcode" id="zipcode" maxlength="6"/></td>
    	</tr>
		
		<tr>
			<td colspan="2" class="title"><fmt:message key="mi.register.position.explain"/></td>
		</tr>

    	<tr>
    		<th class="required"><fmt:message key="mi.recommendNo"/>:</th>
    		<td>
    			<form:input path="recommendNo" id="recommendNo"/>
    			<button type="button" name="showRecommendNameBtn" id="showRecommendNameBtn" onclick="showName(this.form.recommendNo.value,'recommendName');"><fmt:message key="miMember.recommendName"/></button>
    			<span id="recommendName"></span>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.lable.linkNo"/>:</th>
    		<td>
    			<form:input path="linkNo" id="linkNo"/>
    			<button type="button" name="showLinkNameBtn" id="showLinkNameBtn" onclick="showName(this.form.linkNo.value,'linkName');"><fmt:message key="miMember.linkName"/></button>
    			<span id="linkName"></span>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><font color="red">*</font>左右区:</th>
    		<td>
    			<win:list name="leafType" listCode="tree_left_right" defaultValue="0" value="${miMember.leafType }"/>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="btn.register.finish"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<script type="text/javascript">
$("#recommendNo,#memberNo,#linkNo,#agentNo").blur(function(e) {     
	$(this).val($(this).val().toUpperCase());
}); 

$(document).ready(function(){
	$("button[name='refresh']").button({
        icons: {
            primary: "ui-icon-refresh"
        }
    });
	$("#showAgentNameBtn,#showRecommendNameBtn,#showLinkNameBtn").button({
        icons: {
            primary: "ui-icon-search"
        },
        text:false
    });
	$('#regionDiv').regionSelector({
		startRegionId:0,
		regionCode:'${miMember.areaCode}'
	});
})

function validateForm(theForm) {
	
	if(bCancel){
		showLoading();
		return true;
	}
	
	if (theForm.lastName.value == null || theForm.lastName.value == '') {
		alert("<fmt:message key='mi.realName.null.requie'/>");
		theForm.lastName.focus();
		return false;
	}
	
	if (theForm.idType.value == null || theForm.idType.value == '') {
		alert("<fmt:message key='mi.cardType.null.requie'/>");
		theForm.idType.focus();
		return false;
	}
	
	if (theForm.idNo.value == null || theForm.idNo.value == '') {
		alert("<fmt:message key='mi.cardNo.null.requie'/>");
		theForm.idNo.focus();
		return false;
	}
	
	if (theForm.mobile.value == null || theForm.mobile.value == '') {
		alert("<fmt:message key='mi.telephone.null.requie'/>");
		theForm.mobile.focus();
		return false;
	}
	
	if (theForm.recommendNo.value == null || theForm.recommendNo.value == '') {
		alert("<fmt:message key='mi.recommendNo.null.requie'/>");
		theForm.recommendNo.focus();
		return false;
	}
	
	if (theForm.linkNo.value == null || theForm.linkNo.value == '') {
		alert("<fmt:message key='linkNo.isNotEmpty'/>.");
		theForm.linkNo.focus();
		return false;
	}
	
	//其它验证
	showLoading();
	return true;
}

/* 获取会员编号 */
function changeMemberNo() {
	//20141010根据国家来获取会员编号的规则
	var countryRegionId = '2860';
	SysIdAjax.getMemberNo(countryRegionId,function(data) {
		document.getElementById("memberNoLabel").innerHTML = data;
		document.getElementById("memberNo").value = data;
	});
}
</script>