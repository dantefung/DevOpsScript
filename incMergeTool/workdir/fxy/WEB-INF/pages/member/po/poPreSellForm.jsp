<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="po.returnOrder"/></title>
	<meta name="heading" content="<fmt:message key="po.returnOrder"/>"/>
</head>
<c:set var="leftNavVar" scope="request">
	<ul>
		<li><b>0.<fmt:message key="po.returnOrder"/></b></li>
		<li>1.<fmt:message key="po.input.address"/></li>
		<li>2.<fmt:message key="menu.common.selectProduct"/></li>
		<li>3.<fmt:message key="po.order.info.sure"/></li>
	</ul>
</c:set>
<div class="contentBody">
    <form:form commandName="miMember" method="post" action="poPreSell.jhtml"  name="miMemberForm" id="miMemberForm">
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
    	<tr>
    		<th  class="required">&nbsp;<fmt:message key="miMember.memberNo"/>:</th>
    		<td>${ memberNo}</td>
    	</tr>
   		<tr>
    		<th  class="required">&nbsp;<fmt:message key="order.is.pre.sell.lable"/>:</th>
    		<td><win:code listCode="yesno"  value="${isPreSell }" /></td>
   		</tr>
   		<tr>
   			<th  class="required">&nbsp;<fmt:message key="order.pre.sell.date.lable"/>:</th>
    		<td>${preSellDate } </td>
    	</tr>
    	<tr>
    		<th  class="required">&nbsp;<input type="checkbox" name="isCheck" id="isCheck" value="1"/></th>
    		<td ><b><fmt:message key="mi.preSell.readed"/></b></td>
    	</tr>
    	<tr>
    		<th  class="required" colspan="2" style="color: red;font-size: 16px;">&nbsp;${remark }</th>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" value="${strAction }" name="strAction" />
    				 <input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
    				  <input type="hidden" id="memberNo" name="memberNo" value="${memberNo}"/>
    				<button type="button" name="previous" onclick="window.location='poOrderMember.jhtml?newOrderKey=${newOrderKey}&strAction=${strAction }'"><fmt:message key="button.previous"/></button>
					<button type="button" name="next" onclick="bCancel=false;validateForm()"><fmt:message key="button.next"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
    <input type="hidden" value="${isFlag }" name="isFlag" id="isFlag"/>
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
function validateForm() {
	if(bCancel){
		showLoading();
		$id("miMemberForm").submit();
		return;
	}
	var isCheck = $id("isCheck");
	if (!isCheck.checked) {
		alert("<fmt:message key='mi.preSell.check'/>.");
		isCheck.focus();
	}else{
		showLoading();
		$id("miMemberForm").submit();
	}
	
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