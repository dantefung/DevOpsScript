<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="old.member.activate"/></title>
    <meta name="heading" content="<fmt:message key='old.member.activate'/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<c:choose>
	<c:when test="${currentMiMember.isOld!=1 }">
		<div class="alert alert-danger alert-dismissible fade in error">
			<fmt:message key="function.for.old.member.only"/>
		</div>
	</c:when>
	<c:when test="${currentMiMember.activeStatus==1 }">
		<div class="alert alert-danger alert-dismissible fade in error">
			<fmt:message key="you.have.been.activated.already"/>
		</div>
	</c:when>
	<c:otherwise>

		<form:form commandName="miMember" method="post" action="poActiveStep1.jhtml" onsubmit="return validateForm(this)" name="miMemberForm" id="miMemberForm" cssClass="form-horizontal">
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
		    
		    <p class="text-muted"><fmt:message key="item.in.bold.required"/></p>
			<fmt:message key="mi.mustred"/>
			<hr/>
			
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="lastName" class="col-sm-3 control-label required"><fmt:message key="miMember.old.memberNo"/>:</label>
						<div class="col-sm-9 form-control-static">
							${miMember.oldMemberNo }
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label for="lastName" class="col-sm-3 control-label required"><fmt:message key="mi.realname"/>:</label>
						<div class="col-sm-9">
							<form:input path="lastName" id="lastName" cssClass="form-control"/>
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label for="petName" class="col-sm-3 control-label required"><fmt:message key="mi.register.petName"/>:</label>
						<div class="col-sm-9">
							<form:input path="petName" id="petName" cssClass="form-control"/>
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label for="idType" class="col-sm-3 control-label required"><fmt:message key="miMember.certificateType"/>:</label>
						<div class="col-sm-9">
							<win:list name="idType" listCode="member.cardtype" defaultValue="" value="${miMember.idType}" styleClass="form-control"/>
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label for="idNo" class="col-sm-3 control-label required"><fmt:message key="miMember.cardNo"/>:</label>
						<div class="col-sm-9">
							<form:input path="idNo" id="idNo" cssClass="form-control"/>
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label for="mobile" class="col-sm-3 control-label required"><fmt:message key="mi.register.mobil"/>:</label>
						<div class="col-sm-9">
							<form:input path="mobile" id="mobile" maxlength="11" cssClass="form-control"/>
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label for="email" class="col-sm-3 control-label"><fmt:message key="mi.email"/>:</label>
						<div class="col-sm-9">
							<form:input path="email" id="email" cssClass="form-control"/>
						</div>
					</div>

					<div class="form-group form-group-sm">
						<label for="cardType" class="col-sm-3 control-label required"><fmt:message key="mi.register.cardType"/>:</label>
						<div class="col-sm-9">
							<div class="input-group">
								<select name="newCardType" class="form-control">
				    				<c:forEach items="${typeList }" var="ttype">
				   						<option value="${ttype.key }" <c:if test="${ttype.key==newOrderMap.newCardType  }">selected="selected"</c:if>><fmt:message key="${ttype.value }"/></option>
				    				</c:forEach>
				    			</select>
				    			<span class="input-group-addon glyphicon" aria-hidden="true">
				    				<fmt:message key="lang.required.pv"/>：<strong><span id="cardTypeRange" class="text-warning"></span></strong>
				    			</span>
			    			</div>
						</div>
					</div>

					<hr/>
					<div class="form-group form-group-sm">
						<div class="col-sm-12 text-center">
		  					<input type="hidden" value="${form.token}" name="_form_uniq_id" />
		    				<input type="hidden" value="poActive" name="strAction" />
		    				<input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
		    				<button type="submit" class="btn btn-success" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
						</div>
					</div>
				</div>
			</div>
		        
		</form:form>
		
		<script type="text/javascript">
		$("#agentNo").blur(function(e) {     
			$(this).val($(this).val().toUpperCase());
		}); 
		
		$("select[name='newCardType']").change(function(e) {     
			handleCardTypeChange();
		}); 
		
		$(document).ready(function(){
		    handleCardTypeChange();
		});
		
		function validateForm(theForm) {
			if(bCancel){
				showLoading();
				return true;
			}
			
			if (theForm.lastName.value == null || theForm.lastName.value == '') {
				alert("<fmt:message key='mi.realName.null.requie'/>.");
				theForm.lastName.focus();
				return false;
			}
			
			if (theForm.petName.value == null || theForm.petName.value == '') {
				alert("<fmt:message key='mi.null.petname'/>.");
				theForm.petName.focus();
				return false;
			}
			
			if (theForm.idType.value == null || theForm.idType.value == '') {
				alert("<fmt:message key='mi.cardType.null.requie'/>.");
				theForm.idType.focus();
				return false;
			}
			
			if (theForm.idNo.value == null || theForm.idNo.value == '' || theForm.idNo.value.length<6) {
				alert("<fmt:message key='prompt.idCard.format.wrong'/>.");//证件号码格式不正确
				theForm.idNo.focus();
				return false;
			}
			
			if (theForm.mobile.value == null || theForm.mobile.value == '') {
				alert("<fmt:message key='mi.telephone.null.requie'/>.");
				theForm.mobile.focus();
				return false;
			}
			
			showLoading();
			return true;
		}
		
		function handleCardTypeChange(){
			var newCardType = document.miMemberForm.newCardType.value;
			MiMemberAjax.getCardTypeRequiredRange(newCardType,function(data) {
				$("#cardTypeRange").text(data);
			});
		}
		</script>

	</c:otherwise>
</c:choose>