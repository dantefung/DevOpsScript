<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="FCF收盘价管理"/></title>
    <meta name="heading" content="<fmt:message key="FCF收盘价管理"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiFbPriceAdjusts.jhtml" onsubmit="return validateSearch(this)">
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
			<dt>调整单号</dt>
			<dd><input type="text" name="adjustCode" value="${param.adjustCode }"/></dd>
		</dl>
		<dl>
			<dt>创建时间</dt>
			<dd>
				<input type="text" name="startCreateDate" id="startCreateDate" value="${param.startCreateDate }" size="10"/>
				 - <input type="text" name="endCreateDate" id="endCreateDate" value="${param.endCreateDate }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt>审核时间</dt>
			<dd>
				<input type="text" name="startCheckDate" id="startCheckDate" value="${param.startCheckDate }" size="10"/>
				 - <input type="text" name="endCheckDate" id="endCheckDate" value="${param.endCheckDate }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="已审核"/></dt>
			<dd><win:list listCode="yesno" name="status" defaultValue="" value="${param.status }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiFbPriceAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiFbPriceAdjustFunctionForm" id="fiFbPriceAdjustFunctionForm" action="editFiFbPriceAdjust.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiFbPriceAdjust">
				<a href="editFiFbPriceAdjust.jhtml?strAction=addFiFbPriceAdjust" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkFiFbPriceAdjust">
				<a href="javascript:multiCheckFiFbPriceAdjust()" name="check">
					审核
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedAdjustCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiFbPriceAdjustListTableForm" method="get" >
		<ec:table 
			tableId="fiFbPriceAdjustListTable"
			items="fiFbPriceAdjusts"
			var="fiFbPriceAdjustVar"
			action="fiFbPriceAdjusts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="fiFbPriceAdjustListTableForm">
			<ec:row>
				<ec:column alias="chkAdjustCode" headerCell="selectAll" style="width:5px;">  
					<c:if test="${fiFbPriceAdjustVar.status==0 }">
						<input type="checkbox" name="chkAdjustCode" value="${fiFbPriceAdjustVar.adjustCode}" class="checkbox"/>
					</c:if>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewFiFbPriceAdjust">
						<a href="viewFiFbPriceAdjust.jhtml?strAction=viewFiFbPriceAdjust&adjustCode=${fiFbPriceAdjustVar.adjustCode}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<c:if test="${fiFbPriceAdjustVar.status==0 }">
						<win:power powerCode="editFiFbPriceAdjust">
							<a href="editFiFbPriceAdjust.jhtml?strAction=editFiFbPriceAdjust&adjustCode=${fiFbPriceAdjustVar.adjustCode}" name="edit"><fmt:message key="button.edit"/></a>
						</win:power>
					</c:if>
				</ec:column>
				<ec:column property="companyCode" title="分公司" />
				<ec:column property="adjustCode" title="调整单号" />
				<ec:column property="scDate" title="收盘日期" />
				<ec:column property="fbPrice" title="收盘价" />
				<ec:column property="creatorCode" title="创建时间" >
					${fiFbPriceAdjustVar.creatorCode } - ${fiFbPriceAdjustVar.createTime }
				</ec:column>
				<ec:column property="checkerCode" title="审核时间">
					${fiFbPriceAdjustVar.checkerCode } - ${fiFbPriceAdjustVar.checkTime }
				</ec:column>
				<ec:column property="remark" title="备注" />
				<ec:column property="status" title="已审核">
					<win:code listCode="yesno" value="${fiFbPriceAdjustVar.status }"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startCreateDate,#endCreateDate,#startCheckDate,#endCheckDate" ).datepicker();
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiCheckFiFbPriceAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("<fmt:message key='请选择需要审核的单据'/>.");
		return;
	}
	if(!confirm("<fmt:message key='确认审核所选择的单据'/>.")){
		return;
	}
	var theForm=document.fiFbPriceAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="checkFiFbPriceAdjust";
	
	showLoading();
	theForm.submit();
}
</script>