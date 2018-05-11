<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>团队业绩报表</title>
    <meta name="heading" content="团队业绩报表 - <fmt:message key="button.import"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdBonusSub" method="post" action="bdTeamBonusImport.jhtml" onsubmit="return validateForm(this)" id="bdTeamBonusImportForm" enctype="multipart/form-data">
    
    <spring:bind path="bdBonusSub.*">
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
				<b><fmt:message key="导入会员名单格式："/></b>
				<br>
				&nbsp;&nbsp;&nbsp;1,序号<br>
				&nbsp;&nbsp;&nbsp;2,会员编号<br>
				&nbsp;&nbsp;&nbsp;3,xls后缀格式
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.import"/></button>
    				<button type="button" name="cancel" onclick="window.location='bdTeamBonus.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
function isEmpty(input){
	if(input==null || input.length==0){
		return true;
	}else{
		return false;
	}
}
function isNum(num){
  var reNum=/^\d*$/;
  return(reNum.test(num));
}

</script>