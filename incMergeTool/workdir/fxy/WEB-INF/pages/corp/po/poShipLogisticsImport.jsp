<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="st.logistics.import.lable"/></title>
    <meta name="heading" content="<fmt:message key="st.logistics.import.lable"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysUser" method="post" action="importPoShipLogistics.jhtml" onsubmit="return validateForm(this)" id="logisticsImportForm" enctype="multipart/form-data">
    
    <spring:bind path="sysUser.*">
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
    		<th class="required"><fmt:message key="fiPayData.importFile"/>:</th>
    		<td><input type="file" name="xlsFile" id="xlsFile" size="50" value="<fmt:message key='sys.browse'/>..."/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiPayData.import.notice.label"/>:</th>
    		<td>
      			<b>1.&nbsp;<fmt:message key="st.import.remark1"/><br/>
		        2.&nbsp;<fmt:message key="st.import.remark2"/></b><br/>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="importPoShipLogistics"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.import"/></button>
    				<button type="button" name="cancel" onclick="window.location='poShips.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.xlsFile.value==""){
		alert("请选择所需要导入的xls文件");
		return false;
	}
	showLoading();
	return true;
}
</script>