<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="po.plate.view.title"/></title>
    <meta name="heading" content="<fmt:message key="po.plate.view.title"/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<div class="contentBody">
    <form method="post" action="poPlateSelectView.jhtml" onsubmit="return validateForm(this)" id="miMemberForm">
    <input type="hidden" name="sid" id="sid" value="${sid }"/>
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
    <table class="detail" >
    	<tr><th class="required"><fmt:message key='miMember.memberNo'/>：</th><td>${memberNo }</td></tr>
    	<tr>
    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="mi.register.plate.lable"/></td>
    	</tr>
		<c:if test="${not empty plateSelectList }">
			<c:forEach items="${plateSelectList }" var="plate">
		    	<tr style="border-bottom:1 solid gray;">
		    		<th <c:if test="${plate.status != 2 && plate.status != 3}">class="required"</c:if>>${plate.plateModel }&nbsp;&nbsp;&nbsp;<fmt:message key="mi.linkNo"/>:</th>
		    		<td >
						 <input name="${plate.plateModel }_linkNoPlan" id="${plate.plateModel }_linkNoPlan" value="${plate.linkNoPlan }" disabled="disabled" style="border: 0px"/>	
						 <font color="#FFE7BA "><b>[<win:code listCode="mi.plate.select.status" value="${plate.status }"></win:code>]</b></font>	    			
		    		</td>
		    	</tr>
	    	</c:forEach>
	    	<tr><td colspan="2" style="color: red"><fmt:message key='mi.return.order.plate.prompt'/></td></tr>
    	</c:if>
    	<tr>
    		<th width="125px"></th>
    		<td width="290px">
    			<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    			<input type="hidden" value="${strAction }" name="strAction" />
    			 <input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
    			<button type="button" name="previous" onclick="window.location='poOrderMember.jhtml?newOrderKey=${newOrderKey}&strAction=${strAction }'"><fmt:message key="button.previous"/></button>
   				<button type="submit" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
    		</td>
    	</tr>
    </table>
    </form>
</div>
<script type="text/javascript">
$(document).ready(function(){
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
	if(confirm("<fmt:message key='mi.return.order.plate.confirm'/>.")){
		//其它验证
		showLoading();
		return true;
	}else{
		return false;
	}
}
</script>