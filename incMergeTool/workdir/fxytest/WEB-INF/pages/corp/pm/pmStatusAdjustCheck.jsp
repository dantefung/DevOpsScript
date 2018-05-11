<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmStatusAdjustCheck.title"/></title>
    <meta name="heading" content="<fmt:message key="pmStatusAdjustCheck.title"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="searchBar">
	<form method="get" action="checkPmStatusAdjusts.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="busi.new.status"/></dt>
			<dd>
				<win:list name="newStatus" listCode="pmproduct.status2" defaultValue="" value="${param.newStatus}" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd>
				<win:list name="status" listCode="pmstatusadjust.status" defaultValue="" value="${param.status}" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="checkPmStatusAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pmStatusAdjustFunctionForm" id="pmStatusAdjustFunctionForm" action="checkPmStatusAdjusts.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="checkPmStatusAdjusts">
				<a href="javascript:multiCheckPmStatusAdjust()" name="check">
                    <fmt:message key="fi.approval"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkNoPmStatusAdjusts">
				<a href="javascript:multiCheckNoPmStatusAdjust()" name="check">
                    <fmt:message key="fi.approval.not"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>	
		</div>
		<input type="hidden" name="selectedAdjustCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmStatusAdjustListTableForm" method="get" >
		<ec:table 
			tableId="pmStatusAdjustListTable"
			items="pmStatusAdjusts"
			var="pmStatusAdjustVar"
			action="pmStatusAdjusts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmStatusAdjustListTableForm">
			<ec:row>
			   <ec:column alias="chkAdjustCode" headerCell="selectAll" style="width:5px;">  
			       <c:if test="${pmStatusAdjustVar.status==0}">
					<input type="checkbox" name="chkAdjustCode" value="${pmStatusAdjustVar.adjust_code}" class="checkbox"/>
		  		   </c:if>
		  		</ec:column>
			    <ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPmStatusAdjust">
						<a href="viewPmStatusAdjust.jhtml?strAction=viewPmStatusAdjust&adjustCode=${pmStatusAdjustVar.adjust_code}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="adjust_code" title="pmLimitAdjust.adjustCode" />
				<ec:column property="product_code" title="busi.product.productno" />
				<ec:column property="product_name" title="pmProduct.productName" />
				<ec:column property="new_status" title="busi.new.status">
					<win:code listCode="pmproduct.status" value="${pmStatusAdjustVar.new_status}"/>
				</ec:column>
				<ec:column property="status" title="fi.status">
					<win:code listCode="pmstatusadjust.status" value="${pmStatusAdjustVar.status}"/>
				</ec:column>
				<ec:column property="create_time" title="pd.createTime" />
				<ec:column property="creater_code" title="pmProductSppm.createUser" />
				<ec:column property="approve_time" title="icAnnounce.checkTime" />
				<ec:column property="approver_code" title="pmProductSppm.checkUser" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiCheckPmStatusAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.check.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.check'/>?")){
		return;
	}
	var theForm=document.pmStatusAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="checkPmStatusAdjusts";
	
	showLoading();
	theForm.submit();
}

function multiCheckNoPmStatusAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.check.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.check'/>?")){
		return;
	}
	var theForm=document.pmStatusAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="checkNoPmStatusAdjusts";
	
	showLoading();
	theForm.submit();
}

$(function() {
	$( "#startCreateDate,#endCreateDate,#startCheckDate,#endCheckDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

$(document).ready(function(){
	$("a[name='view']").colorbox({iframe:true, width:"80%", height:"80%",title:true});

});
</script>