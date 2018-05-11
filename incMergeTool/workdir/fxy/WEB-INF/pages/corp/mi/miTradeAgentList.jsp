<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="交易盘代理申请管理" /></title>
	<meta name="heading" content="<fmt:message key="交易盘代理申请管理"/>" />
</head>

<div class="searchBar">
	<form method="get" action="miTradeAgents.jhtml"
		onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd>
					<fmt:message key="label.company" />
				</dd>
				<dd>
					<select name="companyCode" id="companyCode">
						<option value=""></option>
						<c:forEach items="${alCompanys}" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }" <c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode} - ${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt>申请单号</dt>
			<dd>
				<input type="text" name="applCode" value="${param.applCode }" />
			</dd>
		</dl>
		<dl>
			<dt>会员编号</dt>
			<dd>
				<input type="text" name="userCode" value="${param.userCode }" />
			</dd>
		</dl>
		<dl>
			<dt>
				<win:list name="dateType" listCode="mi_trade_agent_search_time" defaultValue="" value="${param.dateType }" showBlankLine="true"/>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12" />
				 - 
				 <input type="text"	name="endDate" id="endDate"	value="${param.endDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dt>状态</dt>
			<dd>
				<win:list name="status" listCode="mi_trade_agent_status" defaultValue="" value="${param.status }" showBlankLine="true" />
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listMiTradeAgents" />
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miTradeAgentFunctionForm" id="miTradeAgentFunctionForm"
		action="handleMiTradeAgent.jhtml" method="post">
		<%@ include file="/common/messages.jsp"%>

		<div class="functionBar">
			<win:power powerCode="checkMiTradeAgent">
				<a href="javascript:multiCheckMiTradeAgent()" name="check">审核</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="uncheckMiTradeAgent">
				<a href="javascript:multiUncheckMiTradeAgent()" name="uncheck">取消</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiTradeAgent">
				<a href="javascript:multiDeleteMiTradeAgent()" name="multiDelete">
					<fmt:message key="operation.button.delete" />
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedApplCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>

	<form id="miTradeAgentListTableForm" method="get">
		<ec:table tableId="miTradeAgentListTable" items="miTradeAgents"
			var="miTradeAgentVar" action="miTradeAgents.jhtml" width="100%"
			method="get" autoIncludeParameters="true"
			retrieveRowsCallback="limit" rowsDisplayed="20" sortable="false"
			form="miTradeAgentListTableForm">
			<ec:exportXls fileName="miTradeAgents.xls"></ec:exportXls>
			<ec:row>
				<ec:column alias="chkApplCode" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${miTradeAgentVar.status!=9 }">
						<input type="checkbox" name="chkApplCode" value="${miTradeAgentVar.appl_code}" class="checkbox" />
					</c:if>
				</ec:column>

				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" viewsAllowed="html">
					<win:power powerCode="viewMiTradeAgent">
						<a href="viewMiTradeAgent.jhtml?strAction=viewMiTradeAgent&applCode=${miTradeAgentVar.appl_code}" name="view"><fmt:message key="button.view" /></a>
					</win:power>
					<c:if test="${miTradeAgentVar.status==0 }">
						<win:power powerCode="checkMiTradeAgent">
							<a href="handleMiTradeAgent.jhtml?strAction=checkMiTradeAgent&applCode=${miTradeAgentVar.appl_code}" name="check">审核</a>
						</win:power>
					</c:if>
					<c:if test="${miTradeAgentVar.status==0 || miTradeAgentVar.status==1 }">
						<win:power powerCode="uncheckMiTradeAgent">
							<a href="handleMiTradeAgent.jhtml?strAction=uncheckMiTradeAgent&applCode=${miTradeAgentVar.appl_code}" name="uncheck">取消</a>
						</win:power>
					</c:if>
				</ec:column>
				<ec:column property="company_code" title="公司" />
				<ec:column property="appl_code" title="申请单号" />
				<ec:column property="user_code" title="会员编号" />
				<ec:column property="user_name" title="会员姓名" />
				<ec:column property="region_name" title="地区" />
				<ec:column property="total_pv" title="投资额" styleClass="numberColumn"/>
				<ec:column property="trade_user_name" title="交易盘用户名" />
				<ec:column property="trade_id" title="交易盘ID" />
				<ec:column property="trade_true_name" title="交易盘姓名" />
				<ec:column property="Status" title="状态">
					<win:code listCode="mi_trade_agent_status" value="${miTradeAgentVar.status }" />
				</ec:column>
				<ec:column property="create_time" title="创建时间">
					${miTradeAgentVar.creator_code } - ${miTradeAgentVar.create_time }
				</ec:column>
				<ec:column property="check_time" title="审核时间">
					${miTradeAgentVar.checker_code } - ${miTradeAgentVar.check_time }
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>

<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate,#theDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});
$(document).ready(function(){
    
});
function refreshChildRegions(selectedValue, regionId, targetObjId){
	dwr.util.removeAllOptions(targetObjId);
	AlRegionAjax.getChildRegionsToMap(regionId,'${companyCode}', function(data){
 		dwr.util.addOptions(targetObjId, data);
 		document.getElementById(targetObjId).value = selectedValue;
	});
}
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiTradeAgent(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkApplCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miTradeAgentFunctionForm;
	theForm.selectedApplCodes.value=selectedValues;
	theForm.strAction.value="multiDeleteMiTradeAgent";
	
	showLoading();
	theForm.submit();
}

function multiCheckMiTradeAgent(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkApplCode"));
	if(!selectedValues){
		alert("<fmt:message key='请选择需要审核的申请单'/>.");
		return;
	}
	if(!confirm("<fmt:message key='确认审核当前所选择的申请单'/>.")){
		return;
	}
	var theForm=document.miTradeAgentFunctionForm;
	theForm.selectedApplCodes.value=selectedValues;
	theForm.strAction.value="checkMiTradeAgent";
	
	showLoading();
	theForm.submit();
}

function multiUncheckMiTradeAgent(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkApplCode"));
	if(!selectedValues){
		alert("<fmt:message key='请选择需要取消的申请单'/>.");
		return;
	}
	if(!confirm("<fmt:message key='确认取消当前所选择的申请单'/>.")){
		return;
	}
	var theForm=document.miTradeAgentFunctionForm;
	theForm.selectedApplCodes.value=selectedValues;
	theForm.strAction.value="uncheckMiTradeAgent";
	
	showLoading();
	theForm.submit();
}
</script>