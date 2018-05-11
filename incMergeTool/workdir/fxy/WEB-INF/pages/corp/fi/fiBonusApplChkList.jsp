<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title>收益领取申请审批确认</title>
    <meta name="heading" content="收益领取申请审批确认"/>
</head>

<div class="searchBar">
	<form action="fiBonusApplsChk.jhtml" method="get" name="fiBonusApplChkSearchForm" id="fiBonusApplChkSearchForm" onsubmit="return validateSearch(this)">
		<dl>
			<dt>用户编号</dt>
			<dd><input name="userCode" type="text" value="${param.userCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt>收益类型</dt>
			<dd><win:list name="bonusType" listCode="bonus.type" value="${param.bonusType }" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>申请类型</dt>
			<dd><win:list listCode="fibonusappl.appltype" name="applType" value="${param.applType}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>申请人编号</dt>
			<dd><input name="createrCode" type="text" value="${param.createrCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt>申请时间</dt>
			<dd>
				<input name="startCreateTime" id="startCreateTime" type="text" value="${param.startCreateTime}" size="12"/>
				 - 
				<input name="endCreateTime" id="endCreateTime" type="text" value="${param.endCreateTime}" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt>申请状态</dt>
			<dd><win:list listCode="fibonusappl.status" 	name="status" value="${param.status}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>审核人编号</dt>
			<dd><input name="checkerCode" type="text" value="${param.checkerCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt>审核时间</dt>
			<dd>
				<input name="startCheckTime" id="startCheckTime" type="text" value="${param.startCheckTime }" size="12"/>
				 - 
				<input name="endCheckTime" id="endCheckTime" type="text" value="${param.endCheckTime }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listFiBonusApplsChk"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form action="fiBonusApplsChk.jhtml" method="post" name="fiBonusApplsChkTitleForm" id="fiBonusApplsChkTitleForm">
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="verifyFiBonusAppl">
				<a href="javascript:varifyFiBonusAppl(document.fiBonusApplsChkTitleForm);" name="check">
                    <fmt:message  key="operation.button.check"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="verifyFalseFiBonusAppl">
				<a href="javascript:verifyFalseFiBonusAppl(document.fiBonusApplsChkTitleForm);" name="uncheck">
					退回
				</a>
				(退回原因:<input type="text" id="falseReason" 	name="falseReason" value="" size="40" maxlength="250"/>)
			</win:power>
		</div>
		<input type="hidden" name="strNos">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiBonusApplListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusApplListTable"
			items="fiBonusAppls"
			var="fiBonusApplVar"
			action="fiBonusApplsChk.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusApplListTableForm">
			<ec:row>
				<ec:column alias="selectedNo" headerCell="selectAll" style="width:5px;">
					<c:if test="${fiBonusApplVar.status==0}">
						<input type="checkbox" name="selectedNo" value="${fiBonusApplVar.appl_no}"/>
					</c:if>
		  		</ec:column>
				<ec:column property="bonus_type" 	title="收益类型" styleClass="centerColumn" width="100">
					<win:code listCode="bonus.type" value="${fiBonusApplVar.bonus_type }"/>
				</ec:column>
	   			<ec:column property="user_code" 	title="用户编号" />
	   			<ec:column property="mobile" 	title="手机号码" />
	   			<ec:column property="b_name" 		title="银行户名" />
	   			<ec:column property="open_bank" 	title="开户银行" />
	   			<ec:column property="b_branch" 	title="开户行支行" />
	   			<ec:column property="b_num" 		title="银行账号" />
	   			
	   			<ec:column property="amount" 		title="申请金额" />
	   			<ec:column property="fees" 		title="手续费" />
	   			<ec:column property="send_amt" 		title="实发金额" />
	   			<ec:column property="create_time" 	title="申请时间" />
	   			<ec:column property="status" 		title="申请状态" >
	   				<win:code listCode="fibonusappl.status" value="${fiBonusApplVar.status}"/>
	   			</ec:column>
	   			
	   			<ec:column property="checker_code" 	title="审核人编号" />
	   			<ec:column property="checker_name" 	title="审核人名称" />
	   			<ec:column property="check_time" 	title="审核时间" />
	   			<ec:column property="oper_no" 		title="发放计划编号" />
			</ec:row>
		</ec:table>
	</form>
</div>

<script type="text/javascript">
$(function() {
	$( "#startCreateTime, #endCreateTime, #startCheckTime, #endCheckTime" ).datepicker();
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function varifyFiBonusAppl(theForm){
	var elements=document.getElementsByName("selectedNo");
	if(elements==undefined){
		alert("请选择要审核的收益领取申请");
		return false;
	}
	var selectedOne=false;
	for(var i=0;i<elements.length;i++){
		if(elements[i].checked){
			selectedOne=true;
			theForm.strNos.value+=","+elements[i].value;
		}
	}
	if(!selectedOne){
		alert("请选择要审核的收益领取申请");
		return false;
	}
	if(!confirm("确定选中的领取收益申请审核通过？")){
		return false;
	}
	theForm.strAction.value="verifyFiBonusAppl";
	showLoading();
	theForm.submit();
}		

function verifyFalseFiBonusAppl(theForm){
	var elements=document.getElementsByName("selectedNo");
	if(elements==undefined){
		alert("请选择要退回的收益领取申请");
		return false;
	}
	var selectedOne=false;
	for(var i=0;i<elements.length;i++){
		if(elements[i].checked){
			selectedOne=true;
			theForm.strNos.value+=","+elements[i].value;
		}
	}
	if(!selectedOne){
		alert("请选择要退回的收益领取申请");
		return false;
	}
	if(!confirm("确定退回选中的领取收益申请？退回之后对应的收益领取申请作废")){
		return false;
	}
	
	var falseReasonStr = document.getElementById('falseReason').value;
	if(falseReasonStr==null || falseReasonStr.length<3){
		alert("请填写收益领取申请的退回原因，长度不少于三个字符");
		return false;
	}
	
	theForm.strAction.value="verifyFalseFiBonusAppl";
	showLoading();
	theForm.submit();
}		
</script>
