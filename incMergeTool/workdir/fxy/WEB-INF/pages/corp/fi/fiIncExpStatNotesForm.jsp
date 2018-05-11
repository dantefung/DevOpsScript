<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="edit.notes.lable"/></title>
    <meta name="heading" content="<fmt:message key="edit.notes.lable"/>"/>
</head>
<div class="contentBody">
    <form:form commandName="fiBankbookJournal" method="post" action="editNotes.jhtml" onsubmit="return validateForm(this)" id="fiBankbookTempForm">
    
    <spring:bind path="fiBankbookJournal.*">
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
    		<th><fmt:message key="poSell.notes"/>:</th>
    		<td><form:textarea cols="60" rows="3" path="notes" id="notes"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea cols="60" rows="3" path="remark" id="remark"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="journalId"/>
    				<input type="hidden" name="strAction" value="editNotes"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="editNotes">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='fiIncExpStat.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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

$(function() {
	$("button[name='showNameBtn']",".detail").button({
        icons: {
            primary: "ui-icon-user"
        }
    });
});

</script>