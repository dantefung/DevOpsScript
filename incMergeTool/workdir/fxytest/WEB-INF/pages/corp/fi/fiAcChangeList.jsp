<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="lang.accDeductionMgr"/></title>
    <meta name="heading" content="<fmt:message key="lang.accDeductionMgr"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiAcChanges.jhtml" onsubmit="return validateSearch(this)">
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
			<dd><fmt:message key="lang.deduct.order.no"/></dd>
			<dd><input name="changeNo" type="text" value="${param.changeNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="miMember.memberNo"/></dd>
			<dd><input name="memberNo" type="text" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="lang.reasonOfDeduction"/></dd>
			<dd>
				<select name="reason">
					<option value="" ></option>
    				<c:forEach items="${reasonMap }" var="reasonVar">
    					<option value="${reasonVar.key }" <c:if test="${reasonVar.key==param.reason }">selected="selected"</c:if>>${reasonVar.value }</option>
    				</c:forEach>
    			</select>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="pd.checked"/></dd>
			<dd>
				<win:list name="status" listCode="yesno" defaultValue="" value="${param.status }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd><win:list name="timeRangeType" listCode="fibankbooktemp.timerangetype" defaultValue="" value="${param.timeRangeType }"/></dd>
			<dd>
				<input name="startTime" id="startTime" type="text" value="${param.startTime }" size="14" class="readonly" readonly/>
				-
				<input name="endTime" id="endTime" type="text" value="${param.endTime }" size="14" class="readonly" readonly/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="lang.muti.import.batch.no"/></dd>
			<dd><input name="createNo" type="text" value="${param.createNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listFiAcChanges"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiAcChangeFunctionForm" id="fiAcChangeFunctionForm" action="editFiAcChange.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiAcChange">
				<a href="editFiAcChange.jhtml?strAction=addFiAcChange" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="importFiAcChange">
				<a href="importFiAcChange.jhtml?strAction=importFiAcChange" name="submit">
                    <fmt:message key="button.import"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkFiAcChange">
				<a href="javascript:multiChekFiAcChange()" name="check">
					<fmt:message key="operation.button.check"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteFiAcChange">
				<a href="javascript:multiDeleteFiAcChange()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	<%
		request.setAttribute("vEnter", "\n");
	%>
	<form id="fiAcChangeListTableForm" method="get" >
		<ec:table 
			tableId="fiAcChangeListTable"
			items="fiAcChanges"
			var="fiAcChangeVar"
			action="fiAcChanges.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="fiAcChangeListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">
					<c:if test="${fiAcChangeVar.status==0}">  
						<input type="checkbox" name="chkId" value="${fiAcChangeVar.id}" class="checkbox"/>
					</c:if>
		  		</ec:column>
		  		<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
		  			<win:power powerCode="viewFiAcChange">
						<a href="viewFiAcChange.jhtml?strAction=viewFiAcChange&id=${fiAcChangeVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
		  			<c:if test="${fiAcChangeVar.status==0}">  
						<win:power powerCode="editFiAcChange">
							<a href="editFiAcChange.jhtml?strAction=editFiAcChange&id=${fiAcChangeVar.id}" name="edit"><fmt:message key="button.edit"/></a>
						</win:power>
					</c:if>
				</ec:column>
		  		<ec:column property="company_code" 	title="bdReconsumMoneyReport.company" />
		  		<ec:column property="change_no" 	title="lang.deduct.order.no" />
				<ec:column property="ac_type" 	title="title.accout.type">
					<win:code listCode="bank_account_types" value="${fiAcChangeVar.ac_type }"/>
				</ec:column>
				<ec:column property="member_no" 	title="miMember.memberNo">
					${fiAcChangeVar.member_no}
					<c:if test="${fiAcChangeVar.is_credit==1 }"><span class="important">[<fmt:message key="lang.credit"/>]</span></c:if>
				</ec:column>
				<ec:column property="user_name" 	title="poOrder.memberName" />
				<ec:column property="reason" 	title="lang.reasonOfDeduction" >
					<win:code listCode="fi_ac_change_reason" value="${fiAcChangeVar.reason }"/>
				</ec:column>
				<ec:column property="money" 		title="stStockLog.changeQty" sortable="false" styleClass="numberColumn">
					<fmt:formatNumber value="${fiAcChangeVar.money}" type="number" pattern="###,###,##0.00"/>
				</ec:column>
				<ec:column property="status" 		title="pd.checked" >
					<win:code listCode="yesno" value="${fiAcChangeVar.status }"></win:code>
				</ec:column>
				<ec:column property="create_time" 	title="pd.createTime">
					${fiAcChangeVar.creater_code } - ${fiAcChangeVar.create_time }
				</ec:column>
				<ec:column property="check_time" 	title="icAnnounce.checkTime">
					${fiAcChangeVar.checker_code } - ${fiAcChangeVar.check_time }
				</ec:column>
				<ec:column property="memo" 		title="poSell.notes" sortable="false">
					${fn:replace(fiAcChangeVar.memo, vEnter, '<br>')}
				</ec:column>
				<ec:column property="remark" 		title="busi.common.remark" sortable="false">
					${fn:replace(fiAcChangeVar.remark, vEnter, '<br>')}
				</ec:column>
				<ec:column property="create_no" 	title="bdBounsDeduct.treatedNo" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiAcChange(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>")){
		return;
	}
	var theForm=document.fiAcChangeFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiAcChange";
	
	showLoading();
	theForm.submit();
}

function multiChekFiAcChange(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectOrderToAudit'/>");
		return;
	}
	if(!confirm("<fmt:message key='lang.confirmToAuditSelectedOrder'/>")){
		return;
	}
	var theForm=document.fiAcChangeFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="checkFiAcChange";
	
	showLoading();
	theForm.submit();
}

$(function() {
	$( "#startTime,#endTime" ).datepicker();
});
</script>