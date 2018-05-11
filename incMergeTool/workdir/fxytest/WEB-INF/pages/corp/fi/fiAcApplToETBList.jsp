<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="导出FCF管理" /></title>
	<meta name="heading" content="<fmt:message key="导出FCF管理"/>" />
</head>

<div class="searchBar">
	<form method="get" action="fiAcApplToETBs.jhtml" onsubmit="return validateSearch(this)">
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
				<input type="text" name="applNo" value="${param.applNo }" />
			</dd>
		</dl>
		<dl>
			<dt>会员编号</dt>
			<dd>
				<input type="text" name="memberNo" value="${param.memberNo }" />
			</dd>
		</dl>
		<dl>
			<dt>FCF地址</dt>
			<dd>
				<input type="text" name="caddress" value="${param.caddress }" size="30"/>
			</dd>
		</dl>
		<dl>
			<dt>
				<win:list name="dateType" listCode="fi_ac_appl_date" defaultValue="" value="${param.dateType }" showBlankLine="true"/>
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
				<win:list name="status" listCode="bonus_appl_status" defaultValue="" value="${param.status }" showBlankLine="true" />
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiAcApplToETBs" />
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="5"><fmt:message key="poOrder.amtCount"/>：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					${sumMap.total_amount }
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					${sumMap.total_fees }
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					${sumMap.total_send_amt }
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" align="right" colspan="5"></td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="fiAcApplFunctionForm" id="fiAcApplFunctionForm" action="handleFiAcApplToETB.jhtml" method="post">
		<%@ include file="/common/messages.jsp"%>

		<div class="functionBar">
			<%-- <win:power powerCode="addFiAcAppl">
				<a href="editFiAcAppl.jhtml?strAction=addFiAcAppl" name="add">
					<fmt:message key="operation.button.add" />
				</a>
				<span class="divider">&nbsp;</span>
			</win:power> --%>
			<win:power powerCode="checkFiAcApplToETB">
				<a href="javascript:multiCheckFiAcAppl()" name="check">审核</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="returnFiAcApplToETB">
				<a href="javascript:multiReturnFiAcAppl()" name="uncheck">退回</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="successFiAcApplToETB">
				<a href="javascript:multiSuccessFiAcAppl()" name="submit">处理成功</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="failFiAcApplToETB">
				<a href="javascript:multiFailFiAcAppl()" name="nosubmit">处理失败</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>

	<form id="fiAcApplListTableForm" method="get">
		<ec:table tableId="fiAcApplListTable" items="fiAcAppls"
			var="fiAcApplVar" action="fiAcApplToETBs.jhtml" width="100%"
			method="get" autoIncludeParameters="true"
			retrieveRowsCallback="limit" rowsDisplayed="20" sortable="false"
			form="fiAcApplListTableForm" footer="${footTotalVar }">
			<ec:exportXls fileName="fiAcAppToETBs.xls"/>
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${fiAcApplVar.status==0}">
						<input type="checkbox" name="chkId" value="${fiAcApplVar.id}" class="checkbox" />
					</c:if>
				</ec:column>

				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" viewsAllowed="html">
					<win:power powerCode="viewFiAcApplToETB">
						<a href="viewFiAcApplToETB.jhtml?strAction=viewFiAcApplToETB&id=${fiAcApplVar.id}" name="view"><fmt:message key="查看" /></a>
					</win:power>
					<c:if test="${fiAcApplVar.status==0 }">
						<%-- <win:power powerCode="editFiAcAppl">
							<a href="editFiAcAppl.jhtml?strAction=editFiAcAppl&id=${fiAcApplVar.id}" name="edit"><fmt:message key="button.edit" /></a>
						</win:power> --%>
						<win:power powerCode="checkFiAcApplToETB">
							<a href="handleFiAcApplToETB.jhtml?strAction=checkFiAcApplToETB&id=${fiAcApplVar.id}" name="check">审核</a>
						</win:power>
						<win:power powerCode="returnFiAcApplToETB">
							<a href="handleFiAcApplToETB.jhtml?strAction=returnFiAcApplToETB&id=${fiAcApplVar.id}" name="uncheck">取消</a>
						</win:power>
					</c:if>
					<c:if test="${fiAcApplVar.status==1 }">
						<win:power powerCode="successFiAcApplToETB">
							<a href="handleFiAcApplToETB.jhtml?strAction=successFiAcApplToETB&id=${fiAcApplVar.id}" name="submit">处理成功</a>
						</win:power>
						<win:power powerCode="failFiAcApplToETB">
							<a href="handleFiAcApplToETB.jhtml?strAction=failFiAcApplToETB&id=${fiAcApplVar.id}" name="nosubmit">处理失败</a>
						</win:power>
					</c:if>
				</ec:column>
				<ec:column property="appl_no" title="申请单号" />
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="user_name" title="会员姓名" />
				<ec:column property="amount" title="申请积分" styleClass="numberColumn"/>
				<ec:column property="c_address" title="FCF账户地址"/>
				<ec:column property="Status" title="状态">
					<win:code listCode="bonus_appl_status" value="${fiAcApplVar.status }" />
				</ec:column>
				<ec:column property="create_time" title="创建时间">
					${fiAcApplVar.creater_code }<br/> ${fiAcApplVar.create_time }
				</ec:column>
				<ec:column property="check_time" title="审核时间">
					${fiAcApplVar.checker_code }<br/>${fiAcApplVar.check_time }
				</ec:column>
				<%-- <ec:column property="return_code" title="退回/取消时间">
					${fiAcApplVar.return_code } - ${fiAcApplVar.return_time }
				</ec:column> --%>
				<ec:column property="send_time" title="处理时间">
					${fiAcApplVar.send_code }<br/>${fiAcApplVar.send_time }
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
	$("button[name='export']",".searchBar").button({
        icons: {
            primary: "ui-icon-report"
        }
    });
	$("a[name='submit']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-submit"
        },
        text: false
    });
	$("a[name='nosubmit']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-nosubmit"
        },
        text: false
    });
});
$(document).ready(function(){
    
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiCheckFiAcAppl(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='请选择需要审核的申请单'/>.");
		return;
	}
	if(!confirm("<fmt:message key='确认审核当前所选择的申请单'/>.")){
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="checkFiAcApplToETB";
	
	showLoading();
	theForm.submit();
}

function multiReturnFiAcAppl(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='请选择需要退回的申请单'/>.");
		return;
	}
	if(!confirm("<fmt:message key='确认退回当前所选择的申请单'/>.")){
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="returnFiAcApplToETB";
	
	showLoading();
	theForm.submit();
}

function multiSuccessFiAcAppl(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='请选择需要标为处理成功的申请单'/>.");
		return;
	}
	if(!confirm("<fmt:message key='确认将当前所选择的申请单标为处理成功'/>?")){
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="successFiAcApplToETB";
	
	showLoading();
	theForm.submit();
}

function multiFailFiAcAppl(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='请选择需要标为处理失败的申请单'/>.");
		return;
	}
	if(!confirm("<fmt:message key='确认将当前所选择的申请单标为处理失败'/>?")){
		return;
	}
	var theForm=document.fiAcApplFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="failFiAcApplToETB";
	
	showLoading();
	theForm.submit();
}
</script>