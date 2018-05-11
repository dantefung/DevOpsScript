<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="pageTitle">
<c:if test="${param.strAction=='miMemberExit'}"><fmt:message key="ic.cancel.member.title"/></c:if>
<c:if test="${param.strAction=='miMemberRejoin'}"><fmt:message key="ic.recover.cancel.member.title"/></c:if>
</c:set>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>
<head>
    <title>${pageTitle }</title>
    <meta name="heading" content="${pageTitle }"/>
</head>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="miMemberExit.jhtml" onsubmit="return validateForm(this)" id="miMemberForm">
    
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
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${miMember.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.memberName"/>:</th>
    		<td>${miMember.lastName } <a id='viewMiMemberLink' name="view" href="viewMiMember.jhtml?strAction=viewMiMember&viewType=iframe&memberNo=${miMember.memberNo }"><fmt:message key="function.menu.memberView"/></a></td>
    	</tr>
    	<tr>
    		<th class="required" valign="top"><fmt:message key="busi.common.remark"/>:</th>
    		<td><textarea name="newRemark" rows="6" style="width:525px;">${param.newRemark}</textarea></td>
    	</tr>
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
    				<button type="button" name="cancel" onclick="window.location='miMembers.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.newRemark.value==""){
		alert("<fmt:message key='ic.remark.null.requie'/>");
		theForm.newRemark.focus();
		return false;
	}
	//其它验证
	showLoading();
	return true;
}

$(document).ready(function(){
	$("a[name='view']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        }
    });
	$("#viewMiMemberLink").colorbox({iframe:true, width:"80%", height:"80%"});

});
</script>