<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="冻结会员账户金额"/></title>
    <meta name="heading" content="<fmt:message key="冻结会员账户金额"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiAcFreezeChanges.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="title.accout.type"/></dt>
			<dd>
				<win:list name="accountType" listCode="bank_account_types" defaultValue="" value="${param.accountType }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd>扣补单号</dd>
			<dd><input name="changeNo" type="text" value="${param.changeNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="miMember.memberNo"/></dd>
			<dd><input name="memberNo" type="text" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dd>已审核</dd>
			<dd>
				<win:list name="status" listCode="yesno" defaultValue="" value="${param.status }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd><win:list name="timeRangeType" listCode="fibankbooktemp.timerangetype" defaultValue="" value="${param.timeRangeType }" showBlankLine="true"/></dd>
			<dd>
				<input name="startTime" id="startTime" type="text" value="${param.startTime }" size="14" class="readonly" readonly/>
				-
				<input name="endTime" id="endTime" type="text" value="${param.endTime }" size="14" class="readonly" readonly/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiAcFreezeChanges"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiAcFreezeChangeFunctionForm" id="fiAcFreezeChangeFunctionForm" action="editFiAcFreezeChange.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiAcFreezeChange">
				<a href="editFiAcFreezeChange.jhtml?strAction=addFiAcFreezeChange" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkFiAcFreezeChange">
				<a href="javascript:multiChekFiAcFreezeChange()" name="check">
					审核
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteFiAcFreezeChange">
				<a href="javascript:multiDeleteFiAcFreezeChange()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiAcFreezeChangeListTableForm" method="get" >
		<ec:table 
			tableId="fiAcFreezeChangeListTable"
			items="fiAcFreezeChanges"
			var="fiAcFreezeChangeVar"
			action="fiAcFreezeChanges.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiAcFreezeChangeListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<c:if test="${fiAcFreezeChangeVar.status==0}">  
						<input type="checkbox" name="chkId" value="${fiAcFreezeChangeVar.id}" class="checkbox"/>
					</c:if>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<%-- <win:power powerCode="viewFiAcFreezeChange">
						<a href="viewFiAcFreezeChange.jhtml?strAction=viewFiAcFreezeChange&id=${fiAcFreezeChangeVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power> --%>
					<c:if test="${fiAcFreezeChangeVar.status==0}">  
						<win:power powerCode="editFiAcFreezeChange">
							<a href="editFiAcFreezeChange.jhtml?strAction=editFiAcFreezeChange&id=${fiAcFreezeChangeVar.id}" name="edit"><fmt:message key="button.edit"/></a>
						</win:power>
					</c:if>
				</ec:column>
				<ec:column property="company_code" 	title="bdReconsumMoneyReport.company" />
		  		<ec:column property="change_no" 	title="扣补单号" />
				<ec:column property="ac_type" 	title="title.accout.type">
					<win:code listCode="bank_account_types" value="${fiAcFreezeChangeVar.ac_type }"/>
				</ec:column>
				<ec:column property="user_code" 	title="miMember.memberNo">
					${fiAcFreezeChangeVar.user_code}
					<c:if test="${fiAcFreezeChangeVar.is_credit==1 }"><span class="important">[<fmt:message key="lang.credit"/>]</span></c:if>
				</ec:column>
				<ec:column property="user_name" 	title="poOrder.memberName" />
				<ec:column property="freeze_money" title="冻结金额" sortable="false" styleClass="numberColumn">
					<fmt:formatNumber value="${fiAcFreezeChangeVar.freeze_money}" type="number" pattern="###,###,##0.00"/>
				</ec:column>
				<ec:column property="status" 		title="已审核" styleClass="centerColumn">
					<win:code listCode="yesno" value="${fiAcFreezeChangeVar.status }"></win:code>
				</ec:column>
				<ec:column property="create_time" 	title="pd.createTime">
					${fiAcFreezeChangeVar.creater_code } - ${fiAcFreezeChangeVar.create_time }
				</ec:column>
				<ec:column property="check_time" 	title="icAnnounce.checkTime">
					${fiAcFreezeChangeVar.checker_code } - ${fiAcFreezeChangeVar.check_time }
				</ec:column>
				<ec:column property="remark" 		title="busi.common.remark" sortable="false">
					${fn:replace(fiAcFreezeChangeVar.remark, vEnter, '<br>')}
				</ec:column>
				<ec:column property="memo" 		title="摘要" sortable="false">
					${fn:replace(fiAcFreezeChangeVar.memo, vEnter, '<br>')}
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiAcFreezeChange(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiAcFreezeChangeFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiAcFreezeChange";
	
	showLoading();
	theForm.submit();
}

function multiChekFiAcFreezeChange(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("请选择需要审核的单据");
		return;
	}
	if(!confirm("确认审核当前所选择的单据？")){
		return;
	}
	var theForm=document.fiAcFreezeChangeFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="checkFiAcFreezeChange";
	
	showLoading();
	theForm.submit();
}

$(function() {
	$( "#startTime,#endTime" ).datepicker();
});
</script>