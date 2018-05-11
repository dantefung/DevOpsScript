<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="会员累积消费调整"/></title>
    <meta name="heading" content="<fmt:message key="会员累积消费调整"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poMemberPvAdjusts.jhtml" onsubmit="return validateSearch(this)">
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
			<dt>单号</dt>
			<dd>
				<input type="text" name="adjustCode" value="${param.adjustCode }" />
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
				<win:list name="dateType" listCode="member_pv_time_search" defaultValue="" value="${param.dateType }" showBlankLine="true"/>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12" />
				 - 
				 <input type="text"	name="endDate" id="endDate"	value="${param.endDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dt>审核</dt>
			<dd>
				<win:list name="status" listCode="yesno" defaultValue="" value="${param.status }" showBlankLine="true" />
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPoMemberPvAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="7">总计：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					<fmt:formatNumber pattern="###,##0.00">${sumMap.total_adjust_pv }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" align="right" colspan="3"></td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="poMemberPvAdjustFunctionForm" id="poMemberPvAdjustFunctionForm" action="editPoMemberPvAdjust.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoMemberPvAdjust">
				<a href="editPoMemberPvAdjust.jhtml?strAction=addPoMemberPvAdjust" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkPoMemberPvAdjust">
				<a href="javascript:multiCheckPoMemberPvAdjust()" name="check">审核</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoMemberPvAdjust">
				<a href="javascript:multiDeletePoMemberPvAdjust()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedAdjustCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poMemberPvAdjustListTableForm" method="get" >
		<ec:table 
			tableId="poMemberPvAdjustListTable"
			items="poMemberPvAdjusts"
			var="poMemberPvAdjustVar"
			action="poMemberPvAdjusts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poMemberPvAdjustListTableForm" footer="${footTotalVar }">
			<ec:exportXls fileName="poMemberPvAdjusts.xls"></ec:exportXls>
			<ec:row>
				<ec:column alias="chkAdjustCode" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${poMemberPvAdjustVar.status==0 }">
						<input type="checkbox" name="chkAdjustCode" value="${poMemberPvAdjustVar.adjust_code}" class="checkbox"/>
					</c:if>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" viewsAllowed="html">
					<win:power powerCode="viewPoMemberPvAdjust">
						<a href="viewPoMemberPvAdjust.jhtml?strAction=viewPoMemberPvAdjust&adjustCode=${poMemberPvAdjustVar.adjust_code}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<c:if test="${poMemberPvAdjustVar.status==0 }">
						<win:power powerCode="editPoMemberPvAdjust">
							<a href="editPoMemberPvAdjust.jhtml?strAction=editPoMemberPvAdjust&adjustCode=${poMemberPvAdjustVar.adjust_code}" name="edit"><fmt:message key="button.edit"/></a>
						</win:power>
					</c:if>
				</ec:column>
				<ec:column property="company_code" title="label.company" />
				<ec:column property="adjust_code" title="pmLimitAdjust.adjustCode" />
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="last_name" title="poOrder.memberName" />
				<ec:column property="total_pv" title="busi.current.consumption.accumulation" styleClass="numberColumn" cell="currency" format="###,##0.00"/>
				<ec:column property="adjust_pv" title="busi.adjustment.quota" styleClass="numberColumn" cell="currency" format="###,##0.00"/>
				<ec:column property="creatorCode" title="pd.createTime">
					${poMemberPvAdjustVar.creator_code } - ${poMemberPvAdjustVar.create_time }
				</ec:column>
				<ec:column property="checkerCode" title="icAnnounce.checkTime">
					${poMemberPvAdjustVar.checker_code } - ${poMemberPvAdjustVar.check_time }
				</ec:column>
				<ec:column property="Status" title="pd.checked">
					<win:code listCode="yesno" value="${poMemberPvAdjustVar.status }"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiCheckPoMemberPvAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("<fmt:message key='busi.please.select.documents.audited'/>.");
		return;
	}
	if(!confirm("<fmt:message key='busi.please.select.documents.audited'/>.")){
		return;
	}
	var theForm=document.poMemberPvAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="checkPoMemberPvAdjust";
	
	showLoading();
	theForm.submit();
}

function multiDeletePoMemberPvAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poMemberPvAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="multiDeletePoMemberPvAdjust";
	
	showLoading();
	theForm.submit();
}
</script>