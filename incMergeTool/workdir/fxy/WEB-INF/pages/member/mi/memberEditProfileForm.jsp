<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.userupdate"/></title>
    <meta name="heading" content="<fmt:message key="mi.userupdate"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="editMemberProfile.jhtml" onsubmit="return validateForm(this);" name="memberRegisterForm" id="memberRegisterForm" enctype="multipart/form-data">
	<input type="hidden" name="sid" id="sid" value="${sid }"/>
    <spring:bind path="miMember.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="alert alert-danger alert-dismissible fade in error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
    
    <span class="form-tips">
		<fmt:message key="item.in.bold.required"/>
	</span>
    <table class="detail">
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${miMember.memberNo }</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="mi.realname"/>:</th>
    		<td>******${fn:substring(miMember.lastName, fn:length(miMember.lastName)-1, fn:length(miMember.lastName))}</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.register.petName"/>:</th>
    		<td><form:input path="petName" id="petName" cssClass="form-control input-sm"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.certificateType"/>:</th>
    		<td><win:code listCode="member.cardtype" value="${miMember.idType }"/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="miMember.cardNo"/>:</th>
    		<td>${fn:substring(miMember.idNo, 0, 4)}************${fn:substring(miMember.idNo, fn:length(miMember.idNo)-2, fn:length(miMember.idNo))}</td>
    	</tr>
    	<%-- <tr>
    		<th>当前身份证扫描件(正面):</th>
    		<td>
    			<c:if test="${empty miMember.idPhotoFront }">无</c:if>
    			<c:if test="${not empty miMember.idPhotoFront }"><a href="${miMember.idPhotoFront }" target="_blank">查看</a></c:if>
    		</td>
    	</tr>
    	<tr>
    		<th>新的身份证扫描件(正面):<br/>（JPG格式）</th>
    		<td>
    			<input type="file" name="newIdPhotoFront" id="newIdPhotoFront"/>
    		</td>
    	</tr>
    	<tr>
    		<th>身份证扫描件(反面):</th>
    		<td>
    			<c:if test="${empty miMember.idPhotoBack }">无</c:if>
    			<c:if test="${not empty miMember.idPhotoBack }"><a href="${miMember.idPhotoBack }" target="_blank">查看</a></c:if>
    		</td>
    	</tr>
    	<tr>
    		<th>新的身份证扫描件(反面):<br/>（JPG格式）</th>
    		<td>
    			<input type="file" name="newIdPhotoBack" id="newIdPhotoBack"/>
    		</td>
    	</tr>
    	<tr>
    		<th>营业执照号码:</th>
    		<td>
    			<form:input path="blCode" id="blCode"/>
    		</td>
    	</tr>
    	<tr>
    		<th>当前营业执照文件:</th>
    		<td>
    			<c:if test="${empty miMember.blFile }">无</c:if>
    			<c:if test="${not empty miMember.blFile }"><a href="${miMember.blFile }" target="_blank">查看</a></c:if>
    		</td>
    	</tr>
    	<tr>
    		<th>新的营业执照文件:<br/>（JPG格式）</th>
    		<td>
    			<input type="file" name="newBlFile" id="newBlFile"/>
    		</td>
    	</tr> --%>
    	
    	<tr>
    		<th class="required"><fmt:message key="mi.register.mobil"/>:</th>
    		<td>${miMember.mobile }</td>
    	</tr>
    	<tr>
    		<th ><fmt:message key="csServiceCenter.telephone"/>:</th>
    		<td>
    			<div class="row">
    				<div class="col-xs-4 col-md-4" style="margin-right: 0px;padding-right: 0px;">
    					<form:input path="telAreaCode" id="telAreaCode" maxlength="4"  cssClass="form-control input-sm"/>
    				</div>
    				<div class="col-xs-8 col-md-8" style="margin-left:0px;padding-left: 0px;">
	    				<form:input path="telphone" id="telphone" maxlength="8" cssClass="form-control input-sm"/>
    				</div>
    			</div>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.email"/>:</th>
    		<td><form:input path="email" id="email" cssClass="form-control input-sm"/></td>
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
    			<form:input path="address1" id="address1" cssClass="form-control input-sm"/>
    			<%-- <br/><form:input path="address2" id="address2" style="width:200px;"/>--%>
    		</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
    		<td><form:input path="zipcode" id="zipcode" maxlength="6" cssClass="form-control input-sm"/></td>
    	</tr>

    	<%--
    	<tr>
    		<th>备注信息:</th>
    		<td><form:textarea path="remark" id="remark" cols="40" rows="2"/></td>
    	</tr> --%>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<div class="row">
    					<button type="submit" class="btn btn-success col-xs-12 col-md-4 col-md-offset-4" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</div>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$('#regionDiv').regionSelector({
		startRegionId:0,
		width:'',
		cssName:'form-control',
		regionCode:'${miMember.areaCode}'
	});
});

function validateForm(theForm) {
	
	if(bCancel){
		showLoading();
		return true;
	}
	
	/* var address1 = theForm.address1.value;
	if (address1 == null || address1 == '') {
		alert("<fmt:message key='mi.addrees.nul.requie'/>");
	
		theForm.address1.focus();
		return false;
	} */

	if (confirm("<fmt:message key='mi.isupdate'/>")) {
		//其它验证
		showLoading();
		return true;
	}
	return false;
}

function loadJHTML() {
	alert("<fmt:message key='mi.overload'/>");
	
	var sid = document.getElementById("sid").value;
	document.location = "editMemberProfile.jhtml";
}
// 5分钟后自动跳转到二级密码输入界面
setTimeout(loadJHTML, 1000*60*5);
</script>