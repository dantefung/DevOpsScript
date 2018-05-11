<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.po.poOrderCalcdateLog"/></title>
    <meta name="heading" content="<fmt:message key="menu.po.poOrderCalcdateLog"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poOrderCalcdateLogs.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd><fmt:message key="label.company"/></dd>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>		
		<dl>
			<dd><fmt:message key="miMember.memberNo"/></dd>
			<dd><input type="text" name="userCode" id="userCode" value="${param.userCode }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="poOrder.memberName"/></dd>
			<dd><input type="text" name="userName" id="userName" value="${param.userName }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysOperationLog.operateTime"/></dd>
			<dd>
				<input type="text" name="startOperatorTime" id="startOperatorTime" value="${param.startOperatorTime }" style="width:80px;" readonly="readonly"/>
				-
				<input type="text" name="endOperatorTime" id="endOperatorTime" value="${param.endOperatorTime }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listPoOrderCalcdateLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poOrderCalcdateLogFunctionForm" id="poOrderCalcdateLogFunctionForm" action="editPoOrderCalcdateLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoOrderCalcdateLog">
				<a href="editPoOrderCalcdateLog.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoOrderCalcdateLog">
				<a href="javascript:multiDeletePoOrderCalcdateLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poOrderCalcdateLogListTableForm" method="get" >
		<ec:table 
			tableId="poOrderCalcdateLogListTable"
			items="poOrderCalcdateLogs"
			var="poOrderCalcdateLogVar"
			action="poOrderCalcdateLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderCalcdateLogListTableForm">
			<ec:row>
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="order_no" 	title="busi.order.orderno" />
				<ec:column property="order_type" title="pd.orderType" >
					<win:code listCode="po_order_type" value="${poOrderCalcdateLogVar.order_type }"/>
				</ec:column>
				<ec:column property="old_calc_date" title="poOrderCalcdateLog.oldCalcDate" />
				<ec:column property="new_calc_date" title="poOrderCalcdateLog.newCalcDate" />
				<ec:column property="operator_code" title="sys.handle.no" />
				<ec:column property="operator_time" title="sysOperationLog.operateTime" />
				<ec:column property="memo" 			title="busi.common.remark" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startOperatorTime,#endOperatorTime" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePoOrderCalcdateLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poOrderCalcdateLogFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeletePoOrderCalcdateLog";
	
	showLoading();
	theForm.submit();
}
</script>