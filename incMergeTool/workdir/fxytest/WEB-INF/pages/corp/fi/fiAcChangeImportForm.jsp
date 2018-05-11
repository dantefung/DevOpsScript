<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="lang.acc.deduct.mgr"/></title>
    <meta name="heading" content="<fmt:message key="lang.acc.deduct.mgr"/> - <fmt:message key="button.import"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAcChange" method="post" action="importFiAcChange.jhtml" onsubmit="return validateForm(this)" id="fiAcChangeForm" enctype="multipart/form-data">
    
    <spring:bind path="fiAcChange.*">
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
    		<th class="required"><fmt:message key="title.accout.type"/>:</th>
    		<td>
    			<form:select path="acType">
    				<c:forEach items="${accountTypes }" var="accountTypeVar">
    						<form:option value="${accountTypeVar.key }"><fmt:message key="${accountTypeVar.value }"/></form:option>
    				</c:forEach>
    			</form:select>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiPayData.importFile"/>:</th>
    		<td><input type="file" name="xlsFile" id="xlsFile" size="50" value="<fmt:message key='sys.browse'/>..." accept=".xls"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiPayData.import.notice.label"/>:</th>
    		<td>
      			1.<fmt:message key="fi.msg.q17"/>
      			<br>2.<fmt:message key="fi.msg.q19"/>：<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=#0000FF><font color=#FF0000><fmt:message key="miMember.memberNo"/></font>,<font color=#FF0000>扣补原因</font>,<font color=#FF0000>变更量</font>,<font color=#FF0000><fmt:message key="poSell.notes"/></font>,<font color=#FF0000><fmt:message key="busi.common.remark"/></font></font>
      			<br>3.<fmt:message key="fi.msg.q20"/>
      			<br>4.<fmt:message key="fi.msg.q21"/>。
		        <br/>
				<br/>
				<b><fmt:message key="lang.reasonOfDeduction"/></b>
				<br/>
				<c:forEach items="${reasons}" var="reasonVar">
		    		&nbsp;&nbsp;&nbsp;&nbsp;${reasonVar.key } - ${reasonVar.value }<br/>
		    	</c:forEach>
		    	<br/>
		    	<br/>
		    	<a href="<c:url value="/download/fiAcChangeSample.xls"/>"><fmt:message key="download.doc.template"/></a>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.import"/></button>
    				<button type="button" name="cancel" onclick="window.location='fiAcChanges.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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