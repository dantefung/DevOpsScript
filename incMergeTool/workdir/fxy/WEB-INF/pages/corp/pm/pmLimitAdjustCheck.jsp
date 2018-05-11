<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pm.checkPmLimitAdjusts"/></title>
    <meta name="heading" content="<fmt:message key="menu.pm.checkPmLimitAdjusts"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="searchBar">
	<form method="get" action="checkPmLimitAdjusts.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="pmLimitAdjust.adjustCode"/></dt>
			<dd><input type="text" name="adjustCode" value="${param.adjustCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.product.productno"/></dt>
			<dd><input type="text" name="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pd.createTime"/></dt>
			<dd>
				<input type="text" name="startCreateDate" id="startCreateDate" value="${param.startCreateDate }" size="10"/>
				 - <input type="text" name="endCreateDate" id="endCreateDate" value="${param.endCreateDate }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="icAnnounce.checkTime"/></dt>
			<dd>
				<input type="text" name="startCheckDate" id="startCheckDate" value="${param.startCheckDate }" size="10"/>
				 - <input type="text" name="endCheckDate" id="endCheckDate" value="${param.endCheckDate }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="checkPmLimitAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pmLimitAdjustFunctionForm" id="pmLimitAdjustFunctionForm" action="checkPmLimitAdjusts.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="checkPmLimitAdjusts">
				<a href="javascript:multiCheckPmLimitAdjust()" name="check">
					<fmt:message key="operation.button.check"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedAdjustCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmLimitAdjustListTableForm" method="get" >
		<ec:table 
			tableId="pmLimitAdjustListTable"
			items="pmLimitAdjusts"
			var="pmLimitAdjustVar"
			action="checkPmLimitAdjusts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmLimitAdjustListTableForm">
			<ec:row>
				<ec:column alias="chkAdjustCode" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkAdjustCode" value="${pmLimitAdjustVar.adjust_code}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPmLimitAdjust">
						<a href="viewPmLimitAdjust.jhtml?strAction=viewPmLimitAdjust&adjustCode=${pmLimitAdjustVar.adjust_code}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="adjust_code" title="pmLimitAdjust.adjustCode" />
				<ec:column property="product_code" title="busi.product.productno" />
				<ec:column property="product_name" title="pmProduct.productName" />
				<ec:column property="adjust_qty" title="busi.add.qty" styleClass="numberColumn">
					<c:if test="${pmLimitAdjustVar.adjust_qty>0}">${pmLimitAdjustVar.adjust_qty}</c:if>
					<c:if test="${pmLimitAdjustVar.adjust_qty<=0}">&nbsp;</c:if>
				</ec:column>
				<ec:column property="adjustQty" title="busi.dec.qty" styleClass="numberColumn">
					<c:if test="${pmLimitAdjustVar.adjust_qty<0}">${-pmLimitAdjustVar.adjust_qty}</c:if>
					<c:if test="${pmLimitAdjustVar.adjust_qty>=0}">&nbsp;</c:if>
				</ec:column>
				<ec:column property="status" title="fi.status">
					<win:code listCode="pm_limit_adjust_status" value="${pmLimitAdjustVar.status}"/>
				</ec:column>
				<ec:column property="create_time" title="pd.createTime" />
				<ec:column property="creator_code" title="pmProductSppm.createUser" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startCreateDate,#endCreateDate,#startCheckDate,#endCheckDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiCheckPmLimitAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.check.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.check'/>?")){
		return;
	}
	var theForm=document.pmLimitAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="checkPmLimitAdjusts";
	
	showLoading();
	theForm.submit();
}
</script>