<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.plate.select.title"/></title>
    <meta name="heading" content="<fmt:message key="mi.plate.select.title"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<c:set var="leftNavVar" scope="request">
	<ul>
		<li><b>0.<fmt:message key="mi.plate.select.title"/></b></li>
		<li>1.<fmt:message key="po.input.address"/></li>
		<li>2.<fmt:message key="menu.common.selectProduct"/></li>
		<li>3.<fmt:message key="po.order.info.sure"/></li>
	</ul>
</c:set>
<div class="contentBody">
    <form:form commandName="miMember" method="post" action="poPlateSelect.jhtml" onsubmit="return validateForm(this)" name="miMemberForm" id="miMemberForm">
    <input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
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
    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="mi.mustred"/></td>
    	</tr>
    	<!-- 促销分区选项start -->
		<tr>
			<td colspan="2" class="title"><font color="red">*</font><fmt:message key="mi.register.plate.lable"/></td>
		</tr>
		<c:forEach items="${plateType }" var="plate">
	    	<tr>
	    		<th class="required">${plate.key }<input type="checkbox" name="plateModle" value="${plate.key }" <c:if test="${sessionScope[newOrderKey]._plateTypeSelect[plate.key].status == 1 }">checked="checked"</c:if> /> <fmt:message key="mi.linkNo"/>:</th>
	    		<td>
	    		    <input  name="${plate.key }_linkNoPlan" id="${plate.key }_linkNoPlan" onchange="showRecommandName(this.value,'${plate.key }')"  <c:if test="${not empty sessionScope[newOrderKey]._plateTypeSelect}"> value="${sessionScope[newOrderKey]._plateTypeSelect[plate.key].linkNoPlan}" </c:if> />
	    		    <span id="${plate.key }_recommandName" style="color: blue"></span>
	    		</td>
	    	</tr>
    	</c:forEach>
    	<!-- 促销分区选项end -->
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" value="poUpgrade" name="strAction" />
    				<input type="hidden" value="${miMember.cardType }" name="cardType" />
    				<button type="button" name="previous" onclick="window.location='poOrderMember.jhtml?newOrderKey=${newOrderKey}&strAction=${strAction }'"><fmt:message key="button.previous"/></button>
    				<button type="submit" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<script type="text/javascript">
$(function() {
	$("button[name='next']").button({
        icons: {
            primary: "ui-icon-next"
        }
    });
	$("button[name='previous']").button({
        icons: {
            primary: "ui-icon-previous"
        }
    });
});
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	var plateCk = document.getElementsByName("plateModle");
	var checkFlag = false;
	for(var i=0;i<plateCk.length;i++){
		if(!plateCk[i].checked && !isEmpty($id(plateCk[i].value+"_linkNoPlan").value)){
			alert("<fmt:message key='mi.register.plate.prompt'/>.");
			plateCk[i].focus();
			return false;
		}
		if(plateCk[i].checked){
			checkFlag = true;
		}
	}
	if(!checkFlag){
		alert("<fmt:message key='mi.register.plate.null.requeid'/>.");
		plateCk[0].focus();
		return false;
	}else{
		if(confirm("<fmt:message key='mi.plate.sure.prompt'/>.")){
			return true;
		}else{
			return false;
		}
		
	} 
}

function showRecommandName(memberNo,key){
	if(isEmpty(memberNo)){
		return;
	}
	MiMemberAjax.getMiMemberInfo(memberNo,function(data) {
		if(data!=null){
			document.getElementById(key+"_recommandName").innerHTML = data.lastName;
		}else{
			document.getElementById(key+"_recommandName").innerHTML = "<fmt:message key='prompt.member.inexitance'/>";
		}
	});
}
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}
function $id(tagId){
	return document.getElementById(tagId);
}
</script>