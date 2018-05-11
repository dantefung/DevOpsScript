<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>导入收益条目</title>
    <meta name="heading" content="导入收益条目"/>
</head>

<div class="contentBody">
	<form action="importFiBonusChange.jhtml" method="post" enctype="multipart/form-data" name="fiBonusChangeForm" id="fiBonusChangeForm" onsubmit="return validateOthers(this)">
	
	<spring:bind path="fiBonusChange.*">
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
	    	<th class="required">
	        	<fmt:message key="fiPayData.importFile"/>:
	    	</th>
	    <td align="left" width="100%"><input type="file" name="xlsFile" id="xlsFile" size="50"/></td>
	    </tr>
	
	    <tr><th>
	        	<fmt:message key="fiPayData.import.notice.label"/>:
	    </th>
	    <td align="left">
	        <fmt:message key="fiBonusChange.import.notice.text"/>
	        <br/><br/>
			<b>收益类型</b>
			<br/>
			<c:forEach items="${bonusTypes}" var="bonusTypeVar">
	    		${bonusTypeVar.key } - <fmt:message key="${bonusTypeVar.value }"/><br/>
	    	</c:forEach>
			<br/>
	        <b><fmt:message key="fiBankbookTemp.dealType"/></b>
	        <br/>
	        <c:forEach items="${dealTypes}" var="dealTypeVar">
	    			${dealTypeVar.key } - <fmt:message key="${dealTypeVar.value }"/><br/>
	    	</c:forEach>
	    	<br/>
	        <b><fmt:message key="pdAdjustStock.astNo"/>:</b>
	        <br/>
	        <c:forEach items="${balTypes}" var="balTypeVar">
	    		${balTypeVar.key } - <fmt:message key="${balTypeVar.value }"/><br/>
	    	</c:forEach>
	        <br/>
	        <b><fmt:message key="fiBankbookJournal.dealType"/>:</b>
	        <br/>
	        <c:forEach items="${bonusItemTypes}" var="moneyTypeVar">
	    		${moneyTypeVar.key } - <fmt:message key="${moneyTypeVar.value }"/><br/>
	    	</c:forEach>
	    </td></tr>
	    
	    <tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="importFiBonusChange"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="importFiBonusChange">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.import"/></button>
    				</win:power>
    				<c:if test="${not empty fiBonusChange.itemId }">
    					<win:power powerCode="deleteFiBonusChange">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiBonusChange')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiBonusChanges.jhtml?strAction=listFiBonusChanges&needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
	</table>
	</form>

</div>
<script type="text/javascript">
function validateOthers(theForm){
	if(bCancel){
		showLoading();
		return true;
	}
	if(theForm.xlsFile.value=="" || getFileType(theForm.xlsFile.value)!=".xls"){
		alert("<fmt:message key="fiPayData.xlsFile.required"/>");
		theForm.xlsFile.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>