<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="库存调整 "/></title>
    <meta name="heading" content="<fmt:message key="库存调整"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="searchBar">
	<form method="get" action="stStockAdjusts.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
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
				<input type="hidden" name="dateRangeType" value="createTime"/>
				 <input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12"/>
				 -
				 <input type="text" name="endDate" id="endDate" value="${param.endDate }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt>状态</dt>
			<dd><win:list name="status" listCode="st_stock_adjust_status" value="${param.status }" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>所包含商品编号</dt>
			<dd><input type="text" name="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listStStockAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="stStockAdjustFunctionForm" id="stStockAdjustFunctionForm" action="handleStStockAdjust.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addStStockAdjust">
				<a href="editStStockAdjust.jhtml?strAction=addStStockAdjust" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkStStockAdjust">
				<a href="javascript:multiCheckStStockAdjust()" name="check">
					审核
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="confirmStStockAdjust">
				<a href="javascript:multiConfirmStStockAdjust()" name="submit">
					确认
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedAdjustCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="stStockAdjustListTableForm" method="get" >
		<ec:table 
			tableId="stStockAdjustListTable"
			items="stStockAdjusts"
			var="stStockAdjustVar"
			action="stStockAdjusts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="stStockAdjustListTableForm">
			<ec:row>
				<ec:column alias="chkAdjustCode" headerCell="selectAll" style="width:5px;">  
					<c:if test="${stStockAdjustVar.status==0 || stStockAdjustVar.status==1 }">
					<input type="checkbox" name="chkAdjustCode" value="${stStockAdjustVar.adjust_code}" class="checkbox"/>
					</c:if>
		  		</ec:column>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<nobr>
						<win:power powerCode="viewStStockAdjust">
							<a href="viewStStockAdjust.jhtml?strAction=viewStStockAdjust&adjustCode=${stStockAdjustVar.adjust_code}" name="view"><fmt:message key="function.menu.view"/></a>
						</win:power>
						<c:if test="${stStockAdjustVar.status==0}">
							<win:power powerCode="editStStockAdjust">
								<a href="editStStockAdjust.jhtml?strAction=editStStockAdjust&adjustCode=${stStockAdjustVar.adjust_code}" name="edit"><fmt:message key="button.edit"/></a>
							</win:power>
							<win:power powerCode="checkStStockAdjust">
								<a href="handleStStockAdjust.jhtml?strAction=checkStStockAdjust&adjustCode=${stStockAdjustVar.adjust_code}" name="check">审核</a>
							</win:power>
						</c:if>
						<c:if test="${stStockAdjustVar.status==1}">
							<win:power powerCode="uncheckStStockAdjust">
								<a href="handleStStockAdjust.jhtml?strAction=uncheckStStockAdjust&adjustCode=${stStockAdjustVar.adjust_code}" name="uncheck">取消审核</a>
							</win:power>
							<win:power powerCode="confirmStStockAdjust">
								<a href="handleStStockAdjust.jhtml?strAction=confirmStStockAdjust&adjustCode=${stStockAdjustVar.adjust_code}" name="submit">确认</a>
							</win:power>
						</c:if>
					</nobr>
				</ec:column>
				<ec:column property="company_code" title="分公司" />
				<ec:column property="adjust_code" title="调整单号" />
				<ec:column property="warehouse_code" title="仓库编号" />
				<ec:column property="changeReason" title="stStockAdjust.changeReason">
					<win:code listCode="st_stock_adjust_change_reason" value="${stStockAdjustVar.change_reason }"/>
				</ec:column>
				<ec:column property="status" title="状态" styleClass="centerColumn">
					<win:code listCode="st_stock_adjust_status" value="${stStockAdjustVar.status }"/>
				</ec:column>
				<ec:column property="createTime" title="创建时间">
					${stStockAdjustVar.creator_code } - ${stStockAdjustVar.create_time }
				</ec:column>
				<ec:column property="check_time" title="审核时间">
					${stStockAdjustVar.checker_code } - ${stStockAdjustVar.check_time }
				</ec:column>
				<ec:column property="confirm_time" title="确认时间">
					${stStockAdjustVar.confirm_code } - ${stStockAdjustVar.confirm_time }
				</ec:column>
				
				<c:if test="${ROWCOUNT>0}">
					<c:if test="${ROWCOUNT%2!=0}"><tr class="odd"></c:if>
					<c:if test="${ROWCOUNT%2==0}"><tr class="even"></c:if>
						<td align="right" valign="top" colspan="3">&nbsp;</td>
						<td colspan="7">
							<c:forEach items="${stStockAdjustVar.stStockAdjustDetails}" var="stStockAdjustDetailVar" varStatus="status">
								<c:if test="${!status.first}"><br/></c:if>
								<font color=#888888>
									<c:if test="${stStockAdjustDetailVar.adjust_qty < 0}">
										<font color="red">[${stStockAdjustDetailVar.adjust_qty}]</font>
									</c:if>
									<c:if test="${stStockAdjustDetailVar.adjust_qty > 0}">
										<font color="green">[${stStockAdjustDetailVar.adjust_qty}]</font>
									</c:if>									
									&nbsp;${stStockAdjustDetailVar.product_code} / ${stStockAdjustDetailVar.product_name}
								</font>
							</c:forEach>
						</td>
					</tr>
				</c:if>
				
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate, #endDate" ).datepicker();
	
	$("a[name='submit']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-submit"
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

function multiCheckStStockAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("请选择需要审核的项目.");
		return;
	}
	if(!confirm("确认审核当前所选择的项目？")){
		return;
	}
	var theForm=document.stStockAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="checkStStockAdjust";
	
	showLoading();
	theForm.submit();
}

function multiConfirmStStockAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("请选择需要确认的项目.");
		return;
	}
	if(!confirm("确认确认当前所选择的项目？")){
		return;
	}
	var theForm=document.stStockAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="confirmStStockAdjust";
	
	showLoading();
	theForm.submit();
}
</script>